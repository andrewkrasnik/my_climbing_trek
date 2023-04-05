import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/datasources/remote_gym_data_source.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/hall_model.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/hall_route_model.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/hall_routes_filter.dart';

@LazySingleton(as: RemoteGymDataSource)
class RemoteGymDataSourceImpl implements RemoteGymDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  late final CollectionReference<Map<String, dynamic>> _gymsRef;

  final String _gymsCollectionName = 'climbing-gyms';
  final String _routesCollectionName = 'routes';
  final String _adminsCollectionName = 'admins';

  RemoteGymDataSourceImpl(this._firebaseFirestore, this._firebaseAuth) {
    _gymsRef = _firebaseFirestore.collection(_gymsCollectionName);
    // .withConverter(
    //       fromFirestore: (snapshot, options) {
    //         final json = snapshot.data()!;

    //         return HallModel.fromJson(json, id: int.parse(snapshot.id));
    //       },
    //       toFirestore: (value, options) => {},
    //     );
  }

  @override
  Future<Either<Failure, List<ClimbingHall>>> gyms() async {
    final gyms = await _gymsRef.get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    List<ClimbingHall> gymsList = [];

    for (final snapshot in gyms.docs) {
      final hasPermission = await _hasEditPermission(gymId: snapshot.id);

      gymsList.add(HallModel.fromJson(
        snapshot.data(),
        id: int.parse(snapshot.id),
        hasEditPermission: hasPermission,
      ));
    }

    return Right(gymsList);
  }

  @override
  Future<Either<Failure, List<ClimbingHallRoute>>> gymRoutes({
    required ClimbingHall gym,
    HallRouteFilter? filter,
  }) async {
    final routesRef = _routesRef(gym: gym);

    final routes = await routesRef.get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    return Right(routes.docs.map((snapshot) => snapshot.data()).toList());
  }

  @override
  Future<Either<Failure, Unit>> updateRoute({
    required ClimbingHall gym,
    required ClimbingHallRoute route,
  }) async {
    try {
      final routesRef = _routesRef(gym: gym);

      await routesRef.doc(route.id).set(route);

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }

  CollectionReference<ClimbingHallRoute> _routesRef({
    required ClimbingHall gym,
  }) =>
      _firebaseFirestore
          .collection('$_gymsCollectionName/${gym.id}/$_routesCollectionName')
          .withConverter(
        fromFirestore: (snapshot, options) {
          final json = snapshot.data()!;

          return HallRouteModel.fromJson(json, id: snapshot.id);
        },
        toFirestore: (value, options) {
          if (value is HallRouteModel) {
            return value.toJson();
          } else {
            return HallRouteModel.fromOrign(value).toJson();
          }
        },
      );

  Future<bool> _hasEditPermission({required String gymId}) async {
    if (_firebaseAuth.currentUser != null) {
      final permissionData = await _firebaseFirestore
          .collection('$_gymsCollectionName/$gymId/$_adminsCollectionName')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      return permissionData.exists;
    } else {
      return false;
    }
  }
}

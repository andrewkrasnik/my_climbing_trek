import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/mountain_model.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/mountain_route_model.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/settings/data/models/region_model.dart';

@LazySingleton(as: MountainRegionsRemoteDataSource)
class FirebaseMountainRegionsRemoteDataSource
    implements MountainRegionsRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  late final CollectionReference<Map<String, dynamic>> _regionsRef;

  final String _regionsCollectionName = 'mountain-regions';
  final String _mountainsCollectionName = 'mountains';
  final String _routesCollectionName = 'routes';
  final String _adminsCollectionName = 'admins';

  FirebaseMountainRegionsRemoteDataSource(
    this._firebaseFirestore,
    this._firebaseAuth,
  ) {
    _regionsRef = _firebaseFirestore.collection(_regionsCollectionName);
  }

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    final regionsData = await _regionsRef.where('show', isEqualTo: true).get(
          const GetOptions(
            serverTimestampBehavior: ServerTimestampBehavior.none,
          ),
        );

    List<Region> regions = [];

    for (final snapshot in regionsData.docs) {
      final hasPermission = await _hasEditPermission(regionId: snapshot.id);

      final data = snapshot.data();

      data['id'] = snapshot.id;
      data['hasEditPermission'] = hasPermission;

      regions.add(RegionModel.fromJson(
        data,
      ));
    }

    return Right(regions);
  }

  @override
  Future<Either<Failure, List<Mountain>>> mountains(
      {required Region region}) async {
    final sectorsData = await _mountainsRef(region: region).get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    return Right(sectorsData.docs.map((snapshot) => snapshot.data()).toList());
  }

  @override
  Future<Either<Failure, List<MountainRoute>>> routes(
      {required Region region, required Mountain mountain}) async {
    final routesData = await _routesRef(region: region, mountain: mountain).get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    return Right(routesData.docs.map((snapshot) => snapshot.data()).toList());
  }

  CollectionReference<Mountain> _mountainsRef({required Region region}) =>
      _firebaseFirestore
          .collection(
              '$_regionsCollectionName/${region.id}/$_mountainsCollectionName')
          .withConverter(
            fromFirestore: (snapshot, options) {
              final json = snapshot.data()!;

              json['id'] = snapshot.id;

              return MountainModel.fromJson(json);
            },
            toFirestore: (value, options) =>
                const MountainConverter().toJson(value),
          );

  CollectionReference<MountainRoute> _routesRef(
          {required Region region, required Mountain mountain}) =>
      _firebaseFirestore
          .collection(
              '$_regionsCollectionName/${region.id}/$_mountainsCollectionName'
              '/${mountain.id}/$_routesCollectionName')
          .withConverter(
            fromFirestore: (snapshot, options) {
              final json = snapshot.data()!;

              json['id'] = snapshot.id;

              return MountainRouteModel.fromJson(json);
            },
            toFirestore: (value, options) => {},
          );

  @override
  Future<Either<Failure, Unit>> saveMountain(
      {required Mountain mountain}) async {
    try {
      final routesRef = _mountainsRef(region: mountain.region);

      await routesRef.doc(mountain.id).set(mountain);

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveRoute(
      {required Mountain mountain, required MountainRoute route}) async {
    try {
      final routesRef = _routesRef(mountain: mountain, region: mountain.region);

      await routesRef.doc(route.id).set(route);

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }

  Future<bool> _hasEditPermission({required String regionId}) async {
    if (_firebaseAuth.currentUser != null) {
      final permissionData = await _firebaseFirestore
          .collection(
              '$_regionsCollectionName/$regionId/$_adminsCollectionName')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      return permissionData.exists;
    } else {
      return false;
    }
  }
}

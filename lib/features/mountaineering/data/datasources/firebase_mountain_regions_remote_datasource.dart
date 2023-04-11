import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/mountain_model.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/mountain_route_model.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/settings/data/models/region_model.dart';

@LazySingleton(as: MountainRegionsRemoteDataSource)
class FirebaseMountainRegionsRemoteDataSource
    implements MountainRegionsRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  late final CollectionReference<RegionModel> _regionsRef;

  final String _regionsCollectionName = 'mountain-regions';
  final String _mountainsCollectionName = 'mountains';
  final String _routesCollectionName = 'routes';

  FirebaseMountainRegionsRemoteDataSource(this._firebaseFirestore) {
    _regionsRef =
        _firebaseFirestore.collection(_regionsCollectionName).withConverter(
              fromFirestore: (snapshot, options) {
                final json = snapshot.data()!;

                json['id'] = snapshot.id;

                return RegionModel.fromJson(json);
              },
              toFirestore: (value, options) => {},
            );
  }

  // late final CollectionReference<IceDistrictModel> _districtsRef;

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    final districtsData = await _regionsRef.get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    return Right(
        districtsData.docs.map((snapshot) => snapshot.data()).toList());
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

  CollectionReference<MountainModel> _mountainsRef({required Region region}) =>
      _firebaseFirestore
          .collection(
              '$_regionsCollectionName/${region.id}/$_mountainsCollectionName')
          .withConverter(
            fromFirestore: (snapshot, options) {
              final json = snapshot.data()!;

              json['id'] = snapshot.id;

              return MountainModel.fromJson(json);
            },
            toFirestore: (value, options) => {},
          );

  CollectionReference<MountainRouteModel> _routesRef(
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
}

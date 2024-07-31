import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/data/models/region_model.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_remote_datasource.dart';
import 'package:my_climbing_trek/features/trekking/data/models/converters.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trek_model.dart';
import 'package:my_climbing_trek/features/trekking/data/models/trek_point_model.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';

@LazySingleton(as: TrekkingRemoteDataSource)
class FirebaseTrekkingRemoteDatasource implements TrekkingRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  late final CollectionReference<Map<String, dynamic>> _regionsRef;

  final String _regionsCollectionName = 'mountain-regions';
  final String _trekCollectionName = 'treks';
  final String _trekPointsCollectionName = 'trekPoints';
  final String _adminsCollectionName = 'admins';

  @override
  final List<TrekPoint> pointsCash = [];

  FirebaseTrekkingRemoteDatasource(
    this._firebaseFirestore,
    this._firebaseAuth,
  ) {
    _regionsRef = _firebaseFirestore.collection(_regionsCollectionName);
  }

  @override
  Future<Either<Failure, List<Region>>> regions({int limit = 0}) async {
    var ref = _regionsRef
        .where('show', isEqualTo: true)
        .where('hasTreks', isEqualTo: true);

    if (limit > 0) {
      ref = ref.limit(limit);
    }

    final regionsData = await ref.get(
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
  Future<Either<Failure, List<Trek>>> treks({required Region region}) async {
    final pointsData = await _trekPointsRef(region: region).get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    pointsCash
        .addAll(pointsData.docs.map((snapshot) => snapshot.data()).toList());

    final sectorsData = await _treksRef(region: region).get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    final list = sectorsData.docs.map((snapshot) => snapshot.data()).toList();

    pointsCash.clear();

    return Right(list);
  }

  CollectionReference<Trek> _treksRef({required Region region}) =>
      _firebaseFirestore
          .collection(
              '$_regionsCollectionName/${region.id}/$_trekCollectionName')
          .withConverter(
            fromFirestore: (snapshot, options) {
              final json = snapshot.data()!;

              json['id'] = snapshot.id;

              return TrekModel.fromJson(json);
            },
            toFirestore: (value, options) =>
                const TrekConverter().toJson(value),
          );

  CollectionReference<TrekPoint> _trekPointsRef({required Region region}) =>
      _firebaseFirestore
          .collection(
              '$_regionsCollectionName/${region.id}/$_trekPointsCollectionName')
          .withConverter(
            fromFirestore: (snapshot, options) {
              final json = snapshot.data()!;

              json['id'] = snapshot.id;

              return TrekPointModel.fromJson(json);
            },
            toFirestore: (value, options) =>
                const TrekPointConverter().toJson(value),
          );

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

  @override
  Future<Either<Failure, List<TrekPoint>>> points(
      {required Region region}) async {
    final pointsData = await _trekPointsRef(region: region).get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    try {
      return Right(pointsData.docs.map((snapshot) => snapshot.data()).toList());
    } catch (error) {
      return Left(DataConversionFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePoint(
      {required Region region, required TrekPoint point}) async {
    try {
      final pointsRef = _trekPointsRef(region: region);

      await pointsRef.doc(point.id).delete();

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTrek(
      {required Region region, required Trek trek}) async {
    try {
      final treksRef = _treksRef(region: region);

      await treksRef.doc(trek.id).delete();

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> savePoint(
      {required Region region, required TrekPoint point}) async {
    try {
      final pointsRef = _trekPointsRef(region: region);

      await pointsRef.doc(point.id).set(point);

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveTrek(
      {required Region region, required Trek trek}) async {
    try {
      final treksRef = _treksRef(region: region);

      await treksRef.doc(trek.id).set(trek);

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }
}

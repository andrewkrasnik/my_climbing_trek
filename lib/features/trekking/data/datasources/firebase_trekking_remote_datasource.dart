import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/data/models/region_model.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_remote_datasource.dart';
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
  final List<TrekPoint> points = [];

  FirebaseTrekkingRemoteDatasource(
    this._firebaseFirestore,
    this._firebaseAuth,
  ) {
    _regionsRef = _firebaseFirestore.collection(_regionsCollectionName);
  }

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    final regionsData = await _regionsRef
        .where('show', isEqualTo: true)
        .where('hasTreks', isEqualTo: true)
        .get(
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

    points.addAll(pointsData.docs.map((snapshot) => snapshot.data()).toList());

    final sectorsData = await _treksRef(region: region).get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    final list = sectorsData.docs.map((snapshot) => snapshot.data()).toList();

    points.clear();

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
            toFirestore: (value, options) => {},
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
            toFirestore: (value, options) => {},
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
}

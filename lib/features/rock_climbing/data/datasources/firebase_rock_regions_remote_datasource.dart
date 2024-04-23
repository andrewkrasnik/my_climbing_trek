import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/converters.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_district_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_route_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_sector_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';

@LazySingleton(as: RockRegionsRemoteDataSource)
class FirebaseRockRegionsRemoteDataSource
    implements RockRegionsRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  late final CollectionReference<Map<String, dynamic>> _districtsRef;

  final String _districtsCollectionName = 'rock-districts';
  final String _sectorsCollectionName = 'sectors';
  final String _routesCollectionName = 'routes';
  final String _adminsCollectionName = 'admins';

  FirebaseRockRegionsRemoteDataSource(
    this._firebaseFirestore,
    this._firebaseAuth,
  ) {
    _districtsRef = _firebaseFirestore.collection(_districtsCollectionName);
  }
  @override
  Future<Either<Failure, List<RockDistrict>>> districts() async {
    final districtsData =
        await _districtsRef.where('show', isEqualTo: true).get(
              const GetOptions(
                serverTimestampBehavior: ServerTimestampBehavior.none,
              ),
            );

    List<RockDistrict> districts = [];

    for (final snapshot in districtsData.docs) {
      final hasPermission = await _hasEditPermission(districtId: snapshot.id);

      final data = snapshot.data();

      data['id'] = snapshot.id;
      data['hasEditPermission'] = hasPermission;

      districts.add(RockDistrictModel.fromJson(
        data,
      ));
    }

    return Right(districts);
  }

  @override
  Future<Either<Failure, List<RockSector>>> sectors(
      {required RockDistrict district}) async {
    final sectorsData = await _sectorsRef(district: district).get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    return Right(sectorsData.docs.map((snapshot) => snapshot.data()).toList());
  }

  @override
  Future<Either<Failure, List<RockRoute>>> routes({
    required RockDistrict district,
    required RockSector sector,
  }) async {
    final routesData = await _routesRef(
      district: district,
      sector: sector,
    ).get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    final routes = routesData.docs.map((snapshot) => snapshot.data()).toList();

    return Right(routes);
  }

  CollectionReference<RockSector> _sectorsRef(
          {required RockDistrict district}) =>
      _firebaseFirestore
          .collection(
              '$_districtsCollectionName/${district.id}/$_sectorsCollectionName')
          .withConverter(
            fromFirestore: (snapshot, options) {
              final json = snapshot.data()!;

              json['id'] = snapshot.id;

              return RockSectorModel.fromJson(json);
            },
            toFirestore: (value, options) =>
                const RockSectorConverter().toJson(value),
          );

  CollectionReference<RockRoute> _routesRef({
    required RockDistrict district,
    required RockSector sector,
  }) =>
      _firebaseFirestore
          .collection(
              '$_districtsCollectionName/${district.id}/$_sectorsCollectionName/'
              '${sector.id}/$_routesCollectionName')
          .withConverter(
            fromFirestore: (snapshot, options) {
              final json = snapshot.data()!;

              json['id'] = snapshot.id;

              return RockRouteModel.fromJson(json);
            },
            toFirestore: (value, options) =>
                const RockRouteConverter().toJson(value),
          );

  Future<bool> _hasEditPermission({required String districtId}) async {
    if (_firebaseAuth.currentUser != null) {
      final permissionData = await _firebaseFirestore
          .collection(
              '$_districtsCollectionName/$districtId/$_adminsCollectionName')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      return permissionData.exists;
    } else {
      return false;
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteRoute({
    required RockDistrict district,
    required RockSector sector,
    required RockRoute route,
  }) async {
    try {
      final techniquesRef = _routesRef(district: district, sector: sector);

      await techniquesRef.doc(route.id).delete();

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveRoute({
    required RockDistrict district,
    required RockSector sector,
    required RockRoute route,
  }) async {
    try {
      final techniquesRef = _routesRef(district: district, sector: sector);

      await techniquesRef.doc(route.id).set(route);

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteSector({
    required RockDistrict district,
    required RockSector sector,
  }) async {
    try {
      final sectorsRef = _sectorsRef(district: district);

      await sectorsRef.doc(sector.id).delete();

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveSector({
    required RockDistrict district,
    required RockSector sector,
  }) async {
    try {
      final sectorsRef = _sectorsRef(district: district);

      await sectorsRef.doc(sector.id).set(sector);

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }
}

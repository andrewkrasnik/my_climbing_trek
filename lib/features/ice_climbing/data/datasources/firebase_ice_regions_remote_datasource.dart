import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/converters.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_district_model.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_sector_model.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';

@LazySingleton(as: IceRegionsRemoteDataSource)
class FirebaseIceRegionsRemoteDataSource implements IceRegionsRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  late final CollectionReference<Map<String, dynamic>> _districtsRef;

  final String _districtsCollectionName = 'ice-districts';
  final String _sectorsCollectionName = 'sectors';
  final String _adminsCollectionName = 'admins';

  FirebaseIceRegionsRemoteDataSource(
    this._firebaseFirestore,
    this._firebaseAuth,
  ) {
    _districtsRef = _firebaseFirestore.collection(_districtsCollectionName);
  }
  @override
  Future<Either<Failure, List<IceDistrictModel>>> districts(
      {int limit = 0}) async {
    var ref = _districtsRef.where('show', isEqualTo: true);

    if (limit > 0) {
      ref = ref.limit(limit);
    }

    final districtsData = await ref.get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    List<IceDistrictModel> districts = [];

    for (final snapshot in districtsData.docs) {
      final hasPermission = await _hasEditPermission(districtId: snapshot.id);

      final data = snapshot.data();

      data['id'] = snapshot.id;
      data['hasEditPermission'] = hasPermission;

      districts.add(IceDistrictModel.fromJson(
        data,
      ));
    }

    return Right(districts);
  }

  @override
  Future<Either<Failure, List<IceSector>>> sectors(
      {required IceDistrict district}) async {
    final sectorsData = await _sectorsRef(district: district).get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    return Right(sectorsData.docs.map((snapshot) => snapshot.data()).toList());
  }

  CollectionReference<IceSector> _sectorsRef({required IceDistrict district}) =>
      _firebaseFirestore
          .collection(
              '$_districtsCollectionName/${district.id}/$_sectorsCollectionName')
          .withConverter(
            fromFirestore: (snapshot, options) {
              final json = snapshot.data()!;

              json['id'] = snapshot.id;

              return IceSectorModel.fromJson(json);
            },
            toFirestore: (value, options) =>
                const IceSectorConverter().toJson(value),
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
  Future<Either<Failure, Unit>> delete({
    required IceSector sector,
    required IceDistrict district,
  }) async {
    try {
      final routesRef = _sectorsRef(district: district);

      await routesRef.doc(sector.id).delete();

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> save(
      {required IceDistrict district, required IceSector sector}) async {
    try {
      final routesRef = _sectorsRef(district: district);

      await routesRef.doc(sector.id).set(sector);

      return const Right(unit);
    } catch (error) {
      return Left(RemoteServerFailure(description: error.toString()));
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_district_model.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_sector_model.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';

@LazySingleton(as: IceRegionsRemoteDataSource)
class FirebaseIceRegionsRemoteDataSource implements IceRegionsRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  late final CollectionReference<IceDistrictModel> _districtsRef;

  final String _districtsCollectionName = 'ice-districts';
  final String _sectorsCollectionName = 'sectors';

  FirebaseIceRegionsRemoteDataSource(this._firebaseFirestore) {
    _districtsRef =
        _firebaseFirestore.collection(_districtsCollectionName).withConverter(
              fromFirestore: (snapshot, options) {
                final json = snapshot.data()!;

                json['id'] = snapshot.id;

                return IceDistrictModel.fromJson(json);
              },
              toFirestore: (value, options) => {},
            );
  }
  @override
  Future<Either<Failure, List<IceDistrictModel>>> districts() async {
    final districtsData =
        await _districtsRef.where('show', isEqualTo: true).get(
              const GetOptions(
                serverTimestampBehavior: ServerTimestampBehavior.none,
              ),
            );

    return Right(
        districtsData.docs.map((snapshot) => snapshot.data()).toList());
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

  CollectionReference<IceSectorModel> _sectorsRef(
          {required IceDistrict district}) =>
      _firebaseFirestore
          .collection(
              '$_districtsCollectionName/${district.id}/$_sectorsCollectionName')
          .withConverter(
            fromFirestore: (snapshot, options) {
              final json = snapshot.data()!;

              json['id'] = snapshot.id;

              return IceSectorModel.fromJson(json);
            },
            toFirestore: (value, options) => {},
          );
}

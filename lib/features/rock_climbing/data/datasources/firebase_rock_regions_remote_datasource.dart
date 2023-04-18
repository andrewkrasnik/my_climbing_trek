import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart';
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

  late final CollectionReference<RockDistrictModel> _districtsRef;

  final String _districtsCollectionName = 'rock-districts';
  final String _sectorsCollectionName = 'sectors';
  final String _routesCollectionName = 'routes';

  FirebaseRockRegionsRemoteDataSource(this._firebaseFirestore) {
    _districtsRef =
        _firebaseFirestore.collection(_districtsCollectionName).withConverter(
              fromFirestore: (snapshot, options) {
                final json = snapshot.data()!;

                json['id'] = snapshot.id;

                return RockDistrictModel.fromJson(json);
              },
              toFirestore: (value, options) => {},
            );
  }
  @override
  Future<Either<Failure, List<RockDistrict>>> districts() async {
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

  CollectionReference<RockSectorModel> _sectorsRef(
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
            toFirestore: (value, options) => {},
          );

  CollectionReference<RockRouteModel> _routesRef({
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
            toFirestore: (value, options) => {},
          );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/city.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/data/datasources/places_remote_datasource.dart';
import 'package:my_climbing_trek/features/settings/data/models/city_model.dart';
import 'package:my_climbing_trek/features/settings/data/models/region_model.dart';

@LazySingleton(as: PlacesRemoteDataSource)
class FirebasePlacesRemoteDataSource implements PlacesRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore;

  late final CollectionReference<CityModel> _citiesRef;
  late final CollectionReference<RegionModel> _regionsRef;

  final String _citiesCollectionName = 'cities';
  final String _regionsCollectionName = 'regions';

  FirebasePlacesRemoteDataSource(this._firebaseFirestore) {
    _citiesRef =
        _firebaseFirestore.collection(_citiesCollectionName).withConverter(
              fromFirestore: (snapshot, options) {
                final json = snapshot.data()!;

                json['id'] = snapshot.id;

                return CityModel.fromJson(json);
              },
              toFirestore: (value, options) => {},
            );

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

  @override
  Future<Either<Failure, List<City>>> cities() async {
    final citiesData = await _citiesRef.get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    return Right(citiesData.docs.map((snapshot) => snapshot.data()).toList());
  }

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    final regionsData = await _regionsRef.get(
      const GetOptions(
        serverTimestampBehavior: ServerTimestampBehavior.none,
      ),
    );

    return Right(regionsData.docs.map((snapshot) => snapshot.data()).toList());
  }
}

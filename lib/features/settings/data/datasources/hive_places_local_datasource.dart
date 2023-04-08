import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/city.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/data/datasources/places_local_datasource.dart';
import 'package:my_climbing_trek/features/settings/data/models/city_model.dart';
import 'package:my_climbing_trek/features/settings/data/models/region_model.dart';

@LazySingleton(as: PlacesLocalDataSource)
class HivePlacesLocalDataSource implements PlacesLocalDataSource {
  static const _citiesName = 'cities';
  static const _regionsName = 'regions';

  late final Box<String> _regionsBox;
  late final Box<String> _citiesBox;

  @override
  Future<Either<Failure, Unit>> init() async {
    _citiesBox = await Hive.openBox<String>(_citiesName);

    _regionsBox = await Hive.openBox<String>(_regionsName);

    return const Right(unit);
  }

  @override
  Future<Either<Failure, List<City>>> cities() async {
    return Right(_citiesBox.values
        .map((value) => CityModel.fromJson(json.decode(value)))
        .toList());
  }

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    return Right(_regionsBox.values
        .map((value) => RegionModel.fromJson(json.decode(value)))
        .toList());
  }

  @override
  Region regionById(String id) {
    final data = json.decode(_regionsBox.get(id)!);
    return RegionModel.fromJson(data);
  }

  @override
  City cityById(String id) {
    final data = json.decode(_citiesBox.get(id)!);
    return CityModel.fromJson(data);
  }

  @override
  Future<Either<Failure, Unit>> saveCities({required List<City> cities}) async {
    final citiesBox = await Hive.openBox<String>(_citiesName);

    for (var city in cities) {
      await citiesBox.put(city.id, json.encode((city as CityModel).toJson()));
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> saveRegions(
      {required List<Region> regions}) async {
    final regionsBox = await Hive.openBox<String>(_regionsName);

    for (var region in regions) {
      await regionsBox.put(
          region.id, json.encode((region as RegionModel).toJson()));
    }

    return const Right(unit);
  }
}

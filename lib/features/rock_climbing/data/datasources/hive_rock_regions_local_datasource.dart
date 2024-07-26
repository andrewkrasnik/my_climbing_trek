import 'dart:convert';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_district_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_route_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_sector_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';

@LazySingleton(as: RockRegionsLocalDataSource)
class HiveRockRegionsLocalDataSource implements RockRegionsLocalDataSource {
  static const _districtsName = 'rockDistricts';
  static const _sectorsName = 'rockDistricts';
  static const _routesName = 'rockRoutes';

  @override
  Future<Either<Failure, List<RockDistrict>>> districts() async {
    final districtsBox = await Hive.openBox<String>(_districtsName);

    // if (districtsBox.isEmpty) {
    //   await _loadData(districtsBox);
    // }

    return Right(districtsBox.values
        .map((value) => RockDistrictModel.fromJson(json.decode(value)))
        .toList());
  }

  @override
  Future<Either<Failure, List<RockSector>>> sectors(
      {required RockDistrict district}) async {
    final sectorsBox =
        await Hive.openBox<String>('${_sectorsName}distr${district.id}');

    return Right(sectorsBox.values
        .map((value) => RockSectorModel.fromJson(json.decode(value)))
        .toList());
  }

  @override
  Future<Either<Failure, List<RockRoute>>> routes({
    required RockDistrict district,
    required RockSector sector,
  }) async {
    final routesBox = await Hive.openBox<String>(
        '${_routesName}distr${district.id}sector${sector.id}');

    final routes = routesBox.values
        .map((value) => RockRouteModel.fromJson(json.decode(value)))
        .toList();

    routes.sort(
      (a, b) => (a.number ?? 0).compareTo(b.number ?? 0),
    );

    return Right(routes);
  }

  @override
  Future<Either<Failure, Unit>> saveDistricts(
      {required List<RockDistrict> districts}) async {
    final districtsBox = await Hive.openBox<String>(_districtsName);

    for (var district in districts) {
      final jsonData = (district as RockDistrictModel).toJson();

      jsonData['localData'] = true;

      await districtsBox.put(district.id, json.encode(jsonData));
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> saveRoutes(
      {required RockDistrict district,
      required RockSector sector,
      required List<RockRoute> routes}) async {
    final routesBox = await Hive.openBox<String>(
        '${_routesName}distr${district.id}sector${sector.id}');

    for (var route in routes) {
      await routesBox.put(
          route.id, json.encode((route as RockRouteModel).toJson()));
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> saveSectors(
      {required RockDistrict district,
      required List<RockSector> sectors}) async {
    final sectorsBox =
        await Hive.openBox<String>('${_sectorsName}distr${district.id}');

    for (var sector in sectors) {
      await sectorsBox.put(
          sector.id, json.encode((sector as RockSectorModel).toJson()));
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteDistrict(
      {required RockDistrict district}) async {
    try {
      final sectorsBox =
          await Hive.openBox<String>('$_sectorsName${district.id}');

      await sectorsBox.deleteFromDisk();

      final routesBox =
          await Hive.openBox<List<String>>('$_routesName${district.id}');

      await routesBox.deleteFromDisk();

      final districtBox = await Hive.openBox<String>(_districtsName);

      districtBox.delete(district.id);

      return const Right(unit);
    } catch (error) {
      return Left(NoSQLBaseFailure(description: error.toString()));
    }
  }
}

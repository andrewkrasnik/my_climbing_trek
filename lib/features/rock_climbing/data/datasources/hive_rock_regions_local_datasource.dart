import 'dart:convert';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/mock_rock_regions_local_datasource.dart';
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

    return Right(routesBox.values
        .map((value) => RockRouteModel.fromJson(json.decode(value)))
        .toList());
  }

  Future<void> _loadData(Box<String> districtsBox) async {
    final mockDataSource = MockRockRegionsLocalDataSource();

    final failureOrDistricts = await mockDataSource.districts();

    failureOrDistricts.fold((l) => null, (districts) async {
      for (var district in districts) {
        await districtsBox.put(
            district.id, json.encode((district as RockDistrictModel).toJson()));

        final failureOrSectors =
            await mockDataSource.sectors(district: district);

        await failureOrSectors.fold(
          (l) async => null,
          (sectors) async {
            final sectorsBox = await Hive.openBox<String>(
                '${_sectorsName}distr${district.id}');

            for (var sector in sectors) {
              await sectorsBox.put(
                  sector.id, json.encode((sector as RockSectorModel).toJson()));

              final faiureOrRoutes = await mockDataSource.routes(
                  district: district, sector: sector);

              faiureOrRoutes.fold((l) => null, (routes) async {
                final routesBox = await Hive.openBox<String>(
                    '${_routesName}distr${district.id}sector${sector.id}');

                for (var route in routes) {
                  await routesBox.put(route.id,
                      json.encode((route as RockRouteModel).toJson()));
                }
              });
            }
          },
        );
      }
    });
  }
}

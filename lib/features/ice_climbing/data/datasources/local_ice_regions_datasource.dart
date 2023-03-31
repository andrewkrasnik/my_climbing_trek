import 'dart:convert';

import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/data/datasources/ice_regions_datasource.dart';
import 'package:climbing_diary/features/ice_climbing/data/models/ice_district_model.dart';
import 'package:climbing_diary/features/ice_climbing/data/models/ice_sector_model.dart';
import 'package:dartz/dartz.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IceRegionsDataSource)
class LocalIceRegionsDataSource implements IceRegionsDataSource {
  static const _districtsName = 'iceDistricts';
  static const _sectorsName = 'iceDistricts';
  @override
  Future<Either<Failure, List<IceDistrict>>> getDistricts() async {
    final districtsBox = await Hive.openBox<String>(_districtsName);

    if (districtsBox.isEmpty) {
      await _loadData(districtsBox);
    }

    return Right(districtsBox.values
        .map((value) => IceDistrictModel.fromJson(json.decode(value)))
        .toList());
  }

  @override
  Future<Either<Failure, List<IceSector>>> getSectors(
      {required IceDistrict district}) async {
    final sectorsBox =
        await Hive.openBox<String>('$_sectorsName${district.id}');

    return Right(sectorsBox.values
        .map((value) => IceSectorModel.fromJson(json.decode(value), district))
        .toList());
  }

  Future<void> _loadData(Box<String> districtsBox) async {
    final mockDataSource = MockIceRegionsDataSource();

    final failureOrDistricts = await mockDataSource.getDistricts();

    failureOrDistricts.fold((l) => null, (districts) async {
      for (var district in districts) {
        await districtsBox.put(
            district.id, json.encode((district as IceDistrictModel).toJson()));

        final failureOrSectors =
            await mockDataSource.getSectors(district: district);

        await failureOrSectors.fold(
          (l) async => null,
          (sectors) async {
            final sectorsBox =
                await Hive.openBox<String>('$_sectorsName${district.id}');

            for (var sector in sectors) {
              await sectorsBox.put(
                  sector.id, json.encode((sector as IceSectorModel).toJson()));
            }
          },
        );
      }
    });
  }
}

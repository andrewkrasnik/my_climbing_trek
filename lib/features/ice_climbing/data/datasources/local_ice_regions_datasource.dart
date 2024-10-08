import 'dart:convert';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/datasources/ice_regions_datasource.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_district_model.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_sector_model.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IceRegionsDataSource)
class LocalIceRegionsDataSource implements IceRegionsDataSource {
  static const _districtsName = 'iceDistricts';
  static const _sectorsName = 'iceDistricts';

  @override
  Future<Either<Failure, List<IceDistrict>>> getDistricts() async {
    final districtsBox = await Hive.openBox<String>(_districtsName);

    return Right(districtsBox.values
        .map((value) => IceDistrictModel.fromJson(json.decode(value)))
        .toList());
  }

  @override
  Future<Either<Failure, List<IceSector>>> getSectors(
      {required IceDistrict district}) async {
    final sectorsBox =
        await Hive.openBox<String>('${_sectorsName}distr${district.id}');

    return Right(sectorsBox.values
        .map((value) => IceSectorModel.fromJson(json.decode(value)))
        .toList());
  }

  @override
  Future<Either<Failure, Unit>> saveDistricts(
      {required List<IceDistrict> districts}) async {
    final districtsBox = await Hive.openBox<String>(_districtsName);

    for (var district in districts) {
      final jsonData = (district as IceDistrictModel).toJson();

      jsonData['localData'] = true;

      await districtsBox.put(district.id, json.encode(jsonData));
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> saveSectors(
      {required IceDistrict district, required List<IceSector> sectors}) async {
    final sectorsBox =
        await Hive.openBox<String>('${_sectorsName}distr${district.id}');

    for (var sector in sectors) {
      await sectorsBox.put(
          sector.id, json.encode((sector as IceSectorModel).toJson()));
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> deleteDistrict(
      {required IceDistrict district}) async {
    try {
      final sectorsBox =
          await Hive.openBox<String>('${_sectorsName}distr${district.id}');

      await sectorsBox.deleteFromDisk();

      final districtsBox = await Hive.openBox<String>(_districtsName);

      districtsBox.delete(district.id);

      return const Right(unit);
    } catch (error) {
      return Left(NoSQLBaseFailure(description: error.toString()));
    }
  }
}

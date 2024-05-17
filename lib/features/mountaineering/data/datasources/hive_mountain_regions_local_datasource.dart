import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/data/datasources/mountain_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/settings/data/models/region_model.dart';

@LazySingleton(as: MountainRegionsLocalDataSource)
class HiveMountainRegionsLocalDataSource
    implements MountainRegionsLocalDataSource {
  static const _regionsName = 'mountainRegions';

  @override
  Future<Either<Failure, List<Mountain>>> mountains(
      {required Region region}) async {
    // final regionsBox = await Hive.openBox<String>(_regionsName);

    // return Right(regionsBox.values.map((value) {
    //   return RegionModel.fromJson(json.decode(value));
    // }).toList());

    return Right([]);
  }

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    final regionsBox = await Hive.openBox<String>(_regionsName);

    return Right(regionsBox.values.map((value) {
      final jsonData = json.decode(value);
      jsonData['localData'] = true;

      return RegionModel.fromJson(jsonData);
    }).toList());
  }

  @override
  Future<Either<Failure, List<MountainRoute>>> routes(
      {required Region region, required Mountain mountain}) async {
    // TODO: implement routes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteRegion({required Region region}) async {
    try {
      final regionsBox = await Hive.openBox<String>(_regionsName);

      regionsBox.delete(region.id);

      return const Right(unit);
    } catch (error) {
      return Left(NoSQLBaseFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveRegion({required Region region}) async {
    try {
      final regionsBox = await Hive.openBox<String>(_regionsName);

      regionsBox.put(
          region.id,
          json.encode(RegionModel(
            name: region.name,
            hasEditPermission: region.hasEditPermission,
            id: region.id,
            image: region.image,
            localData: region.localData,
          ).toJson()));

      return const Right(unit);
    } catch (error) {
      return Left(NoSQLBaseFailure(description: error.toString()));
    }
  }
}

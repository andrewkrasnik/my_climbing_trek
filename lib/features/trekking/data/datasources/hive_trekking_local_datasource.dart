import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/data/models/region_model.dart';
import 'package:my_climbing_trek/features/trekking/data/datasources/trekking_local_datasource.dart';
import 'package:my_climbing_trek/features/trekking/data/models/converters.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';

@LazySingleton(as: TrekkingLocalDataSource)
class HiveTrekkingLocalDataSource implements TrekkingLocalDataSource {
  static const _regionsName = 'trekkingRegions';
  static const _treksName = 'treks';
  static const _trekkingPointsName = 'trekkingPoints';

  final List<TrekPoint> _pointsCash = [];

  @override
  List<TrekPoint> get pointsCash => _pointsCash;

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
  Future<Either<Failure, Unit>> deleteRegion({required Region region}) async {
    try {
      final treksBox = await Hive.openBox<String>('$_treksName${region.id}');

      await treksBox.deleteFromDisk();

      final routesBox =
          await Hive.openBox<String>('$_trekkingPointsName${region.id}');

      await routesBox.deleteFromDisk();

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

      await regionsBox.put(
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

  @override
  Future<Either<Failure, List<TrekPoint>>> points(
      {required Region region}) async {
    final trekingPointsBox =
        await Hive.openBox<String>('$_trekkingPointsName${region.id}');

    final points = trekingPointsBox.values
        .map((value) => const TrekPointConverter().fromJson(json.decode(value)))
        .toList();

    _pointsCash.clear();
    _pointsCash.addAll(points);

    return Right(points);
  }

  @override
  Future<Either<Failure, Unit>> savePoints(
      {required Region region, required List<TrekPoint> points}) async {
    try {
      final treksBox =
          await Hive.openBox<String>('$_trekkingPointsName${region.id}');

      final Map<String, String> map = {};

      for (var point in points) {
        map[point.id] = json.encode(const TrekPointConverter().toJson(point));
      }

      await treksBox.putAll(map);

      return const Right(unit);
    } catch (error) {
      return Left(NoSQLBaseFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveTreks(
      {required Region region, required List<Trek> treks}) async {
    try {
      final treksBox = await Hive.openBox<String>('$_treksName${region.id}');

      final Map<String, String> map = {};

      for (var trek in treks) {
        map[trek.id] = json.encode(const TrekConverter().toJson(trek));
      }

      await treksBox.putAll(map);

      return const Right(unit);
    } catch (error) {
      return Left(NoSQLBaseFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Trek>>> treks({required Region region}) async {
    final treksBox = await Hive.openBox<String>('$_treksName${region.id}');

    return Right(treksBox.values
        .map((value) => const TrekConverter().fromJson(json.decode(value)))
        .toList());
  }
}

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/data/models/region_model.dart';
import 'package:my_climbing_trek/features/traveling/data/datasources/travel_regions_datasource.dart';

@LazySingleton(as: TravelRegionsDataSource)
class HiveTravelRegionsDataSource implements TravelRegionsDataSource {
  final HiveInterface _hiveInterface;

  static const _regionsName = 'regions';

  HiveTravelRegionsDataSource(this._hiveInterface);

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    final regionsBox = await _hiveInterface.openBox<String>(_regionsName);

    return Right(regionsBox.values
        .map((value) => RegionModel.fromJson(json.decode(value)))
        .toList());
  }
}

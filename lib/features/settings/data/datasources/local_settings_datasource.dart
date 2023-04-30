import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/data/models/treanings_settings_model.dart';
import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';
import 'package:my_climbing_trek/features/settings/data/datasources/settings_datasource.dart';

@LazySingleton(as: SettingsDataSource)
class SettingsDataSourceImpl implements SettingsDataSource {
  static const _treaningsKey = 'treanings_settings';
  static const _settingsName = 'settings';

  @override
  Future<Either<Failure, TreaningsSettings?>> getTreaningsSettings() async {
    final treaningsBox = await Hive.openBox<String>(_settingsName);

    final data = treaningsBox.get(_treaningsKey);

    return Right(data == null
        ? null
        : TreaningsSettingsModel.fromJson(jsonDecode(data)));
  }

  @override
  Future<Either<Failure, Unit>> saveTreaningsSettings(
      {required TreaningsSettings settings}) async {
    final treaningsBox = await Hive.openBox<String>(_settingsName);

    treaningsBox.put(_treaningsKey,
        jsonEncode(TreaningsSettingsModel.fromOrign(settings).toJson()));

    return const Right(unit);
  }

  @override
  Future<Either<Failure, String?>> getStringValue({required String key}) async {
    final treaningsBox = await Hive.openBox<String>(_settingsName);

    return Right(treaningsBox.get(key));
  }

  @override
  Future<Either<Failure, Unit>> saveStringValue(
      {required String key, required String? value}) async {
    final treaningsBox = await Hive.openBox<String>(_settingsName);

    if (value != null) {
      await treaningsBox.put(key, value);
    } else {
      await treaningsBox.delete(key);
    }

    return const Right(unit);
  }
}

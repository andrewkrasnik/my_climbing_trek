import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/data/datasources/settings_datasource.dart';
import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';

import 'package:my_climbing_trek/features/settings/domain/repositories/settings_repository.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource _settingsDataSource;

  SettingsRepositoryImpl(this._settingsDataSource);

  @override
  Future<Either<Failure, TreaningsSettings?>> getTreaningsSettings() async {
    return await _settingsDataSource.getTreaningsSettings();
  }

  @override
  Future<Either<Failure, Unit>> saveTreaningsSettings(
      {required TreaningsSettings settings}) async {
    return await _settingsDataSource.saveTreaningsSettings(settings: settings);
  }
}

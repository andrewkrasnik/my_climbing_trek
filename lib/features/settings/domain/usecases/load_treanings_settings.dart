import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';
import 'package:my_climbing_trek/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoadTreaningsSettings {
  final SettingsRepository _settingsRepository;

  LoadTreaningsSettings(this._settingsRepository);

  Future<Either<Failure, TreaningsSettings?>> call() async {
    return await _settingsRepository.getTreaningsSettings();
  }
}

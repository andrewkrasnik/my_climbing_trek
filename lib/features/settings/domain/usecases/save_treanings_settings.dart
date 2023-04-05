import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';
import 'package:my_climbing_trek/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SaveTreaningsSettings {
  final SettingsRepository _settingsRepository;

  SaveTreaningsSettings(this._settingsRepository);

  Future<Either<Failure, Unit>> call(
      {required TreaningsSettings settings}) async {
    return await _settingsRepository.saveTreaningsSettings(settings: settings);
  }
}

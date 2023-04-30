import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SaveSimpleSettingsUsecase {
  final SettingsRepository _settingsRepository;

  SaveSimpleSettingsUsecase(this._settingsRepository);

  Future<Either<Failure, Unit>> call({
    required String key,
    required String? value,
  }) async {
    return await _settingsRepository.saveStringValue(key: key, value: value);
  }
}

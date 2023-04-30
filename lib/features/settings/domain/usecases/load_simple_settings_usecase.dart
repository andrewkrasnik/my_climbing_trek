import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoadSimpleSettingsUsecase {
  final SettingsRepository _settingsRepository;

  LoadSimpleSettingsUsecase(this._settingsRepository);

  Future<Either<Failure, String?>> call({required String key}) async {
    return await _settingsRepository.getStringValue(key: key);
  }
}

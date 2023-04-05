import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';

abstract class SettingsDataSource {
  Future<Either<Failure, TreaningsSettings?>> getTreaningsSettings();
  Future<Either<Failure, Unit>> saveTreaningsSettings(
      {required TreaningsSettings settings});
}

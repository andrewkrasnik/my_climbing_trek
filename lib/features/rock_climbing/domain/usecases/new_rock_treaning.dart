import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_treanings_repository.dart';

@LazySingleton()
class NewRockTreaning {
  final RockTreaningsRepository _rockTreaningsRepository;

  NewRockTreaning(
    this._rockTreaningsRepository,
  );

  Future<Either<Failure, RockTreaning>> call({
    required RockDistrict district,
    required RockSector sector,
  }) async {
    final treaning = RockTreaning(
      district: district,
      date: DateTime.now(),
      sectors: [sector],
    );

    return await _rockTreaningsRepository.saveTreaning(treaning: treaning);
  }
}

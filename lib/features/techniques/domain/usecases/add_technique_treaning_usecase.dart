import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';

@LazySingleton()
class AddTechniqueTreaningUseCase {
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;

  AddTechniqueTreaningUseCase(this._techniqueTreaningsRepository);

  Future<Either<Failure, TechniqueTreaning>> call({
    required TechniqueGroup group,
    Technique? technique,
  }) async {
    final TechniqueTreaning treaning = TechniqueTreaning(date: DateTime.now());
    treaning.startTreaning();

    treaning.items[group] = technique == null
        ? []
        : [
            TechniqueTreaningItem(
              technique: technique,
              treaningId: treaning.id,
            )
          ];

    final failureOrUnit =
        await _techniqueTreaningsRepository.saveTreaning(treaning: treaning);

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (_) => Right(treaning),
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';

@LazySingleton()
class AddTechniqueToTreaningUseCase {
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;

  AddTechniqueToTreaningUseCase(this._techniqueTreaningsRepository);

  Future<Either<Failure, TechniqueTreaning>> call({
    required TechniqueTreaning treaning,
    required TechniqueGroup group,
    Technique? technique,
    List<TechniqueOption>? options,
  }) async {
    if (technique != null) {
      final newItem = TechniqueTreaningItem(
        group: group,
        technique: technique,
        treaningId: treaning.id,
        options: options,
      );

      treaning.items.add(newItem);

      final failureOrItemUnit =
          await _techniqueTreaningsRepository.saveTreaningItem(item: newItem);

      if (failureOrItemUnit.isLeft()) {
        return Left(
            failureOrItemUnit.fold((failure) => failure, (_) => Failure()));
      }
    }

    final failureOrUnit =
        await _techniqueTreaningsRepository.saveTreaning(treaning: treaning);

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (_) => Right(treaning),
    );
  }
}

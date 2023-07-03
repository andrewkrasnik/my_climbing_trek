import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';

@LazySingleton()
class EditTechniqueItemUseCase {
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;

  EditTechniqueItemUseCase(this._techniqueTreaningsRepository);

  Future<Either<Failure, TechniqueTreaningItem>> call({
    required TechniqueTreaningItem item,
    required List<TechniqueOption> options,
    required String comment,
    DateTime? startTime,
    DateTime? finishTime,
  }) async {
    item.options = options;
    item.comment = comment;

    final failureOrUnit =
        await _techniqueTreaningsRepository.saveTreaningItem(item: item);

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (_) => Right(item),
    );
  }
}

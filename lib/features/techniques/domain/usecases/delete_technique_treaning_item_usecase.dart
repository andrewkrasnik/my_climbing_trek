import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/technique_treanings_repository.dart';

@LazySingleton()
class DeleteTechniqueTreaningItemUseCase {
  final TechniqueTreaningsRepository _techniqueTreaningsRepository;

  DeleteTechniqueTreaningItemUseCase(this._techniqueTreaningsRepository);

  Future<Either<Failure, Unit>> call({
    required TechniqueTreaningItem item,
  }) async {
    return await _techniqueTreaningsRepository.deleteTreaningItem(item: item);
  }
}

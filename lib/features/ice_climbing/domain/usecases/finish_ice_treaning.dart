import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FinishIceTreaning {
  final IceTreaningsRepository iceTreaningsRepository;

  FinishIceTreaning({
    required this.iceTreaningsRepository,
  });

  Future<Either<Failure, IceTreaning>> call(
      {required IceTreaning treaning}) async {
    treaning.finish();

    return await iceTreaningsRepository.saveTreaning(treaning: treaning);
  }
}

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetLastIceTreaning {
  final IceTreaningsRepository iceTreaningsRepository;

  GetLastIceTreaning({
    required this.iceTreaningsRepository,
  });

  Future<Either<Failure, IceTreaning?>> call() async {
    return await iceTreaningsRepository.getPreviousTreaning();
  }
}

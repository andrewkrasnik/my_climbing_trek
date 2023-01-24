import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NewIceTreaning {
  final IceTreaningsRepository iceTreaningsRepository;

  NewIceTreaning({
    required this.iceTreaningsRepository,
  });

  Future<Either<Failure, IceTreaning>> call(
      {required IceDistrict district}) async {
    final treaning = IceTreaning(district: district, date: DateTime.now());

    return await iceTreaningsRepository.saveTreaning(treaning: treaning);
  }
}

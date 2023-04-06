import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_regions_repository.dart';

@LazySingleton()
class LoadRockDistricts {
  final RockRegionsRepository _regionsRepository;

  LoadRockDistricts(this._regionsRepository);

  Future<Either<Failure, List<RockDistrict>>> call() async {
    return await _regionsRepository.districts();
  }
}

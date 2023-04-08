import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_regions_repository.dart';

@LazySingleton()
class LoadRockRoutes {
  final RockRegionsRepository _regionsRepository;

  LoadRockRoutes(this._regionsRepository);

  Future<Either<Failure, List<RockRoute>>> call(
      {required RockDistrict district, required RockSector sector}) async {
    return await _regionsRepository.routes(district: district, sector: sector);
  }
}

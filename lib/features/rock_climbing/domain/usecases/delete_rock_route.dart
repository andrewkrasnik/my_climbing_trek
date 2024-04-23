import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_regions_repository.dart';

@LazySingleton()
class DeleteRockRoute {
  final RockRegionsRepository _regionsRepository;

  DeleteRockRoute(this._regionsRepository);

  Future<Either<Failure, Unit>> call({
    required RockDistrict district,
    required RockSector sector,
    required RockRoute route,
  }) async {
    return await _regionsRepository.deleteRoute(
      district: district,
      sector: sector,
      route: route,
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/core/data/difficulty_category.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_regions_repository.dart';

@LazySingleton()
class SaveRockRoute {
  final RockRegionsRepository _regionsRepository;

  SaveRockRoute(this._regionsRepository);

  Future<Either<Failure, Unit>> call({
    required RockDistrict district,
    required RockSector sector,
    required String author,
    required String id,
    required int boltCount,
    required String anchor,
    required String name,
    required int? number,
    required int length,
    required String remark,
    required DifficultyCategory category,
    required ClimbingRouteType type,
  }) async {
    final route = RockRoute(
      name: name,
      category: category,
      type: type,
      anchor: anchor,
      author: author,
      boltCount: boltCount,
      id: id,
      length: length,
      number: number,
      remark: remark,
    );

    return await _regionsRepository.saveRoute(
      district: district,
      sector: sector,
      route: route,
    );
  }
}

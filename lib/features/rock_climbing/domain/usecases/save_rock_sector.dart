import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/repositories/rock_regions_repository.dart';

@LazySingleton()
class SaveRockSector {
  final RockRegionsRepository _regionsRepository;

  SaveRockSector(this._regionsRepository);

  Future<Either<Failure, Unit>> call({
    required RockDistrict district,
    required String name,
    required String id,
    required String image,
    required bool hasBouldering,
    required bool hasRope,
    required bool hasTrad,
    required bool hasDryTooling,
    required bool hasAid,
  }) async {
    final sector = RockSector(
      name: name,
      hasAid: hasAid,
      hasBouldering: hasBouldering,
      hasDryTooling: hasDryTooling,
      hasRope: hasRope,
      hasTrad: hasTrad,
      id: id,
      image: image,
    );
    return await _regionsRepository.saveSector(
      district: district,
      sector: sector,
    );
  }
}

import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_regions_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

@LazySingleton()
class SaveSectorUseCase {
  final IceRegionsRepository iceRegionsRepository;

  SaveSectorUseCase({
    required this.iceRegionsRepository,
  });

  Future<Either<Failure, Unit>> call({
    required IceDistrict district,
    required String name,
    required String image,
    required String id,
    required bool waterfallIce,
    required bool glacierIce,
    required bool artificialIce,
    required String description,
    required int length,
    required IceCategory maxCategory,
  }) async {
    final sector = IceSector(
      name: name,
      length: length,
      maxCategory: maxCategory,
      artificialIce: artificialIce,
      description: description,
      glacierIce: glacierIce,
      id: id,
      image: image,
      waterfallIce: waterfallIce,
    );

    return await iceRegionsRepository.save(district: district, sector: sector);
  }
}

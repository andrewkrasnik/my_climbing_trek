import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_regions_repository.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class NewIceTreaning {
  final IceTreaningsRepository iceTreaningsRepository;
  final IceRegionsRepository iceRegionsRepository;

  NewIceTreaning({
    required this.iceTreaningsRepository,
    required this.iceRegionsRepository,
  });

  Future<Either<Failure, IceTreaning>> call(
      {required IceDistrict district}) async {
    final List<IceSector> sectors = [];

    if (district.compact) {
      final failureOfSectors =
          await iceRegionsRepository.getSectors(district: district);

      sectors.addAll(failureOfSectors.fold((_) => [], (sectors) => sectors));
    }

    final treaning = IceTreaning(
      district: district,
      date: DateTime.now(),
      sectors: sectors,
    );

    return await iceTreaningsRepository.saveTreaning(treaning: treaning);
  }
}

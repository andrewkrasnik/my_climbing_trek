import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/repositories/ice_treanings_repository.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class IceSectorToTreaning {
  final IceTreaningsRepository iceTreaningsRepository;

  IceSectorToTreaning({
    required this.iceTreaningsRepository,
  });

  Future<Either<Failure, IceTreaning>> call({
    required IceDistrict district,
    required IceSector sector,
    IceTreaning? treaning,
  }) async {
    final currentTreaning = treaning ??
        IceTreaning(
          district: district,
          date: DateTime.now(),
          sectors: [sector],
        );

    if (currentTreaning.sectors
            .firstWhereOrNull((element) => element == sector) ==
        null) {
      currentTreaning.sectors.add(sector);
    }

    return await iceTreaningsRepository.saveTreaning(treaning: currentTreaning);
  }
}

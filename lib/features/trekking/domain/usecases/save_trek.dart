import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_repository.dart';

@LazySingleton()
class SaveTrek {
  final TrekkingRepository _trekkingRepository;

  SaveTrek(this._trekkingRepository);

  Future<Either<Failure, Unit>> call({
    required Region region,
    required String name,
    required TrekkingType type,
    required String id,
    required String? image,
    required List<TrekSection> sections,
    required String? mapImage,
    required List<String> links,
  }) async {
    final trek = Trek(
      name: name,
      type: type,
      id: id,
      image: image,
      region: region,
      sections: sections,
      links: links,
      mapImage: mapImage,
    );

    return await _trekkingRepository.saveTrek(region: region, trek: trek);
  }
}

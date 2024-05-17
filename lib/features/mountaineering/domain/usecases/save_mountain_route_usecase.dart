import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_type.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/mountain_regions_repository.dart';

@LazySingleton()
class SaveMountainRouteUsecase {
  final MountainRegionsRepository _mountainRegionsRepository;

  SaveMountainRouteUsecase(this._mountainRegionsRepository);

  Future<Either<Failure, Unit>> call({
    required Mountain mountain,
    required String id,
    required String name,
    required String image,
    required MountaineeringCategory category,
    ClimbingCategory? climbingCategory,
    AidCategory? aidCategory,
    UssrClimbingCategory? ussrCategory,
    required MountainRouteType type,
    required List<MountainRouteRoop> roops,
    required String description,
    required String passage,
    required String descent,
    required List<String> links,
    required String author,
    required String firstAscentYear,
    required int length,
    String? ueaaSchemaImage,
    String? farLink,
  }) async {
    final route = MountainRoute(
      category: category,
      type: type,
      roops: roops,
      name: name,
      aidCategory: aidCategory,
      author: author,
      climbingCategory: climbingCategory,
      descent: descent,
      description: description,
      farLink: farLink,
      firstAscentYear: firstAscentYear,
      id: id,
      image: image,
      length: length,
      links: links,
      passage: passage,
      ueaaSchemaImage: ueaaSchemaImage,
      ussrCategory: ussrCategory,
    );

    return _mountainRegionsRepository.saveRoute(
      mountain: mountain,
      route: route,
    );
  }
}

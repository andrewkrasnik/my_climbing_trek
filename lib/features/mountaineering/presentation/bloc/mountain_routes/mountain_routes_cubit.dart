import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_type.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/get_mountain_routes.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/save_mountain_route_usecase.dart';

part 'mountain_routes_state.dart';
part 'mountain_routes_cubit.freezed.dart';

@Injectable()
class MountainRoutesCubit extends Cubit<MountainRoutesState> {
  final GetMountainRoutes _getMountainRoutes;
  final SaveMountainRouteUsecase _saveMountainRouteUsecase;

  MountainRoutesCubit(
    this._getMountainRoutes,
    this._saveMountainRouteUsecase,
  ) : super(const MountainRoutesState.initial());

  Future<void> loadData(
      {required Region region, required Mountain mountain}) async {
    emit(const MountainRoutesState.loading());

    final failureOrRoutes =
        await _getMountainRoutes(mountain: mountain, region: region);

    failureOrRoutes.fold(
        (failure) =>
            emit(MountainRoutesState.error(description: failure.toString())),
        (routes) => emit(MountainRoutesState.data(routes: routes)));
  }

  Future<void> saveRoute({
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
    emit(const MountainRoutesState.loading());

    final failureOrMountains = await _saveMountainRouteUsecase(
      mountain: mountain,
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

    failureOrMountains.fold(
        (failure) =>
            emit(MountainRoutesState.error(description: failure.toString())),
        (_) => loadData(mountain: mountain, region: mountain.region));
  }
}

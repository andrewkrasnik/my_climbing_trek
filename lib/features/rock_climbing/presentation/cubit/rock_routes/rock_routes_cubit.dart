import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/core/data/difficulty_category.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_routes_filter.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/delete_rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/get_rock_route_statistic.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/load_rock_routes.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/save_rock_route.dart';

part 'rock_routes_state.dart';
part 'rock_routes_cubit.freezed.dart';

@Injectable()
class RockRoutesCubit extends Cubit<RockRoutesState> {
  final LoadRockRoutes _loadRockRoutes;
  final GetRockRouteStatistic _getRockRouteStatistic;
  final DeleteRockRoute _deleteRockRoute;
  final SaveRockRoute _saveRockRoute;

  RockRoutesCubit(
    this._loadRockRoutes,
    this._getRockRouteStatistic,
    this._deleteRockRoute,
    this._saveRockRoute,
  ) : super(const RockRoutesState.initial());

  Future<void> loadData({
    required RockDistrict district,
    required RockSector sector,
    RockRouteFilter? filter,
  }) async {
    emit(const RockRoutesState.loading());

    final failureOrRoutes = await _loadRockRoutes(
      district: district,
      sector: sector,
      filter: filter,
    );

    await failureOrRoutes.fold(
        (failure) async =>
            emit(RockRoutesState.error(description: failure.toString())),
        (routes) async {
      emit(RockRoutesState.data(routes: routes));

      final failureOrStatistic = await _getRockRouteStatistic(
        routes: routes,
        sector: sector,
      );

      failureOrStatistic.fold(
        (failure) =>
            emit(RockRoutesState.error(description: failure.toString())),
        (statistic) => emit(
          RockRoutesState.data(routes: routes, statistic: statistic),
        ),
      );
    });
  }

  Future<void> save({
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
    emit(const RockRoutesState.loading());

    final failureOrUnit = await _saveRockRoute(
      district: district,
      sector: sector,
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

    failureOrUnit.fold(
      (failure) => emit(RockRoutesState.error(description: failure.toString())),
      (statistic) => loadData(
        district: district,
        sector: sector,
      ),
    );
  }

  Future<void> delete({
    required RockDistrict district,
    required RockSector sector,
    required RockRoute route,
  }) async {
    emit(const RockRoutesState.loading());

    final failureOrUnit = await _deleteRockRoute(
      district: district,
      sector: sector,
      route: route,
    );

    failureOrUnit.fold(
      (failure) => emit(RockRoutesState.error(description: failure.toString())),
      (statistic) => loadData(
        district: district,
        sector: sector,
      ),
    );
  }
}

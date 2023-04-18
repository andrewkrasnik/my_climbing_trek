import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/get_rock_route_statistic.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/load_rock_routes.dart';

part 'rock_routes_state.dart';
part 'rock_routes_cubit.freezed.dart';

@Injectable()
class RockRoutesCubit extends Cubit<RockRoutesState> {
  final LoadRockRoutes _loadRockRoutes;
  final GetRockRouteStatistic _getRockRouteStatistic;

  RockRoutesCubit(this._loadRockRoutes, this._getRockRouteStatistic)
      : super(const RockRoutesState.initial());

  Future<void> loadData(
      {required RockDistrict district, required RockSector sector}) async {
    emit(const RockRoutesState.loading());
    final failureOrRoutes =
        await _loadRockRoutes(district: district, sector: sector);

    await failureOrRoutes.fold(
        (failure) async =>
            emit(RockRoutesState.error(description: failure.toString())),
        (routes) async {
      emit(RockRoutesState.data(routes: routes));

      final failureOrStatistic = await _getRockRouteStatistic(routes: routes);

      failureOrStatistic.fold(
        (failure) =>
            emit(RockRoutesState.error(description: failure.toString())),
        (statistic) => emit(
          RockRoutesState.data(routes: routes, statistic: statistic),
        ),
      );
    });
  }
}

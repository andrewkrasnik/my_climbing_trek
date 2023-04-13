import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/gym_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/hall_routes_filter.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/get_gym_route_statistic.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/hall_route_to_archive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'climbing_hall_state.dart';
part 'climbing_hall_cubit.freezed.dart';

@Injectable()
class ClimbingHallCubit extends Cubit<ClimbingHallState> {
  final GetClimbingHallRoures _getClimbingHallRoures;
  final HallRouteToArchive _hallRouteToArchive;
  final GetGymRouteStatistic _gymRouteStatistic;
  ClimbingHallCubit(
    this._getClimbingHallRoures,
    this._hallRouteToArchive,
    this._gymRouteStatistic,
  ) : super(const ClimbingHallState.initial());

  Future<void> loadData(
    ClimbingHall climbingHall, {
    HallRouteFilter? filter,
  }) async {
    emit(const ClimbingHallState.loading());

    final failureOrRoutes = await _getClimbingHallRoures(
      climbingHall: climbingHall,
      filter: filter,
    );
    failureOrRoutes.fold(
      (failure) =>
          emit(ClimbingHallState.error(description: failure.toString())),
      (routes) async {
        if (routes.isEmpty) {
          emit(const ClimbingHallState.initial());
        } else {
          emit(ClimbingHallState.data(routes: routes));

          final failureOrStatistic = await _gymRouteStatistic(routes: routes);

          failureOrStatistic.fold(
            (failure) =>
                emit(ClimbingHallState.error(description: failure.toString())),
            (statistic) => emit(
              ClimbingHallState.data(routes: routes, statistic: statistic),
            ),
          );
        }
      },
    );
  }

  Future<void> toArchive({
    required ClimbingHall hall,
    required ClimbingHallRoute route,
    HallRouteFilter? filter,
  }) async {
    emit(const ClimbingHallState.loading());

    final failureOrUnit = await _hallRouteToArchive(hall: hall, route: route);

    failureOrUnit.fold(
      (failure) =>
          emit(ClimbingHallState.error(description: failure.toString())),
      (routes) => loadData(hall, filter: filter),
    );
  }
}

import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/hall_routes_filter.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/hall_route_to_archive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'climbing_hall_state.dart';
part 'climbing_hall_cubit.freezed.dart';

@Injectable()
class ClimbingHallCubit extends Cubit<ClimbingHallState> {
  final GetClimbingHallRoures getClimbingHallRoures;
  final HallRouteToArchive hallRouteToArchive;
  ClimbingHallCubit({
    required this.getClimbingHallRoures,
    required this.hallRouteToArchive,
  }) : super(const ClimbingHallState.initial());

  Future<void> loadData(
    ClimbingHall climbingHall, {
    HallRouteFilter? filter,
  }) async {
    emit(const ClimbingHallState.loading());

    final failureOrRoutes = await getClimbingHallRoures(
      climbingHall: climbingHall,
      filter: filter,
    );
    failureOrRoutes.fold(
      (failure) =>
          emit(ClimbingHallState.error(description: failure.toString())),
      (routes) => routes.isEmpty
          ? emit(const ClimbingHallState.initial())
          : emit(ClimbingHallState.data(routes: routes)),
    );
  }

  Future<void> toArchive({
    required ClimbingHall hall,
    required ClimbingHallRoute route,
    HallRouteFilter? filter,
  }) async {
    emit(const ClimbingHallState.loading());

    final failureOrUnit = await hallRouteToArchive(hall: hall, route: route);

    failureOrUnit.fold(
      (failure) =>
          emit(ClimbingHallState.error(description: failure.toString())),
      (routes) => loadData(hall, filter: filter),
    );
  }
}

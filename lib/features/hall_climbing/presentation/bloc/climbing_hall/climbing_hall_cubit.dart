import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/hall_routes_filter.dart';
import 'package:climbing_diary/features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'climbing_hall_state.dart';
part 'climbing_hall_cubit.freezed.dart';

@Injectable()
class ClimbingHallCubit extends Cubit<ClimbingHallState> {
  final GetClimbingHallRoures getClimbingHallRoures;
  ClimbingHallCubit({required this.getClimbingHallRoures})
      : super(ClimbingHallState.initial());

  Future<void> loadData(
    ClimbingHall climbingHall, {
    HallRouteFilter? filter,
  }) async {
    final failureOrRoutes = await getClimbingHallRoures(
      climbingHall: climbingHall,
      filter: filter,
    );
    failureOrRoutes.fold(
        (failure) => null, (routes) => emit(state.copyWith(routes: routes)));
  }
}

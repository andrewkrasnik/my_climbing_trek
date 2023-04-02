import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/get_hall_route_attempts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'hall_route_attempts_state.dart';
part 'hall_route_attempts_cubit.freezed.dart';

@Injectable()
class HallRouteAttemptsCubit extends Cubit<HallRouteAttemptsState> {
  final GetHallRouteAttempts getHallRouteAttempts;
  HallRouteAttemptsCubit({required this.getHallRouteAttempts})
      : super(const HallRouteAttemptsState.initial());

  Future<void> loadData({required ClimbingHallRoute route}) async {
    emit(const HallRouteAttemptsState.loading());

    final failureOrAttempts = await getHallRouteAttempts(route: route);

    failureOrAttempts.fold(
      (failure) =>
          emit(HallRouteAttemptsState.error(description: failure.toString())),
      (attempts) => emit(HallRouteAttemptsState.data(attempts: attempts)),
    );
  }
}

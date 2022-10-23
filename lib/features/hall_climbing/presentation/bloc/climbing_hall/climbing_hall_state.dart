part of 'climbing_hall_cubit.dart';

@freezed
class ClimbingHallState with _$ClimbingHallState {
  const factory ClimbingHallState({
    List<ClimbingHallRoute>? routes,
  }) = _ClimbingHallState;

  factory ClimbingHallState.initial() => const ClimbingHallState();
}

part of 'current_hall_treaning_cubit.dart';

@freezed
class CurrentHallTreaningState with _$CurrentHallTreaningState {
  const factory CurrentHallTreaningState({
    ClimbingHallTreaning? current,
    ClimbingHallTreaning? last,
    ClimbingHallAttempt? currentAttempt,
    ClimbingHallAttempt? lastAttempt,
    GymRouteAttemptsStatistic? currentRouteStatistic,
    GymRouteAttemptsStatistic? lastRouteStatistic,
    bool? loading,
  }) = _CurrentHallTreaningState;

  factory CurrentHallTreaningState.initial() =>
      const CurrentHallTreaningState();
}

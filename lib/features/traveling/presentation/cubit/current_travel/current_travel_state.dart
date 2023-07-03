part of 'current_travel_cubit.dart';

@freezed
class CurrentTravelState with _$CurrentTravelState {
  const factory CurrentTravelState({Travel? travel, required bool useFilter}) =
      _CurrentTravelState;
  factory CurrentTravelState.initial() =>
      const CurrentTravelState(useFilter: false);
}

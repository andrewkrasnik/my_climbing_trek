part of 'current_travel_cubit.dart';

@freezed
class CurrentTravelState with _$CurrentTravelState {
  const factory CurrentTravelState({
    Travel? travel,
    TravelDay? travelDay,
    required bool useFilter,
    required String errorMessage,
  }) = _CurrentTravelState;
  factory CurrentTravelState.initial() => const CurrentTravelState(
        useFilter: false,
        errorMessage: '',
      );
}

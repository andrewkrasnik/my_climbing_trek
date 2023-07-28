part of 'travel_day_cubit.dart';

@freezed
class TravelDayState with _$TravelDayState {
  const factory TravelDayState({
    required String description,
    required List<TransportLine> transportLines,
    required List<FeedingLine> feedingsLines,
    required List<StayLine> stayLines,
    required bool loading,
    required String errorMessage,
  }) = _TravelDayState;

  factory TravelDayState.initial() => const TravelDayState(
        description: '',
        feedingsLines: [],
        stayLines: [],
        transportLines: [],
        loading: false,
        errorMessage: '',
      );
}

part of 'travel_page_cubit.dart';

@freezed
class TravelPageState with _$TravelPageState {
  const factory TravelPageState({required int tabIndex}) = _TravelPageState;
  factory TravelPageState.initial() => const TravelPageState(tabIndex: 0);
}

part of 'travel_page_cubit.dart';

@freezed
class TravelPageState with _$TravelPageState {
  const factory TravelPageState({
    Travel? travel,
    required int tabIndex,
    required List<CostLine> costs,
    required List<InsuranceLine> insurances,
    required List<TravelBudgetLine> budgetLines,
    required List<TravelDay> days,
    required bool loading,
    required String errorMessage,
    required List<Region> regions,
    FeedingStatistic? feedingStatistic,
  }) = _TravelPageState;

  factory TravelPageState.initial() => const TravelPageState(
        tabIndex: 0,
        budgetLines: [],
        costs: [],
        days: [],
        insurances: [],
        regions: [],
        loading: false,
        errorMessage: '',
      );
}

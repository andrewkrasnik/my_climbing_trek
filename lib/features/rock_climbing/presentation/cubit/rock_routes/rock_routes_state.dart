part of 'rock_routes_cubit.dart';

@freezed
class RockRoutesState with _$RockRoutesState {
  const factory RockRoutesState.initial() = _Initial;
  const factory RockRoutesState.loading() = _Loading;
  const factory RockRoutesState.data({required List<RockRoute> routes}) = _Data;
  const factory RockRoutesState.error({required String description}) = _Error;
}

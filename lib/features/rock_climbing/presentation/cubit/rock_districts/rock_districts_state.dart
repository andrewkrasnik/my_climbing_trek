part of 'rock_districts_cubit.dart';

@freezed
class RockDistrictsState with _$RockDistrictsState {
  const factory RockDistrictsState.initial() = _Initial;
  const factory RockDistrictsState.loading() = _Loading;
  const factory RockDistrictsState.data(
      {required List<RockDistrict> districts}) = _Data;
  const factory RockDistrictsState.error({required String description}) =
      _Error;
}

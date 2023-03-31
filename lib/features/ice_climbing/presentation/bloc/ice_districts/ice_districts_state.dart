part of 'ice_districts_cubit.dart';

@freezed
class IceDistrictsState with _$IceDistrictsState {
  const factory IceDistrictsState.initial() = _Initial;
  const factory IceDistrictsState.loading() = _Loading;
  const factory IceDistrictsState.data({required List<IceDistrict> districts}) =
      _Data;
  const factory IceDistrictsState.error({required String description}) = _Error;
}

part of 'ice_sectors_cubit.dart';

@freezed
class IceSectorsState with _$IceSectorsState {
  const factory IceSectorsState.initial() = _Initial;
  const factory IceSectorsState.loading() = _Loading;
  const factory IceSectorsState.data({required List<IceSector> sectors}) =
      _Data;
  const factory IceSectorsState.error({required String description}) = _Error;
}

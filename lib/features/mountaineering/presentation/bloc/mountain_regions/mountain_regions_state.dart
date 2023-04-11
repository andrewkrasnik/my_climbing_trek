part of 'mountain_regions_cubit.dart';

@freezed
class MountainRegionsState with _$MountainRegionsState {
  const factory MountainRegionsState.initial() = _Initial;
  const factory MountainRegionsState.loading() = _Loading;
  const factory MountainRegionsState.data({required List<Region> regions}) =
      _Data;
  const factory MountainRegionsState.error({required String description}) =
      _Error;
}

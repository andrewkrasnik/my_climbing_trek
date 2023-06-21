part of 'trekking_regions_cubit.dart';

@freezed
class TrekkingRegionsState with _$TrekkingRegionsState {
  const factory TrekkingRegionsState.initial() = _Initial;
  const factory TrekkingRegionsState.loading() = _Loading;
  const factory TrekkingRegionsState.data({required List<Region> regions}) =
      _Data;
  const factory TrekkingRegionsState.error({required String description}) =
      _Error;
}

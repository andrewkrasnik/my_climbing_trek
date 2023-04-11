part of 'mountain_routes_cubit.dart';

@freezed
class MountainRoutesState with _$MountainRoutesState {
  const factory MountainRoutesState.initial() = _Initial;
  const factory MountainRoutesState.loading() = _Loading;
  const factory MountainRoutesState.data(
      {required List<MountainRoute> routes}) = _Data;
  const factory MountainRoutesState.error({required String description}) =
      _Error;
}

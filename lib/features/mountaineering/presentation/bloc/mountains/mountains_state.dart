part of 'mountains_cubit.dart';

@freezed
class MountainsState with _$MountainsState {
  const factory MountainsState.initial() = _Initial;
  const factory MountainsState.loading() = _Loading;
  const factory MountainsState.data({required List<Mountain> mountains}) =
      _Data;
  const factory MountainsState.error({required String description}) = _Error;
}

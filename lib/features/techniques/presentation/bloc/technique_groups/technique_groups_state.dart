part of 'technique_groups_cubit.dart';

@freezed
class TechniqueGroupsState with _$TechniqueGroupsState {
  const factory TechniqueGroupsState.initial() = _Initial;
  const factory TechniqueGroupsState.loading() = _Loading;
  const factory TechniqueGroupsState.data(
      {required List<TechniqueGroup> groups}) = _Data;
  const factory TechniqueGroupsState.error({required String description}) =
      _Error;
}

part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({required CategoryType hallCategoryType}) =
      _SettingsState;

  factory SettingsState.initial() =>
      const SettingsState(hallCategoryType: CategoryType.french);
}

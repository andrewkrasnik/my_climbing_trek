part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required CategoryType hallCategoryType,
    required TreaningsSettings treaningsSettings,
  }) = _SettingsState;

  factory SettingsState.initial() => SettingsState(
        hallCategoryType: CategoryType.french,
        treaningsSettings: TreaningsSettings.initial(),
      );
}

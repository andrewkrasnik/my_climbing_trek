import 'package:my_climbing_trek/core/data/category_type.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';
import 'package:my_climbing_trek/features/settings/domain/usecases/load_treanings_settings.dart';
import 'package:my_climbing_trek/features/settings/domain/usecases/save_treanings_settings.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

@LazySingleton()
class SettingsCubit extends Cubit<SettingsState> {
  final LoadTreaningsSettings _loadTreaningsSettings;
  final SaveTreaningsSettings _saveTreaningsSettings;

  SettingsCubit(this._loadTreaningsSettings, this._saveTreaningsSettings)
      : super(SettingsState.initial());

  Future<void> loadData() async {
    final failureOrSettings = await _loadTreaningsSettings();

    failureOrSettings.fold(
      (l) => null,
      (settings) => {
        if (settings != null) emit(state.copyWith(treaningsSettings: settings))
      },
    );
  }

  Future<void> changeTreaningSettings(
      {required int settingsId, required bool value}) async {
    var newSettings = state.treaningsSettings;
    switch (settingsId) {
      case 1:
        newSettings = newSettings.copyWith(useGymTreanings: value);
        break;
      case 2:
        newSettings = newSettings.copyWith(useCardioTreanings: value);
        break;
      case 3:
        newSettings = newSettings.copyWith(useStrengthTraining: value);
        break;
      case 4:
        newSettings = newSettings.copyWith(useIceTreanings: value);
        break;
      default:
        throw 'unknown settings';
    }

    final failureOrUnit = await _saveTreaningsSettings(settings: newSettings);

    failureOrUnit.fold(
      (failure) => null,
      (_) => emit(state.copyWith(treaningsSettings: newSettings)),
    );
  }

  void selectHallCategoryType({required CategoryType type}) {
    emit(state.copyWith(hallCategoryType: type));
  }
}

import 'package:my_climbing_trek/core/data/category_type.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';
import 'package:my_climbing_trek/features/settings/domain/usecases/load_places.dart';
import 'package:my_climbing_trek/features/settings/domain/usecases/load_simple_settings_usecase.dart';
import 'package:my_climbing_trek/features/settings/domain/usecases/load_treanings_settings.dart';
import 'package:my_climbing_trek/features/settings/domain/usecases/save_simple_settings_usecase.dart';
import 'package:my_climbing_trek/features/settings/domain/usecases/save_treanings_settings.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

@LazySingleton()
class SettingsCubit extends Cubit<SettingsState> {
  final LoadTreaningsSettings _loadTreaningsSettings;
  final SaveTreaningsSettings _saveTreaningsSettings;
  final LoadPlaces _loadPlaces;
  final LoadSimpleSettingsUsecase _loadSimpleSettingsUsecase;
  final SaveSimpleSettingsUsecase _saveSimpleSettingsUsecase;

  SettingsCubit(
    this._loadTreaningsSettings,
    this._saveTreaningsSettings,
    this._loadPlaces,
    this._loadSimpleSettingsUsecase,
    this._saveSimpleSettingsUsecase,
  ) : super(SettingsState.initial());

  Future<void> loadData() async {
    await _loadPlaces();

    final failureOrString =
        await _loadSimpleSettingsUsecase(key: 'HallCategoryType');

    failureOrString.fold((l) => null, (hallCategoryTypeId) async {
      if (hallCategoryTypeId != null) {
        emit(state.copyWith(
            hallCategoryType:
                CategoryType.getById(int.parse(hallCategoryTypeId))));
      }
    });

    final failureOrSettings = await _loadTreaningsSettings();

    failureOrSettings.fold(
      (l) => null,
      (settings) => {
        if (settings != null) emit(state.copyWith(treaningsSettings: settings))
      },
    );
  }

  Future<void> changeProxy(String proxy) async {
    final newSettings = state.treaningsSettings.copyWith(proxy: proxy);

    final failureOrUnit = await _saveTreaningsSettings(settings: newSettings);

    failureOrUnit.fold(
      (failure) => null,
      (_) => emit(state.copyWith(treaningsSettings: newSettings)),
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
      case 5:
        newSettings = newSettings.copyWith(useRockTraining: value);
        break;
      case 6:
        newSettings = newSettings.copyWith(useMountaineering: value);
        break;
      case 7:
        newSettings = newSettings.copyWith(useTraveling: value);
        break;
      case 8:
        newSettings = newSettings.copyWith(useTrekking: value);
      case 9:
        newSettings = newSettings.copyWith(useTechniques: value);
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

  Future<void> selectHallCategoryType({required CategoryType type}) async {
    final failureOrUnit = await _saveSimpleSettingsUsecase(
      key: 'HallCategoryType',
      value: type.id.toString(),
    );

    failureOrUnit.fold(
        (l) => null, (r) => emit(state.copyWith(hallCategoryType: type)));
  }
}

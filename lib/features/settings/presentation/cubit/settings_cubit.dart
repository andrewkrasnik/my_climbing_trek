import 'package:my_climbing_trek/core/data/category_type.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

@LazySingleton()
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  loadData() {}

  void selectHallCategoryType({required CategoryType type}) {
    emit(state.copyWith(hallCategoryType: type));
  }
}

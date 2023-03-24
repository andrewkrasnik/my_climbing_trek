import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:climbing_diary/features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/usecases/new_ice_attempt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:climbing_diary/features/ice_climbing/domain/usecases/new_ice_treaning.dart';

part 'current_ice_treaning_cubit.freezed.dart';
part 'current_ice_treaning_state.dart';

@Injectable()
class CurrentIceTreaningCubit extends Cubit<CurrentIceTreaningState> {
  final NewIceTreaning _newIceTreaning;
  final NewIceAttempt _newIceAttempt;
  final IceSectorToTreaning _iceSectorToTreaning;

  CurrentIceTreaningCubit(
    this._newIceTreaning,
    this._iceSectorToTreaning,
    this._newIceAttempt,
  ) : super(CurrentIceTreaningState.initial());

  Future<void> addNewTreaning({required IceDistrict district}) async {
    final failureOrTreaning = await _newIceTreaning(district: district);

    failureOrTreaning.fold((failure) => null,
        (treaning) => emit(state.copyWith(currentTreaning: treaning)));
  }

  Future<void> addIceSectorToTreaning({
    required IceSector sector,
    required IceDistrict district,
  }) async {
    final failureOrTreaning = await _iceSectorToTreaning(
      district: district,
      sector: sector,
      treaning: state.currentTreaning,
    );

    failureOrTreaning.fold((failure) => null,
        (treaning) => emit(state.copyWith(currentTreaning: treaning)));
  }

  Future<void> addAttempt({
    required IceSector sector,
    required ClimbingStyle style,
  }) async {
    if (state.currentTreaning != null) {
      final failureOrAttempt = await _newIceAttempt(
          treaning: state.currentTreaning!,
          sector: sector,
          category: sector.maxCategory,
          style: style);

      failureOrAttempt.fold((failure) => null,
          (attempt) => emit(state.copyWith(currentAttempt: attempt)));
    }
  }
}

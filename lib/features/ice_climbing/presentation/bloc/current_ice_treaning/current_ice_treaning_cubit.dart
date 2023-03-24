import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:climbing_diary/features/ice_climbing/domain/usecases/finish_ice_attempt.dart';
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
  final FinishIceAttempt _finishIceAttempt;

  CurrentIceTreaningCubit(
    this._newIceTreaning,
    this._iceSectorToTreaning,
    this._newIceAttempt,
    this._finishIceAttempt,
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

  void startAttempt({required IceTreaningAttempt attempt}) {}

  void finishCurrentAttempt({
    required bool fail,
    required bool downClimbing,
    required int fallCount,
    required int suspensionCount,
    required int toolsCount,
    required int iceScrewsCount,
    required bool installedIceScrews,
    required int length,
  }) async {
    final failureOrAttempt = await _finishIceAttempt(
      attempt: state.currentAttempt!,
      treaning: state.currentTreaning!,
      length: length,
      fail: fail,
      downClimbing: downClimbing,
      fallCount: fallCount,
      iceScrewsCount: iceScrewsCount,
      installedIceScrews: installedIceScrews,
      suspensionCount: suspensionCount,
      toolsCount: toolsCount,
    );

    failureOrAttempt.fold(
        (failure) => null,
        (attempt) =>
            emit(state.copyWith(currentAttempt: null, lastAttempt: attempt)));
  }

  void deleteAttempt({required IceTreaningAttempt attempt}) {}
}

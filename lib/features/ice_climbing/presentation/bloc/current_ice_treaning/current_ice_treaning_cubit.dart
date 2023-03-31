import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:climbing_diary/features/ice_climbing/domain/usecases/finish_ice_attempt.dart';
import 'package:climbing_diary/features/ice_climbing/domain/usecases/finish_ice_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/usecases/get_current_ice_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/usecases/get_last_ice_treaning.dart';
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
  final FinishIceTreaning _finishIceTreaning;
  final GetLastIceTreaning _getLastIceTreaning;
  final GetCurrentIceTreaning _getCurrentIceTreaning;

  CurrentIceTreaningCubit(
    this._newIceTreaning,
    this._iceSectorToTreaning,
    this._newIceAttempt,
    this._finishIceAttempt,
    this._finishIceTreaning,
    this._getCurrentIceTreaning,
    this._getLastIceTreaning,
  ) : super(CurrentIceTreaningState.initial());

  Future<void> loadData() async {
    emit(const CurrentIceTreaningState());

    final failureOrCurrent = await _getCurrentIceTreaning();

    if (failureOrCurrent.isLeft()) {
      // emit(state)
    }

    final failureOrPrevios = await _getLastIceTreaning();

    if (failureOrPrevios.isLeft()) {
      // emit(state)
    }

    emit(state.copyWith(
      currentTreaning:
          failureOrCurrent.fold((_) => null, (treaning) => treaning),
      lastTreaning: failureOrPrevios.fold((_) => null, (treaning) => treaning),
    ));
  }

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

  Future<void> startAttempt({required IceTreaningAttempt attempt}) async {}

  Future<void> finishCurrentAttempt({
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

  Future<void> deleteAttempt({required IceTreaningAttempt attempt}) async {}

  Future<void> finishTreaning() async {
    if (state.currentAttempt == null) {
      final failureOrTreaning =
          await _finishIceTreaning(treaning: state.currentTreaning!);

      failureOrTreaning.fold(
        (failure) => null,
        (treaning) => emit(state.copyWith(
          currentTreaning: null,
          lastTreaning: treaning,
          lastAttempt: null,
        )),
      );
    }
  }
}

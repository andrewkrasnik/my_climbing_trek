import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/delete_ice_attempt.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/finish_ice_attempt.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/finish_ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/get_current_ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/get_ice_treaning_usecase.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/get_last_ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/new_ice_attempt.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/new_ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/save_ice_treaning_usecase.dart';

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
  final DeleteIceAttempt _deleteIceAttempt;
  final GetIceTreaningUseCase _getIceTreaningUseCase;
  final SaveIceTreaningUseCase _saveIceTreaningUseCase;

  CurrentIceTreaningCubit(
    this._newIceTreaning,
    this._iceSectorToTreaning,
    this._newIceAttempt,
    this._finishIceAttempt,
    this._finishIceTreaning,
    this._getCurrentIceTreaning,
    this._getLastIceTreaning,
    this._deleteIceAttempt,
    this._getIceTreaningUseCase,
    this._saveIceTreaningUseCase,
  ) : super(CurrentIceTreaningState.initial());

  Future<void> setTreaning({required IceTreaning treaning}) async {
    emit(state.copyWith(currentTreaning: treaning));
  }

  Future<void> loadCurrentTreanings() async {
    emit(const CurrentIceTreaningState());

    final failureOrCurrent = await _getCurrentIceTreaning();

    if (failureOrCurrent.isLeft()) {
      // emit(state)
    }

    final failureOrPrevios = await _getLastIceTreaning();

    if (failureOrPrevios.isLeft()) {
      // emit(state)
    }

    final currentTreaning =
        failureOrCurrent.fold((_) => null, (treaning) => treaning);

    final lastTreaning =
        failureOrPrevios.fold((_) => null, (treaning) => treaning);

    emit(state.copyWith(
      currentAttempt: currentTreaning?.currentAttempt,
      lastAttempt: currentTreaning?.lastAttempt,
      currentTreaning: currentTreaning,
      lastTreaning: lastTreaning,
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
    required IceCategory category,
    required IceTreaningAttempt attempt,
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
      category: category,
      attempt: attempt,
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

    failureOrAttempt.fold((failure) => null, (attempt) {
      emit(state.copyWith(currentAttempt: null, lastAttempt: attempt));
      loadData();
    });
  }

  Future<void> deleteAttempt({required IceTreaningAttempt attempt}) async {
    final failureOrUnit = await _deleteIceAttempt(attempt: attempt);

    failureOrUnit.fold((failure) => null, (_) => loadData());
  }

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

  Future<void> loadData() async {
    if (state.currentTreaning == null) {
      return;
    }

    emit(state.copyWith(loading: true));

    final failureOrTreaning =
        await _getIceTreaningUseCase(treaning: state.currentTreaning!);

    failureOrTreaning.fold(
      (failure) => null,
      (treaning) => emit(
        state.copyWith(currentTreaning: treaning, loading: false),
      ),
    );
  }

  void changeDate({required DateTime date}) async {
    if (state.currentTreaning == null) {
      return;
    }

    emit(state.copyWith(loading: true));

    final failureOrTreaning = await _saveIceTreaningUseCase(
        treaning: state.currentTreaning!.copyWith(date: date));

    failureOrTreaning.fold(
      (failure) => null,
      (treaning) =>
          emit(state.copyWith(currentTreaning: treaning, loading: false)),
    );
  }
}

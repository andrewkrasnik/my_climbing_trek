import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/add_ascension_usecase.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/edit_ascension_event_usecase.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/finish_ascension_usecase.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/get_ascension_usecase.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/get_current_ascension_usecase.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/save_ascension_usecase.dart';

part 'ascension_cubit.freezed.dart';
part 'ascension_state.dart';

@Injectable()
class AscensionCubit extends Cubit<AscensionState> {
  final AddAscensionUsecase _addAscensionUsecase;
  final GetAscensionUsecase _getAscensionUsecase;
  final FinishAscensionUsecase _finishAscensionUsecase;
  final EditAscensionEventUsecase _editAscensionEventUsecase;
  final SaveAscensionUsecase _saveAscensionUsecase;
  final GetCurrentAscensionUsecase _getCurrentAscensionUsecase;

  AscensionCubit(
    this._addAscensionUsecase,
    this._getAscensionUsecase,
    this._finishAscensionUsecase,
    this._editAscensionEventUsecase,
    this._saveAscensionUsecase,
    this._getCurrentAscensionUsecase,
  ) : super(AscensionState.initial());

  Future<void> loadCurrent({required}) async {
    emit(AscensionState.initial());

    final failureOrAscension = await _getCurrentAscensionUsecase();

    failureOrAscension.fold((failure) => null,
        (ascension) => emit(state.copyWith(ascension: ascension)));
  }

  Future<void> loadData({required Ascension ascension}) async {
    emit(AscensionState.initial());

    final failureOrAscension = await _getAscensionUsecase(ascension: ascension);

    failureOrAscension.fold((failure) => null,
        (ascension) => emit(state.copyWith(ascension: ascension)));
  }

  Future<void> addAscension({
    required Mountain mountain,
    required MountainRoute route,
  }) async {
    final failureOrAscension = await _addAscensionUsecase(
      mountain: mountain,
      route: route,
    );

    failureOrAscension.fold((failure) => null,
        (ascension) => emit(state.copyWith(ascension: ascension)));
  }

  Future<void> finishAscension({required Ascension ascension}) async {
    final failureOrUnit = await _finishAscensionUsecase(ascension: ascension);

    failureOrUnit.fold((failure) => null,
        (ascension) => emit(state.copyWith(ascension: null)));
  }

  Future<void> setPlanedTime(
      {required AscensionEvent event, required DateTime time}) async {
    final failureOrUnit = await _editAscensionEventUsecase(
      event: event,
      planedTime: time,
    );

    failureOrUnit.fold((failure) => null,
        (ascension) => loadData(ascension: state.ascension!));
  }

  Future<void> setTime(
      {required AscensionEvent event, required DateTime time}) async {
    final failureOrUnit = await _editAscensionEventUsecase(
      event: event,
      time: time,
    );

    failureOrUnit.fold(
        (failure) => null, (_) => loadData(ascension: state.ascension!));
  }

  Future<void> setAscension({required Ascension ascension}) async {
    emit(AscensionState(ascension: ascension));
  }

  Future<void> changeDate({required DateTime date}) async {
    if (state.ascension == null) {
      return;
    }

    emit(state.copyWith(loading: true));

    final failureOrTreaning = await _saveAscensionUsecase(
        ascension: state.ascension!.copyWith(date: date));

    failureOrTreaning.fold(
      (failure) => null,
      (_) => loadData(ascension: state.ascension!),
    );
  }
}

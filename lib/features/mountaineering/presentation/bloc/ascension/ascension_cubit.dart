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

part 'ascension_cubit.freezed.dart';
part 'ascension_state.dart';

@Injectable()
class AscensionCubit extends Cubit<AscensionState> {
  final AddAscensionUsecase _addAscensionUsecase;
  final GetAscensionUsecase _getAscensionUsecase;
  final FinishAscensionUsecase _finishAscensionUsecase;
  final EditAscensionEventUsecase _editAscensionEventUsecase;

  AscensionCubit(
    this._addAscensionUsecase,
    this._getAscensionUsecase,
    this._finishAscensionUsecase,
    this._editAscensionEventUsecase,
  ) : super(AscensionState.initial());

  Future<void> loadData() async {
    emit(AscensionState.initial());

    final failureOrAscension = await _getAscensionUsecase();

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

    failureOrUnit.fold((failure) => null, (ascension) => loadData());
  }

  Future<void> setTime(
      {required AscensionEvent event, required DateTime time}) async {
    final failureOrUnit = await _editAscensionEventUsecase(
      event: event,
      time: time,
    );

    failureOrUnit.fold((failure) => null, (ascension) => loadData());
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_event_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/add_trek_event_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/continue_trek_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/current_trekking_path_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/delete_trek_event_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/get_trekking_path_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/previos_trekking_path_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/save_trek_event_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/save_trekking_path_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/start_trek_usecase.dart';

part 'trekking_state.dart';
part 'trekking_cubit.freezed.dart';

@Injectable()
class TrekkingCubit extends Cubit<TrekkingState> {
  final CurrentTrekkingPathUsecase _currentTrekkingPathUsecase;
  final PreviosTrekkingPathUsecase _previosTrekkingPathUsecase;
  final StartTrekUsecase _startTrekUsecase;
  final AddTrekEventUsecase _addTrekEventUsecase;
  final ContinueTrekUsecase _continueTrekUsecase;
  final GetTrekkingPathUsecase _getTrekkingPathUsecase;
  final SaveTrekkingPathUsecase _saveTrekkingPathUsecase;
  final DeleteTrekEventUsecase _deleteTrekEventUsecase;
  final SaveTrekEventUsecase _saveTrekEventUsecase;

  TrekkingCubit(
    this._currentTrekkingPathUsecase,
    this._previosTrekkingPathUsecase,
    this._startTrekUsecase,
    this._addTrekEventUsecase,
    this._continueTrekUsecase,
    this._getTrekkingPathUsecase,
    this._saveTrekkingPathUsecase,
    this._deleteTrekEventUsecase,
    this._saveTrekEventUsecase,
  ) : super(TrekkingState.initial());

  Future<void> loadCurrent() async {
    final failureOrCurrentPath = await _currentTrekkingPathUsecase();

    failureOrCurrentPath.fold((failure) => null, (currentPath) async {
      emit(state.copyWith(
        currentPath: currentPath,
        previosPath: null,
        currentEvent: currentPath?.events.lastOrNull,
      ));

      final failureOrPath = await _previosTrekkingPathUsecase();

      failureOrPath.fold((failure) => null, (path) async {
        emit(state.copyWith(previosPath: path));
      });
    });
  }

  Future<void> loadData({required TrekkingPath path}) async {
    final failureOrCurrentPath = await _getTrekkingPathUsecase(path: path);

    failureOrCurrentPath.fold((failure) => null, (currentPath) async {
      emit(state.copyWith(
        currentPath: currentPath,
        previosPath: null,
        currentEvent: currentPath.events.lastOrNull,
        loading: false,
      ));
    });
  }

  Future<void> startTrek({required Trek trek, bool turn = false}) async {
    final failureOrPath = await _startTrekUsecase(trek: trek, turn: turn);

    failureOrPath.fold(
        (failure) => null,
        (path) => emit(state.copyWith(
              currentPath: path,
              previosPath: null,
              currentPoint: path.currentPoint,
            )));
  }

  Future<void> continueTrek(
      {required TrekkingPath path, bool turn = false}) async {
    final failureOrPath = await _continueTrekUsecase(path: path, turn: turn);

    failureOrPath.fold(
        (failure) => null,
        (path) => emit(state.copyWith(
              currentPath: path,
              previosPath: null,
              currentPoint: path.currentSectionStart,
            )));
  }

  Future<void> addEvent({
    required TrekkingPath path,
    required TrekkingEventType type,
    DateTime? time,
    TrekPoint? point,
  }) async {
    final failureOrUnit = await _addTrekEventUsecase(
      path: path,
      type: type,
      point: point,
      time: time,
    );

    if (point != null) {
      emit(state.copyWith(currentPoint: null));
    }

    failureOrUnit.fold((failure) => null, (_) => loadData(path: path));
  }

  Future<void> setCurrentPoint({required TrekPoint? point}) async {
    emit(state.copyWith(currentPoint: point));
  }

  Future<void> setPath({required TrekkingPath path}) async {
    emit(TrekkingState(currentPath: path));
  }

  Future<void> changeDate({required DateTime date}) async {
    if (state.currentPath == null) {
      return;
    }

    emit(state.copyWith(loading: true));

    final failureOrTreaning = await _saveTrekkingPathUsecase(
        path: state.currentPath!.copyWith(date: date));

    failureOrTreaning.fold(
      (failure) => null,
      (_) => loadData(path: state.currentPath!),
    );
  }

  Future<void> setTime(
      {required TrekkingPathEvent event, required DateTime time}) async {
    final failureOrUnit =
        await _saveTrekEventUsecase(event: event.copyWith(time: time));

    failureOrUnit.fold(
      (failure) => null,
      (_) => loadData(path: state.currentPath!),
    );
  }

  Future<void> deleteEvent({required TrekkingPathEvent event}) async {
    final failureOrUnit = await _deleteTrekEventUsecase(event: event);

    failureOrUnit.fold(
      (failure) => null,
      (_) => loadData(path: state.currentPath!),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_event_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/add_trek_event_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/current_trekking_path_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/previos_trekking_path_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/start_trek_usecase.dart';

part 'trekking_state.dart';
part 'trekking_cubit.freezed.dart';

@Injectable()
class TrekkingCubit extends Cubit<TrekkingState> {
  final CurrentTrekkingPathUsecase _currentTrekkingPathUsecase;
  final PreviosTrekkingPathUsecase _previosTrekkingPathUsecase;
  final StartTrekUsecase _startTrekUsecase;
  final AddTrekEventUsecase _addTrekEventUsecase;

  TrekkingCubit(
    this._currentTrekkingPathUsecase,
    this._previosTrekkingPathUsecase,
    this._startTrekUsecase,
    this._addTrekEventUsecase,
  ) : super(TrekkingState.initial());

  Future<void> loadData() async {
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

  Future<void> startTrek({required Trek trek}) async {
    final failureOrPath = await _startTrekUsecase(trek: trek);

    failureOrPath.fold(
        (failure) => null,
        (path) => emit(state.copyWith(
              currentPath: path,
              previosPath: null,
              currentPoint: path.currentSection?.start,
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

    failureOrUnit.fold((failure) => null, (_) => loadData());
  }

  Future<void> setCurrentPoint({required TrekPoint point}) async {
    emit(state.copyWith(currentPoint: point));
  }
}

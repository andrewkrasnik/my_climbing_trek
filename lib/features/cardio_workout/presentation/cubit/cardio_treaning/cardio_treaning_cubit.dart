import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_exercise.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/usecases/save_cardio_treaning.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'cardio_treaning_state.dart';

@injectable
class CardioTreaningCubit extends Cubit<CardioTreaningState> {
  final GetLastCardioTreaning _getLastCardioTreaning;
  final SaveCardioTreaning _saveCardioTreaning;

  CardioTreaningCubit(
    this._getLastCardioTreaning,
    this._saveCardioTreaning,
  ) : super(CardioTreaningState.initial());

  Future<void> loadData() async {
    emit(state.copyWith(loading: true));

    final failureOrTreaning = await _getLastCardioTreaning();

    failureOrTreaning.fold(
        (failure) => emit(
            state.copyWith(loading: false, errorMessage: failure.toString())),
        (treaning) => emit(state.copyWith(
            loading: false, lastTreaning: treaning, errorMessage: '')));
  }

  Future<void> save({
    String id = '',
    required DateTime date,
    required int duration,
    required CardioExercise exercise,
    required double length,
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrTreaning = await _saveCardioTreaning(
      date: date,
      duration: duration,
      exercise: exercise,
      length: length,
      id: id,
    );

    failureOrTreaning.fold(
        (failure) => emit(
            state.copyWith(loading: false, errorMessage: failure.toString())),
        (_) => loadData());
  }
}

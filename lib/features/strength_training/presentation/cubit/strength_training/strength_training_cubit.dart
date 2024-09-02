import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:my_climbing_trek/features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/usecases/finish_stregth_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/usecases/save_stregth_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/usecases/update_strength_treaning_exercises.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/usecases/add_strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/usecases/get_current_strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/usecases/get_previos_strength_treaning.dart';

part 'strength_training_state.dart';

@Injectable()
class StrengthTrainingCubit extends Cubit<StrengthTrainingState> {
  final GetCurrentStrengthTreaning getCurrentStrengthTreaning;
  final GetPreviosStrengthTreaning getPreviosStrengthTreaning;
  final AddStrengthTreaning addStrengthTreaning;
  final UpdateStrengthTreaningExercises updateStrengthTreaningExercises;
  final AddRepetitionForStrengthTreaning addRepetitionForStrengthTreaning;
  final FinishStrengthTreaning finishStrengthTreaning;
  final DeleteRepetitionForStrengthTreaning deleteRepetitionForStrengthTreaning;
  final SaveStrengthTreaning saveStrengthTreaning;

  StrengthTrainingCubit({
    required this.getCurrentStrengthTreaning,
    required this.getPreviosStrengthTreaning,
    required this.addStrengthTreaning,
    required this.updateStrengthTreaningExercises,
    required this.addRepetitionForStrengthTreaning,
    required this.finishStrengthTreaning,
    required this.deleteRepetitionForStrengthTreaning,
    required this.saveStrengthTreaning,
  }) : super(StrengthTrainingState.initial());

  Future<void> loadData() async {
    emit(const StrengthTrainingState(loading: true));

    final failureOrCurrent = await getCurrentStrengthTreaning();

    if (failureOrCurrent.isLeft()) {
      // emit(state)
    }

    final failureOrPrevios = await getPreviosStrengthTreaning();

    if (failureOrPrevios.isLeft()) {
      // emit(state)
    }

    emit(state.copyWith(
      currentTreaning:
          failureOrCurrent.fold((_) => null, (treaning) => treaning),
      previosTreaning:
          failureOrPrevios.fold((_) => null, (treaning) => treaning),
      loading: false,
    ));
  }

  Future<void> addTreaning() async {
    emit(state.copyWith(loading: true));

    final failureOrTreaning = await addStrengthTreaning();

    failureOrTreaning.fold(
      (failure) => null,
      (treaning) =>
          emit(state.copyWith(currentTreaning: treaning, loading: false)),
    );
  }

  Future<void> updateExercises({required StrengthTreaning treaning}) async {
    emit(state.copyWith(loading: true));

    final failureOrTreaning =
        await updateStrengthTreaningExercises(treaning: treaning);

    failureOrTreaning.fold(
      (failure) => null,
      (treaning) =>
          emit(state.copyWith(currentTreaning: treaning, loading: false)),
    );
  }

  Future<void> addRepetition({
    required StrengthTreaning treaning,
    required StrengthExercise exercise,
    required int count,
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrTreaning = await addRepetitionForStrengthTreaning(
        treaning: treaning, count: count, exercise: exercise);

    failureOrTreaning.fold(
      (failure) => null,
      (treaning) =>
          emit(state.copyWith(currentTreaning: treaning, loading: false)),
    );
  }

  Future<void> deleteRepetition({
    required StrengthTreaning treaning,
    required StrengthExercise exercise,
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrTreaning = await deleteRepetitionForStrengthTreaning(
        treaning: treaning, exercise: exercise);

    failureOrTreaning.fold(
      (failure) => null,
      (treaning) =>
          emit(state.copyWith(currentTreaning: treaning, loading: false)),
    );
  }

  Future<void> finishTreaning({required StrengthTreaning treaning}) async {
    emit(state.copyWith(loading: true));

    final failureOrTreaning = await finishStrengthTreaning(treaning: treaning);

    failureOrTreaning.fold(
      (failure) => null,
      (treaning) => loadData(),
    );
  }

  Future<void> changeDate({
    required StrengthTreaning treaning,
    required DateTime date,
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrTreaning =
        await saveStrengthTreaning(treaning: treaning.copyWith(date: date));

    failureOrTreaning.fold(
      (failure) => null,
      (treaning) =>
          emit(state.copyWith(currentTreaning: treaning, loading: false)),
    );
  }
}

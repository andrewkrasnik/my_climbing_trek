import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:climbing_diary/features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/usecases/update_strength_treaning_exercises.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/usecases/add_strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/usecases/get_current_strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/usecases/get_previos_strength_treaning.dart';

part 'strength_training_state.dart';

@Injectable()
class StrengthTrainingCubit extends Cubit<StrengthTrainingState> {
  final GetCurrentStrengthTreaning getCurrentStrengthTreaning;
  final GetPreviosStrengthTreaning getPreviosStrengthTreaning;
  final AddStrengthTreaning addStrengthTreaning;
  final UpdateStrengthTreaningExercises updateStrengthTreaningExercises;
  final AddRepetitionForStrengthTreaning addRepetitionForStrengthTreaning;

  StrengthTrainingCubit({
    required this.getCurrentStrengthTreaning,
    required this.getPreviosStrengthTreaning,
    required this.addStrengthTreaning,
    required this.updateStrengthTreaningExercises,
    required this.addRepetitionForStrengthTreaning,
  }) : super(StrengthTrainingState.initial());

  Future<void> loadData() async {
    emit(state.copyWith(loading: true));

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
}

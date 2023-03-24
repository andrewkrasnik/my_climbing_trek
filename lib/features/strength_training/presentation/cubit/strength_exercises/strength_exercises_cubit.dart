import 'package:climbing_diary/features/strength_training/domain/usecases/delete_strength_exercise.dart';
import 'package:climbing_diary/features/strength_training/domain/usecases/select_to_use_strength_exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/features/strength_training/domain/entities/strength_exercise.dart';
import 'package:climbing_diary/features/strength_training/domain/usecases/get_strength_exercises.dart';
import 'package:climbing_diary/features/strength_training/domain/usecases/save_strength_exercise.dart';

part 'strength_exercises_cubit.freezed.dart';
part 'strength_exercises_state.dart';

@Injectable()
class StrengthExercisesCubit extends Cubit<StrengthExercisesState> {
  final GetStrengthExercises getStrengthExercises;
  final SaveStrengthExercise saveStrengthExercise;
  final SelectToUseStrengthExercise selectToUseStrengthExercise;
  final DeleteStrengthExercise deleteStrengthExercise;

  StrengthExercisesCubit(
    this.getStrengthExercises,
    this.saveStrengthExercise,
    this.selectToUseStrengthExercise,
    this.deleteStrengthExercise,
  ) : super(const StrengthExercisesState.initial());

  Future<void> loadData() async {
    emit(const StrengthExercisesState.loading());

    final failureOrExercises = await getStrengthExercises();

    failureOrExercises.fold(
        (failure) => emit(StrengthExercisesState.error(
              description: failure.toString(),
            )),
        (exercises) => emit(
              StrengthExercisesState.data(exercises: exercises),
            ));
  }

  Future<void> save({
    required String name,
    required int repetitions,
    String? id,
  }) async {
    emit(const StrengthExercisesState.loading());

    final failureOrExercise = await saveStrengthExercise(
      name: name,
      repetitions: repetitions,
      id: id,
    );

    failureOrExercise.fold(
        (failure) => emit(StrengthExercisesState.error(
              description: failure.toString(),
            )),
        (treaning) => loadData());
  }

  Future<void> select({
    required StrengthExercise exercise,
    required bool select,
  }) async {
    emit(const StrengthExercisesState.loading());

    final failureOrExercise = await selectToUseStrengthExercise(
      exercise: exercise,
      select: select,
    );

    failureOrExercise.fold(
        (failure) => emit(StrengthExercisesState.error(
              description: failure.toString(),
            )),
        (treaning) => loadData());
  }

  Future<void> deleteExercise({required StrengthExercise exercise}) async {
    final failureOrUnit = await deleteStrengthExercise(exercise: exercise);

    failureOrUnit.fold(
        (failure) => emit(StrengthExercisesState.error(
              description: failure.toString(),
            )),
        (_) => null);

    loadData();
  }
}

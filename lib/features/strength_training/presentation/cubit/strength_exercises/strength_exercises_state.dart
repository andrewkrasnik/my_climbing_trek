part of 'strength_exercises_cubit.dart';

@freezed
class StrengthExercisesState with _$StrengthExercisesState {
  const factory StrengthExercisesState.initial() = _Initial;

  const factory StrengthExercisesState.loading() = _Loading;
  const factory StrengthExercisesState.data(
      {required Map<StrengthExercise, bool> exercises}) = _Data;
  const factory StrengthExercisesState.error({required String description}) =
      _Error;
}

part of 'strength_trainings_cubit.dart';

@freezed
class StrengthTrainingsState with _$StrengthTrainingsState {
  const factory StrengthTrainingsState.initial() = _Initial;

  const factory StrengthTrainingsState.loading() = _Loading;
  const factory StrengthTrainingsState.data(
      {required List<StrengthTreaning> treanings}) = _Data;
  const factory StrengthTrainingsState.error({required String description}) =
      _Error;
}

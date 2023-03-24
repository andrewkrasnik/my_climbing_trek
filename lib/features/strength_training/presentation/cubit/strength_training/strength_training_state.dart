part of 'strength_training_cubit.dart';

class StrengthTrainingState extends Equatable {
  final StrengthTreaning? currentTreaning;
  final StrengthTreaning? previosTreaning;
  final bool loading;

  const StrengthTrainingState({
    this.currentTreaning,
    this.previosTreaning,
    this.loading = false,
  });

  factory StrengthTrainingState.initial() => const StrengthTrainingState();

  StrengthTrainingState copyWith({
    StrengthTreaning? currentTreaning,
    StrengthTreaning? previosTreaning,
    bool? loading,
  }) {
    return StrengthTrainingState(
      currentTreaning: currentTreaning ?? this.currentTreaning,
      previosTreaning: previosTreaning ?? this.previosTreaning,
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [currentTreaning, previosTreaning, loading];
}

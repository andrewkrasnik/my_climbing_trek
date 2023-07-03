part of 'technique_treaning_cubit.dart';

@freezed
class TechniqueTreaningState with _$TechniqueTreaningState {
  const factory TechniqueTreaningState({
    TechniqueTreaning? currentTreaning,
    TechniqueTreaning? previosTreaning,
    Technique? currentTechnique,
  }) = _TechniqueTreaningState;

  factory TechniqueTreaningState.initial() => const TechniqueTreaningState();
}

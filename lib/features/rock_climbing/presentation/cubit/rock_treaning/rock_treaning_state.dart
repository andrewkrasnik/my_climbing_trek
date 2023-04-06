part of 'rock_treaning_cubit.dart';

@freezed
class RockTreaningState with _$RockTreaningState {
  const factory RockTreaningState({
    RockTreaning? currentTreaning,
    RockTreaning? lastTreaning,
    RockTreaningAttempt? currentAttempt,
    RockTreaningAttempt? lastAttempt,
  }) = _CurrentIceTreaningState;

  factory RockTreaningState.initial() => const RockTreaningState();
}

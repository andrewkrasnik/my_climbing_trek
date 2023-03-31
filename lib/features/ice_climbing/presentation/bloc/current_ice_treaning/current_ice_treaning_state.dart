part of 'current_ice_treaning_cubit.dart';

@freezed
class CurrentIceTreaningState with _$CurrentIceTreaningState {
  const factory CurrentIceTreaningState({
    IceTreaning? currentTreaning,
    IceTreaning? lastTreaning,
    IceTreaningAttempt? currentAttempt,
    IceTreaningAttempt? lastAttempt,
  }) = _CurrentIceTreaningState;

  factory CurrentIceTreaningState.initial() => const CurrentIceTreaningState();
}

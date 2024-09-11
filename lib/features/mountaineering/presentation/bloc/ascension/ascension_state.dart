part of 'ascension_cubit.dart';

@freezed
class AscensionState with _$AscensionState {
  const factory AscensionState({Ascension? ascension, bool? loading}) =
      _AscensionState;
  factory AscensionState.initial() => const AscensionState();
}

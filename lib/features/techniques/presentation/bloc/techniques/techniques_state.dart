part of 'techniques_cubit.dart';

@freezed
class TechniquesState with _$TechniquesState {
  const factory TechniquesState.initial() = _Initial;
  const factory TechniquesState.loading() = _Loading;
  const factory TechniquesState.data({
    required List<Technique> techniques,
    required bool editing,
  }) = _Data;
  const factory TechniquesState.error({required String description}) = _Error;
}

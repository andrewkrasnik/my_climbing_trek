part of 'treks_cubit.dart';

@freezed
class TreksState with _$TreksState {
  const factory TreksState.initial() = _Initial;

  const factory TreksState.loading() = _Loading;

  const factory TreksState.data({
    required List<Trek> treks,
    required List<TrekPoint> points,
  }) = _Data;

  const factory TreksState.error({required String description}) = _Error;
}

part of 'cardio_treanings_cubit.dart';

@freezed
class CardioTreaningsState with _$CardioTreaningsState {
  const factory CardioTreaningsState.initial() = _Initial;

  const factory CardioTreaningsState.loading() = _Loading;
  const factory CardioTreaningsState.data(
      {required List<CardioTreaning> treanings}) = _Data;
  const factory CardioTreaningsState.error({required String description}) =
      _Error;
}

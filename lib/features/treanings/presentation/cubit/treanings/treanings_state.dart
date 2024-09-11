part of 'treanings_cubit.dart';

@freezed
class TreaningsState with _$TreaningsState {
  const factory TreaningsState.initial() = _Initial;

  const factory TreaningsState.loading() = _Loading;

  const factory TreaningsState.data({required List<Treaning> treanings}) =
      _Data;

  const factory TreaningsState.error({required String description}) = _Error;
}

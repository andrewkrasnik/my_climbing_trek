part of 'travels_cubit.dart';

@freezed
class TravelsState with _$TravelsState {
  const factory TravelsState.initial() = _Initial;
  const factory TravelsState.loading() = _Loading;
  const factory TravelsState.data({required List<Travel> travels}) = _Data;
  const factory TravelsState.error({required String description}) = _Error;
}

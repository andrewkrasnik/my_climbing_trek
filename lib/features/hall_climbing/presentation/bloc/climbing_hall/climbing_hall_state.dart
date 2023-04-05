part of 'climbing_hall_cubit.dart';

@freezed
class ClimbingHallState with _$ClimbingHallState {
  const factory ClimbingHallState.initial() = _Initial;
  const factory ClimbingHallState.loading() = _Loading;
  const factory ClimbingHallState.data(
      {required List<ClimbingHallRoute> routes}) = _Data;
  const factory ClimbingHallState.error({required String description}) = _Error;
}

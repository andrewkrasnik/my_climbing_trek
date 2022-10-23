part of 'climbing_halls_cubit.dart';

@freezed
class ClimbingHallsState with _$ClimbingHallsState {
  const factory ClimbingHallsState.initial() = _Initial;
  const factory ClimbingHallsState.loading() = _Loading;
  const factory ClimbingHallsState.data({required List<ClimbingHall> halls}) =
      _Data;
}

part of 'hall_treanings_cubit.dart';

@freezed
class HallTreaningsState with _$HallTreaningsState {
  const factory HallTreaningsState.initial() = _Initial;

  const factory HallTreaningsState.loading() = _Loading;
  const factory HallTreaningsState.data(
      {required List<ClimbingHallTreaning> treanings}) = _Data;
}

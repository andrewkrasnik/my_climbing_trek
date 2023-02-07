part of 'hall_route_attempts_cubit.dart';

@freezed
class HallRouteAttemptsState with _$HallRouteAttemptsState {
  const factory HallRouteAttemptsState.initial() = _Initial;

  const factory HallRouteAttemptsState.loading() = _Loading;

  const factory HallRouteAttemptsState.data(
      {required List<ClimbingHallAttempt> attempts}) = _Data;

  const factory HallRouteAttemptsState.error({required String description}) =
      _Error;
}

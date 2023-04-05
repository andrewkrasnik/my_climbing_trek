part of 'hall_route_cubit.dart';

@freezed
class HallRouteState with _$HallRouteState {
  const factory HallRouteState.initial() = _Initial;
  const factory HallRouteState.saved() = _Saved;
  const factory HallRouteState.loading() = _Loading;
  const factory HallRouteState.error({required String description}) = _Error;
}

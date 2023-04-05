part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;
  const factory AuthenticationState.loading() = _Loading;
  const factory AuthenticationState.logged({required User user}) = _Logged;
  const factory AuthenticationState.error({required String description}) =
      _Error;
}

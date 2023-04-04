import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/features/authentication/domain/entities/user.dart';
import 'package:my_climbing_trek/features/authentication/domain/usecases/auth_get_user.dart';
import 'package:my_climbing_trek/features/authentication/domain/usecases/auth_login.dart';
import 'package:my_climbing_trek/features/authentication/domain/usecases/auth_logout.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

@Injectable()
class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthLogin _authLogin;
  final AuthLogout _authLogout;
  final AuthGetUser _authGetUser;

  AuthenticationCubit(
    this._authLogin,
    this._authLogout,
    this._authGetUser,
  ) : super(const AuthenticationState.initial());

  Future<void> login() async {
    emit(const AuthenticationState.loading());

    final failureOrUser = await _authLogin();

    failureOrUser.fold(
      (failure) =>
          emit(AuthenticationState.error(description: failure.toString())),
      (user) => emit(AuthenticationState.logged(user: user)),
    );
  }

  Future<void> logout() async {
    emit(const AuthenticationState.loading());

    final failureOrUser = await _authLogout();

    failureOrUser.fold(
      (failure) =>
          emit(AuthenticationState.error(description: failure.toString())),
      (user) => emit(const AuthenticationState.initial()),
    );
  }

  Future<void> getUser() async {
    emit(const AuthenticationState.loading());

    final failureOrUser = await _authGetUser();

    failureOrUser.fold(
      (failure) =>
          emit(AuthenticationState.error(description: failure.toString())),
      (user) {
        if (user != null) {
          emit(AuthenticationState.logged(user: user));
        } else {
          emit(const AuthenticationState.initial());
        }
      },
    );
  }
}

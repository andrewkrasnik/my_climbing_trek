import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/authentication/presentation/cubit/authentication_cubit.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        return state.maybeMap(
          initial: (_) => ElevatedButton.icon(
            onPressed: () {
              BlocProvider.of<AuthenticationCubit>(context).login();
            },
            icon: const Icon(Icons.login_outlined),
            label: const Text('Continue with Google'),
          ),
          logged: (loggedState) => Column(
            children: [
              const Text('Аккаунт'),
              Text(loggedState.user.email),
              ElevatedButton.icon(
                onPressed: () {
                  BlocProvider.of<AuthenticationCubit>(context).logout();
                },
                icon: const Icon(Icons.logout_outlined),
                label: const Text('Выйти из аккаунта'),
              ),
            ],
          ),
          loading: (_) => const CircularProgressIndicator(),
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

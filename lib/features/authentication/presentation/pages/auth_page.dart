import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/authentication/presentation/cubit/authentication_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Авторизуйтесь для начала работы с приложением',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {
              BlocProvider.of<AuthenticationCubit>(context).login();
            },
            icon: const Icon(Icons.login, size: 40),
            label: Text(
              'Continue with Google',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}

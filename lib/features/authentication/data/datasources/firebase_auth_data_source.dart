import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';

import 'package:my_climbing_trek/features/authentication/data/datasources/auth_data_source.dart';
import 'package:my_climbing_trek/features/authentication/domain/entities/user.dart';

@LazySingleton(as: AuthDataSource)
class FirebaseAuthDataSource implements AuthDataSource {
  final fb.FirebaseAuth firebaseAuth;

  FirebaseAuthDataSource({
    required this.firebaseAuth,
  });

  @override
  Future<Either<Failure, User>> login() async {
    try {
      final credential =
          await firebaseAuth.signInWithProvider(fb.GoogleAuthProvider());

      final user = User(
        id: credential.user!.uid,
        name: credential.user!.displayName ?? (credential.user!.email ?? ""),
        email: credential.user!.email!,
      );
      return Right(user);
    } catch (error) {
      return Left(LoginFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (error) {
      return Left(LoginFailure(description: error.toString()));
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, User?>> getSignedInUser() async {
    try {
      final currentUser = firebaseAuth.currentUser;

      if (currentUser != null) {
        final user = User(
          id: currentUser.uid,
          name: currentUser.displayName ?? (currentUser.email ?? ""),
          email: currentUser.email!,
        );
        return Right(user);
      } else {
        return const Right(null);
      }
    } catch (error) {
      return Left(LoginFailure(description: error.toString()));
    }
  }
}

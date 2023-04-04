import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/authentication/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/features/authentication/data/datasources/auth_data_source.dart';
import 'package:my_climbing_trek/features/authentication/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({
    required this.authDataSource,
  });

  @override
  Future<Either<Failure, User>> login() async {
    return await authDataSource.login();
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    return await authDataSource.logout();
  }

  @override
  Future<Either<Failure, User?>> getSignedInUser() async {
    return await authDataSource.getSignedInUser();
  }
}

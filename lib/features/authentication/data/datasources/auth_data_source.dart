import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';

import 'package:my_climbing_trek/features/authentication/domain/entities/user.dart';

abstract class AuthDataSource {
  Future<Either<Failure, User>> login();
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, User?>> getSignedInUser();
}

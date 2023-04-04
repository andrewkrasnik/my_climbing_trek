import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/authentication/domain/entities/user.dart';
import 'package:my_climbing_trek/features/authentication/domain/repositories/auth_repository.dart';

@Injectable()
class AuthLogin {
  final AuthRepository authRepository;

  AuthLogin({
    required this.authRepository,
  });

  Future<Either<Failure, User>> call() async {
    return await authRepository.login();
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/authentication/domain/repositories/auth_repository.dart';

@Injectable()
class AuthLogout {
  final AuthRepository authRepository;

  AuthLogout({
    required this.authRepository,
  });

  Future<Either<Failure, Unit>> call() async {
    return await authRepository.logout();
  }
}

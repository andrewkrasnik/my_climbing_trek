import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';

abstract class TreaningsRepository {
  Future<Either<Failure, List<Treaning>>> getTreanings();

  Future<Either<Failure, List<Map<String, dynamic>>>> getJsonTreanings();

  Future<Either<Failure, Unit>> saveJsonTreanings(List<dynamic> json);
}

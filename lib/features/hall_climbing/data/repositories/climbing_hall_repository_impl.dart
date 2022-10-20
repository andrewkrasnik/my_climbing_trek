import 'package:climbing_diary/features/hall_climbing/data/datasources/climbing_hall_data_source.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/city.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/repositories/climbing_hall_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ClimbingHallRepository)
class ClimbingHallRepositoryImpl implements ClimbingHallRepository {
  final ClimbingHallDataSource climbingHallDataSource;

  ClimbingHallRepositoryImpl({required this.climbingHallDataSource});
  @override
  Future<Either<Failure, List<City>>> getSities() async {
    return await climbingHallDataSource.getSities();
  }

  @override
  Future<Either<Failure, List<ClimbingHall>>> getClimbingHalls() async {
    return await climbingHallDataSource.getClimbingHalls();
  }
}

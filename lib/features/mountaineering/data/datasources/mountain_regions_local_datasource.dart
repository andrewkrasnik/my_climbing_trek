import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';

abstract class MountainRegionsLocalDataSource {
  Future<Either<Failure, List<Region>>> regions();

  Future<Either<Failure, List<Mountain>>> mountains({required Region region});

  Future<Either<Failure, List<MountainRoute>>> routes(
      {required Mountain mountain});
}

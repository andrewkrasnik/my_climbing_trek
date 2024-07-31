import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';

abstract class TrekkingLocalDataSource {
  Future<Either<Failure, List<Region>>> regions();

  Future<Either<Failure, List<Trek>>> treks({required Region region});

  List<TrekPoint> get pointsCash;

  Future<Either<Failure, List<TrekPoint>>> points({required Region region});

  Future<Either<Failure, Unit>> saveRegion({required Region region});

  Future<Either<Failure, Unit>> deleteRegion({required Region region});

  Future<Either<Failure, Unit>> saveTreks(
      {required Region region, required List<Trek> treks});

  Future<Either<Failure, Unit>> savePoints({
    required Region region,
    required List<TrekPoint> points,
  });
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/data/datasources/travel_local_datasource.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';

@LazySingleton(as: TravelLocalDatasource)
class MockTravelLocalDatasource implements TravelLocalDatasource {
  final List<Travel> _list = [
    Travel(
      name: 'Ала-Арча 2023',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1axUAphSxg3bOqphsxHDN8Ohgp-E5JM_12w&usqp=CAU',
      date: DateTime(2023, 5, 1),
      start: DateTime(2023, 5, 1),
      regions: [],
    ),
    Travel(
      name: 'Хибины 2023',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1axUAphSxg3bOqphsxHDN8Ohgp-E5JM_12w&usqp=CAU',
      date: DateTime(2023, 2, 22),
      start: DateTime(2023, 2, 22),
      regions: [],
    ),
    Travel(
      name: 'Узункол 2023',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1axUAphSxg3bOqphsxHDN8Ohgp-E5JM_12w&usqp=CAU',
      date: DateTime(2023, 7, 16),
      start: DateTime(2023, 7, 16),
      regions: [],
    ),
  ];
  @override
  Future<Either<Failure, Travel>> currentTravel() async {
    return Right(_list.first);
  }

  @override
  Future<Either<Failure, Unit>> deleteTravel({required Travel travel}) async {
    return const Right(unit);
  }

  @override
  Future<Either<Failure, List<Travel>>> getTreanings() async {
    return Right(_list);
  }

  @override
  Future<Either<Failure, Unit>> saveTravel({required Travel travel}) async {
    return const Right(unit);
  }
}

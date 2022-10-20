import 'package:climbing_diary/core/data/map_point.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/hall_climbing/data/datasources/climbing_hall_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/city.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ClimbingHallDataSource)
class MockClimbingHallDataSource implements ClimbingHallDataSource {
  static const List<City> _cities = [
    City(name: 'Москва'),
    City(name: 'Санкт-Петербург'),
  ];

  final List<ClimbingHall> _climbingHalls = [
    ClimbingHall(
        name: 'СпортСтейшн',
        address: 'Новоостаповская улица, д. 5, стр. 2',
        city: _cities.first,
        hasBouldering: true,
        hasBigWall: true,
        point: MapPoint(),
        image:
            'https://avatars.mds.yandex.net/get-altay/5483320/2a0000017ce6617df6c425f29ba307b7e41e/XXXL',
        telephone: '+7 (495) 126-16-59',
        website: 'https://station.club/'),
    ClimbingHall(
        name: 'BigWallsport',
        address: 'просп. Мира, 119, стр. 22',
        city: _cities.first,
        hasBouldering: true,
        hasBigWall: true,
        point: MapPoint(),
        image:
            'https://avatars.mds.yandex.net/get-altay/1938975/2a0000016ec72ab066107d87f0f36f12f04a/XXXL',
        telephone: '+7 (499) 653-60-30',
        website: 'https://bigwallsport.ru/'),
    ClimbingHall(
        name: 'Северная стена',
        address: 'Газовая ул., 10З',
        city: _cities.first,
        hasBouldering: true,
        hasBigWall: true,
        point: MapPoint(),
        image:
            'https://avatars.mds.yandex.net/get-altay/4581272/2a00000179d578d29da510d67c0d62c26141/XXXL',
        telephone: '+7 (812) 501-93-15',
        website: 'https://severnayastena.ru/'),
  ];
  @override
  Future<Either<Failure, List<ClimbingHall>>> getClimbingHalls() async {
    return Right(_climbingHalls);
  }

  @override
  Future<Either<Failure, List<City>>> getSities() async {
    return const Right(_cities);
  }
}

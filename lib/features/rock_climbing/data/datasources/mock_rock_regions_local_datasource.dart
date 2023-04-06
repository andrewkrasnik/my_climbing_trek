import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/core/data/map_point.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';

class MockRockRegionsLocalDataSource implements RockRegionsLocalDataSource {
  static final dukinskie = RockDistrict(
      name: 'Дюкинские карьеры',
      region: Region(name: 'Владимирская область'),
      mapPoint: const MapPoint(latitude: 56.010036, longitude: 41.065170),
      id: 'dukenskie');

  static final dukenskieCentral = RockSector(
    name: 'Центральный',
    district: dukinskie,
    id: 'dukenskie_central',
    hasRope: true,
  );

  static final dukenskieCircus = RockSector(
    name: 'Цирк',
    district: dukinskie,
    id: 'dukenskie_circus',
    hasRope: true,
    hasDryTooling: true,
  );

  final List<RockDistrict> _districts = [dukinskie];

  final Map<RockDistrict, List<RockSector>> _sectors = {
    dukinskie: [dukenskieCentral, dukenskieCircus]
  };

  final Map<RockSector, List<RockRoute>> _routes = {
    dukenskieCentral: [
      RockRoute(
        name: 'Обратный упор',
        category: ClimbingCategory.category6B,
        type: ClimbingRouteType.rope,
        number: 2,
        anchor: '',
        author: 'КШ',
        boltCount: 6,
        length: 10,
      ),
    ],
    dukenskieCircus: [
      RockRoute(
        name: ' Владимирский бювет',
        category: ClimbingCategory.category5B,
        type: ClimbingRouteType.rope,
        number: 26,
        anchor: '',
        author: 'А. Юркин',
        boltCount: 5,
        length: 11,
      ),
    ],
  };

  @override
  Future<Either<Failure, List<RockDistrict>>> districts() async {
    return Right(_districts);
  }

  @override
  Future<Either<Failure, List<RockRoute>>> routes(
      {required RockDistrict district, required RockSector sector}) async {
    return Right(_routes[sector]!);
  }

  @override
  Future<Either<Failure, List<RockSector>>> sectors(
      {required RockDistrict district}) async {
    return Right(_sectors[district]!);
  }
}

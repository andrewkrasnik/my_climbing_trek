import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/core/data/map_point.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/datasources/rock_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_district_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_route_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/data/models/rock_sector_model.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';

// @LazySingleton(as: RockRegionsLocalDataSource)
class MockRockRegionsLocalDataSource implements RockRegionsLocalDataSource {
  static final dukinskie = RockDistrictModel(
      name: 'Дюкинские карьеры',
      region: Region.vladimirskaya,
      mapPoint: const MapPoint(latitude: 56.010036, longitude: 41.065170),
      image: 'https://gukovka.ru/Photo/Duki/duki.jpg',
      id: 'dukenskie');

  static final dukenskieCentral = RockSectorModel(
    name: 'Центральный',
    // district: dukinskie,
    id: 'dukenskie_central',
    hasRope: true,
    image:
        'https://firebasestorage.googleapis.com/v0/b/my-climbing-trek.appspot.com/o/images%2Frock_climbing%2Fdukenskie_central.png?alt=media&token=1b7495e2-fbdf-4bfd-a543-0771f5ddc67c',
  );

  static final dukenskieCircus = RockSectorModel(
    name: 'Цирк',
    // district: dukinskie,
    id: 'dukenskie_circus',
    image:
        'https://firebasestorage.googleapis.com/v0/b/my-climbing-trek.appspot.com/o/images%2Frock_climbing%2Fdukenskie_circus.png?alt=media&token=20176891-a099-4770-9641-565614e8cb79',
    hasRope: true,
    hasDryTooling: true,
  );

  final List<RockDistrictModel> _districts = [dukinskie];

  final Map<RockDistrictModel, List<RockSectorModel>> _sectors = {
    dukinskie: [dukenskieCentral, dukenskieCircus]
  };

  final Map<RockSectorModel, List<RockRouteModel>> _routes = {
    dukenskieCentral: [
      RockRouteModel(
        name: 'Обратный упор',
        category: ClimbingCategory.category6B,
        type: ClimbingRouteType.rope,
        number: 2,
        anchor: '',
        author: 'КШ',
        boltCount: 6,
        length: 10,
      ),
      RockRouteModel(
        name: 'Крымское винишко',
        category: ClimbingCategory.category5A,
        type: ClimbingRouteType.rope,
        number: 3,
        anchor: '',
        author: 'П. Антонов',
        boltCount: 0,
        length: 9,
      ),
      RockRouteModel(
        name: 'Лёва',
        category: ClimbingCategory.category6Aplus,
        type: ClimbingRouteType.rope,
        number: 4,
        anchor: '',
        author: 'О. Миленин',
        boltCount: 5,
        length: 10,
      ),
      RockRouteModel(
        name: 'Ленивый гена',
        category: ClimbingCategory.category6A,
        type: ClimbingRouteType.rope,
        number: 5,
        anchor: '',
        author: 'А. Юркин',
        boltCount: 5,
        length: 10,
      ),
    ],
    dukenskieCircus: [
      RockRouteModel(
        name: 'Владимирский бювет',
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

  @override
  Future<Either<Failure, Unit>> saveDistricts(
      {required List<RockDistrict> districts}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> saveRoutes(
      {required RockDistrict district,
      required RockSector sector,
      required List<RockRoute> routes}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> saveSectors(
      {required RockDistrict district, required List<RockSector> sectors}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteDistrict(
      {required RockDistrict district}) {
    // TODO: implement deleteDistrict
    throw UnimplementedError();
  }
}

import 'package:my_climbing_trek/core/data/city.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/datasources/climbing_hall_data_source.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/hall_model.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/hall_routes_filter.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';

// @LazySingleton(as: ClimbingHallDataSource)
class MockClimbingHallDataSource implements ClimbingHallDataSource {
  static const List<City> _cities = [
    City.moscow,
    City.spb,
  ];

  static const HallModel _sportStation = HallModel(
    name: 'СпортСтейшн',
    address: 'Новоостаповская улица, д. 5, стр. 2',
    city: City.moscow,
    hasBouldering: true,
    hasBigWall: true,
    hasAutoBelay: true,
    // point: MapPoint(),
    image:
        'https://avatars.mds.yandex.net/get-altay/5483320/2a0000017ce6617df6c425f29ba307b7e41e/XXXL',
    telephone: '+7 (495) 126-16-59',
    website: 'https://station.club/',
    email: 'info@station.club',
    id: '0',
  );

  static const HallModel _bigwall = HallModel(
    name: 'BigWallsport',
    address: 'просп. Мира, 119, стр. 22',
    city: City.moscow,
    hasBouldering: true,
    hasBigWall: true,
    hasAutoBelay: true,
    // point: MapPoint(),
    image:
        'https://avatars.mds.yandex.net/get-altay/1938975/2a0000016ec72ab066107d87f0f36f12f04a/XXXL',
    telephone: '+7 (499) 653-60-30',
    website: 'https://bigwallsport.ru/',
    email: 'info@bigwallsport.ru',
    id: '1',
  );

  static const List<HallModel> climbingHallsList = [
    _sportStation,
    _bigwall,
    HallModel(
      name: 'Северная стена',
      address: 'Газовая ул., 10З',
      city: City.spb,
      hasBouldering: true,
      hasBigWall: true,
      // point: MapPoint(),
      image:
          'https://avatars.mds.yandex.net/get-altay/4581272/2a00000179d578d29da510d67c0d62c26141/XXXL',
      telephone: '+7 (812) 501-93-15',
      website: 'https://severnayastena.ru/',
      email: 'severnayastena@gmail.com',
      id: '2',
    ),
  ];

  static const List<ClimbingHallRoute> _routes = [];
  //   ClimbingHallRoute(
  //     category: ClimbingCategory.category6A,
  //     color: RouteColor.red,
  //     type: ClimbingRouteType.rope,
  //   ),
  //   ClimbingHallRoute(
  //     category: ClimbingCategory.category6A,
  //     color: RouteColor.green,
  //     type: ClimbingRouteType.rope,
  //   ),
  //   ClimbingHallRoute(
  //     category: ClimbingCategory.category6B,
  //     color: RouteColor.yellow,
  //     type: ClimbingRouteType.rope,
  //   ),
  // ];

  final List<ClimbingHallRoute> _routesData = [
    ..._routes,
  ];

  @override
  Future<Either<Failure, List<ClimbingHall>>> climbingHalls() async {
    return const Right(climbingHallsList);
  }

  @override
  Future<Either<Failure, List<City>>> cities() async {
    return const Right(_cities);
  }

  @override
  Future<Either<Failure, List<ClimbingHallRoute>>> climbingHallRoutes({
    required ClimbingHall climbingHall,
    HallRouteFilter? filter,
  }) async {
    return Right(_routesData
        .where((element) =>
            climbingHall == climbingHall && (filter?.match(element) ?? true))
        .toList());
  }

  @override
  Future<Either<Failure, ClimbingHallRoute>> addRoute(
      {required ClimbingHall climbingHall,
      required ClimbingHallRoute route}) async {
    _routesData.add(route);
    return Right(route);
  }

  @override
  Future<Either<Failure, HallModel>> getHallById(String id) async {
    try {
      return Right(climbingHallsList.firstWhere((element) => element.id == id));
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, ClimbingHallRoute>> getRouteById(
      {required String id, required String hallId}) {
    // TODO: implement getRouteById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateRoute(
      {required ClimbingHall climbingHall, required ClimbingHallRoute route}) {
    // TODO: implement updateRoute
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updateData() {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> saveGyms({required List<ClimbingHall> gyms}) {
    // TODO: implement saveGyms
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> saveRoutes(
      {required ClimbingHall gym, required List<ClimbingHallRoute> routes}) {
    // TODO: implement saveRoutes
    throw UnimplementedError();
  }
}

import 'dart:convert';

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/datasources/climbing_hall_data_source.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/hall_model.dart';
import 'package:my_climbing_trek/features/hall_climbing/data/models/hall_route_model.dart';
import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/hall_routes_filter.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ClimbingHallDataSource)
class LocalClimbingHallDataSource implements ClimbingHallDataSource {
  static const _climbingHallsName = 'climbingHalls';
  static const _climbingHallName = 'climbingHall';

  @override
  Future<Either<Failure, ClimbingHallRoute>> addRoute(
      {required ClimbingHall climbingHall,
      required ClimbingHallRoute route}) async {
    final routesBox =
        await Hive.openBox<String>('$_climbingHallName${climbingHall.id}');

    await routesBox.put(
        route.id, json.encode(HallRouteModel.fromOrign(route).toJson()));

    return Right(route);
  }

  @override
  Future<Either<Failure, List<HallRouteModel>>> climbingHallRoutes(
      {required ClimbingHall climbingHall, HallRouteFilter? filter}) async {
    final routesBox =
        await Hive.openBox<String>('$_climbingHallName${climbingHall.id}');

    return Right(routesBox.values
        .map((value) => HallRouteModel.fromJson(json.decode(value)))
        .where((element) =>
            filter?.match(element) ?? HallRouteFilter().match(element))
        .toList()
      ..sort(
        (a, b) => a.sectorNumber.compareTo(b.sectorNumber),
      ));
  }

  @override
  Future<Either<Failure, List<HallModel>>> climbingHalls() async {
    final hallsBox = await Hive.openBox<String>(_climbingHallsName);

    // if (hallsBox.isEmpty) {
    //   for (var element in MockClimbingHallDataSource.climbingHallsList) {
    //     await hallsBox.put(element.id, json.encode(element.toJson()));
    //   }
    // }
    // late final Box<ClimbingHall> hallsBox;
    // if (await Hive.boxExists(_climbingHallsName)) {
    //   hallsBox = await Hive.openBox<ClimbingHall>(_climbingHallsName);
    // } else {
    //   hallsBox = Hive.box<ClimbingHall>(_climbingHallsName);

    // }
    return Right(hallsBox.values
        .map((value) => HallModel.fromJson(json.decode(value)))
        .toList());
  }

  @override
  Future<Either<Failure, HallModel>> getHallById(String id) async {
    final hallsBox = await Hive.openBox<String>(_climbingHallsName);

    final jsonRaw = hallsBox.get(id);

    if (jsonRaw != null) {
      return Right(HallModel.fromJson(json.decode(jsonRaw)));
    } else {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, ClimbingHallRoute>> getRouteById(
      {required String id, required String hallId}) async {
    final routesBox = await Hive.openBox<String>('$_climbingHallName$hallId');

    final jsonString = routesBox.get(id);

    if (jsonString != null) {
      return Right(HallRouteModel.fromJson(json.decode(jsonString)));
    } else {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateRoute(
      {required ClimbingHall climbingHall,
      required ClimbingHallRoute route}) async {
    try {
      final routesBox =
          await Hive.openBox<String>('$_climbingHallName${climbingHall.id}');

      await routesBox.put(
          route.id, json.encode(HallRouteModel.fromOrign(route).toJson()));
    } catch (e) {
      return Left(Failure());
    }

    return const Right(unit);
  }

  // static const HallModel _skala = HallModel(
  //   name: 'Скала Сити',
  //   address: 'Кутузовский проспект, дом 36, строение 13/14',
  //   city: City.moscow,
  //   hasBouldering: false,
  //   hasBigWall: true,
  //   hasAutoBelay: false,
  //   // point: MapPoint(),
  //   image:
  //       'https://skala-city.ru/storage/SCContent/1/%D0%A1%D0%BA%D0%B0%D0%BB%D0%B0_%D0%A1%D0%B8%D1%82%D0%B8_2020_3.jpg',
  //   telephone: '+7 (966) 112-93-77',
  //   website: 'https://skala-city.ru/',
  //   email: 'skalatown@gmail.com',
  //   id: 3,
  // );

  @override
  Future<Either<Failure, Unit>> updateData() async {
    // final hallsBox = await Hive.openBox<String>(_climbingHallsName);

    // final jsonRaw1 = json.decode(hallsBox.getAt(0)!);

    // jsonRaw1['hasAutoBelay'] = true;

    // await hallsBox.put(0, json.encode(jsonRaw1));

    // final jsonRaw2 = json.decode(hallsBox.getAt(1)!);

    // jsonRaw2['hasAutoBelay'] = true;

    // await hallsBox.put(1, json.encode(jsonRaw2));

    // // final jsonRaw = hallsBox.getAt(_skala.id);

    // // if (jsonRaw == null) {
    // await hallsBox.put(_skala.id, json.encode(_skala.toJson()));
    // // }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> saveGyms(
      {required List<ClimbingHall> gyms}) async {
    try {
      final hallsBox = await Hive.openBox<String>(_climbingHallsName);

      for (final gym in gyms) {
        await hallsBox.put(gym.id, json.encode((gym as HallModel).toJson()));
      }
    } catch (error) {
      return Left(NoSQLBaseFailure(description: error.toString()));
    }
    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> saveRoutes({
    required ClimbingHall gym,
    required List<ClimbingHallRoute> routes,
  }) async {
    try {
      final routesBox =
          await Hive.openBox<String>('$_climbingHallName${gym.id}');
      for (final route in routes) {
        await routesBox.put(
            route.id, json.encode((route as HallRouteModel).toJson()));
      }
    } catch (error) {
      return Left(NoSQLBaseFailure(description: error.toString()));
    }
    return const Right(unit);
  }
}

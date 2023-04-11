import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/data/datasources/mountain_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_type.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';

@LazySingleton(as: MountainRegionsLocalDataSource)
class MountainRegionsLocalDataSourceImpl
    implements MountainRegionsLocalDataSource {
  static final archa = Region(
    name: 'Ала-Арча',
    state: 'Киргизия',
    id: 'archa',
    image:
        'https://biomehanika-ekb.ru/wp-content/uploads/2016/02/p0608_06-150x150.jpg',
  );

  static final africa = Region(
    name: 'Африка',
    state: 'Африка',
    id: 'africa',
    image:
        'https://www.aroma-butik.ru/images/categories/articles/article_picture_2_109.jpg',
  );

  static final teacher = Mountain(
      region: archa,
      name: 'Учитель',
      altitude: 4540,
      image:
          'https://api.inomad.kz/storage/tours/images/tour-133/1650185179Ri1sG.jpg');

  static final box = Mountain(
      region: archa,
      name: 'Бокс',
      altitude: 4293,
      image: 'https://www.trfa.ru/assets/galleries/209/img_02.jpg');

  static final raceka = Mountain(
      region: archa,
      name: 'Рацека',
      altitude: 3972,
      image: 'https://alpinist.biz/wp-content/uploads/2018/10/0000.jpg');

  static final kilimanjaro = Mountain(
      region: africa,
      name: 'Килиманджаро',
      altitude: 5895,
      image:
          'https://cdn1.relax-fm.ru/vardata/modules/news/files/1/630/news_file_630_5e9769dc5a2f1.jpg');

  final List<Region> _regions = [archa, africa];

  final Map<Region, List<Mountain>> _mountains = {
    archa: [teacher, box, raceka],
    africa: [kilimanjaro],
  };

  final Map<Mountain, List<MountainRoute>> _routes = {
    teacher: [
      MountainRoute(
          category: MountaineeringCategory.oneB,
          type: MountainRouteType.rock,
          roops: [],
          id: 'teacherOneB',
          name: 'По западному гребню'),
    ],
    box: [
      MountainRoute(
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.rock,
        roops: [],
        id: 'boxOneB',
        name: 'По	кулуару из Текетора с юго-запада',
      ),
      MountainRoute(
        category: MountaineeringCategory.twoA,
        type: MountainRouteType.rock,
        roops: [],
        id: 'boxTwoA',
        name: 'По южному гребню с пер. Текетор',
      ),
    ],
    raceka: [
      MountainRoute(
        category: MountaineeringCategory.twoA,
        type: MountainRouteType.rock,
        roops: [],
        id: 'racekaTwoA',
        name: 'По южному гребню',
      ),
      MountainRoute(
        category: MountaineeringCategory.twoB,
        type: MountainRouteType.rock,
        roops: [],
        id: 'racekaTwoB',
        name: 'По северному гребню',
      ),
      MountainRoute(
        category: MountaineeringCategory.treeA,
        type: MountainRouteType.rock,
        roops: [],
        id: 'racekaTreeA',
        name: 'По западному угребню',
      ),
    ],
  };

  @override
  Future<Either<Failure, List<Region>>> regions() async {
    return Right(_regions);
  }

  @override
  Future<Either<Failure, List<Mountain>>> mountains(
      {required Region region}) async {
    return Right(_mountains[region]!);
  }

  @override
  Future<Either<Failure, List<MountainRoute>>> routes(
      {required Mountain mountain}) async {
    return Right(_routes[mountain]!);
  }
}

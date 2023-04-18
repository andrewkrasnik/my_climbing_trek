import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/data/datasources/mountain_regions_local_datasource.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';
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

  static final stavr = Region(
    name: 'Ставропольский край',
    state: 'Россия',
    id: 'stavr',
    image:
        'https://tripplanet.ru/wp-content/uploads/europe/russia/stavropol-region/dostoprimechatelnosti-stavropolskogo-kraja.jpg',
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

  static final esenin = Mountain(
      region: stavr,
      name: 'Бештау, Есенинская скала',
      altitude: 400,
      image:
          'https://sun9-40.userapi.com/impg/lSfw5oY30RdyA5wpnVEHX6Nwqx5ZZhIBeNxCYg/8LtCcI9Ghqw.jpg?size=720x1080&quality=96&sign=1b77a5fdf5918592f2f403fc60118eaf&type=album');

  final List<Region> _regions = [archa, africa, stavr];

  final Map<Region, List<Mountain>> _mountains = {
    archa: [teacher, box, raceka],
    africa: [kilimanjaro],
    stavr: [esenin],
  };

  final Map<Mountain, List<MountainRoute>> _routes = {
    teacher: [
      MountainRoute(
          category: MountaineeringCategory.oneB,
          type: MountainRouteType.rock,
          roops: const [],
          id: 'teacherOneB',
          name: 'По западному гребню'),
    ],
    box: [
      MountainRoute(
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.rock,
        roops: const [],
        id: 'boxOneB',
        name: 'По	кулуару из Текетора с юго-запада',
      ),
      MountainRoute(
        category: MountaineeringCategory.twoA,
        type: MountainRouteType.rock,
        roops: const [],
        id: 'boxTwoA',
        name: 'По южному гребню с пер. Текетор',
      ),
    ],
    raceka: [
      MountainRoute(
        category: MountaineeringCategory.twoA,
        type: MountainRouteType.rock,
        roops: const [],
        id: 'racekaTwoA',
        name: 'По южному гребню',
      ),
      MountainRoute(
        category: MountaineeringCategory.twoB,
        type: MountainRouteType.rock,
        roops: const [],
        id: 'racekaTwoB',
        name: 'По северному гребню',
      ),
      MountainRoute(
        category: MountaineeringCategory.treeA,
        type: MountainRouteType.rock,
        roops: const [],
        id: 'racekaTreeA',
        name: 'По западному гребню',
      ),
    ],
    esenin: [
      MountainRoute(
        ussrCategory: UssrClimbingCategory.Vplus,
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.tradMultiPitch,
        image:
            'https://firebasestorage.googleapis.com/v0/b/my-climbing-trek.appspot.com/o/images%2Fmountaineering%2Fesenin1.png?alt=media&token=1ace1472-38a6-4702-87dc-1539e3b8ce72',
        roops: [
          MountainRouteRoop(
            number: 1,
            length: 15,
            anchor: 'На одном шлямбуре и своих точках',
            pieces: [
              MountainRouteRockPiece(
                  length: 15, ussrCategory: UssrClimbingCategory.IV)
            ],
            description:
                'По стене левее входа в кулуар до выхода на небольшую полку. По ней вправо через кант в основание большого внутреннего угла',
          ),
          MountainRouteRoop(
            number: 2,
            length: 35,
            anchor: 'На одном шлямбуре и своих точках общая с коричневой',
            pieces: [
              MountainRouteRockPiece(
                  length: 15, ussrCategory: UssrClimbingCategory.IV),
              MountainRouteRockPiece(
                  length: 15, ussrCategory: UssrClimbingCategory.III),
            ],
            description:
                'По внутреннему углу и далее по стене прямо вверх до выхода на травянистую полку. По полке, а затем траверсом стены вправо вход в небольшой камин-колодец',
          ),
          MountainRouteRoop(
            number: 3,
            length: 30,
            slope: 0,
            anchor: 'На вершине',
            pieces: [
              MountainRouteRockPiece(
                  length: 4, ussrCategory: UssrClimbingCategory.IV),
              MountainRouteRockPiece(
                  length: 3, ussrCategory: UssrClimbingCategory.Vplus),
              MountainRouteRockPiece(
                  length: 23, ussrCategory: UssrClimbingCategory.IIIplus),
            ],
            description:
                'Прямо вверх, а затем вправо по слегка нависающей трещине выйти на полку, и по ней до выхода на кант стены. Далее влево вверх вдоль зелёной до выхода на вершину',
          ),
        ],
        id: 'esenin1',
        name: 'Кабардинская',
      ),
      MountainRoute(
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.tradMultiPitch,
        ussrCategory: UssrClimbingCategory.VI,
        image:
            'https://firebasestorage.googleapis.com/v0/b/my-climbing-trek.appspot.com/o/images%2Fmountaineering%2Fesenin7.png?alt=media&token=3fefc678-c794-4821-8241-d48bfe32a287',
        roops: [
          MountainRouteRoop(
              number: 1,
              length: 20,
              anchor: 'На двух шлямбурах под деревом общей с синей',
              pieces: [
                MountainRouteRockPiece(
                    length: 7, ussrCategory: UssrClimbingCategory.V),
                MountainRouteRockPiece(
                    length: 3,
                    ussrCategory: UssrClimbingCategory.VI,
                    aidCategory: AidCategory.A1),
                MountainRouteRockPiece(
                    length: 10, ussrCategory: UssrClimbingCategory.III),
              ],
              description:
                  'С дерева в колодце на стену. По косой трещине, а затем прямо вверх по стене выход под карниз с нависанием, который проходится в лоб или несколько правее. Далее по простым скалам влево вверх до станции'),
          MountainRouteRoop(
            number: 2,
            length: 30,
            anchor: 'На выступе общей с осетинской',
            description:
                'Прямо вверх к основанию большого камина. Не входя в камин траверс влево через кант стены и далее по можжевеловой полке до станции',
            pieces: [
              MountainRouteRockPiece(
                  length: 15, ussrCategory: UssrClimbingCategory.III),
              MountainRouteRockPiece(
                  length: 12, ussrCategory: UssrClimbingCategory.IV),
              MountainRouteRockPiece(
                  length: 3, ussrCategory: UssrClimbingCategory.II),
            ],
          ),
          MountainRouteRoop(
            number: 3,
            length: 15,
            anchor: 'На двух шлямбурах, общая с зелёной и осетинской',
            description:
                'Прямо вверх по стене либо по левому её канту с выходом к широкой щели и далее вдоль щели до выхода на можжевеловую полку',
            pieces: [
              MountainRouteRockPiece(
                  length: 5, ussrCategory: UssrClimbingCategory.Vplus),
              MountainRouteRockPiece(
                  length: 10, ussrCategory: UssrClimbingCategory.IVplus),
            ],
          ),
          MountainRouteRoop(
            number: 4,
            length: 35,
            anchor: 'На вершине',
            description:
                'Вправо вверх до выхода на можжевеловую полку, а затем по простым скалам до выхода наверх',
            pieces: [
              MountainRouteRockPiece(
                  length: 35, ussrCategory: UssrClimbingCategory.IIIplus),
            ],
          ),
        ],
        id: 'esenin7',
        name: 'Польская',
      ),
    ]
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
      {required Region region, required Mountain mountain}) async {
    return Right(_routes[mountain]!);
  }
}

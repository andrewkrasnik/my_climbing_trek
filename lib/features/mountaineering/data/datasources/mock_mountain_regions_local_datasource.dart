import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
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

  static final crimea = Region(
    name: 'Крым',
    state: 'Россия',
    id: 'crimea',
    image:
        'https://interaffairs.ru/i/2020/12/f5cdf423c5e876691ff91956a9ab061d.jpg',
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

  static final socol = Mountain(
      region: crimea,
      name: 'Сокол',
      altitude: 474,
      image:
          'https://rasim-sudak.ru/wp-content/uploads/2014/03/3271011_large.jpeg');

  final List<Region> _regions = [crimea, archa, stavr, africa];

  final Map<Region, List<Mountain>> _mountains = {
    archa: [teacher, box, raceka],
    africa: [kilimanjaro],
    stavr: [esenin],
    crimea: [socol],
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
    ],
    socol: [
      MountainRoute(
        name: 'По яйцу',
        climbingCategory: ClimbingCategory.category6Aplus,
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.multiPitch,
        ussrCategory: UssrClimbingCategory.VI,
        image: 'https://alpinist.biz/wp-content/uploads/2015/04/11.jpg',
        roops: [
          MountainRouteRoop(
            number: 1,
            length: 22,
            boltCount: 7,
            description:
                'Первые 8-9 метров пробиты часто, собственно на этом участке сложность маршрута и категорирована как 5с. Далее рельеф выполаживается и переходит участками в н/к. Пробивка на этих участках редкая.',
            climbingCategory: ClimbingCategory.category5C,
          ),
          MountainRouteRoop(
            number: 2,
            length: 29,
            boltCount: 10,
            description:
                'Веревка простая, лазание на трении по плитам с хорошими зацепами для рук и ног. Пробивка равномерная и частая. На последнем шлямбуре небольшой траверс на 3 метра вправо к станции.',
            climbingCategory: ClimbingCategory.category5A,
          ),
          MountainRouteRoop(
            number: 3,
            length: 29,
            boltCount: 10,
            description:
                'На этом участке сложность лазания равномерная на протяжении всей веревки. Лазание на трении, пробивка частая.',
            climbingCategory: ClimbingCategory.category5C,
          ),
          MountainRouteRoop(
            number: 4,
            length: 31,
            boltCount: 12,
            description:
                'Этот участок маршрута — ключевой. Пробивка частая. Собственно сам ключ (крутые гладкие плиты) начинается в середине этой веревки, как раз на уровне опасно лежачей слева большой нашлепки, за которую очень хочется придержаться, но это делать категорически нельзя, т.к. она в любой момент может отделиться от скалы и пойти вниз, при этом камни пойдут прежде всего на маршрут левее (Правая двойка) и зацепят собственно и сам мультипитч (По яйцу). Дальнейшие последствия очевидны.'
                ' Стоит также напомнить, что на участке R3-R4 (приблизительно на середине) маршрут «По яйцу» пресекает (справа на лево) другой мультипитч, который был пробит с месяц назад. На него лезть не нужно — ваш маршрут (по яйцу) уходит по шлямбурам правее.',
            climbingCategory: ClimbingCategory.category6Aplus,
          ),
          MountainRouteRoop(
            number: 5,
            length: 27,
            boltCount: 9,
            description:
                'Вначале этой веревки лазание сложное, на трении, крайние метров 10-15 рельеф выполаживается. Мы вышли на вершину траверсом несколько метров влево. '
                'В дождливую погоду 4-я и 5-я веревки крайне сложны для лазания, т.к. все идется в основном по «зеркалам» на трении.',
            climbingCategory: ClimbingCategory.category6A,
          ),
        ],
        descent:
            'от R5 спуск по полке на северо-восток 10 метров. Далее по спусковой тропе',
        links: const [
          'https://alpinist.biz/archives/4802',
          'https://www.youtube.com/watch?v=xeLZK1-Zopw&embeds_euri=http%3A%2F%2Fwww.mountain.ru%2F&source_ve_path=Mjg2NjY&feature=emb_logo',
        ],
      ),
      MountainRoute(
        category: MountaineeringCategory.twoB,
        name: 'Muchacha',
        type: MountainRouteType.rock,
        ussrCategory: UssrClimbingCategory.IVplus,
        length: 180,
        author: 'А.Кузьмицкий, Е.Хворост',
        firstAscentYear: '2005 г.',
        image:
            'https://alpinist.biz/wp-content/uploads/2015/04/0001-814x1024.jpg',
        passage:
            'Подходы под маршрут начинаются от дорожного знака «3-й км» вверх по крутой тропе под стену, либо от зеленой трубы чуть дальше по шоссе в сторону Нового Света вверх по склону (явной тропы нет, но более полого). '
            'Начало маршрута находится несколько левее «Правой двойки».',
        description:
            'Маршрут расположен на юго-восточной стене Сокола, в первом (восточном) секторе. Короткая, но довольно сложная двойка — если сравнивать с «Левой двойкой» и тем более с «Подарочным набором». Страховка своя, станции частично пробиты шлямбурами.',
        roops: [
          MountainRouteRoop(
            length: 50,
            number: 1,
            anchor: 'На своих точках около можжевелового куста',
            description:
                'Первые 10-15 метров по простым разрушенным скалам вверх и левее на полку возле большого, отдельно стоящего от скалы, откола. Дальше начинается довольно крутой рельеф с проблематичной страховкой. От откола на полке 15 м вверх, по наклонному внутреннему углу (слева разрушенный рельеф, справа монолитная крутая плита с мелкими зацепками и впадинками под руки и ноги). Страховка на этом участке организовывается достаточно проблематично из-за разрушенности рельефа слева и монолитности плиты справа.',
            pieces: [
              MountainRouteRockPiece(
                length: 50,
                ussrCategory: UssrClimbingCategory.IIIplus,
              )
            ],
          ),
          MountainRouteRoop(
            length: 50,
            number: 2,
            anchor: 'Шлямбур плюс свои точки',
            description:
                'От станции вверх и чуть правее, по плитам и системе мелких щелей в направлении небольшого дерева, находящегося на уровне большой сосны правее. Перед деревом ключевой участок веревки, забит шлямбур. Далее вверх до станции под небольшим отколом (шлямбур + усилить своим). На всех участках 2-й веревки страховка организовывается просто — камы и закладки средних и мелких размеров, по желанию якоря.',
            pieces: [
              MountainRouteRockPiece(
                length: 50,
                ussrCategory: UssrClimbingCategory.IIIplus,
              )
            ],
          ),
          MountainRouteRoop(
            length: 50,
            number: 3,
            anchor: 'На двух шлямбурах',
            description:
                'От станции вверх метров 10 к дереву, затем начинается крутой и длинный траверс влево под разрушенными бараньими лбами. Страховка в щели. Дойдя до нашлепки — обойти ее и подняться слева по разрушенному внутреннему углу на полочку',
            pieces: [
              MountainRouteRockPiece(
                length: 10,
                ussrCategory: UssrClimbingCategory.IIIplus,
              ),
              MountainRouteRockPiece(
                length: 35,
                ussrCategory: UssrClimbingCategory.IVplus,
              ),
              MountainRouteRockPiece(
                length: 5,
                ussrCategory: UssrClimbingCategory.II,
              ),
            ],
          ),
          MountainRouteRoop(
            length: 30,
            number: 4,
            anchor: 'На сосне',
            description:
                'От станции влево, затем вверх и на широкую полку, где сходятся крайние веревки нескольких маршрутов: «ХАчу», «Менуэт», «Чико», «Мучача». По полке вправо в расселину и выход на вершину',
            pieces: [
              MountainRouteRockPiece(
                length: 15,
                ussrCategory: UssrClimbingCategory.IIIplus,
              ),
              MountainRouteRockPiece(
                length: 15,
                ussrCategory: UssrClimbingCategory.NC,
              ),
            ],
          ),
        ],
        links: [
          'https://alpinist.biz/archives/1135',
        ],
      ),
    ],
    kilimanjaro: [
      MountainRoute(
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.combine,
        roops: [],
        description:
            'Местные гиды прозвали путь «Coca-cola», потому что большинство туристов выбирают для восхождение на Килимаджаро именно его. Тому есть несколько причин. Во-первых, маршрут пологий без длинных перегонов, во-вторых, оборудован наиболее комфортабельными ночевками. Здесь есть вода, туалеты, вместительные домики, хорошо отлажена работа спасателей, некоторые приюты даже охраняются от диких зверей. В приютах можно купить бутилированную воду, пиво, б\а напитки, туристам выдаются матрасы с подушками. Соответственно Марангу переполнен в любой сезон, что относится к главным его минусам. По статистике наибольший процент туристов не доходит до вершины именно на этом пути. Поскольку Марангу признан наиболее легким, неподготовленные люди идут этим маршрутом и им не хватает времени на акклиматизацию. Восхождение на Килиманджаро этим маршрутом не порадует глаз обилием панорамных пейзажей, если сравнивать с другими путями на вершину.'
            '\nНазвание маршрут заимствовал у своей исходной точки на высоте 1800 м. — ворот нац. парка Марангу. За первый день пути широкая тропа ведет экваториальным лесом до приюта Мандара Хат. Набор высоты составляет 900 м, время прохождения — 4 часа, здесь много шансов встретить голубых обезьян и других представителей местной фауны. В приюте есть несколько хибарок с 60 двухъярусных кроватей и столовая, сливные уборные, вода, стража.'
            '\nНа второй день восхождения на Килиманджаро за 6-ти часовой переход туристы достигают приюта Хоромбо (3720 м). Лес сменяется зарослями необычайного древовидного кустарника сенецио, или древовидного крестовника (Senecio kilimanjari, Tree groundsel). Растения напоминают огромные столбы высотой до 7 метров, увенчанные кипами листьев. Сениции здесь растут между глыбами черных камней, когда-то разбросанных извержением Мавензи. Это уникальное место считается одной из достопримечательностей маршрута Марангу. Домики приюта Хоромбо когда-то построили норвежцы, условия здесь комфортабельны, кроватей 60 двухъярусных и хижины побольше, чем в Мандаре. Рядом можно сходить к утесу Зебра-рок или к подножию Мавензи, и это делает стоянку отличным местом для проведения добавочного дня акклиматизации.'
            '\n3й день похода заканчивается в приюте Кибо Хат на высоте 4700 м, что у подножия вулкана. Кибо состоит из каменных бараков и туалетов, столовой нету. Здесь начинается само восхождение на Килиманджаро. С приюта открывается вид на отвесные стены кратера Кибо.'
            '\nПокорять вершину начинают 24.00 при сиянии звезд и налобных фонариков, а рассвет смельчаки встречают уже на краю первого кратера Гиллманс Пойнт (5685 м). Если небо чистое, то отсюда виден весь кратер Кибо. Тропа идет к пику Ухуру вдоль восточного края большого кратера Кибо и в нее вливаются маршруты Мачаме (возле Стелла Пойнт, 5700 м), Мвекка и Умбве. Отсюда до цели путешествия — Ухуру Пойнт остается час пути.',
        name: 'МАРАНГУ',
        image: 'https://pohod-v-gory.com/wp-content/uploads/2022/10/0-97.jpg',
        links: ['https://pohod-v-gory.com/ru/marshruty-na-kilimandzharo/'],
      ),
      MountainRoute(
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.combine,
        roops: [],
        description:
            'Восхождение на Килиманджаро этим путем берет начало возле кенийской границы в городке Лойтокиток, иногда так именуют и сам маршрут. Здешние пейзажи слывут не такими красивыми, как при подъеме с востока или запада, и намного меньше туристов выбирают этот путь. Ронгаи подойдет людям, которые хотят уединения и общения с природой, не любят толкучки вокруг. Он проходит через заповедник, часто путешественники встречают диких животных — обезьян колобусов, иногда даже слонов. Трек довольно пологий, без длинных переходов. Лес в начале маршрута сосновый и очень красивый, первый лагерь обычно разбивают на высоте 2600 м на выходе из леса — отсюда открывается панорама на равнины Цаво и Амбосели. За второй день и 7 часов пути туристы набирают 1000 метров высоты и разбивают лагерь возле пещеры Kikelewa Caves. В третий день трек становится более крутым и живописным, ночевка возле горного озера Мавензи Тарн под самым вулканом Мавензи. Склоны вулкана тут отвесны и это место считается красивейшим на маршруте. На 4 день Ронгаи сливается с маршрутом Марангу в приюте Кибо Хат.'
            '\nРонгаи так же наименее ветренный и дождливый маршрут, его рекомендуют выбирать в межсезонье, когда метеоусловия переменчивы. По нему совершается только восхождение на Килиманджаро, возвращаются же по Мвеко или Марангу.',
        name: 'РОНГАИ',
        image: 'https://pohod-v-gory.com/wp-content/uploads/2022/10/0-97.jpg',
        links: ['https://pohod-v-gory.com/ru/marshruty-na-kilimandzharo/'],
      ),
      MountainRoute(
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.combine,
        roops: [],
        description:
            'Лобовой и обрывистый, с резкими наборами высоты, очень быстрый и не очень популярный для задумавших восхождение на Килиманджаро. Но много людей выбирают его для спуска после других подъемов. Начало трека возле Колледжа Дикой Природы (1400 м) в городе Моши. Приюты по пути: Мвека (3000 м) и Барафу Хат (4600 м). Это небольшие хибарки из металла без удобств, спят тут лишь одиночные туристы, группы же становятся лагерем невдалеке. В Барафу Хат довольно многолюдно, тут разбиты площадки для палаток туристы из соседнего маршрута Мачаме часто стоят здесь. На последнем этапе восхождения тропа крутая и нестабильная, если снег уже лежит, то без страховки не пройти. Возле Стелла Пойнт Мвека сливается с остальными маршрутами, проходящими с этой стороны кратера.',
        name: 'МВЕКА',
        image: 'https://pohod-v-gory.com/wp-content/uploads/2022/10/0-97.jpg',
        links: ['https://pohod-v-gory.com/ru/marshruty-na-kilimandzharo/'],
      ),
      MountainRoute(
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.combine,
        roops: [],
        name: 'УМБВЕ',
        description:
            'Это прямой, небезопасный и сложный путь, в путеводителе парка Килиманджаро его советуют для спуска. Начинается он в селении Моши с так называемых Ворот Умбве на высоте 1800 м. Восхождение на Килиманджаро этим путем советуют сильным и выносливым туристам, так как переходы тут быстрые с большим перепадом высот. Существуют два варианта этого маршрута — старая и новая, попроще. В первый день восхождения после 2100 м тропический лес сменяется крутым гребнем и ущельями между равнинами Лонцо и Умбве. Уже на этом переходе открываются чудесные виды на Килиманджаро. Ночевка — Пещера Умбве (2800 м) либо Бивуак Кемп (2940 м). Вторую ночь туристы проводят на высоте 3950 м, здесь стоит хижина Барранко и много мест под палатки. Место людное и популярное, но чуть выше есть еще одна удобная стоянка, у подножия Барранко Уолл. Еще один переход отделяет туристов от Лава Тауэр Хат (4650 м) — штурмового лагеря пика Ухуру для западных маршрутов.'
            '\nЗападные маршруты — Мачаме, Шира и Лемошо, считаются наиболее живописными, но восхождение на Килиманджаро этими путями невозможно без физической выносливости и сноровки. Именно по этому маршруту мы проводим наше восхождение на Килиманджаро.',
        image: 'https://pohod-v-gory.com/wp-content/uploads/2022/10/0-97.jpg',
        links: ['https://pohod-v-gory.com/ru/marshruty-na-kilimandzharo/'],
      ),
      MountainRoute(
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.combine,
        roops: [],
        description:
            'На сегодня признан наиболее красивым путем для покорения «крыши Африки», восхождение на Килиманджаро все чаще совершается этим маршрутом. Его наименовали «Виски Рут», противопоставляя «кока-коле» Марангу. Маршрут поднимается лесами западных косогоров и траверсует южные под скально-снежной стеной Брич-Уолл, что позволяет рассмотреть Килиманджаро со всех ракурсов и насладится множеством пейзажей и образований. Сейчас там иногда даже больше туристов, чем на Марангу, приюты не вмещают всех желающих. Из всех западных это наиболее прямой и короткий путь, но и он не прост — придется переходить речки, лазать по камням, отвесным склонам и преодолевать скользкие места.'
            '\nНачало тропы возле одноименного парка (1830 м). Леса на этом склоне горы чудесны и являются отдельной визиткой маршрута. В первый день около 5ти часов стежка вьется лесами и выводит путников на влажные равнины, поросшие кустами , у местных «мурленд». Ночлег в лагере Мачаме (3100 м) дает отдохнуть перед завтрашним крутым подъемом на плато Шира. Шира — пустынная высокогорная местность с поодиночными растениями, характерными для альпийского пояса. На нем стоит приют Шира Хат (3840 м), совместный для западных маршрутов. На следующий день группы покоряют пик Лава Тауэр (4630 м) и спускаются в кемп Барранко (3860 м). При том, что Барранко на одной высоте с Шира Хат, он более живописен в плане флоры — тут растут сенеции. В лагере много народа и всегда шумно.'
            '\nНа следующий день предстоит взять Барранко Уолл — крутой подъем на пути к стоянке Каранга Камп (4200 м). От Каранга к штурмовому лагерю Барафу Камп туристы поднимаются еще на 400 м траверсом через два канъона. Как и из Кибо Хат с востока, отсюда восхождение на Килиманджаро начинается тоже ночью. Путь сначала несложный, но возле Стелла Пойнт становится круче и опаснее — серпантин проложен по скальным выходам. Часто тропа идет по большим скальным участкам и даже твердым породам, в то время как из Кибо Хат почти все время приходится взбираться по мелкому сыпуну. В этом отношении тут идти проще, чем с востока. Когда покорен Стелла Поинт, только час пути отделяет от вершины и восхождение на Килиманджаро можно считать выполненным. Спускаются отсюда через Барафу Камп к Мвека Камп (3100 м), а в последний день до Мвека Гейд.',
        name: 'МАЧАМЕ',
        image: 'https://pohod-v-gory.com/wp-content/uploads/2022/10/0-97.jpg',
        links: ['https://pohod-v-gory.com/ru/marshruty-na-kilimandzharo/'],
      ),

      MountainRoute(
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.combine,
        roops: [],
        description:
            'Очень длинный и медленный вариант восхождения, который требует минимум шесть ночевок. Из-за своей длительности он непопулярен, хотя не менее красив, чем Мачаме. Оборудованных ночевок тут нету, условия очень напоминают дикие и природа максимально первозданная. Этот путь выбирают, когда хотят посмотреть нетронутую красоту этих мест и воссоединится с природой. На плато Шира маршрут сливается с остальными западными, так что людей становится значительно больше.',
        name: 'ШИРА',
        image: 'https://pohod-v-gory.com/wp-content/uploads/2022/10/0-97.jpg',
        links: ['https://pohod-v-gory.com/ru/marshruty-na-kilimandzharo/'],
      ),
      MountainRoute(
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.combine,
        roops: [],
        description:
            'Тянется паралельно маршруту Шира, но огибает вершину Шира с другой стороны. Восхождение на Килиманджаро этим путем предпочитают еще меньше людей, чем маршрутом Шира, хотя Лемошо легко может поспорить за первенство в плане красоты и живописности со всеми остальными. Восхождение на Килиманджаро любим путем дает возможность увидеть почти все климатические пояса планеты, а пройдясь тропой Лемошо, можно посмотреть еще и множество природных зон. Тропические и высокогорные леса, полупустыни, высокогорные пустынные плато и ледники при минимуме людей вокруг — это и есть основное преимущество маршрута.',
        name: 'ЛЕМОШО',
        image: 'https://pohod-v-gory.com/wp-content/uploads/2022/10/0-97.jpg',
        links: ['https://pohod-v-gory.com/ru/marshruty-na-kilimandzharo/'],
      ),
      MountainRoute(
        category: MountaineeringCategory.oneB,
        type: MountainRouteType.combine,
        roops: [],
        description:
            'Существует прямой путь с западной стороны, который в конце ведет сразу через кратер, а не путем Барафу. Маршрут известен как SHIRA WESTERN BREACH CAMP IN CRATER ROUTE, «Шира Вестерн Брич Камп Кратер» и используется очень редко из-за опасности потерять дорогу в туман. Случаются здесь обвалы и камнепады.',
        name: 'ПРЯМОЙ ЗАПАДНЫЙ',
        image: 'https://pohod-v-gory.com/wp-content/uploads/2022/10/0-97.jpg',
        links: ['https://pohod-v-gory.com/ru/marshruty-na-kilimandzharo/'],
      ),
      // MountainRoute(
      //   category: MountaineeringCategory.oneB,
      //   type: MountainRouteType.combine,
      //   roops: [],
      //   description: '',
      //   name: '',
      //   image: 'https://pohod-v-gory.com/wp-content/uploads/2022/10/0-97.jpg',
      // ),
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

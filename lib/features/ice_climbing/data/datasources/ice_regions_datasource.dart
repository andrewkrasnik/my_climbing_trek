import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_district_model.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_sector_model.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class IceRegionsDataSource {
  Future<Either<Failure, List<IceDistrict>>> getDistricts();
  Future<Either<Failure, List<IceSector>>> getSectors(
      {required IceDistrict district});
  Future<Either<Failure, List<IceSector>>> getAllSectors();
}

// @LazySingleton(as: IceRegionsDataSource)
class MockIceRegionsDataSource implements IceRegionsDataSource {
  final List<IceDistrict> _districts = [];
  final Map<IceDistrict, List<IceSector>> _sectors = {};

  MockIceRegionsDataSource() {
    final moscow = Region(name: 'Москва и область', id: 'moscow');
    final caucasus = Region(name: 'Северный кавказ', id: 'caucas');

    final naroFominsk = IceDistrictModel(
      id: 'narofom',
      compact: true,
      name: 'Наро-Фоминская сосулька',
      region: moscow,
      image:
          'https://sun1-47.userapi.com/impg/3VW79oaXqedj5fD4CuX4ccvqcF4if6dNgdSfPg/6mM_UsN9ntQ.jpg?size=1242x1234&quality=95&sign=9e66838aba3b3f42a82261a77c0c8bcb&type=album',
    );

    final naroFominskWestWall = IceSectorModel(
      id: 'narofomWest',
      name: 'Западная стена',
      district: naroFominsk,
      description: '',
      length: 14,
      maxCategory: IceCategory.i3,
      image:
          'https://sun1-47.userapi.com/impg/3VW79oaXqedj5fD4CuX4ccvqcF4if6dNgdSfPg/6mM_UsN9ntQ.jpg?size=1242x1234&quality=95&sign=9e66838aba3b3f42a82261a77c0c8bcb&type=album',
      artificialIce: true,
    );

    final naroFominskEastWall = IceSectorModel(
      id: 'narofomEast',
      name: 'Восточная стена',
      district: naroFominsk,
      description: '',
      length: 14,
      maxCategory: IceCategory.i3,
      image:
          'https://sun1-47.userapi.com/impg/3VW79oaXqedj5fD4CuX4ccvqcF4if6dNgdSfPg/6mM_UsN9ntQ.jpg?size=1242x1234&quality=95&sign=9e66838aba3b3f42a82261a77c0c8bcb&type=album',
      artificialIce: true,
    );

    final naroFominskNordWall = IceSectorModel(
      id: 'narofomNord',
      name: 'Северная стена',
      district: naroFominsk,
      description: '',
      length: 14,
      maxCategory: IceCategory.i3,
      image:
          'https://sun1-47.userapi.com/impg/3VW79oaXqedj5fD4CuX4ccvqcF4if6dNgdSfPg/6mM_UsN9ntQ.jpg?size=1242x1234&quality=95&sign=9e66838aba3b3f42a82261a77c0c8bcb&type=album',
      artificialIce: true,
    );

    final digoria = IceDistrictModel(
      id: 'digora',
      name: 'Дигория',
      region: caucasus,
      image: 'http://caas.ru/taimazy/taymaz_01_small.jpg',
    );

    final digoriaWall = IceSectorModel(
      id: 'digora1',
      name: 'Стенка',
      length: 40,
      district: digoria,
      waterfallIce: true,
      image: 'https://risk.ru/u/img/15/14919-670.jpg',
      maxCategory: IceCategory.i6,
      description: """
Расположен на правобережной стенке каньона реки Урух, на 15м дальше "Зубового" сразу после поворота каньона. Отличный тренировочный каскад шириной около 50м, на полное пролезание можно потратить не 1 день! Множество вариантов прохождения с нижней и верхней страховкой. Имеются варианты от 20-35 метровых стенок по бокам (50-70°) до 40 метровых стен сложного ажурного льда через ледово-скальный грот по центру (до 95°). Имеются сектора с разной плотностью льда, что позволяет подобрать дорожку под нижнюю страховку даже при наличии плохих буров.

Подход занимает ок. 15 мин - от домиков над баром траверсом склона по тропе на восток, ок. 150м до незамерзающего ручья, далее вниз по склону до обрыва в каньон (спуск оборудован тросами). К подножию каскада дюльфером с любого дерева. Выход в а/л по тому же пути.
""",
    );

    final digoriaRivers = IceSectorModel(
      id: 'digora2',
      name: 'Ручейки',
      district: digoria,
      waterfallIce: true,
      image: 'https://risk.ru/u/img/15/14924-670.jpg',
      length: 50,
      maxCategory: IceCategory.i6plus,
      description:
          """Расположен на правобережной стенке каньона реки Урух, примерно в 2,5 - 3км от а/л, после "Душика ада". Несколько почти вертикальных сосулек разной структуры длиной от 10 до 50 м (WI 4 - 6+). Также большое количество микстовых маршрутов по ледовым потекам и залитым щелям.

Подходы довольно сложные: по левому берегу каньона над сбросами до коша после ручья, далее по крутым кулуарам вниз, либо по заберегам реки вверх по течению от "Душика ада".

"Писающий мальчик" (на фото справа), 50 м, до WI 6. Выделяется среди прочих сосулек сектора. Старт с крохотной площадки на побочине реки, крутизна 80°, монолитный лед.

""",
    );

    final digoriaAihva = IceSectorModel(
      id: 'digora3',
      name: 'Айхва',
      district: digoria,
      waterfallIce: true,
      image: 'https://risk.ru/u/img/15/14924-670.jpg',
      length: 80,
      maxCategory: IceCategory.i4plus,
      description:
          """Расположен на южном склоне ущелья в прямой видимости из а/л. Первые 30м WI 2 (до 45°), затем 8-10 м стенка (до 85°), после выполаживания 40м WI 1 или н/к. Простой мягкий лед, буры хорошо крутятся.
        Подход занимает 30 мин - вверх от моста через р.Урух по простым пологим склонам. Спуск либо по пути подъема дюльфером, либо ок. 1,5 часов пешком по крутым осыпям и лугам на дорогу на левом берегу реки.
        """,
    );

    final digoriaKubus = IceSectorModel(
      id: 'digora4',
      name: 'Кубус 2000',
      district: digoria,
      waterfallIce: true,
      image: 'http://caas.ru/taimazy/taym_09_2_small.jpg',
      length: 65,
      maxCategory: IceCategory.i5plus,
      description: """
      Расположен на северном склоне горы Кубус в прямой видимости из а/л. Тут мы пролезли три маршрута.

1 - "Год свиньи" - через 7-ми метровый ледовый столб в самом низу (90°) по системе стенок WI 4+ и покатых полочек разной крутизны (80°), местами микст. Cтраховаться удобно на кустах.

2 - "Класика-миллениум" - через 3-ех метровую стенку на большую полку далее по 30-метровой стенке и ажурному 7-метровому ледовому столбу (90°, WI 5) на следующую полку. Оттуда вверх по 12-ти метровой сосульке WI 5 (до 95°).

3 - "Жесткий ультиматум" - через 3-х метровую ледовую стенку, 30-ти метровую стенку и 7-метровый ажурный столб (90°) на большую полку. Далее 10 метров пешком и по 5-ти метровой натечной стенке WI 5 со сложным выходом за перегиб (может быть проблематичная страховка) на покатую полку.

Также существует сложный микстовый вариант с нависанием через верхний скальный пояс после второй полки. Страховка на мелких и средних закладных. Очень неплохо было бы вбить здесь 2--3 шлямбура.

Подход занимает 30-45 мин (в зависимости от толщины снежного покрова) - по снежному склону прямо из альплагеря. Спуск около 40 мин. Сначала по плечу горы Кубус на поляну "Кругозор", затем по хорошей тропе в альплагерь.
                   """,
    );

    final digoriaKubusik = IceSectorModel(
      name: 'Кубусик',
      id: 'digora5',
      district: digoria,
      waterfallIce: true,
      image: 'http://caas.ru/taimazy/taym_10_small.jpg',
      length: 20,
      maxCategory: IceCategory.i5plus,
      description:
          """Расположен на северном склоне горы Кубус в непосредственной близости от каскада "Кубус 2000", в прямой видимости из а/л. Возможно несколько вариантов прохождения: по сложному льду в центральной части с элементами простого микста и ключом в виде системы карнизиков на последних пяти метрах, либо микстовым лазанием различной сложности слева или справа от ледового столба (варианты разной сложности).

Подход и спуск такой же, как на "Кубус2000".
""",
    );

    final digoriaToof = IceSectorModel(
      id: 'digora6',
      name: 'Зубовый',
      district: digoria,
      waterfallIce: true,
      image: 'http://caas.ru/taimazy/taym_11_small.jpg',
      length: 35,
      maxCategory: IceCategory.i4plus,
      description:
          """Расположен в кулуаре правобережной стенки каньона реки Урух, на самом выходе из каньона. Первые 25-30 м простого, часто засыпанного снегом, монолитного льда WI 3 (до 50°), после резкого перегиба 6-метровая стенка (90°).

Подход по правому берегу реки Урух от моста в а/л занимает около 10 мин. Спуска нет - лед выводит ко входу в бар... Этот момент не может не радовать :)
""",
    );

    final digoriaKindom = IceSectorModel(
      id: 'digora7',
      name: 'Ледовое Королевство 1-ый каскад',
      district: digoria,
      waterfallIce: true,
      image: 'http://caas.ru/taimazy/taym_13_2_small.jpg',
      length: 20,
      maxCategory: IceCategory.i6,
      description:
          """Расположен на правобережной стенке каньона р.Урух, на 30 метров дальше каскада "Стенка", после 2-ого поворота каньона. Участки сложности WI 6 на "Яростном парашютисте" без использования скалы.

1 - "Яростный парашютист" - после простого выхода в грот по тонкому ледовому столбику с использованием скалы слева, страховка по шлямбурам.

2 - "Как Герасим Му-Му" - ледовый столб слева или крутая ледовая стенка справа (90°), верхняя или нижняя страховка, буры крутятся хорошо.

Подход такой же, как на "Стенку", но дюльферять с обрыва нужно не вниз, а направо за поворот каньона. Осторожно, в некоторых местах лед над рекой тонкий!!!
""",
    );

    final digoriaKrown = IceSectorModel(
      id: 'digora8',
      name: 'Ледовое королевство  каскад "Корона"',
      district: digoria,
      waterfallIce: true,
      image: 'http://caas.ru/taimazy/taym_14_2_small.jpg',
      length: 25,
      maxCategory: IceCategory.i6,
      description:
          """Расположен на правобережной стенке каньона р.Урух, на 10м дальше 1-ого каскада "Ледового королевства".

1 - микст, пройденный нами (Тихоновым А.). Вверху траверс вправо на лед из-под нависания. В нижней и средней части проблематичная страховка.

2 - классический вариант через систему ажурных нависаний и полочек с непривычно большим количеством обратных хватов, страховка только верхняя - буры крутить некуда.

Подход такой же, как на 1-ый каскад "Ледового королевства".
""",
    );

    final digoriaKurazh = IceSectorModel(
      id: 'digora9',
      name: 'Ледовое королевство  каскад "Кураж"',
      district: digoria,
      waterfallIce: true,
      image: 'http://caas.ru/taimazy/taym_15_2_small.jpg',
      length: 25,
      maxCategory: IceCategory.i5plus,
      description: """
Расположен на правобережной стенке каньона реки Урух, на 10м дальше "Короны". Равномерное лазание по тонкому прозрачному натечному льду (90°), сквозь который видно скалу. Каскад имеет ширину около 20 метров, но все варианты подъема идентичны. Страховка желательно верхняя - лед тонкий и буры глубоко не закручиваются.

Подход такой же, как на каскад "Корона".
""",
    );

    final digoriaDushik = IceSectorModel(
      id: 'digora10',
      name: 'Душик ада',
      district: digoria,
      waterfallIce: true,
      image: 'http://caas.ru/taimazy/shell_small.jpg',
      length: 80,
      maxCategory: IceCategory.i7,
      description: """
Расположен на правобережной стенке каньона реки Урух, примерно в 2-2,5км от а/л. Красивый техничный каскад, состоящий из двух независимых частей: левой "Ширмы" и правого столба "Душика". Большое количество вариантов с микстами и карнизами.

В случае небольшого количества снега или наличия тропы подход занимает около 40 минут - из а/л по правому берегу над каньоном до первого верхнего коша к ручью с трубой-водозаборником, откуда вдоль ручья по кулуару на дно каньона. Весь путь хорошо просматривается с дороги с другого берега.
""",
    );

    final digoriaBlue = IceSectorModel(
      id: 'digora11',
      name: 'Голубая щель',
      district: digoria,
      waterfallIce: true,
      image: 'https://risk.ru/u/img/15/14924-670.jpg',
      length: 40,
      maxCategory: IceCategory.i4,
      description: """
Расположен в большом внутреннем углу на правобережной стенке каньона реки Урух, примерно в 3 км от а/л. Каскад из твердого "бутылочного" льда шириной около 8 метров. В нижней и средней части средняя крутизна 65°, в верхней - 80°. "Сраный спонсор" - по центру самой высокой части через стенку вверху. По бокам имеются более простые варианты.

В случае небольшого количества снега или наличия тропы подход занимает около 1 часа - из а/л по правому берегу над каньоном через кош на перемычку "Кругозора", далее вниз по лесу до сбросов и дюльфером с любого дерева к подножию каскада. Путь хорошо просматривается с дороги с другого берега.
""",
    );

    _districts.add(naroFominsk);
    _districts.add(digoria);

    _sectors[naroFominsk] = [
      naroFominskWestWall,
      naroFominskEastWall,
      naroFominskNordWall,
    ];

    _sectors[digoria] = [
      digoriaRivers,
      digoriaWall,
      digoriaAihva,
      digoriaKubus,
      digoriaKubusik,
      digoriaToof,
      digoriaKindom,
      digoriaKrown,
      digoriaDushik,
      digoriaKurazh,
      digoriaBlue,
    ];
  }

  @override
  Future<Either<Failure, List<IceDistrict>>> getDistricts() async {
    return Right(_districts);
  }

  @override
  Future<Either<Failure, List<IceSector>>> getSectors(
      {required IceDistrict district}) async {
    return Right(_sectors[district] ?? []);
  }

  @override
  Future<Either<Failure, List<IceSector>>> getAllSectors() {
    // TODO: implement getAllSectors
    throw UnimplementedError();
  }
}

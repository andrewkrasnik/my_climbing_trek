import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/data/datasources/techniques_remote_datasource.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';

// @LazySingleton(as: TechniquesRemoteDataSource)
class MockTechniquesRemoteDataSource implements TechniquesRemoteDataSource {
  final Map<TechniqueGroup, List<Technique>> _groups = {
    TechniqueGroup(
      name: 'Базовые альпинистские',
      description: '',
      image:
          'https://static.tildacdn.com/tild6262-3161-4066-b662-383466363964/nxi5EX9QHC0.jpg',
    ): [
      Technique(name: 'Мультипитч', description: ''),
      Technique(
        name: 'Жумаринг',
        description: '',
        options: [
          TechniqueOption(name: 'Косые перила'),
          TechniqueOption(name: 'Два жумара'),
          TechniqueOption(name: 'Один жумар'),
          TechniqueOption(name: 'На прусиках'),
        ],
      ),
      Technique(name: 'Укорачивание связки', description: ''),
      Technique(
        name: 'Установка точек',
        description: '',
        options: [
          TechniqueOption(name: 'Френды'),
          TechniqueOption(name: 'Закладки'),
          TechniqueOption(name: 'Крючья'),
          TechniqueOption(name: 'Трикамы'),
          TechniqueOption(name: 'Гексы'),
          TechniqueOption(name: 'Болнаты'),
        ],
      ),
      Technique(
        name: 'Организация станции',
        description: '',
        links: const [
          'https://risk.ru/blog/6626',
          'https://alplager.kz/fixed/',
          'https://alplager.kz/sliding-x/',
        ],
        options: [
          TechniqueOption(name: 'Две точки'),
          TechniqueOption(name: 'Три точки'),
          TechniqueOption(name: 'Четыре и более точек'),
          TechniqueOption(name: 'На дереве'),
          TechniqueOption(name: 'На выступе'),
          TechniqueOption(name: 'Фиксированная'),
          TechniqueOption(name: 'Компенсационная'),
          TechniqueOption(name: 'Из основной веревки'),
          TechniqueOption(name: 'Оппозитная точка'),
        ],
      ),
      Technique(
        name: 'Полиспаст',
        description: '',
        options: [
          TechniqueOption(name: 'Три к одному'),
          TechniqueOption(name: 'Пять к одному'),
        ],
      ),
      Technique(name: 'Бухтовка веревки', description: '', options: [
        TechniqueOption(name: 'На руку'),
        TechniqueOption(name: 'На шею'),
      ]),
    ],
    TechniqueGroup(
      name: 'Узлы',
      description: '',
      image:
          'https://extrim.ironws.com/wp-content/uploads/2016/05/climbing_knots-245x300.jpg',
    ): [
      Technique(name: 'Восьмерка', description: ''),
      Technique(name: 'Булинь', description: ''),
      Technique(name: 'Двойной булинь', description: ''),
      Technique(name: 'Стремя', description: ''),
      Technique(name: 'Австрийский проводник', description: ''),
      Technique(name: 'Грейпвайн', description: ''),
      Technique(name: 'UEAA', description: ''),
    ],
    TechniqueGroup(
      name: 'Спасработы в малой группе',
      description: '',
      image: 'https://risk.ru/u/img/343/342746.jpg',
    ): [
      Technique(name: 'Спасение лидера', description: ''),
      Technique(name: 'Капризный клиент', description: ''),
      Technique(name: 'Тандем-противовес', description: ''),
      Technique(name: 'Спасение с перил', description: ''),
    ],
    TechniqueGroup(
      name: 'Первая помощь',
      description: '',
      image:
          'https://informugra.ru/upload/iblock/7e6/vdwbbka0ndu12lqf95kjfoul8u4njs3h.jpg',
    ): [
      Technique(name: 'Сердечно-легочная реанимация', description: ''),
      Technique(name: 'Иммобилизация', description: ''),
      Technique(name: 'Остановка кровотечений', description: ''),
    ],
    TechniqueGroup(
      name: 'Лавинная подготовка',
      description: '',
      image:
          'https://thumb.tildacdn.com/tild6630-3036-4431-a564-613664656434/-/format/webp/photo_2020-02-04_15-.jpg',
    ): [
      Technique(name: 'Поиск по биперу', description: ''),
      Technique(name: 'Поиск с щупами', description: ''),
    ],
    TechniqueGroup(
      name: 'Ледовые занятия',
      description: '',
      image: 'https://www.kant.ru/upload/img/articles/18_ledoclimbing.jpg',
    ): [
      Technique(
        name: 'Станции на льду',
        description: '',
        options: [
          TechniqueOption(name: 'Самовыкрут'),
          TechniqueOption(name: 'Проушина Абалакова'),
        ],
      ),
      Technique(
        name: 'Спасение из ледовой трещины',
        description: '',
        options: [
          TechniqueOption(name: 'Связка двойка'),
          TechniqueOption(name: 'Связка тройка'),
        ],
      ),
    ],
    TechniqueGroup(
      name: 'Снежные занятия',
      description: '',
      image:
          'https://turclub-pik.ru/crop/170/140/uploads/track_img/582/d56926ada9ddb7959f852b0e92773d99.jpg.webp',
    ): [
      Technique(name: 'Тропежка', description: ''),
      Technique(name: 'Снежная пещера', description: ''),
      Technique(name: 'Снежная хижина', description: ''),
      Technique(name: 'Самозадержание', description: ''),
      Technique(
        name: 'Станции на снегу',
        description: '',
        options: [
          TechniqueOption(name: 'На ледорубе'),
          TechniqueOption(name: 'На рюкзаке'),
          TechniqueOption(name: 'На лопате'),
          TechniqueOption(name: 'Через ледоруб'),
          TechniqueOption(name: 'Страховка через яму'),
        ],
      ),
      Technique(name: 'Спасение из ледовой трещины', description: ''),
    ],
  };

  @override
  Future<Either<Failure, List<TechniqueGroup>>> groups() async {
    return Right(_groups.keys.toList());
  }

  @override
  Future<Either<Failure, List<Technique>>> techniques(
      {required TechniqueGroup group}) async {
    return Right(_groups[group]!);
  }

  @override
  Future<Either<Failure, bool>> getEditing() {
    // TODO: implement getEditing
    throw UnimplementedError();
  }
}

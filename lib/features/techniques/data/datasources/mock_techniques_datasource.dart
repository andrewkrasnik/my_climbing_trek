import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/data/datasources/techniques_remote_datasource.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';

@LazySingleton(as: TechniquesRemoteDataSource)
class MockTechniquesRemoteDataSource implements TechniquesRemoteDataSource {
  final Map<TechniqueGroup, List<Technique>> _groups = {
    TechniqueGroup(
      name: 'Базовые альпинистские',
      description: '',
      image:
          'https://static.tildacdn.com/tild6262-3161-4066-b662-383466363964/nxi5EX9QHC0.jpg',
    ): [
      Technique(name: 'Мультипитч', description: ''),
      Technique(name: 'Жумаринг', description: ''),
    ],
    TechniqueGroup(
      name: 'Узлы',
      description: '',
      image:
          'https://extrim.ironws.com/wp-content/uploads/2016/05/climbing_knots-245x300.jpg',
    ): [
      Technique(name: 'Восьмерка', description: ''),
      Technique(name: 'Булинь', description: ''),
    ],
    TechniqueGroup(
      name: 'Спасработы в малой группе',
      description: '',
      image: 'https://risk.ru/u/img/343/342746.jpg',
    ): [
      Technique(name: 'Спасение лидера', description: ''),
      Technique(name: 'Капризный клиент', description: ''),
    ],
    TechniqueGroup(
      name: 'Первая помощь',
      description:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZce8tz-V8NxYOfSbblz6HgV4HfVxNSg6emg&usqp=CAU',
      image: '',
    ): [
      Technique(name: 'Сердечно-легочная реанимация', description: ''),
      Technique(name: 'Иммобилизация', description: ''),
      Technique(name: 'Остановка кровотечений', description: ''),
    ],
    TechniqueGroup(
      name: 'Лавинная подготовка',
      description: '',
      image: 'https://risk.ru/u/img/343/342746.jpg',
    ): [
      Technique(name: 'Поиск по биперу', description: ''),
      Technique(name: 'Поиск с щупами', description: ''),
    ],
    TechniqueGroup(
      name: 'Ледовые занятия',
      description: '',
      image: 'https://risk.ru/u/img/343/342746.jpg',
    ): [
      Technique(name: 'Станции на льду', description: ''),
      Technique(name: 'Спасение из ледовой трещины', description: ''),
    ],
    TechniqueGroup(
      name: 'Снежные занятия',
      description: '',
      image: 'https://risk.ru/u/img/343/342746.jpg',
    ): [
      Technique(name: 'Тропежка', description: ''),
      Technique(name: 'Снежная пещера', description: ''),
      Technique(name: 'Снежная хижина', description: ''),
      Technique(name: 'Станции на снегу', description: ''),
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
}

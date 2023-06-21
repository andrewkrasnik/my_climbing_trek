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
      image: '',
    ): [
      Technique(name: 'Мультипитч', description: ''),
      Technique(name: 'Жумаринг', description: ''),
    ],
    TechniqueGroup(
      name: 'Узлы',
      description: '',
      image: '',
    ): [
      Technique(name: 'Восьмерка', description: ''),
      Technique(name: 'Булинь', description: ''),
    ],
    TechniqueGroup(
      name: 'Спасработы в малой группе',
      description: '',
      image: '',
    ): [
      Technique(name: 'Спасение лидера', description: ''),
      Technique(name: 'Капризный клиент', description: ''),
    ],
    TechniqueGroup(
      name: 'Первая помощь',
      description: '',
      image: '',
    ): [
      Technique(name: 'Сердечно-легочная реанимация', description: ''),
      Technique(name: 'Иммобилизация', description: ''),
      Technique(name: 'Остановка кровотечений', description: ''),
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

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/techniques/data/datasources/techniques_local_datasource.dart';
import 'package:my_climbing_trek/features/techniques/data/models/converters.dart';
import 'package:my_climbing_trek/features/techniques/data/models/technique_group_model.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';

@LazySingleton(as: TechniquesLocalDataSource)
class HiveTechniquesLocalDataSource implements TechniquesLocalDataSource {
  static const _groupsName = 'techniquesGroups';
  static const _techniquesName = 'techniques';

  @override
  Future<Either<Failure, List<TechniqueGroup>>> groups({int limit = 0}) async {
    final groupsBox = await Hive.openBox<String>(_groupsName);

    return Right(groupsBox.values.map((value) {
      final jsonData = json.decode(value);
      jsonData['localData'] = true;

      return TechniqueGroupModel.fromJson(jsonData);
    }).toList());
  }

  @override
  Future<Either<Failure, List<Technique>>> techniques(
      {required TechniqueGroup group}) async {
    final techniquesBox =
        await Hive.openBox<String>('$_techniquesName${group.id}');

    return Right(techniquesBox.values
        .map((value) => const TechniqueConverter().fromJson(json.decode(value)))
        .toList());
  }

  @override
  Future<Either<Failure, Unit>> deleteGroup({
    required TechniqueGroup group,
  }) async {
    try {
      final techniquesBox =
          await Hive.openBox<String>('$_techniquesName${group.id}');

      await techniquesBox.deleteFromDisk();

      final groupsBox = await Hive.openBox<String>(_groupsName);

      groupsBox.delete(group.id);

      return const Right(unit);
    } catch (error) {
      return Left(NoSQLBaseFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveGroup({
    required TechniqueGroup group,
  }) async {
    try {
      final groupsBox = await Hive.openBox<String>(_groupsName);

      await groupsBox.put(
          group.id, json.encode((group as TechniqueGroupModel).toJson()));

      return const Right(unit);
    } catch (error) {
      return Left(NoSQLBaseFailure(description: error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveTechniques({
    required TechniqueGroup group,
    required List<Technique> techniques,
  }) async {
    try {
      final techniquesBox =
          await Hive.openBox<String>('$_techniquesName${group.id}');

      final Map<String, String> map = {};

      for (var technique in techniques) {
        map[technique.id] =
            json.encode(const TechniqueConverter().toJson(technique));
      }

      await techniquesBox.putAll(map);

      return const Right(unit);
    } catch (error) {
      return Left(NoSQLBaseFailure(description: error.toString()));
    }
  }
}

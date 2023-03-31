import 'package:climbing_diary/core/datasource/db_tables.dart';
import 'package:climbing_diary/core/datasource/drift_db_local_datasource.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/data/datasources/ice_regions_datasource.dart';
import 'package:climbing_diary/features/ice_climbing/data/datasources/ice_treanings_datasource.dart';
import 'package:climbing_diary/features/ice_climbing/data/models/ice_treaning_model.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:dartz/dartz.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IceTreaningsDataSource)
class LocalIceTreaningsDataSource implements IceTreaningsDataSource {
  final DriftDBLocalDataSource _localDatabase;
  final table = DBTables.iceTreanings;
  final attemptsTable = DBTables.iceAttempts;

  Map<String, IceSector>? _sectors;

  Map<String, IceDistrict>? _districts;

  LocalIceTreaningsDataSource(this._localDatabase);

  @override
  Future<Either<Failure, IceTreaning?>> getCurrentTreaning() async {
    final failureOrTreaning =
        await _localDatabase.getCurrentTreaning(table: table);

    return failureOrTreaning.fold((failure) => Left(failure), (json) async {
      if (json == null) {
        return const Right(null);
      } else {
        return Right(await _treaningWithAttempts(json));
      }
    });
  }

  @override
  Future<Either<Failure, IceTreaning?>> getPreviousTreaning() async {
    final failureOrTreaning =
        await _localDatabase.getLastTreaning(table: table);

    return failureOrTreaning.fold((failure) => Left(failure), (json) async {
      if (json == null) {
        return const Right(null);
      } else {
        return Right(await _treaningWithAttempts(json));
      }
    });
  }

  @override
  Future<Either<Failure, List<IceTreaning>>> getTreanings() async {
    final failureOrData = await _localDatabase
        .getData(table: table, orderByConditions: {'date': false});

    return failureOrData.fold(
      (failure) => Left(failure),
      (data) async {
        final List<IceTreaning> treanings = [];

        for (var treaning in data) {
          treanings.add(await _treaningWithAttempts(treaning));
        }

        return Right(treanings);
      },
    );
  }

  @override
  Future<Either<Failure, IceTreaning>> saveTreaning(
      {required IceTreaning treaning}) async {
    final data = _convertTreaning(treaning: treaning);

    final failureOrUnit =
        await _localDatabase.updateById(table: table, data: data);

    return failureOrUnit.fold((failure) => Left(failure), (_) async {
      final failureOrUnitDelete = await _localDatabase.deleteAll(
          table: attemptsTable, whereConditions: {'treaning_id': treaning.id});

      return failureOrUnitDelete.fold(
        (failure) => Left(failure),
        (_) async {
          final failureOrUnitInsert = await _localDatabase.insertAll(
              table: attemptsTable, data: data['attempts']);
          return failureOrUnitInsert.fold(
              (failure) => Left(failure), (r) => Right(treaning));
        },
      );
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteTreaning(
      {required IceTreaning treaning}) async {
    final failureOrUnitDelete = await _localDatabase.deleteAll(
        table: attemptsTable, whereConditions: {'treaning_id': treaning.id});

    return failureOrUnitDelete.fold(
      (failure) => Left(failure),
      (_) async => await _localDatabase.deleteById(
          table: table, data: _convertTreaning(treaning: treaning)),
    );
  }

  Future<IceTreaningModel> _treaningWithAttempts(
      Map<String, dynamic> json) async {
    final failureOrLines = await _localDatabase.getData(
      table: attemptsTable,
      whereConditions: {'treaning_id': json['id']},
      orderByConditions: {'start_time': false},
    );

    if (_districts == null) {
      final dataSource = getIt<IceRegionsDataSource>();
      final failureOrList = await dataSource.getDistricts();

      _sectors = {};

      await failureOrList.fold((_) async => null, (list) async {
        _districts = {for (final item in list) item.id: item};

        for (var district in list) {
          final failureOrSectors =
              await dataSource.getSectors(district: district);

          failureOrSectors.fold((l) => null, (sectors) {
            _sectors!.addAll({for (final item in sectors) item.id: item});
          });
        }
      });
    }

    json['attempts'] = failureOrLines.fold(
      (l) => [],
      (lines) => lines,
    );

    return IceTreaningModel.fromJson(json, _districts!, _sectors!);
  }

  Map<String, dynamic> _convertTreaning({required IceTreaning treaning}) {
    if (treaning is IceTreaningModel) {
      return treaning.toJson();
    } else {
      return IceTreaningModel(
        date: treaning.date,
        finish: treaning.finish,
        start: treaning.start,
        id: treaning.id,
        district: treaning.district,
        sectors: treaning.sectors,
        attempts: treaning.attempts,
      ).toJson();
    }
  }
}

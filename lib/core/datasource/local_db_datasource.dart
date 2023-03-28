import 'package:climbing_diary/core/datasource/db_tables.dart';
import 'package:climbing_diary/core/failures/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LocalDBDatasource {
  Future<Either<Failure, List<Map<String, dynamic>>>> getData({
    required DBTables table,
    Map<String, dynamic>? whereConditions,
    Map<String, bool>? orderByConditions,
  });

  Future<Either<Failure, Unit>> insertAll(
      {required DBTables table, required List<Map<String, dynamic>> data});

  Future<Either<Failure, Unit>> updateById(
      {required DBTables table, required Map<String, dynamic> data});

  Future<Either<Failure, Unit>> deleteById(
      {required DBTables table, required Map<String, dynamic> data});
}

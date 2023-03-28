part of 'drift_db_local_datasource.dart';

const tables = [
  DriftStrengthExercisesTable,
  HallTreaningTable,
  HallAttemptTable,
];

@DataClassName('DriftStrengthExercises')
class DriftStrengthExercisesTable extends Table {
  IntColumn get repetitions => integer()();
  TextColumn get id => text().unique()();
  TextColumn get name => text()();
}

@DataClassName('HallTreaningItem')
class HallTreaningTable extends Table {
  TextColumn get id => text()();
  IntColumn get hallId => integer()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finish => dateTime().nullable()();
}

@DataClassName('HallAttemptItem')
class HallAttemptTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get treaningId => text().references(HallTreaningTable, #id)();
  IntColumn get categoryId => integer()();
  IntColumn get styleId => integer()();
  IntColumn get routeId => integer().nullable()();
  DateTimeColumn get finish => dateTime().nullable()();
  DateTimeColumn get start => dateTime().nullable()();
  IntColumn get ascentTypeId => integer().nullable()();
  IntColumn get suspensionCount => integer()();
  IntColumn get fallCount => integer()();
  BoolColumn get downClimbing => boolean()();
  BoolColumn get fail => boolean()();
}

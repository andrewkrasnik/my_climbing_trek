part of 'drift_db_local_datasource.dart';

const tables = [
  DriftStrengthExercisesTable,
  DriftHallTreaningsTable,
  DriftHallAttemptsTable,
  DriftCardioTreaningsTable,
  DriftStrengthTreaningsTable,
  DriftStrengthTreaningLinesTable,
];

@DataClassName('DriftStrengthExercise')
class DriftStrengthExercisesTable extends Table {
  IntColumn get repetitions => integer()();
  TextColumn get id => text().unique()();
  TextColumn get name => text()();
  BoolColumn get selected => boolean().withDefault(const Constant(false))();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftStrengthTreaning')
class DriftStrengthTreaningsTable extends Table {
  TextColumn get id => text().unique()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finish => dateTime().nullable()();
  DateTimeColumn get start => dateTime().nullable()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftStrengthTreaningLine')
class DriftStrengthTreaningLinesTable extends Table {
  TextColumn get repetitions => text()();
  TextColumn get treaningId =>
      text().references(DriftStrengthTreaningsTable, #id)();
  TextColumn get exercise =>
      text().references(DriftStrengthExercisesTable, #id)();
}

@DataClassName('DriftCardioTreanings')
class DriftCardioTreaningsTable extends Table {
  TextColumn get id => text().unique()();
  TextColumn get exercise => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finish => dateTime().nullable()();
  DateTimeColumn get start => dateTime().nullable()();
  IntColumn get duration => integer()();
  RealColumn get length => real()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftHallTreaning')
class DriftHallTreaningsTable extends Table {
  TextColumn get id => text().unique()();
  IntColumn get hallId => integer()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finish => dateTime().nullable()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftHallAttempt')
class DriftHallAttemptsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get treaningId =>
      text().references(DriftHallTreaningsTable, #id)();
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

part of 'drift_db_local_datasource.dart';

const tables = [
  DriftStrengthExercisesTable,
  DriftHallTreaningsTable,
  DriftHallAttemptsTable,
  DriftCardioTreaningsTable,
  DriftStrengthTreaningsTable,
  DriftStrengthTreaningLinesTable,
  DriftIceAttemptsTable,
  DriftIceTreaningsTable,
  DriftRockTreaningsTable,
  DriftRockAttemptsTable,
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
  IntColumn get id => integer().nullable().autoIncrement()();
  TextColumn get repetitions => text()();
  TextColumn get treaningId =>
      text().references(DriftStrengthTreaningsTable, #id)();
  TextColumn get exercise =>
      text().references(DriftStrengthExercisesTable, #id)();

  @override
  Set<Column>? get primaryKey => {id};
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
  TextColumn get hallId => text()();
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
  TextColumn get categoryId => text()();
  TextColumn get styleId => text()();
  TextColumn get routeId => text().nullable()();
  DateTimeColumn get finish => dateTime().nullable()();
  DateTimeColumn get start => dateTime().nullable()();
  IntColumn get ascentTypeId => integer().nullable()();
  IntColumn get suspensionCount => integer()();
  IntColumn get fallCount => integer()();
  BoolColumn get downClimbing => boolean()();
  BoolColumn get fail => boolean()();
}

@DataClassName('DriftIceTreanings')
class DriftIceTreaningsTable extends Table {
  TextColumn get id => text().unique()();
  TextColumn get district => text()();
  TextColumn get districtId => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finish => dateTime().nullable()();
  DateTimeColumn get start => dateTime().nullable()();
  TextColumn get sectors => text().nullable()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftIceAttempt')
class DriftIceAttemptsTable extends Table {
  TextColumn get id => text().unique()();
  TextColumn get sector => text()();
  TextColumn get sectorId => text()();
  TextColumn get treaningId => text().references(DriftIceTreaningsTable, #id)();
  TextColumn get category => text()();
  TextColumn get style => text()();
  DateTimeColumn get finishTime => dateTime().nullable()();
  DateTimeColumn get startTime => dateTime().nullable()();
  IntColumn get wayLength => integer().nullable()();
  IntColumn get suspensionCount => integer()();
  IntColumn get fallCount => integer()();
  BoolColumn get downClimbing => boolean()();
  BoolColumn get fail => boolean()();
  BoolColumn get installedIceScrews => boolean()();
  IntColumn get iceScrewsCount => integer()();
  IntColumn get toolsCount => integer()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftRockTreanings')
class DriftRockTreaningsTable extends Table {
  TextColumn get id => text().unique()();
  TextColumn get districtId => text()();
  TextColumn get district => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finish => dateTime().nullable()();
  DateTimeColumn get start => dateTime().nullable()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftRockAttempt')
class DriftRockAttemptsTable extends Table {
  TextColumn get id => text().unique()();
  TextColumn get sector => text()();
  TextColumn get sectorId => text()();
  TextColumn get treaningId =>
      text().references(DriftRockTreaningsTable, #id)();
  TextColumn get category => text()();
  TextColumn get route => text().nullable()();
  TextColumn get routeId => text().nullable()();
  TextColumn get style => text()();
  DateTimeColumn get finishTime => dateTime().nullable()();
  DateTimeColumn get startTime => dateTime().nullable()();
  IntColumn get suspensionCount => integer()();
  IntColumn get fallCount => integer()();
  BoolColumn get downClimbing => boolean()();
  BoolColumn get fail => boolean()();

  @override
  Set<Column>? get primaryKey => {id};
}

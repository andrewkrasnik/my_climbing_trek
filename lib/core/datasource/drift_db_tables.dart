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
  DriftTrekkingPathsTable,
  DriftTrekkingPathEventsTable,
  DriftTechniqueTreaningsTable,
  DriftTechniqueTreaningItemsTable,
  DriftAscensionsTable,
  DriftAscensionEventsTable,
  DriftTravelsTable,
  DriftTravelDaysTable,
  DriftCostLinesTable,
  DriftBudgetLinesTable,
  DriftInsuranceLinesTable,
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
  TextColumn get id => text()();
  TextColumn get repetitions => text()();
  TextColumn get treaningId =>
      text().references(DriftStrengthTreaningsTable, #id)();
  TextColumn get exercise => text()();
  TextColumn get exerciseId =>
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
  DateTimeColumn get start => dateTime().nullable()();
  TextColumn get climbingHall => text()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftHallAttempt')
class DriftHallAttemptsTable extends Table {
  TextColumn get id => text().unique()();
  TextColumn get treaningId =>
      text().references(DriftHallTreaningsTable, #id)();
  TextColumn get category => text()();
  TextColumn get style => text()();
  TextColumn get routeId => text().nullable()();
  TextColumn get route => text().nullable()();
  DateTimeColumn get finishTime => dateTime().nullable()();
  DateTimeColumn get startTime => dateTime().nullable()();
  TextColumn get ascentType => text().nullable()();
  IntColumn get suspensionCount => integer()();
  IntColumn get fallCount => integer()();
  BoolColumn get downClimbing => boolean()();
  BoolColumn get fail => boolean()();

  @override
  Set<Column>? get primaryKey => {id};
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
  TextColumn get sectors => text().nullable()();

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
  TextColumn get ascentType => text().nullable()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftTrekkingPath')
class DriftTrekkingPathsTable extends Table {
  TextColumn get id => text().unique()();
  TextColumn get region => text()();
  TextColumn get trekId => text().nullable()();
  TextColumn get trek => text().nullable()();
  TextColumn get type => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finish => dateTime().nullable()();
  DateTimeColumn get start => dateTime().nullable()();
  TextColumn get currentSection => text().nullable()();
  IntColumn get climbDown => integer()();
  IntColumn get climbUp => integer()();
  BoolColumn get turn => boolean()();
  RealColumn get length => real()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftTrekkingPathEvent')
class DriftTrekkingPathEventsTable extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get pathId => text().references(DriftTrekkingPathsTable, #id)();
  TextColumn get point => text().nullable()();
  TextColumn get pointId => text().nullable()();
  DateTimeColumn get time => dateTime()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftTechniqueTreaning')
class DriftTechniqueTreaningsTable extends Table {
  TextColumn get id => text().unique()();
  TextColumn get comment => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finish => dateTime().nullable()();
  DateTimeColumn get start => dateTime().nullable()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftTechniqueTreaningItem')
class DriftTechniqueTreaningItemsTable extends Table {
  TextColumn get id => text()();
  TextColumn get comment => text()();
  TextColumn get treaningId =>
      text().references(DriftTechniqueTreaningsTable, #id)();
  TextColumn get options => text().nullable()();
  DateTimeColumn get finishTime => dateTime().nullable()();
  DateTimeColumn get startTime => dateTime().nullable()();
  TextColumn get group => text()();
  TextColumn get technique => text()();
  TextColumn get techniqueId => text()();
  TextColumn get groupId => text()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftAscension')
class DriftAscensionsTable extends Table {
  TextColumn get id => text().unique()();
  TextColumn get mountain => text()();
  TextColumn get mountainId => text()();
  TextColumn get routeId => text().nullable()();
  TextColumn get route => text().nullable()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finish => dateTime().nullable()();
  DateTimeColumn get start => dateTime().nullable()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftAscensionEvent')
class DriftAscensionEventsTable extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  TextColumn get ascensionId => text().references(DriftAscensionsTable, #id)();
  DateTimeColumn get time => dateTime().nullable()();
  DateTimeColumn get planedTime => dateTime().nullable()();

  @override
  Set<Column>? get primaryKey => {id};
}

///////////////////////////////////////////////////////////////////////
/////////////////////////////TRAVELS///////////////////////////////////

@DataClassName('DriftTravel')
class DriftTravelsTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get finish => dateTime().nullable()();
  DateTimeColumn get start => dateTime().nullable()();
  TextColumn get regions => text()();
  TextColumn get name => text()();
  TextColumn get image => text()();
  TextColumn get description => text()();
  TextColumn get currencies => text()();
  TextColumn get status => text()();
  IntColumn get budgetCurrency => integer()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftTravelDay')
class DriftTravelDaysTable extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get start => dateTime().nullable()();
  TextColumn get description => text()();
  IntColumn get number => integer()();
  TextColumn get transportLines => text()();
  TextColumn get feedingsLines => text()();
  TextColumn get stayLines => text()();
  TextColumn get travelId => text().references(DriftTravelsTable, #id)();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftCostLine')
class DriftCostLinesTable extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  IntColumn get currency => integer()();
  TextColumn get travelId => text().references(DriftTravelsTable, #id)();
  DateTimeColumn get date => dateTime()();
  RealColumn get sum => real()();
  RealColumn get budgetSum => real()();
  TextColumn get description => text()();
  TextColumn get incomeExpense => text()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftBudgetLine')
class DriftBudgetLinesTable extends Table {
  TextColumn get id => text()();
  TextColumn get type => text()();
  RealColumn get amount => real()();
  TextColumn get travelId => text().references(DriftTravelsTable, #id)();
  TextColumn get description => text()();

  @override
  Set<Column>? get primaryKey => {id};
}

@DataClassName('DriftInsuranceLine')
class DriftInsuranceLinesTable extends Table {
  TextColumn get id => text()();
  TextColumn get number => text()();
  TextColumn get travelId => text().references(DriftTravelsTable, #id)();
  TextColumn get insurant => text()();
  TextColumn get description => text()();
  TextColumn get insurer => text()();
  TextColumn get contacts => text()();

  @override
  Set<Column>? get primaryKey => {id};
}

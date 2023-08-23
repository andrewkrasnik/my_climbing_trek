// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db_local_datasource.dart';

// ignore_for_file: type=lint
class $DriftStrengthExercisesTableTable extends DriftStrengthExercisesTable
    with TableInfo<$DriftStrengthExercisesTableTable, DriftStrengthExercise> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftStrengthExercisesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _repetitionsMeta =
      const VerificationMeta('repetitions');
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
      'repetitions', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _selectedMeta =
      const VerificationMeta('selected');
  @override
  late final GeneratedColumn<bool> selected =
      GeneratedColumn<bool>('selected', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("selected" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }),
          defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [repetitions, id, name, selected];
  @override
  String get aliasedName => _alias ?? 'drift_strength_exercises_table';
  @override
  String get actualTableName => 'drift_strength_exercises_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftStrengthExercise> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('repetitions')) {
      context.handle(
          _repetitionsMeta,
          repetitions.isAcceptableOrUnknown(
              data['repetitions']!, _repetitionsMeta));
    } else if (isInserting) {
      context.missing(_repetitionsMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('selected')) {
      context.handle(_selectedMeta,
          selected.isAcceptableOrUnknown(data['selected']!, _selectedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftStrengthExercise map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftStrengthExercise(
      repetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}repetitions'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      selected: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}selected'])!,
    );
  }

  @override
  $DriftStrengthExercisesTableTable createAlias(String alias) {
    return $DriftStrengthExercisesTableTable(attachedDatabase, alias);
  }
}

class DriftStrengthExercise extends DataClass
    implements Insertable<DriftStrengthExercise> {
  final int repetitions;
  final String id;
  final String name;
  final bool selected;
  const DriftStrengthExercise(
      {required this.repetitions,
      required this.id,
      required this.name,
      required this.selected});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['repetitions'] = Variable<int>(repetitions);
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['selected'] = Variable<bool>(selected);
    return map;
  }

  DriftStrengthExercisesTableCompanion toCompanion(bool nullToAbsent) {
    return DriftStrengthExercisesTableCompanion(
      repetitions: Value(repetitions),
      id: Value(id),
      name: Value(name),
      selected: Value(selected),
    );
  }

  factory DriftStrengthExercise.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftStrengthExercise(
      repetitions: serializer.fromJson<int>(json['repetitions']),
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      selected: serializer.fromJson<bool>(json['selected']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'repetitions': serializer.toJson<int>(repetitions),
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'selected': serializer.toJson<bool>(selected),
    };
  }

  DriftStrengthExercise copyWith(
          {int? repetitions, String? id, String? name, bool? selected}) =>
      DriftStrengthExercise(
        repetitions: repetitions ?? this.repetitions,
        id: id ?? this.id,
        name: name ?? this.name,
        selected: selected ?? this.selected,
      );
  @override
  String toString() {
    return (StringBuffer('DriftStrengthExercise(')
          ..write('repetitions: $repetitions, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('selected: $selected')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(repetitions, id, name, selected);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftStrengthExercise &&
          other.repetitions == this.repetitions &&
          other.id == this.id &&
          other.name == this.name &&
          other.selected == this.selected);
}

class DriftStrengthExercisesTableCompanion
    extends UpdateCompanion<DriftStrengthExercise> {
  final Value<int> repetitions;
  final Value<String> id;
  final Value<String> name;
  final Value<bool> selected;
  final Value<int> rowid;
  const DriftStrengthExercisesTableCompanion({
    this.repetitions = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.selected = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftStrengthExercisesTableCompanion.insert({
    required int repetitions,
    required String id,
    required String name,
    this.selected = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : repetitions = Value(repetitions),
        id = Value(id),
        name = Value(name);
  static Insertable<DriftStrengthExercise> custom({
    Expression<int>? repetitions,
    Expression<String>? id,
    Expression<String>? name,
    Expression<bool>? selected,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (repetitions != null) 'repetitions': repetitions,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (selected != null) 'selected': selected,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftStrengthExercisesTableCompanion copyWith(
      {Value<int>? repetitions,
      Value<String>? id,
      Value<String>? name,
      Value<bool>? selected,
      Value<int>? rowid}) {
    return DriftStrengthExercisesTableCompanion(
      repetitions: repetitions ?? this.repetitions,
      id: id ?? this.id,
      name: name ?? this.name,
      selected: selected ?? this.selected,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (selected.present) {
      map['selected'] = Variable<bool>(selected.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftStrengthExercisesTableCompanion(')
          ..write('repetitions: $repetitions, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('selected: $selected, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftHallTreaningsTableTable extends DriftHallTreaningsTable
    with TableInfo<$DriftHallTreaningsTableTable, DriftHallTreaning> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftHallTreaningsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _hallIdMeta = const VerificationMeta('hallId');
  @override
  late final GeneratedColumn<String> hallId = GeneratedColumn<String>(
      'hall_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _climbingHallMeta =
      const VerificationMeta('climbingHall');
  @override
  late final GeneratedColumn<String> climbingHall = GeneratedColumn<String>(
      'climbing_hall', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, hallId, date, finish, start, climbingHall];
  @override
  String get aliasedName => _alias ?? 'drift_hall_treanings_table';
  @override
  String get actualTableName => 'drift_hall_treanings_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftHallTreaning> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('hall_id')) {
      context.handle(_hallIdMeta,
          hallId.isAcceptableOrUnknown(data['hall_id']!, _hallIdMeta));
    } else if (isInserting) {
      context.missing(_hallIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    if (data.containsKey('climbing_hall')) {
      context.handle(
          _climbingHallMeta,
          climbingHall.isAcceptableOrUnknown(
              data['climbing_hall']!, _climbingHallMeta));
    } else if (isInserting) {
      context.missing(_climbingHallMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftHallTreaning map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftHallTreaning(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      hallId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hall_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
      climbingHall: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}climbing_hall'])!,
    );
  }

  @override
  $DriftHallTreaningsTableTable createAlias(String alias) {
    return $DriftHallTreaningsTableTable(attachedDatabase, alias);
  }
}

class DriftHallTreaning extends DataClass
    implements Insertable<DriftHallTreaning> {
  final String id;
  final String hallId;
  final DateTime date;
  final DateTime? finish;
  final DateTime? start;
  final String climbingHall;
  const DriftHallTreaning(
      {required this.id,
      required this.hallId,
      required this.date,
      this.finish,
      this.start,
      required this.climbingHall});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['hall_id'] = Variable<String>(hallId);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    map['climbing_hall'] = Variable<String>(climbingHall);
    return map;
  }

  DriftHallTreaningsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftHallTreaningsTableCompanion(
      id: Value(id),
      hallId: Value(hallId),
      date: Value(date),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
      climbingHall: Value(climbingHall),
    );
  }

  factory DriftHallTreaning.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftHallTreaning(
      id: serializer.fromJson<String>(json['id']),
      hallId: serializer.fromJson<String>(json['hallId']),
      date: serializer.fromJson<DateTime>(json['date']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
      start: serializer.fromJson<DateTime?>(json['start']),
      climbingHall: serializer.fromJson<String>(json['climbingHall']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'hallId': serializer.toJson<String>(hallId),
      'date': serializer.toJson<DateTime>(date),
      'finish': serializer.toJson<DateTime?>(finish),
      'start': serializer.toJson<DateTime?>(start),
      'climbingHall': serializer.toJson<String>(climbingHall),
    };
  }

  DriftHallTreaning copyWith(
          {String? id,
          String? hallId,
          DateTime? date,
          Value<DateTime?> finish = const Value.absent(),
          Value<DateTime?> start = const Value.absent(),
          String? climbingHall}) =>
      DriftHallTreaning(
        id: id ?? this.id,
        hallId: hallId ?? this.hallId,
        date: date ?? this.date,
        finish: finish.present ? finish.value : this.finish,
        start: start.present ? start.value : this.start,
        climbingHall: climbingHall ?? this.climbingHall,
      );
  @override
  String toString() {
    return (StringBuffer('DriftHallTreaning(')
          ..write('id: $id, ')
          ..write('hallId: $hallId, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('climbingHall: $climbingHall')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, hallId, date, finish, start, climbingHall);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftHallTreaning &&
          other.id == this.id &&
          other.hallId == this.hallId &&
          other.date == this.date &&
          other.finish == this.finish &&
          other.start == this.start &&
          other.climbingHall == this.climbingHall);
}

class DriftHallTreaningsTableCompanion
    extends UpdateCompanion<DriftHallTreaning> {
  final Value<String> id;
  final Value<String> hallId;
  final Value<DateTime> date;
  final Value<DateTime?> finish;
  final Value<DateTime?> start;
  final Value<String> climbingHall;
  final Value<int> rowid;
  const DriftHallTreaningsTableCompanion({
    this.id = const Value.absent(),
    this.hallId = const Value.absent(),
    this.date = const Value.absent(),
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.climbingHall = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftHallTreaningsTableCompanion.insert({
    required String id,
    required String hallId,
    required DateTime date,
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    required String climbingHall,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        hallId = Value(hallId),
        date = Value(date),
        climbingHall = Value(climbingHall);
  static Insertable<DriftHallTreaning> custom({
    Expression<String>? id,
    Expression<String>? hallId,
    Expression<DateTime>? date,
    Expression<DateTime>? finish,
    Expression<DateTime>? start,
    Expression<String>? climbingHall,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hallId != null) 'hall_id': hallId,
      if (date != null) 'date': date,
      if (finish != null) 'finish': finish,
      if (start != null) 'start': start,
      if (climbingHall != null) 'climbing_hall': climbingHall,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftHallTreaningsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? hallId,
      Value<DateTime>? date,
      Value<DateTime?>? finish,
      Value<DateTime?>? start,
      Value<String>? climbingHall,
      Value<int>? rowid}) {
    return DriftHallTreaningsTableCompanion(
      id: id ?? this.id,
      hallId: hallId ?? this.hallId,
      date: date ?? this.date,
      finish: finish ?? this.finish,
      start: start ?? this.start,
      climbingHall: climbingHall ?? this.climbingHall,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (hallId.present) {
      map['hall_id'] = Variable<String>(hallId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (climbingHall.present) {
      map['climbing_hall'] = Variable<String>(climbingHall.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftHallTreaningsTableCompanion(')
          ..write('id: $id, ')
          ..write('hallId: $hallId, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('climbingHall: $climbingHall, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftHallAttemptsTableTable extends DriftHallAttemptsTable
    with TableInfo<$DriftHallAttemptsTableTable, DriftHallAttempt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftHallAttemptsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _treaningIdMeta =
      const VerificationMeta('treaningId');
  @override
  late final GeneratedColumn<String> treaningId = GeneratedColumn<String>(
      'treaning_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_hall_treanings_table (id)'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _styleMeta = const VerificationMeta('style');
  @override
  late final GeneratedColumn<String> style = GeneratedColumn<String>(
      'style', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _routeIdMeta =
      const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<String> routeId = GeneratedColumn<String>(
      'route_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
      'route', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _finishTimeMeta =
      const VerificationMeta('finishTime');
  @override
  late final GeneratedColumn<DateTime> finishTime = GeneratedColumn<DateTime>(
      'finish_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _ascentTypeMeta =
      const VerificationMeta('ascentType');
  @override
  late final GeneratedColumn<String> ascentType = GeneratedColumn<String>(
      'ascent_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _suspensionCountMeta =
      const VerificationMeta('suspensionCount');
  @override
  late final GeneratedColumn<int> suspensionCount = GeneratedColumn<int>(
      'suspension_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fallCountMeta =
      const VerificationMeta('fallCount');
  @override
  late final GeneratedColumn<int> fallCount = GeneratedColumn<int>(
      'fall_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _downClimbingMeta =
      const VerificationMeta('downClimbing');
  @override
  late final GeneratedColumn<bool> downClimbing =
      GeneratedColumn<bool>('down_climbing', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("down_climbing" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _failMeta = const VerificationMeta('fail');
  @override
  late final GeneratedColumn<bool> fail =
      GeneratedColumn<bool>('fail', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("fail" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        treaningId,
        category,
        style,
        routeId,
        route,
        finishTime,
        startTime,
        ascentType,
        suspensionCount,
        fallCount,
        downClimbing,
        fail
      ];
  @override
  String get aliasedName => _alias ?? 'drift_hall_attempts_table';
  @override
  String get actualTableName => 'drift_hall_attempts_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftHallAttempt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('treaning_id')) {
      context.handle(
          _treaningIdMeta,
          treaningId.isAcceptableOrUnknown(
              data['treaning_id']!, _treaningIdMeta));
    } else if (isInserting) {
      context.missing(_treaningIdMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('style')) {
      context.handle(
          _styleMeta, style.isAcceptableOrUnknown(data['style']!, _styleMeta));
    } else if (isInserting) {
      context.missing(_styleMeta);
    }
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    }
    if (data.containsKey('route')) {
      context.handle(
          _routeMeta, route.isAcceptableOrUnknown(data['route']!, _routeMeta));
    }
    if (data.containsKey('finish_time')) {
      context.handle(
          _finishTimeMeta,
          finishTime.isAcceptableOrUnknown(
              data['finish_time']!, _finishTimeMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('ascent_type')) {
      context.handle(
          _ascentTypeMeta,
          ascentType.isAcceptableOrUnknown(
              data['ascent_type']!, _ascentTypeMeta));
    }
    if (data.containsKey('suspension_count')) {
      context.handle(
          _suspensionCountMeta,
          suspensionCount.isAcceptableOrUnknown(
              data['suspension_count']!, _suspensionCountMeta));
    } else if (isInserting) {
      context.missing(_suspensionCountMeta);
    }
    if (data.containsKey('fall_count')) {
      context.handle(_fallCountMeta,
          fallCount.isAcceptableOrUnknown(data['fall_count']!, _fallCountMeta));
    } else if (isInserting) {
      context.missing(_fallCountMeta);
    }
    if (data.containsKey('down_climbing')) {
      context.handle(
          _downClimbingMeta,
          downClimbing.isAcceptableOrUnknown(
              data['down_climbing']!, _downClimbingMeta));
    } else if (isInserting) {
      context.missing(_downClimbingMeta);
    }
    if (data.containsKey('fail')) {
      context.handle(
          _failMeta, fail.isAcceptableOrUnknown(data['fail']!, _failMeta));
    } else if (isInserting) {
      context.missing(_failMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftHallAttempt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftHallAttempt(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      treaningId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}treaning_id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      style: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}style'])!,
      routeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}route_id']),
      route: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}route']),
      finishTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish_time']),
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      ascentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ascent_type']),
      suspensionCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}suspension_count'])!,
      fallCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fall_count'])!,
      downClimbing: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}down_climbing'])!,
      fail: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fail'])!,
    );
  }

  @override
  $DriftHallAttemptsTableTable createAlias(String alias) {
    return $DriftHallAttemptsTableTable(attachedDatabase, alias);
  }
}

class DriftHallAttempt extends DataClass
    implements Insertable<DriftHallAttempt> {
  final String id;
  final String treaningId;
  final String category;
  final String style;
  final String? routeId;
  final String? route;
  final DateTime? finishTime;
  final DateTime? startTime;
  final String? ascentType;
  final int suspensionCount;
  final int fallCount;
  final bool downClimbing;
  final bool fail;
  const DriftHallAttempt(
      {required this.id,
      required this.treaningId,
      required this.category,
      required this.style,
      this.routeId,
      this.route,
      this.finishTime,
      this.startTime,
      this.ascentType,
      required this.suspensionCount,
      required this.fallCount,
      required this.downClimbing,
      required this.fail});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['treaning_id'] = Variable<String>(treaningId);
    map['category'] = Variable<String>(category);
    map['style'] = Variable<String>(style);
    if (!nullToAbsent || routeId != null) {
      map['route_id'] = Variable<String>(routeId);
    }
    if (!nullToAbsent || route != null) {
      map['route'] = Variable<String>(route);
    }
    if (!nullToAbsent || finishTime != null) {
      map['finish_time'] = Variable<DateTime>(finishTime);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    if (!nullToAbsent || ascentType != null) {
      map['ascent_type'] = Variable<String>(ascentType);
    }
    map['suspension_count'] = Variable<int>(suspensionCount);
    map['fall_count'] = Variable<int>(fallCount);
    map['down_climbing'] = Variable<bool>(downClimbing);
    map['fail'] = Variable<bool>(fail);
    return map;
  }

  DriftHallAttemptsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftHallAttemptsTableCompanion(
      id: Value(id),
      treaningId: Value(treaningId),
      category: Value(category),
      style: Value(style),
      routeId: routeId == null && nullToAbsent
          ? const Value.absent()
          : Value(routeId),
      route:
          route == null && nullToAbsent ? const Value.absent() : Value(route),
      finishTime: finishTime == null && nullToAbsent
          ? const Value.absent()
          : Value(finishTime),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      ascentType: ascentType == null && nullToAbsent
          ? const Value.absent()
          : Value(ascentType),
      suspensionCount: Value(suspensionCount),
      fallCount: Value(fallCount),
      downClimbing: Value(downClimbing),
      fail: Value(fail),
    );
  }

  factory DriftHallAttempt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftHallAttempt(
      id: serializer.fromJson<String>(json['id']),
      treaningId: serializer.fromJson<String>(json['treaningId']),
      category: serializer.fromJson<String>(json['category']),
      style: serializer.fromJson<String>(json['style']),
      routeId: serializer.fromJson<String?>(json['routeId']),
      route: serializer.fromJson<String?>(json['route']),
      finishTime: serializer.fromJson<DateTime?>(json['finishTime']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      ascentType: serializer.fromJson<String?>(json['ascentType']),
      suspensionCount: serializer.fromJson<int>(json['suspensionCount']),
      fallCount: serializer.fromJson<int>(json['fallCount']),
      downClimbing: serializer.fromJson<bool>(json['downClimbing']),
      fail: serializer.fromJson<bool>(json['fail']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'treaningId': serializer.toJson<String>(treaningId),
      'category': serializer.toJson<String>(category),
      'style': serializer.toJson<String>(style),
      'routeId': serializer.toJson<String?>(routeId),
      'route': serializer.toJson<String?>(route),
      'finishTime': serializer.toJson<DateTime?>(finishTime),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'ascentType': serializer.toJson<String?>(ascentType),
      'suspensionCount': serializer.toJson<int>(suspensionCount),
      'fallCount': serializer.toJson<int>(fallCount),
      'downClimbing': serializer.toJson<bool>(downClimbing),
      'fail': serializer.toJson<bool>(fail),
    };
  }

  DriftHallAttempt copyWith(
          {String? id,
          String? treaningId,
          String? category,
          String? style,
          Value<String?> routeId = const Value.absent(),
          Value<String?> route = const Value.absent(),
          Value<DateTime?> finishTime = const Value.absent(),
          Value<DateTime?> startTime = const Value.absent(),
          Value<String?> ascentType = const Value.absent(),
          int? suspensionCount,
          int? fallCount,
          bool? downClimbing,
          bool? fail}) =>
      DriftHallAttempt(
        id: id ?? this.id,
        treaningId: treaningId ?? this.treaningId,
        category: category ?? this.category,
        style: style ?? this.style,
        routeId: routeId.present ? routeId.value : this.routeId,
        route: route.present ? route.value : this.route,
        finishTime: finishTime.present ? finishTime.value : this.finishTime,
        startTime: startTime.present ? startTime.value : this.startTime,
        ascentType: ascentType.present ? ascentType.value : this.ascentType,
        suspensionCount: suspensionCount ?? this.suspensionCount,
        fallCount: fallCount ?? this.fallCount,
        downClimbing: downClimbing ?? this.downClimbing,
        fail: fail ?? this.fail,
      );
  @override
  String toString() {
    return (StringBuffer('DriftHallAttempt(')
          ..write('id: $id, ')
          ..write('treaningId: $treaningId, ')
          ..write('category: $category, ')
          ..write('style: $style, ')
          ..write('routeId: $routeId, ')
          ..write('route: $route, ')
          ..write('finishTime: $finishTime, ')
          ..write('startTime: $startTime, ')
          ..write('ascentType: $ascentType, ')
          ..write('suspensionCount: $suspensionCount, ')
          ..write('fallCount: $fallCount, ')
          ..write('downClimbing: $downClimbing, ')
          ..write('fail: $fail')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      treaningId,
      category,
      style,
      routeId,
      route,
      finishTime,
      startTime,
      ascentType,
      suspensionCount,
      fallCount,
      downClimbing,
      fail);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftHallAttempt &&
          other.id == this.id &&
          other.treaningId == this.treaningId &&
          other.category == this.category &&
          other.style == this.style &&
          other.routeId == this.routeId &&
          other.route == this.route &&
          other.finishTime == this.finishTime &&
          other.startTime == this.startTime &&
          other.ascentType == this.ascentType &&
          other.suspensionCount == this.suspensionCount &&
          other.fallCount == this.fallCount &&
          other.downClimbing == this.downClimbing &&
          other.fail == this.fail);
}

class DriftHallAttemptsTableCompanion
    extends UpdateCompanion<DriftHallAttempt> {
  final Value<String> id;
  final Value<String> treaningId;
  final Value<String> category;
  final Value<String> style;
  final Value<String?> routeId;
  final Value<String?> route;
  final Value<DateTime?> finishTime;
  final Value<DateTime?> startTime;
  final Value<String?> ascentType;
  final Value<int> suspensionCount;
  final Value<int> fallCount;
  final Value<bool> downClimbing;
  final Value<bool> fail;
  final Value<int> rowid;
  const DriftHallAttemptsTableCompanion({
    this.id = const Value.absent(),
    this.treaningId = const Value.absent(),
    this.category = const Value.absent(),
    this.style = const Value.absent(),
    this.routeId = const Value.absent(),
    this.route = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.startTime = const Value.absent(),
    this.ascentType = const Value.absent(),
    this.suspensionCount = const Value.absent(),
    this.fallCount = const Value.absent(),
    this.downClimbing = const Value.absent(),
    this.fail = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftHallAttemptsTableCompanion.insert({
    required String id,
    required String treaningId,
    required String category,
    required String style,
    this.routeId = const Value.absent(),
    this.route = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.startTime = const Value.absent(),
    this.ascentType = const Value.absent(),
    required int suspensionCount,
    required int fallCount,
    required bool downClimbing,
    required bool fail,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        treaningId = Value(treaningId),
        category = Value(category),
        style = Value(style),
        suspensionCount = Value(suspensionCount),
        fallCount = Value(fallCount),
        downClimbing = Value(downClimbing),
        fail = Value(fail);
  static Insertable<DriftHallAttempt> custom({
    Expression<String>? id,
    Expression<String>? treaningId,
    Expression<String>? category,
    Expression<String>? style,
    Expression<String>? routeId,
    Expression<String>? route,
    Expression<DateTime>? finishTime,
    Expression<DateTime>? startTime,
    Expression<String>? ascentType,
    Expression<int>? suspensionCount,
    Expression<int>? fallCount,
    Expression<bool>? downClimbing,
    Expression<bool>? fail,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (treaningId != null) 'treaning_id': treaningId,
      if (category != null) 'category': category,
      if (style != null) 'style': style,
      if (routeId != null) 'route_id': routeId,
      if (route != null) 'route': route,
      if (finishTime != null) 'finish_time': finishTime,
      if (startTime != null) 'start_time': startTime,
      if (ascentType != null) 'ascent_type': ascentType,
      if (suspensionCount != null) 'suspension_count': suspensionCount,
      if (fallCount != null) 'fall_count': fallCount,
      if (downClimbing != null) 'down_climbing': downClimbing,
      if (fail != null) 'fail': fail,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftHallAttemptsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? treaningId,
      Value<String>? category,
      Value<String>? style,
      Value<String?>? routeId,
      Value<String?>? route,
      Value<DateTime?>? finishTime,
      Value<DateTime?>? startTime,
      Value<String?>? ascentType,
      Value<int>? suspensionCount,
      Value<int>? fallCount,
      Value<bool>? downClimbing,
      Value<bool>? fail,
      Value<int>? rowid}) {
    return DriftHallAttemptsTableCompanion(
      id: id ?? this.id,
      treaningId: treaningId ?? this.treaningId,
      category: category ?? this.category,
      style: style ?? this.style,
      routeId: routeId ?? this.routeId,
      route: route ?? this.route,
      finishTime: finishTime ?? this.finishTime,
      startTime: startTime ?? this.startTime,
      ascentType: ascentType ?? this.ascentType,
      suspensionCount: suspensionCount ?? this.suspensionCount,
      fallCount: fallCount ?? this.fallCount,
      downClimbing: downClimbing ?? this.downClimbing,
      fail: fail ?? this.fail,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (treaningId.present) {
      map['treaning_id'] = Variable<String>(treaningId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (style.present) {
      map['style'] = Variable<String>(style.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<String>(routeId.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (finishTime.present) {
      map['finish_time'] = Variable<DateTime>(finishTime.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (ascentType.present) {
      map['ascent_type'] = Variable<String>(ascentType.value);
    }
    if (suspensionCount.present) {
      map['suspension_count'] = Variable<int>(suspensionCount.value);
    }
    if (fallCount.present) {
      map['fall_count'] = Variable<int>(fallCount.value);
    }
    if (downClimbing.present) {
      map['down_climbing'] = Variable<bool>(downClimbing.value);
    }
    if (fail.present) {
      map['fail'] = Variable<bool>(fail.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftHallAttemptsTableCompanion(')
          ..write('id: $id, ')
          ..write('treaningId: $treaningId, ')
          ..write('category: $category, ')
          ..write('style: $style, ')
          ..write('routeId: $routeId, ')
          ..write('route: $route, ')
          ..write('finishTime: $finishTime, ')
          ..write('startTime: $startTime, ')
          ..write('ascentType: $ascentType, ')
          ..write('suspensionCount: $suspensionCount, ')
          ..write('fallCount: $fallCount, ')
          ..write('downClimbing: $downClimbing, ')
          ..write('fail: $fail, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftCardioTreaningsTableTable extends DriftCardioTreaningsTable
    with TableInfo<$DriftCardioTreaningsTableTable, DriftCardioTreanings> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftCardioTreaningsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _exerciseMeta =
      const VerificationMeta('exercise');
  @override
  late final GeneratedColumn<String> exercise = GeneratedColumn<String>(
      'exercise', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lengthMeta = const VerificationMeta('length');
  @override
  late final GeneratedColumn<double> length = GeneratedColumn<double>(
      'length', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, exercise, date, finish, start, duration, length];
  @override
  String get aliasedName => _alias ?? 'drift_cardio_treanings_table';
  @override
  String get actualTableName => 'drift_cardio_treanings_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftCardioTreanings> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('exercise')) {
      context.handle(_exerciseMeta,
          exercise.isAcceptableOrUnknown(data['exercise']!, _exerciseMeta));
    } else if (isInserting) {
      context.missing(_exerciseMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('length')) {
      context.handle(_lengthMeta,
          length.isAcceptableOrUnknown(data['length']!, _lengthMeta));
    } else if (isInserting) {
      context.missing(_lengthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftCardioTreanings map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftCardioTreanings(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      exercise: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration'])!,
      length: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}length'])!,
    );
  }

  @override
  $DriftCardioTreaningsTableTable createAlias(String alias) {
    return $DriftCardioTreaningsTableTable(attachedDatabase, alias);
  }
}

class DriftCardioTreanings extends DataClass
    implements Insertable<DriftCardioTreanings> {
  final String id;
  final String exercise;
  final DateTime date;
  final DateTime? finish;
  final DateTime? start;
  final int duration;
  final double length;
  const DriftCardioTreanings(
      {required this.id,
      required this.exercise,
      required this.date,
      this.finish,
      this.start,
      required this.duration,
      required this.length});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['exercise'] = Variable<String>(exercise);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    map['duration'] = Variable<int>(duration);
    map['length'] = Variable<double>(length);
    return map;
  }

  DriftCardioTreaningsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftCardioTreaningsTableCompanion(
      id: Value(id),
      exercise: Value(exercise),
      date: Value(date),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
      duration: Value(duration),
      length: Value(length),
    );
  }

  factory DriftCardioTreanings.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftCardioTreanings(
      id: serializer.fromJson<String>(json['id']),
      exercise: serializer.fromJson<String>(json['exercise']),
      date: serializer.fromJson<DateTime>(json['date']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
      start: serializer.fromJson<DateTime?>(json['start']),
      duration: serializer.fromJson<int>(json['duration']),
      length: serializer.fromJson<double>(json['length']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'exercise': serializer.toJson<String>(exercise),
      'date': serializer.toJson<DateTime>(date),
      'finish': serializer.toJson<DateTime?>(finish),
      'start': serializer.toJson<DateTime?>(start),
      'duration': serializer.toJson<int>(duration),
      'length': serializer.toJson<double>(length),
    };
  }

  DriftCardioTreanings copyWith(
          {String? id,
          String? exercise,
          DateTime? date,
          Value<DateTime?> finish = const Value.absent(),
          Value<DateTime?> start = const Value.absent(),
          int? duration,
          double? length}) =>
      DriftCardioTreanings(
        id: id ?? this.id,
        exercise: exercise ?? this.exercise,
        date: date ?? this.date,
        finish: finish.present ? finish.value : this.finish,
        start: start.present ? start.value : this.start,
        duration: duration ?? this.duration,
        length: length ?? this.length,
      );
  @override
  String toString() {
    return (StringBuffer('DriftCardioTreanings(')
          ..write('id: $id, ')
          ..write('exercise: $exercise, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('duration: $duration, ')
          ..write('length: $length')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, exercise, date, finish, start, duration, length);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftCardioTreanings &&
          other.id == this.id &&
          other.exercise == this.exercise &&
          other.date == this.date &&
          other.finish == this.finish &&
          other.start == this.start &&
          other.duration == this.duration &&
          other.length == this.length);
}

class DriftCardioTreaningsTableCompanion
    extends UpdateCompanion<DriftCardioTreanings> {
  final Value<String> id;
  final Value<String> exercise;
  final Value<DateTime> date;
  final Value<DateTime?> finish;
  final Value<DateTime?> start;
  final Value<int> duration;
  final Value<double> length;
  final Value<int> rowid;
  const DriftCardioTreaningsTableCompanion({
    this.id = const Value.absent(),
    this.exercise = const Value.absent(),
    this.date = const Value.absent(),
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.duration = const Value.absent(),
    this.length = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftCardioTreaningsTableCompanion.insert({
    required String id,
    required String exercise,
    required DateTime date,
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    required int duration,
    required double length,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        exercise = Value(exercise),
        date = Value(date),
        duration = Value(duration),
        length = Value(length);
  static Insertable<DriftCardioTreanings> custom({
    Expression<String>? id,
    Expression<String>? exercise,
    Expression<DateTime>? date,
    Expression<DateTime>? finish,
    Expression<DateTime>? start,
    Expression<int>? duration,
    Expression<double>? length,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (exercise != null) 'exercise': exercise,
      if (date != null) 'date': date,
      if (finish != null) 'finish': finish,
      if (start != null) 'start': start,
      if (duration != null) 'duration': duration,
      if (length != null) 'length': length,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftCardioTreaningsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? exercise,
      Value<DateTime>? date,
      Value<DateTime?>? finish,
      Value<DateTime?>? start,
      Value<int>? duration,
      Value<double>? length,
      Value<int>? rowid}) {
    return DriftCardioTreaningsTableCompanion(
      id: id ?? this.id,
      exercise: exercise ?? this.exercise,
      date: date ?? this.date,
      finish: finish ?? this.finish,
      start: start ?? this.start,
      duration: duration ?? this.duration,
      length: length ?? this.length,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (exercise.present) {
      map['exercise'] = Variable<String>(exercise.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (length.present) {
      map['length'] = Variable<double>(length.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftCardioTreaningsTableCompanion(')
          ..write('id: $id, ')
          ..write('exercise: $exercise, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('duration: $duration, ')
          ..write('length: $length, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftStrengthTreaningsTableTable extends DriftStrengthTreaningsTable
    with TableInfo<$DriftStrengthTreaningsTableTable, DriftStrengthTreaning> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftStrengthTreaningsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, date, finish, start];
  @override
  String get aliasedName => _alias ?? 'drift_strength_treanings_table';
  @override
  String get actualTableName => 'drift_strength_treanings_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftStrengthTreaning> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftStrengthTreaning map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftStrengthTreaning(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
    );
  }

  @override
  $DriftStrengthTreaningsTableTable createAlias(String alias) {
    return $DriftStrengthTreaningsTableTable(attachedDatabase, alias);
  }
}

class DriftStrengthTreaning extends DataClass
    implements Insertable<DriftStrengthTreaning> {
  final String id;
  final DateTime date;
  final DateTime? finish;
  final DateTime? start;
  const DriftStrengthTreaning(
      {required this.id, required this.date, this.finish, this.start});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    return map;
  }

  DriftStrengthTreaningsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftStrengthTreaningsTableCompanion(
      id: Value(id),
      date: Value(date),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
    );
  }

  factory DriftStrengthTreaning.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftStrengthTreaning(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
      start: serializer.fromJson<DateTime?>(json['start']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'finish': serializer.toJson<DateTime?>(finish),
      'start': serializer.toJson<DateTime?>(start),
    };
  }

  DriftStrengthTreaning copyWith(
          {String? id,
          DateTime? date,
          Value<DateTime?> finish = const Value.absent(),
          Value<DateTime?> start = const Value.absent()}) =>
      DriftStrengthTreaning(
        id: id ?? this.id,
        date: date ?? this.date,
        finish: finish.present ? finish.value : this.finish,
        start: start.present ? start.value : this.start,
      );
  @override
  String toString() {
    return (StringBuffer('DriftStrengthTreaning(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, finish, start);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftStrengthTreaning &&
          other.id == this.id &&
          other.date == this.date &&
          other.finish == this.finish &&
          other.start == this.start);
}

class DriftStrengthTreaningsTableCompanion
    extends UpdateCompanion<DriftStrengthTreaning> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<DateTime?> finish;
  final Value<DateTime?> start;
  final Value<int> rowid;
  const DriftStrengthTreaningsTableCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftStrengthTreaningsTableCompanion.insert({
    required String id,
    required DateTime date,
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date);
  static Insertable<DriftStrengthTreaning> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<DateTime>? finish,
    Expression<DateTime>? start,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (finish != null) 'finish': finish,
      if (start != null) 'start': start,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftStrengthTreaningsTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? date,
      Value<DateTime?>? finish,
      Value<DateTime?>? start,
      Value<int>? rowid}) {
    return DriftStrengthTreaningsTableCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      finish: finish ?? this.finish,
      start: start ?? this.start,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftStrengthTreaningsTableCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftStrengthTreaningLinesTableTable
    extends DriftStrengthTreaningLinesTable
    with
        TableInfo<$DriftStrengthTreaningLinesTableTable,
            DriftStrengthTreaningLine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftStrengthTreaningLinesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _repetitionsMeta =
      const VerificationMeta('repetitions');
  @override
  late final GeneratedColumn<String> repetitions = GeneratedColumn<String>(
      'repetitions', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treaningIdMeta =
      const VerificationMeta('treaningId');
  @override
  late final GeneratedColumn<String> treaningId = GeneratedColumn<String>(
      'treaning_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_strength_treanings_table (id)'));
  static const VerificationMeta _exerciseMeta =
      const VerificationMeta('exercise');
  @override
  late final GeneratedColumn<String> exercise = GeneratedColumn<String>(
      'exercise', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exerciseIdMeta =
      const VerificationMeta('exerciseId');
  @override
  late final GeneratedColumn<String> exerciseId = GeneratedColumn<String>(
      'exercise_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_strength_exercises_table (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, repetitions, treaningId, exercise, exerciseId];
  @override
  String get aliasedName => _alias ?? 'drift_strength_treaning_lines_table';
  @override
  String get actualTableName => 'drift_strength_treaning_lines_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftStrengthTreaningLine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('repetitions')) {
      context.handle(
          _repetitionsMeta,
          repetitions.isAcceptableOrUnknown(
              data['repetitions']!, _repetitionsMeta));
    } else if (isInserting) {
      context.missing(_repetitionsMeta);
    }
    if (data.containsKey('treaning_id')) {
      context.handle(
          _treaningIdMeta,
          treaningId.isAcceptableOrUnknown(
              data['treaning_id']!, _treaningIdMeta));
    } else if (isInserting) {
      context.missing(_treaningIdMeta);
    }
    if (data.containsKey('exercise')) {
      context.handle(_exerciseMeta,
          exercise.isAcceptableOrUnknown(data['exercise']!, _exerciseMeta));
    } else if (isInserting) {
      context.missing(_exerciseMeta);
    }
    if (data.containsKey('exercise_id')) {
      context.handle(
          _exerciseIdMeta,
          exerciseId.isAcceptableOrUnknown(
              data['exercise_id']!, _exerciseIdMeta));
    } else if (isInserting) {
      context.missing(_exerciseIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftStrengthTreaningLine map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftStrengthTreaningLine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      repetitions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}repetitions'])!,
      treaningId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}treaning_id'])!,
      exercise: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise'])!,
      exerciseId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}exercise_id'])!,
    );
  }

  @override
  $DriftStrengthTreaningLinesTableTable createAlias(String alias) {
    return $DriftStrengthTreaningLinesTableTable(attachedDatabase, alias);
  }
}

class DriftStrengthTreaningLine extends DataClass
    implements Insertable<DriftStrengthTreaningLine> {
  final String id;
  final String repetitions;
  final String treaningId;
  final String exercise;
  final String exerciseId;
  const DriftStrengthTreaningLine(
      {required this.id,
      required this.repetitions,
      required this.treaningId,
      required this.exercise,
      required this.exerciseId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['repetitions'] = Variable<String>(repetitions);
    map['treaning_id'] = Variable<String>(treaningId);
    map['exercise'] = Variable<String>(exercise);
    map['exercise_id'] = Variable<String>(exerciseId);
    return map;
  }

  DriftStrengthTreaningLinesTableCompanion toCompanion(bool nullToAbsent) {
    return DriftStrengthTreaningLinesTableCompanion(
      id: Value(id),
      repetitions: Value(repetitions),
      treaningId: Value(treaningId),
      exercise: Value(exercise),
      exerciseId: Value(exerciseId),
    );
  }

  factory DriftStrengthTreaningLine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftStrengthTreaningLine(
      id: serializer.fromJson<String>(json['id']),
      repetitions: serializer.fromJson<String>(json['repetitions']),
      treaningId: serializer.fromJson<String>(json['treaningId']),
      exercise: serializer.fromJson<String>(json['exercise']),
      exerciseId: serializer.fromJson<String>(json['exerciseId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'repetitions': serializer.toJson<String>(repetitions),
      'treaningId': serializer.toJson<String>(treaningId),
      'exercise': serializer.toJson<String>(exercise),
      'exerciseId': serializer.toJson<String>(exerciseId),
    };
  }

  DriftStrengthTreaningLine copyWith(
          {String? id,
          String? repetitions,
          String? treaningId,
          String? exercise,
          String? exerciseId}) =>
      DriftStrengthTreaningLine(
        id: id ?? this.id,
        repetitions: repetitions ?? this.repetitions,
        treaningId: treaningId ?? this.treaningId,
        exercise: exercise ?? this.exercise,
        exerciseId: exerciseId ?? this.exerciseId,
      );
  @override
  String toString() {
    return (StringBuffer('DriftStrengthTreaningLine(')
          ..write('id: $id, ')
          ..write('repetitions: $repetitions, ')
          ..write('treaningId: $treaningId, ')
          ..write('exercise: $exercise, ')
          ..write('exerciseId: $exerciseId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, repetitions, treaningId, exercise, exerciseId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftStrengthTreaningLine &&
          other.id == this.id &&
          other.repetitions == this.repetitions &&
          other.treaningId == this.treaningId &&
          other.exercise == this.exercise &&
          other.exerciseId == this.exerciseId);
}

class DriftStrengthTreaningLinesTableCompanion
    extends UpdateCompanion<DriftStrengthTreaningLine> {
  final Value<String> id;
  final Value<String> repetitions;
  final Value<String> treaningId;
  final Value<String> exercise;
  final Value<String> exerciseId;
  final Value<int> rowid;
  const DriftStrengthTreaningLinesTableCompanion({
    this.id = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.treaningId = const Value.absent(),
    this.exercise = const Value.absent(),
    this.exerciseId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftStrengthTreaningLinesTableCompanion.insert({
    required String id,
    required String repetitions,
    required String treaningId,
    required String exercise,
    required String exerciseId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        repetitions = Value(repetitions),
        treaningId = Value(treaningId),
        exercise = Value(exercise),
        exerciseId = Value(exerciseId);
  static Insertable<DriftStrengthTreaningLine> custom({
    Expression<String>? id,
    Expression<String>? repetitions,
    Expression<String>? treaningId,
    Expression<String>? exercise,
    Expression<String>? exerciseId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (repetitions != null) 'repetitions': repetitions,
      if (treaningId != null) 'treaning_id': treaningId,
      if (exercise != null) 'exercise': exercise,
      if (exerciseId != null) 'exercise_id': exerciseId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftStrengthTreaningLinesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? repetitions,
      Value<String>? treaningId,
      Value<String>? exercise,
      Value<String>? exerciseId,
      Value<int>? rowid}) {
    return DriftStrengthTreaningLinesTableCompanion(
      id: id ?? this.id,
      repetitions: repetitions ?? this.repetitions,
      treaningId: treaningId ?? this.treaningId,
      exercise: exercise ?? this.exercise,
      exerciseId: exerciseId ?? this.exerciseId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<String>(repetitions.value);
    }
    if (treaningId.present) {
      map['treaning_id'] = Variable<String>(treaningId.value);
    }
    if (exercise.present) {
      map['exercise'] = Variable<String>(exercise.value);
    }
    if (exerciseId.present) {
      map['exercise_id'] = Variable<String>(exerciseId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftStrengthTreaningLinesTableCompanion(')
          ..write('id: $id, ')
          ..write('repetitions: $repetitions, ')
          ..write('treaningId: $treaningId, ')
          ..write('exercise: $exercise, ')
          ..write('exerciseId: $exerciseId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftIceTreaningsTableTable extends DriftIceTreaningsTable
    with TableInfo<$DriftIceTreaningsTableTable, DriftIceTreanings> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftIceTreaningsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _districtMeta =
      const VerificationMeta('district');
  @override
  late final GeneratedColumn<String> district = GeneratedColumn<String>(
      'district', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _districtIdMeta =
      const VerificationMeta('districtId');
  @override
  late final GeneratedColumn<String> districtId = GeneratedColumn<String>(
      'district_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _sectorsMeta =
      const VerificationMeta('sectors');
  @override
  late final GeneratedColumn<String> sectors = GeneratedColumn<String>(
      'sectors', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, district, districtId, date, finish, start, sectors];
  @override
  String get aliasedName => _alias ?? 'drift_ice_treanings_table';
  @override
  String get actualTableName => 'drift_ice_treanings_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftIceTreanings> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('district')) {
      context.handle(_districtMeta,
          district.isAcceptableOrUnknown(data['district']!, _districtMeta));
    } else if (isInserting) {
      context.missing(_districtMeta);
    }
    if (data.containsKey('district_id')) {
      context.handle(
          _districtIdMeta,
          districtId.isAcceptableOrUnknown(
              data['district_id']!, _districtIdMeta));
    } else if (isInserting) {
      context.missing(_districtIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    if (data.containsKey('sectors')) {
      context.handle(_sectorsMeta,
          sectors.isAcceptableOrUnknown(data['sectors']!, _sectorsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftIceTreanings map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftIceTreanings(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      district: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}district'])!,
      districtId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}district_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
      sectors: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sectors']),
    );
  }

  @override
  $DriftIceTreaningsTableTable createAlias(String alias) {
    return $DriftIceTreaningsTableTable(attachedDatabase, alias);
  }
}

class DriftIceTreanings extends DataClass
    implements Insertable<DriftIceTreanings> {
  final String id;
  final String district;
  final String districtId;
  final DateTime date;
  final DateTime? finish;
  final DateTime? start;
  final String? sectors;
  const DriftIceTreanings(
      {required this.id,
      required this.district,
      required this.districtId,
      required this.date,
      this.finish,
      this.start,
      this.sectors});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['district'] = Variable<String>(district);
    map['district_id'] = Variable<String>(districtId);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    if (!nullToAbsent || sectors != null) {
      map['sectors'] = Variable<String>(sectors);
    }
    return map;
  }

  DriftIceTreaningsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftIceTreaningsTableCompanion(
      id: Value(id),
      district: Value(district),
      districtId: Value(districtId),
      date: Value(date),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
      sectors: sectors == null && nullToAbsent
          ? const Value.absent()
          : Value(sectors),
    );
  }

  factory DriftIceTreanings.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftIceTreanings(
      id: serializer.fromJson<String>(json['id']),
      district: serializer.fromJson<String>(json['district']),
      districtId: serializer.fromJson<String>(json['districtId']),
      date: serializer.fromJson<DateTime>(json['date']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
      start: serializer.fromJson<DateTime?>(json['start']),
      sectors: serializer.fromJson<String?>(json['sectors']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'district': serializer.toJson<String>(district),
      'districtId': serializer.toJson<String>(districtId),
      'date': serializer.toJson<DateTime>(date),
      'finish': serializer.toJson<DateTime?>(finish),
      'start': serializer.toJson<DateTime?>(start),
      'sectors': serializer.toJson<String?>(sectors),
    };
  }

  DriftIceTreanings copyWith(
          {String? id,
          String? district,
          String? districtId,
          DateTime? date,
          Value<DateTime?> finish = const Value.absent(),
          Value<DateTime?> start = const Value.absent(),
          Value<String?> sectors = const Value.absent()}) =>
      DriftIceTreanings(
        id: id ?? this.id,
        district: district ?? this.district,
        districtId: districtId ?? this.districtId,
        date: date ?? this.date,
        finish: finish.present ? finish.value : this.finish,
        start: start.present ? start.value : this.start,
        sectors: sectors.present ? sectors.value : this.sectors,
      );
  @override
  String toString() {
    return (StringBuffer('DriftIceTreanings(')
          ..write('id: $id, ')
          ..write('district: $district, ')
          ..write('districtId: $districtId, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('sectors: $sectors')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, district, districtId, date, finish, start, sectors);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftIceTreanings &&
          other.id == this.id &&
          other.district == this.district &&
          other.districtId == this.districtId &&
          other.date == this.date &&
          other.finish == this.finish &&
          other.start == this.start &&
          other.sectors == this.sectors);
}

class DriftIceTreaningsTableCompanion
    extends UpdateCompanion<DriftIceTreanings> {
  final Value<String> id;
  final Value<String> district;
  final Value<String> districtId;
  final Value<DateTime> date;
  final Value<DateTime?> finish;
  final Value<DateTime?> start;
  final Value<String?> sectors;
  final Value<int> rowid;
  const DriftIceTreaningsTableCompanion({
    this.id = const Value.absent(),
    this.district = const Value.absent(),
    this.districtId = const Value.absent(),
    this.date = const Value.absent(),
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.sectors = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftIceTreaningsTableCompanion.insert({
    required String id,
    required String district,
    required String districtId,
    required DateTime date,
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.sectors = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        district = Value(district),
        districtId = Value(districtId),
        date = Value(date);
  static Insertable<DriftIceTreanings> custom({
    Expression<String>? id,
    Expression<String>? district,
    Expression<String>? districtId,
    Expression<DateTime>? date,
    Expression<DateTime>? finish,
    Expression<DateTime>? start,
    Expression<String>? sectors,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (district != null) 'district': district,
      if (districtId != null) 'district_id': districtId,
      if (date != null) 'date': date,
      if (finish != null) 'finish': finish,
      if (start != null) 'start': start,
      if (sectors != null) 'sectors': sectors,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftIceTreaningsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? district,
      Value<String>? districtId,
      Value<DateTime>? date,
      Value<DateTime?>? finish,
      Value<DateTime?>? start,
      Value<String?>? sectors,
      Value<int>? rowid}) {
    return DriftIceTreaningsTableCompanion(
      id: id ?? this.id,
      district: district ?? this.district,
      districtId: districtId ?? this.districtId,
      date: date ?? this.date,
      finish: finish ?? this.finish,
      start: start ?? this.start,
      sectors: sectors ?? this.sectors,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (district.present) {
      map['district'] = Variable<String>(district.value);
    }
    if (districtId.present) {
      map['district_id'] = Variable<String>(districtId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (sectors.present) {
      map['sectors'] = Variable<String>(sectors.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftIceTreaningsTableCompanion(')
          ..write('id: $id, ')
          ..write('district: $district, ')
          ..write('districtId: $districtId, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('sectors: $sectors, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftIceAttemptsTableTable extends DriftIceAttemptsTable
    with TableInfo<$DriftIceAttemptsTableTable, DriftIceAttempt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftIceAttemptsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _sectorMeta = const VerificationMeta('sector');
  @override
  late final GeneratedColumn<String> sector = GeneratedColumn<String>(
      'sector', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sectorIdMeta =
      const VerificationMeta('sectorId');
  @override
  late final GeneratedColumn<String> sectorId = GeneratedColumn<String>(
      'sector_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treaningIdMeta =
      const VerificationMeta('treaningId');
  @override
  late final GeneratedColumn<String> treaningId = GeneratedColumn<String>(
      'treaning_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_ice_treanings_table (id)'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _styleMeta = const VerificationMeta('style');
  @override
  late final GeneratedColumn<String> style = GeneratedColumn<String>(
      'style', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _finishTimeMeta =
      const VerificationMeta('finishTime');
  @override
  late final GeneratedColumn<DateTime> finishTime = GeneratedColumn<DateTime>(
      'finish_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _wayLengthMeta =
      const VerificationMeta('wayLength');
  @override
  late final GeneratedColumn<int> wayLength = GeneratedColumn<int>(
      'way_length', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _suspensionCountMeta =
      const VerificationMeta('suspensionCount');
  @override
  late final GeneratedColumn<int> suspensionCount = GeneratedColumn<int>(
      'suspension_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fallCountMeta =
      const VerificationMeta('fallCount');
  @override
  late final GeneratedColumn<int> fallCount = GeneratedColumn<int>(
      'fall_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _downClimbingMeta =
      const VerificationMeta('downClimbing');
  @override
  late final GeneratedColumn<bool> downClimbing =
      GeneratedColumn<bool>('down_climbing', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("down_climbing" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _failMeta = const VerificationMeta('fail');
  @override
  late final GeneratedColumn<bool> fail =
      GeneratedColumn<bool>('fail', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("fail" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _installedIceScrewsMeta =
      const VerificationMeta('installedIceScrews');
  @override
  late final GeneratedColumn<bool> installedIceScrews =
      GeneratedColumn<bool>('installed_ice_screws', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("installed_ice_screws" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _iceScrewsCountMeta =
      const VerificationMeta('iceScrewsCount');
  @override
  late final GeneratedColumn<int> iceScrewsCount = GeneratedColumn<int>(
      'ice_screws_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _toolsCountMeta =
      const VerificationMeta('toolsCount');
  @override
  late final GeneratedColumn<int> toolsCount = GeneratedColumn<int>(
      'tools_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sector,
        sectorId,
        treaningId,
        category,
        style,
        finishTime,
        startTime,
        wayLength,
        suspensionCount,
        fallCount,
        downClimbing,
        fail,
        installedIceScrews,
        iceScrewsCount,
        toolsCount
      ];
  @override
  String get aliasedName => _alias ?? 'drift_ice_attempts_table';
  @override
  String get actualTableName => 'drift_ice_attempts_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftIceAttempt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sector')) {
      context.handle(_sectorMeta,
          sector.isAcceptableOrUnknown(data['sector']!, _sectorMeta));
    } else if (isInserting) {
      context.missing(_sectorMeta);
    }
    if (data.containsKey('sector_id')) {
      context.handle(_sectorIdMeta,
          sectorId.isAcceptableOrUnknown(data['sector_id']!, _sectorIdMeta));
    } else if (isInserting) {
      context.missing(_sectorIdMeta);
    }
    if (data.containsKey('treaning_id')) {
      context.handle(
          _treaningIdMeta,
          treaningId.isAcceptableOrUnknown(
              data['treaning_id']!, _treaningIdMeta));
    } else if (isInserting) {
      context.missing(_treaningIdMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('style')) {
      context.handle(
          _styleMeta, style.isAcceptableOrUnknown(data['style']!, _styleMeta));
    } else if (isInserting) {
      context.missing(_styleMeta);
    }
    if (data.containsKey('finish_time')) {
      context.handle(
          _finishTimeMeta,
          finishTime.isAcceptableOrUnknown(
              data['finish_time']!, _finishTimeMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('way_length')) {
      context.handle(_wayLengthMeta,
          wayLength.isAcceptableOrUnknown(data['way_length']!, _wayLengthMeta));
    }
    if (data.containsKey('suspension_count')) {
      context.handle(
          _suspensionCountMeta,
          suspensionCount.isAcceptableOrUnknown(
              data['suspension_count']!, _suspensionCountMeta));
    } else if (isInserting) {
      context.missing(_suspensionCountMeta);
    }
    if (data.containsKey('fall_count')) {
      context.handle(_fallCountMeta,
          fallCount.isAcceptableOrUnknown(data['fall_count']!, _fallCountMeta));
    } else if (isInserting) {
      context.missing(_fallCountMeta);
    }
    if (data.containsKey('down_climbing')) {
      context.handle(
          _downClimbingMeta,
          downClimbing.isAcceptableOrUnknown(
              data['down_climbing']!, _downClimbingMeta));
    } else if (isInserting) {
      context.missing(_downClimbingMeta);
    }
    if (data.containsKey('fail')) {
      context.handle(
          _failMeta, fail.isAcceptableOrUnknown(data['fail']!, _failMeta));
    } else if (isInserting) {
      context.missing(_failMeta);
    }
    if (data.containsKey('installed_ice_screws')) {
      context.handle(
          _installedIceScrewsMeta,
          installedIceScrews.isAcceptableOrUnknown(
              data['installed_ice_screws']!, _installedIceScrewsMeta));
    } else if (isInserting) {
      context.missing(_installedIceScrewsMeta);
    }
    if (data.containsKey('ice_screws_count')) {
      context.handle(
          _iceScrewsCountMeta,
          iceScrewsCount.isAcceptableOrUnknown(
              data['ice_screws_count']!, _iceScrewsCountMeta));
    } else if (isInserting) {
      context.missing(_iceScrewsCountMeta);
    }
    if (data.containsKey('tools_count')) {
      context.handle(
          _toolsCountMeta,
          toolsCount.isAcceptableOrUnknown(
              data['tools_count']!, _toolsCountMeta));
    } else if (isInserting) {
      context.missing(_toolsCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftIceAttempt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftIceAttempt(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sector: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sector'])!,
      sectorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sector_id'])!,
      treaningId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}treaning_id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      style: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}style'])!,
      finishTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish_time']),
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      wayLength: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}way_length']),
      suspensionCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}suspension_count'])!,
      fallCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fall_count'])!,
      downClimbing: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}down_climbing'])!,
      fail: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fail'])!,
      installedIceScrews: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}installed_ice_screws'])!,
      iceScrewsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ice_screws_count'])!,
      toolsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}tools_count'])!,
    );
  }

  @override
  $DriftIceAttemptsTableTable createAlias(String alias) {
    return $DriftIceAttemptsTableTable(attachedDatabase, alias);
  }
}

class DriftIceAttempt extends DataClass implements Insertable<DriftIceAttempt> {
  final String id;
  final String sector;
  final String sectorId;
  final String treaningId;
  final String category;
  final String style;
  final DateTime? finishTime;
  final DateTime? startTime;
  final int? wayLength;
  final int suspensionCount;
  final int fallCount;
  final bool downClimbing;
  final bool fail;
  final bool installedIceScrews;
  final int iceScrewsCount;
  final int toolsCount;
  const DriftIceAttempt(
      {required this.id,
      required this.sector,
      required this.sectorId,
      required this.treaningId,
      required this.category,
      required this.style,
      this.finishTime,
      this.startTime,
      this.wayLength,
      required this.suspensionCount,
      required this.fallCount,
      required this.downClimbing,
      required this.fail,
      required this.installedIceScrews,
      required this.iceScrewsCount,
      required this.toolsCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['sector'] = Variable<String>(sector);
    map['sector_id'] = Variable<String>(sectorId);
    map['treaning_id'] = Variable<String>(treaningId);
    map['category'] = Variable<String>(category);
    map['style'] = Variable<String>(style);
    if (!nullToAbsent || finishTime != null) {
      map['finish_time'] = Variable<DateTime>(finishTime);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    if (!nullToAbsent || wayLength != null) {
      map['way_length'] = Variable<int>(wayLength);
    }
    map['suspension_count'] = Variable<int>(suspensionCount);
    map['fall_count'] = Variable<int>(fallCount);
    map['down_climbing'] = Variable<bool>(downClimbing);
    map['fail'] = Variable<bool>(fail);
    map['installed_ice_screws'] = Variable<bool>(installedIceScrews);
    map['ice_screws_count'] = Variable<int>(iceScrewsCount);
    map['tools_count'] = Variable<int>(toolsCount);
    return map;
  }

  DriftIceAttemptsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftIceAttemptsTableCompanion(
      id: Value(id),
      sector: Value(sector),
      sectorId: Value(sectorId),
      treaningId: Value(treaningId),
      category: Value(category),
      style: Value(style),
      finishTime: finishTime == null && nullToAbsent
          ? const Value.absent()
          : Value(finishTime),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      wayLength: wayLength == null && nullToAbsent
          ? const Value.absent()
          : Value(wayLength),
      suspensionCount: Value(suspensionCount),
      fallCount: Value(fallCount),
      downClimbing: Value(downClimbing),
      fail: Value(fail),
      installedIceScrews: Value(installedIceScrews),
      iceScrewsCount: Value(iceScrewsCount),
      toolsCount: Value(toolsCount),
    );
  }

  factory DriftIceAttempt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftIceAttempt(
      id: serializer.fromJson<String>(json['id']),
      sector: serializer.fromJson<String>(json['sector']),
      sectorId: serializer.fromJson<String>(json['sectorId']),
      treaningId: serializer.fromJson<String>(json['treaningId']),
      category: serializer.fromJson<String>(json['category']),
      style: serializer.fromJson<String>(json['style']),
      finishTime: serializer.fromJson<DateTime?>(json['finishTime']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      wayLength: serializer.fromJson<int?>(json['wayLength']),
      suspensionCount: serializer.fromJson<int>(json['suspensionCount']),
      fallCount: serializer.fromJson<int>(json['fallCount']),
      downClimbing: serializer.fromJson<bool>(json['downClimbing']),
      fail: serializer.fromJson<bool>(json['fail']),
      installedIceScrews: serializer.fromJson<bool>(json['installedIceScrews']),
      iceScrewsCount: serializer.fromJson<int>(json['iceScrewsCount']),
      toolsCount: serializer.fromJson<int>(json['toolsCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sector': serializer.toJson<String>(sector),
      'sectorId': serializer.toJson<String>(sectorId),
      'treaningId': serializer.toJson<String>(treaningId),
      'category': serializer.toJson<String>(category),
      'style': serializer.toJson<String>(style),
      'finishTime': serializer.toJson<DateTime?>(finishTime),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'wayLength': serializer.toJson<int?>(wayLength),
      'suspensionCount': serializer.toJson<int>(suspensionCount),
      'fallCount': serializer.toJson<int>(fallCount),
      'downClimbing': serializer.toJson<bool>(downClimbing),
      'fail': serializer.toJson<bool>(fail),
      'installedIceScrews': serializer.toJson<bool>(installedIceScrews),
      'iceScrewsCount': serializer.toJson<int>(iceScrewsCount),
      'toolsCount': serializer.toJson<int>(toolsCount),
    };
  }

  DriftIceAttempt copyWith(
          {String? id,
          String? sector,
          String? sectorId,
          String? treaningId,
          String? category,
          String? style,
          Value<DateTime?> finishTime = const Value.absent(),
          Value<DateTime?> startTime = const Value.absent(),
          Value<int?> wayLength = const Value.absent(),
          int? suspensionCount,
          int? fallCount,
          bool? downClimbing,
          bool? fail,
          bool? installedIceScrews,
          int? iceScrewsCount,
          int? toolsCount}) =>
      DriftIceAttempt(
        id: id ?? this.id,
        sector: sector ?? this.sector,
        sectorId: sectorId ?? this.sectorId,
        treaningId: treaningId ?? this.treaningId,
        category: category ?? this.category,
        style: style ?? this.style,
        finishTime: finishTime.present ? finishTime.value : this.finishTime,
        startTime: startTime.present ? startTime.value : this.startTime,
        wayLength: wayLength.present ? wayLength.value : this.wayLength,
        suspensionCount: suspensionCount ?? this.suspensionCount,
        fallCount: fallCount ?? this.fallCount,
        downClimbing: downClimbing ?? this.downClimbing,
        fail: fail ?? this.fail,
        installedIceScrews: installedIceScrews ?? this.installedIceScrews,
        iceScrewsCount: iceScrewsCount ?? this.iceScrewsCount,
        toolsCount: toolsCount ?? this.toolsCount,
      );
  @override
  String toString() {
    return (StringBuffer('DriftIceAttempt(')
          ..write('id: $id, ')
          ..write('sector: $sector, ')
          ..write('sectorId: $sectorId, ')
          ..write('treaningId: $treaningId, ')
          ..write('category: $category, ')
          ..write('style: $style, ')
          ..write('finishTime: $finishTime, ')
          ..write('startTime: $startTime, ')
          ..write('wayLength: $wayLength, ')
          ..write('suspensionCount: $suspensionCount, ')
          ..write('fallCount: $fallCount, ')
          ..write('downClimbing: $downClimbing, ')
          ..write('fail: $fail, ')
          ..write('installedIceScrews: $installedIceScrews, ')
          ..write('iceScrewsCount: $iceScrewsCount, ')
          ..write('toolsCount: $toolsCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      sector,
      sectorId,
      treaningId,
      category,
      style,
      finishTime,
      startTime,
      wayLength,
      suspensionCount,
      fallCount,
      downClimbing,
      fail,
      installedIceScrews,
      iceScrewsCount,
      toolsCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftIceAttempt &&
          other.id == this.id &&
          other.sector == this.sector &&
          other.sectorId == this.sectorId &&
          other.treaningId == this.treaningId &&
          other.category == this.category &&
          other.style == this.style &&
          other.finishTime == this.finishTime &&
          other.startTime == this.startTime &&
          other.wayLength == this.wayLength &&
          other.suspensionCount == this.suspensionCount &&
          other.fallCount == this.fallCount &&
          other.downClimbing == this.downClimbing &&
          other.fail == this.fail &&
          other.installedIceScrews == this.installedIceScrews &&
          other.iceScrewsCount == this.iceScrewsCount &&
          other.toolsCount == this.toolsCount);
}

class DriftIceAttemptsTableCompanion extends UpdateCompanion<DriftIceAttempt> {
  final Value<String> id;
  final Value<String> sector;
  final Value<String> sectorId;
  final Value<String> treaningId;
  final Value<String> category;
  final Value<String> style;
  final Value<DateTime?> finishTime;
  final Value<DateTime?> startTime;
  final Value<int?> wayLength;
  final Value<int> suspensionCount;
  final Value<int> fallCount;
  final Value<bool> downClimbing;
  final Value<bool> fail;
  final Value<bool> installedIceScrews;
  final Value<int> iceScrewsCount;
  final Value<int> toolsCount;
  final Value<int> rowid;
  const DriftIceAttemptsTableCompanion({
    this.id = const Value.absent(),
    this.sector = const Value.absent(),
    this.sectorId = const Value.absent(),
    this.treaningId = const Value.absent(),
    this.category = const Value.absent(),
    this.style = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.startTime = const Value.absent(),
    this.wayLength = const Value.absent(),
    this.suspensionCount = const Value.absent(),
    this.fallCount = const Value.absent(),
    this.downClimbing = const Value.absent(),
    this.fail = const Value.absent(),
    this.installedIceScrews = const Value.absent(),
    this.iceScrewsCount = const Value.absent(),
    this.toolsCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftIceAttemptsTableCompanion.insert({
    required String id,
    required String sector,
    required String sectorId,
    required String treaningId,
    required String category,
    required String style,
    this.finishTime = const Value.absent(),
    this.startTime = const Value.absent(),
    this.wayLength = const Value.absent(),
    required int suspensionCount,
    required int fallCount,
    required bool downClimbing,
    required bool fail,
    required bool installedIceScrews,
    required int iceScrewsCount,
    required int toolsCount,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sector = Value(sector),
        sectorId = Value(sectorId),
        treaningId = Value(treaningId),
        category = Value(category),
        style = Value(style),
        suspensionCount = Value(suspensionCount),
        fallCount = Value(fallCount),
        downClimbing = Value(downClimbing),
        fail = Value(fail),
        installedIceScrews = Value(installedIceScrews),
        iceScrewsCount = Value(iceScrewsCount),
        toolsCount = Value(toolsCount);
  static Insertable<DriftIceAttempt> custom({
    Expression<String>? id,
    Expression<String>? sector,
    Expression<String>? sectorId,
    Expression<String>? treaningId,
    Expression<String>? category,
    Expression<String>? style,
    Expression<DateTime>? finishTime,
    Expression<DateTime>? startTime,
    Expression<int>? wayLength,
    Expression<int>? suspensionCount,
    Expression<int>? fallCount,
    Expression<bool>? downClimbing,
    Expression<bool>? fail,
    Expression<bool>? installedIceScrews,
    Expression<int>? iceScrewsCount,
    Expression<int>? toolsCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sector != null) 'sector': sector,
      if (sectorId != null) 'sector_id': sectorId,
      if (treaningId != null) 'treaning_id': treaningId,
      if (category != null) 'category': category,
      if (style != null) 'style': style,
      if (finishTime != null) 'finish_time': finishTime,
      if (startTime != null) 'start_time': startTime,
      if (wayLength != null) 'way_length': wayLength,
      if (suspensionCount != null) 'suspension_count': suspensionCount,
      if (fallCount != null) 'fall_count': fallCount,
      if (downClimbing != null) 'down_climbing': downClimbing,
      if (fail != null) 'fail': fail,
      if (installedIceScrews != null)
        'installed_ice_screws': installedIceScrews,
      if (iceScrewsCount != null) 'ice_screws_count': iceScrewsCount,
      if (toolsCount != null) 'tools_count': toolsCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftIceAttemptsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? sector,
      Value<String>? sectorId,
      Value<String>? treaningId,
      Value<String>? category,
      Value<String>? style,
      Value<DateTime?>? finishTime,
      Value<DateTime?>? startTime,
      Value<int?>? wayLength,
      Value<int>? suspensionCount,
      Value<int>? fallCount,
      Value<bool>? downClimbing,
      Value<bool>? fail,
      Value<bool>? installedIceScrews,
      Value<int>? iceScrewsCount,
      Value<int>? toolsCount,
      Value<int>? rowid}) {
    return DriftIceAttemptsTableCompanion(
      id: id ?? this.id,
      sector: sector ?? this.sector,
      sectorId: sectorId ?? this.sectorId,
      treaningId: treaningId ?? this.treaningId,
      category: category ?? this.category,
      style: style ?? this.style,
      finishTime: finishTime ?? this.finishTime,
      startTime: startTime ?? this.startTime,
      wayLength: wayLength ?? this.wayLength,
      suspensionCount: suspensionCount ?? this.suspensionCount,
      fallCount: fallCount ?? this.fallCount,
      downClimbing: downClimbing ?? this.downClimbing,
      fail: fail ?? this.fail,
      installedIceScrews: installedIceScrews ?? this.installedIceScrews,
      iceScrewsCount: iceScrewsCount ?? this.iceScrewsCount,
      toolsCount: toolsCount ?? this.toolsCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sector.present) {
      map['sector'] = Variable<String>(sector.value);
    }
    if (sectorId.present) {
      map['sector_id'] = Variable<String>(sectorId.value);
    }
    if (treaningId.present) {
      map['treaning_id'] = Variable<String>(treaningId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (style.present) {
      map['style'] = Variable<String>(style.value);
    }
    if (finishTime.present) {
      map['finish_time'] = Variable<DateTime>(finishTime.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (wayLength.present) {
      map['way_length'] = Variable<int>(wayLength.value);
    }
    if (suspensionCount.present) {
      map['suspension_count'] = Variable<int>(suspensionCount.value);
    }
    if (fallCount.present) {
      map['fall_count'] = Variable<int>(fallCount.value);
    }
    if (downClimbing.present) {
      map['down_climbing'] = Variable<bool>(downClimbing.value);
    }
    if (fail.present) {
      map['fail'] = Variable<bool>(fail.value);
    }
    if (installedIceScrews.present) {
      map['installed_ice_screws'] = Variable<bool>(installedIceScrews.value);
    }
    if (iceScrewsCount.present) {
      map['ice_screws_count'] = Variable<int>(iceScrewsCount.value);
    }
    if (toolsCount.present) {
      map['tools_count'] = Variable<int>(toolsCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftIceAttemptsTableCompanion(')
          ..write('id: $id, ')
          ..write('sector: $sector, ')
          ..write('sectorId: $sectorId, ')
          ..write('treaningId: $treaningId, ')
          ..write('category: $category, ')
          ..write('style: $style, ')
          ..write('finishTime: $finishTime, ')
          ..write('startTime: $startTime, ')
          ..write('wayLength: $wayLength, ')
          ..write('suspensionCount: $suspensionCount, ')
          ..write('fallCount: $fallCount, ')
          ..write('downClimbing: $downClimbing, ')
          ..write('fail: $fail, ')
          ..write('installedIceScrews: $installedIceScrews, ')
          ..write('iceScrewsCount: $iceScrewsCount, ')
          ..write('toolsCount: $toolsCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftRockTreaningsTableTable extends DriftRockTreaningsTable
    with TableInfo<$DriftRockTreaningsTableTable, DriftRockTreanings> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftRockTreaningsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _districtIdMeta =
      const VerificationMeta('districtId');
  @override
  late final GeneratedColumn<String> districtId = GeneratedColumn<String>(
      'district_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _districtMeta =
      const VerificationMeta('district');
  @override
  late final GeneratedColumn<String> district = GeneratedColumn<String>(
      'district', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _sectorsMeta =
      const VerificationMeta('sectors');
  @override
  late final GeneratedColumn<String> sectors = GeneratedColumn<String>(
      'sectors', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, districtId, district, date, finish, start, sectors];
  @override
  String get aliasedName => _alias ?? 'drift_rock_treanings_table';
  @override
  String get actualTableName => 'drift_rock_treanings_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftRockTreanings> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('district_id')) {
      context.handle(
          _districtIdMeta,
          districtId.isAcceptableOrUnknown(
              data['district_id']!, _districtIdMeta));
    } else if (isInserting) {
      context.missing(_districtIdMeta);
    }
    if (data.containsKey('district')) {
      context.handle(_districtMeta,
          district.isAcceptableOrUnknown(data['district']!, _districtMeta));
    } else if (isInserting) {
      context.missing(_districtMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    if (data.containsKey('sectors')) {
      context.handle(_sectorsMeta,
          sectors.isAcceptableOrUnknown(data['sectors']!, _sectorsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftRockTreanings map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftRockTreanings(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      districtId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}district_id'])!,
      district: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}district'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
      sectors: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sectors']),
    );
  }

  @override
  $DriftRockTreaningsTableTable createAlias(String alias) {
    return $DriftRockTreaningsTableTable(attachedDatabase, alias);
  }
}

class DriftRockTreanings extends DataClass
    implements Insertable<DriftRockTreanings> {
  final String id;
  final String districtId;
  final String district;
  final DateTime date;
  final DateTime? finish;
  final DateTime? start;
  final String? sectors;
  const DriftRockTreanings(
      {required this.id,
      required this.districtId,
      required this.district,
      required this.date,
      this.finish,
      this.start,
      this.sectors});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['district_id'] = Variable<String>(districtId);
    map['district'] = Variable<String>(district);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    if (!nullToAbsent || sectors != null) {
      map['sectors'] = Variable<String>(sectors);
    }
    return map;
  }

  DriftRockTreaningsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftRockTreaningsTableCompanion(
      id: Value(id),
      districtId: Value(districtId),
      district: Value(district),
      date: Value(date),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
      sectors: sectors == null && nullToAbsent
          ? const Value.absent()
          : Value(sectors),
    );
  }

  factory DriftRockTreanings.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftRockTreanings(
      id: serializer.fromJson<String>(json['id']),
      districtId: serializer.fromJson<String>(json['districtId']),
      district: serializer.fromJson<String>(json['district']),
      date: serializer.fromJson<DateTime>(json['date']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
      start: serializer.fromJson<DateTime?>(json['start']),
      sectors: serializer.fromJson<String?>(json['sectors']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'districtId': serializer.toJson<String>(districtId),
      'district': serializer.toJson<String>(district),
      'date': serializer.toJson<DateTime>(date),
      'finish': serializer.toJson<DateTime?>(finish),
      'start': serializer.toJson<DateTime?>(start),
      'sectors': serializer.toJson<String?>(sectors),
    };
  }

  DriftRockTreanings copyWith(
          {String? id,
          String? districtId,
          String? district,
          DateTime? date,
          Value<DateTime?> finish = const Value.absent(),
          Value<DateTime?> start = const Value.absent(),
          Value<String?> sectors = const Value.absent()}) =>
      DriftRockTreanings(
        id: id ?? this.id,
        districtId: districtId ?? this.districtId,
        district: district ?? this.district,
        date: date ?? this.date,
        finish: finish.present ? finish.value : this.finish,
        start: start.present ? start.value : this.start,
        sectors: sectors.present ? sectors.value : this.sectors,
      );
  @override
  String toString() {
    return (StringBuffer('DriftRockTreanings(')
          ..write('id: $id, ')
          ..write('districtId: $districtId, ')
          ..write('district: $district, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('sectors: $sectors')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, districtId, district, date, finish, start, sectors);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftRockTreanings &&
          other.id == this.id &&
          other.districtId == this.districtId &&
          other.district == this.district &&
          other.date == this.date &&
          other.finish == this.finish &&
          other.start == this.start &&
          other.sectors == this.sectors);
}

class DriftRockTreaningsTableCompanion
    extends UpdateCompanion<DriftRockTreanings> {
  final Value<String> id;
  final Value<String> districtId;
  final Value<String> district;
  final Value<DateTime> date;
  final Value<DateTime?> finish;
  final Value<DateTime?> start;
  final Value<String?> sectors;
  final Value<int> rowid;
  const DriftRockTreaningsTableCompanion({
    this.id = const Value.absent(),
    this.districtId = const Value.absent(),
    this.district = const Value.absent(),
    this.date = const Value.absent(),
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.sectors = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftRockTreaningsTableCompanion.insert({
    required String id,
    required String districtId,
    required String district,
    required DateTime date,
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.sectors = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        districtId = Value(districtId),
        district = Value(district),
        date = Value(date);
  static Insertable<DriftRockTreanings> custom({
    Expression<String>? id,
    Expression<String>? districtId,
    Expression<String>? district,
    Expression<DateTime>? date,
    Expression<DateTime>? finish,
    Expression<DateTime>? start,
    Expression<String>? sectors,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (districtId != null) 'district_id': districtId,
      if (district != null) 'district': district,
      if (date != null) 'date': date,
      if (finish != null) 'finish': finish,
      if (start != null) 'start': start,
      if (sectors != null) 'sectors': sectors,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftRockTreaningsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? districtId,
      Value<String>? district,
      Value<DateTime>? date,
      Value<DateTime?>? finish,
      Value<DateTime?>? start,
      Value<String?>? sectors,
      Value<int>? rowid}) {
    return DriftRockTreaningsTableCompanion(
      id: id ?? this.id,
      districtId: districtId ?? this.districtId,
      district: district ?? this.district,
      date: date ?? this.date,
      finish: finish ?? this.finish,
      start: start ?? this.start,
      sectors: sectors ?? this.sectors,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (districtId.present) {
      map['district_id'] = Variable<String>(districtId.value);
    }
    if (district.present) {
      map['district'] = Variable<String>(district.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (sectors.present) {
      map['sectors'] = Variable<String>(sectors.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftRockTreaningsTableCompanion(')
          ..write('id: $id, ')
          ..write('districtId: $districtId, ')
          ..write('district: $district, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('sectors: $sectors, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftRockAttemptsTableTable extends DriftRockAttemptsTable
    with TableInfo<$DriftRockAttemptsTableTable, DriftRockAttempt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftRockAttemptsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _sectorMeta = const VerificationMeta('sector');
  @override
  late final GeneratedColumn<String> sector = GeneratedColumn<String>(
      'sector', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sectorIdMeta =
      const VerificationMeta('sectorId');
  @override
  late final GeneratedColumn<String> sectorId = GeneratedColumn<String>(
      'sector_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treaningIdMeta =
      const VerificationMeta('treaningId');
  @override
  late final GeneratedColumn<String> treaningId = GeneratedColumn<String>(
      'treaning_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_rock_treanings_table (id)'));
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
      'route', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _routeIdMeta =
      const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<String> routeId = GeneratedColumn<String>(
      'route_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _styleMeta = const VerificationMeta('style');
  @override
  late final GeneratedColumn<String> style = GeneratedColumn<String>(
      'style', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _finishTimeMeta =
      const VerificationMeta('finishTime');
  @override
  late final GeneratedColumn<DateTime> finishTime = GeneratedColumn<DateTime>(
      'finish_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _suspensionCountMeta =
      const VerificationMeta('suspensionCount');
  @override
  late final GeneratedColumn<int> suspensionCount = GeneratedColumn<int>(
      'suspension_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fallCountMeta =
      const VerificationMeta('fallCount');
  @override
  late final GeneratedColumn<int> fallCount = GeneratedColumn<int>(
      'fall_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _downClimbingMeta =
      const VerificationMeta('downClimbing');
  @override
  late final GeneratedColumn<bool> downClimbing =
      GeneratedColumn<bool>('down_climbing', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("down_climbing" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _failMeta = const VerificationMeta('fail');
  @override
  late final GeneratedColumn<bool> fail =
      GeneratedColumn<bool>('fail', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("fail" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _ascentTypeMeta =
      const VerificationMeta('ascentType');
  @override
  late final GeneratedColumn<String> ascentType = GeneratedColumn<String>(
      'ascent_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sector,
        sectorId,
        treaningId,
        category,
        route,
        routeId,
        style,
        finishTime,
        startTime,
        suspensionCount,
        fallCount,
        downClimbing,
        fail,
        ascentType
      ];
  @override
  String get aliasedName => _alias ?? 'drift_rock_attempts_table';
  @override
  String get actualTableName => 'drift_rock_attempts_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftRockAttempt> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sector')) {
      context.handle(_sectorMeta,
          sector.isAcceptableOrUnknown(data['sector']!, _sectorMeta));
    } else if (isInserting) {
      context.missing(_sectorMeta);
    }
    if (data.containsKey('sector_id')) {
      context.handle(_sectorIdMeta,
          sectorId.isAcceptableOrUnknown(data['sector_id']!, _sectorIdMeta));
    } else if (isInserting) {
      context.missing(_sectorIdMeta);
    }
    if (data.containsKey('treaning_id')) {
      context.handle(
          _treaningIdMeta,
          treaningId.isAcceptableOrUnknown(
              data['treaning_id']!, _treaningIdMeta));
    } else if (isInserting) {
      context.missing(_treaningIdMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('route')) {
      context.handle(
          _routeMeta, route.isAcceptableOrUnknown(data['route']!, _routeMeta));
    }
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    }
    if (data.containsKey('style')) {
      context.handle(
          _styleMeta, style.isAcceptableOrUnknown(data['style']!, _styleMeta));
    } else if (isInserting) {
      context.missing(_styleMeta);
    }
    if (data.containsKey('finish_time')) {
      context.handle(
          _finishTimeMeta,
          finishTime.isAcceptableOrUnknown(
              data['finish_time']!, _finishTimeMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('suspension_count')) {
      context.handle(
          _suspensionCountMeta,
          suspensionCount.isAcceptableOrUnknown(
              data['suspension_count']!, _suspensionCountMeta));
    } else if (isInserting) {
      context.missing(_suspensionCountMeta);
    }
    if (data.containsKey('fall_count')) {
      context.handle(_fallCountMeta,
          fallCount.isAcceptableOrUnknown(data['fall_count']!, _fallCountMeta));
    } else if (isInserting) {
      context.missing(_fallCountMeta);
    }
    if (data.containsKey('down_climbing')) {
      context.handle(
          _downClimbingMeta,
          downClimbing.isAcceptableOrUnknown(
              data['down_climbing']!, _downClimbingMeta));
    } else if (isInserting) {
      context.missing(_downClimbingMeta);
    }
    if (data.containsKey('fail')) {
      context.handle(
          _failMeta, fail.isAcceptableOrUnknown(data['fail']!, _failMeta));
    } else if (isInserting) {
      context.missing(_failMeta);
    }
    if (data.containsKey('ascent_type')) {
      context.handle(
          _ascentTypeMeta,
          ascentType.isAcceptableOrUnknown(
              data['ascent_type']!, _ascentTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftRockAttempt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftRockAttempt(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sector: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sector'])!,
      sectorId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sector_id'])!,
      treaningId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}treaning_id'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      route: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}route']),
      routeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}route_id']),
      style: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}style'])!,
      finishTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish_time']),
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      suspensionCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}suspension_count'])!,
      fallCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fall_count'])!,
      downClimbing: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}down_climbing'])!,
      fail: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}fail'])!,
      ascentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ascent_type']),
    );
  }

  @override
  $DriftRockAttemptsTableTable createAlias(String alias) {
    return $DriftRockAttemptsTableTable(attachedDatabase, alias);
  }
}

class DriftRockAttempt extends DataClass
    implements Insertable<DriftRockAttempt> {
  final String id;
  final String sector;
  final String sectorId;
  final String treaningId;
  final String category;
  final String? route;
  final String? routeId;
  final String style;
  final DateTime? finishTime;
  final DateTime? startTime;
  final int suspensionCount;
  final int fallCount;
  final bool downClimbing;
  final bool fail;
  final String? ascentType;
  const DriftRockAttempt(
      {required this.id,
      required this.sector,
      required this.sectorId,
      required this.treaningId,
      required this.category,
      this.route,
      this.routeId,
      required this.style,
      this.finishTime,
      this.startTime,
      required this.suspensionCount,
      required this.fallCount,
      required this.downClimbing,
      required this.fail,
      this.ascentType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['sector'] = Variable<String>(sector);
    map['sector_id'] = Variable<String>(sectorId);
    map['treaning_id'] = Variable<String>(treaningId);
    map['category'] = Variable<String>(category);
    if (!nullToAbsent || route != null) {
      map['route'] = Variable<String>(route);
    }
    if (!nullToAbsent || routeId != null) {
      map['route_id'] = Variable<String>(routeId);
    }
    map['style'] = Variable<String>(style);
    if (!nullToAbsent || finishTime != null) {
      map['finish_time'] = Variable<DateTime>(finishTime);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    map['suspension_count'] = Variable<int>(suspensionCount);
    map['fall_count'] = Variable<int>(fallCount);
    map['down_climbing'] = Variable<bool>(downClimbing);
    map['fail'] = Variable<bool>(fail);
    if (!nullToAbsent || ascentType != null) {
      map['ascent_type'] = Variable<String>(ascentType);
    }
    return map;
  }

  DriftRockAttemptsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftRockAttemptsTableCompanion(
      id: Value(id),
      sector: Value(sector),
      sectorId: Value(sectorId),
      treaningId: Value(treaningId),
      category: Value(category),
      route:
          route == null && nullToAbsent ? const Value.absent() : Value(route),
      routeId: routeId == null && nullToAbsent
          ? const Value.absent()
          : Value(routeId),
      style: Value(style),
      finishTime: finishTime == null && nullToAbsent
          ? const Value.absent()
          : Value(finishTime),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      suspensionCount: Value(suspensionCount),
      fallCount: Value(fallCount),
      downClimbing: Value(downClimbing),
      fail: Value(fail),
      ascentType: ascentType == null && nullToAbsent
          ? const Value.absent()
          : Value(ascentType),
    );
  }

  factory DriftRockAttempt.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftRockAttempt(
      id: serializer.fromJson<String>(json['id']),
      sector: serializer.fromJson<String>(json['sector']),
      sectorId: serializer.fromJson<String>(json['sectorId']),
      treaningId: serializer.fromJson<String>(json['treaningId']),
      category: serializer.fromJson<String>(json['category']),
      route: serializer.fromJson<String?>(json['route']),
      routeId: serializer.fromJson<String?>(json['routeId']),
      style: serializer.fromJson<String>(json['style']),
      finishTime: serializer.fromJson<DateTime?>(json['finishTime']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      suspensionCount: serializer.fromJson<int>(json['suspensionCount']),
      fallCount: serializer.fromJson<int>(json['fallCount']),
      downClimbing: serializer.fromJson<bool>(json['downClimbing']),
      fail: serializer.fromJson<bool>(json['fail']),
      ascentType: serializer.fromJson<String?>(json['ascentType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sector': serializer.toJson<String>(sector),
      'sectorId': serializer.toJson<String>(sectorId),
      'treaningId': serializer.toJson<String>(treaningId),
      'category': serializer.toJson<String>(category),
      'route': serializer.toJson<String?>(route),
      'routeId': serializer.toJson<String?>(routeId),
      'style': serializer.toJson<String>(style),
      'finishTime': serializer.toJson<DateTime?>(finishTime),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'suspensionCount': serializer.toJson<int>(suspensionCount),
      'fallCount': serializer.toJson<int>(fallCount),
      'downClimbing': serializer.toJson<bool>(downClimbing),
      'fail': serializer.toJson<bool>(fail),
      'ascentType': serializer.toJson<String?>(ascentType),
    };
  }

  DriftRockAttempt copyWith(
          {String? id,
          String? sector,
          String? sectorId,
          String? treaningId,
          String? category,
          Value<String?> route = const Value.absent(),
          Value<String?> routeId = const Value.absent(),
          String? style,
          Value<DateTime?> finishTime = const Value.absent(),
          Value<DateTime?> startTime = const Value.absent(),
          int? suspensionCount,
          int? fallCount,
          bool? downClimbing,
          bool? fail,
          Value<String?> ascentType = const Value.absent()}) =>
      DriftRockAttempt(
        id: id ?? this.id,
        sector: sector ?? this.sector,
        sectorId: sectorId ?? this.sectorId,
        treaningId: treaningId ?? this.treaningId,
        category: category ?? this.category,
        route: route.present ? route.value : this.route,
        routeId: routeId.present ? routeId.value : this.routeId,
        style: style ?? this.style,
        finishTime: finishTime.present ? finishTime.value : this.finishTime,
        startTime: startTime.present ? startTime.value : this.startTime,
        suspensionCount: suspensionCount ?? this.suspensionCount,
        fallCount: fallCount ?? this.fallCount,
        downClimbing: downClimbing ?? this.downClimbing,
        fail: fail ?? this.fail,
        ascentType: ascentType.present ? ascentType.value : this.ascentType,
      );
  @override
  String toString() {
    return (StringBuffer('DriftRockAttempt(')
          ..write('id: $id, ')
          ..write('sector: $sector, ')
          ..write('sectorId: $sectorId, ')
          ..write('treaningId: $treaningId, ')
          ..write('category: $category, ')
          ..write('route: $route, ')
          ..write('routeId: $routeId, ')
          ..write('style: $style, ')
          ..write('finishTime: $finishTime, ')
          ..write('startTime: $startTime, ')
          ..write('suspensionCount: $suspensionCount, ')
          ..write('fallCount: $fallCount, ')
          ..write('downClimbing: $downClimbing, ')
          ..write('fail: $fail, ')
          ..write('ascentType: $ascentType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      sector,
      sectorId,
      treaningId,
      category,
      route,
      routeId,
      style,
      finishTime,
      startTime,
      suspensionCount,
      fallCount,
      downClimbing,
      fail,
      ascentType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftRockAttempt &&
          other.id == this.id &&
          other.sector == this.sector &&
          other.sectorId == this.sectorId &&
          other.treaningId == this.treaningId &&
          other.category == this.category &&
          other.route == this.route &&
          other.routeId == this.routeId &&
          other.style == this.style &&
          other.finishTime == this.finishTime &&
          other.startTime == this.startTime &&
          other.suspensionCount == this.suspensionCount &&
          other.fallCount == this.fallCount &&
          other.downClimbing == this.downClimbing &&
          other.fail == this.fail &&
          other.ascentType == this.ascentType);
}

class DriftRockAttemptsTableCompanion
    extends UpdateCompanion<DriftRockAttempt> {
  final Value<String> id;
  final Value<String> sector;
  final Value<String> sectorId;
  final Value<String> treaningId;
  final Value<String> category;
  final Value<String?> route;
  final Value<String?> routeId;
  final Value<String> style;
  final Value<DateTime?> finishTime;
  final Value<DateTime?> startTime;
  final Value<int> suspensionCount;
  final Value<int> fallCount;
  final Value<bool> downClimbing;
  final Value<bool> fail;
  final Value<String?> ascentType;
  final Value<int> rowid;
  const DriftRockAttemptsTableCompanion({
    this.id = const Value.absent(),
    this.sector = const Value.absent(),
    this.sectorId = const Value.absent(),
    this.treaningId = const Value.absent(),
    this.category = const Value.absent(),
    this.route = const Value.absent(),
    this.routeId = const Value.absent(),
    this.style = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.startTime = const Value.absent(),
    this.suspensionCount = const Value.absent(),
    this.fallCount = const Value.absent(),
    this.downClimbing = const Value.absent(),
    this.fail = const Value.absent(),
    this.ascentType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftRockAttemptsTableCompanion.insert({
    required String id,
    required String sector,
    required String sectorId,
    required String treaningId,
    required String category,
    this.route = const Value.absent(),
    this.routeId = const Value.absent(),
    required String style,
    this.finishTime = const Value.absent(),
    this.startTime = const Value.absent(),
    required int suspensionCount,
    required int fallCount,
    required bool downClimbing,
    required bool fail,
    this.ascentType = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sector = Value(sector),
        sectorId = Value(sectorId),
        treaningId = Value(treaningId),
        category = Value(category),
        style = Value(style),
        suspensionCount = Value(suspensionCount),
        fallCount = Value(fallCount),
        downClimbing = Value(downClimbing),
        fail = Value(fail);
  static Insertable<DriftRockAttempt> custom({
    Expression<String>? id,
    Expression<String>? sector,
    Expression<String>? sectorId,
    Expression<String>? treaningId,
    Expression<String>? category,
    Expression<String>? route,
    Expression<String>? routeId,
    Expression<String>? style,
    Expression<DateTime>? finishTime,
    Expression<DateTime>? startTime,
    Expression<int>? suspensionCount,
    Expression<int>? fallCount,
    Expression<bool>? downClimbing,
    Expression<bool>? fail,
    Expression<String>? ascentType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sector != null) 'sector': sector,
      if (sectorId != null) 'sector_id': sectorId,
      if (treaningId != null) 'treaning_id': treaningId,
      if (category != null) 'category': category,
      if (route != null) 'route': route,
      if (routeId != null) 'route_id': routeId,
      if (style != null) 'style': style,
      if (finishTime != null) 'finish_time': finishTime,
      if (startTime != null) 'start_time': startTime,
      if (suspensionCount != null) 'suspension_count': suspensionCount,
      if (fallCount != null) 'fall_count': fallCount,
      if (downClimbing != null) 'down_climbing': downClimbing,
      if (fail != null) 'fail': fail,
      if (ascentType != null) 'ascent_type': ascentType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftRockAttemptsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? sector,
      Value<String>? sectorId,
      Value<String>? treaningId,
      Value<String>? category,
      Value<String?>? route,
      Value<String?>? routeId,
      Value<String>? style,
      Value<DateTime?>? finishTime,
      Value<DateTime?>? startTime,
      Value<int>? suspensionCount,
      Value<int>? fallCount,
      Value<bool>? downClimbing,
      Value<bool>? fail,
      Value<String?>? ascentType,
      Value<int>? rowid}) {
    return DriftRockAttemptsTableCompanion(
      id: id ?? this.id,
      sector: sector ?? this.sector,
      sectorId: sectorId ?? this.sectorId,
      treaningId: treaningId ?? this.treaningId,
      category: category ?? this.category,
      route: route ?? this.route,
      routeId: routeId ?? this.routeId,
      style: style ?? this.style,
      finishTime: finishTime ?? this.finishTime,
      startTime: startTime ?? this.startTime,
      suspensionCount: suspensionCount ?? this.suspensionCount,
      fallCount: fallCount ?? this.fallCount,
      downClimbing: downClimbing ?? this.downClimbing,
      fail: fail ?? this.fail,
      ascentType: ascentType ?? this.ascentType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sector.present) {
      map['sector'] = Variable<String>(sector.value);
    }
    if (sectorId.present) {
      map['sector_id'] = Variable<String>(sectorId.value);
    }
    if (treaningId.present) {
      map['treaning_id'] = Variable<String>(treaningId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<String>(routeId.value);
    }
    if (style.present) {
      map['style'] = Variable<String>(style.value);
    }
    if (finishTime.present) {
      map['finish_time'] = Variable<DateTime>(finishTime.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (suspensionCount.present) {
      map['suspension_count'] = Variable<int>(suspensionCount.value);
    }
    if (fallCount.present) {
      map['fall_count'] = Variable<int>(fallCount.value);
    }
    if (downClimbing.present) {
      map['down_climbing'] = Variable<bool>(downClimbing.value);
    }
    if (fail.present) {
      map['fail'] = Variable<bool>(fail.value);
    }
    if (ascentType.present) {
      map['ascent_type'] = Variable<String>(ascentType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftRockAttemptsTableCompanion(')
          ..write('id: $id, ')
          ..write('sector: $sector, ')
          ..write('sectorId: $sectorId, ')
          ..write('treaningId: $treaningId, ')
          ..write('category: $category, ')
          ..write('route: $route, ')
          ..write('routeId: $routeId, ')
          ..write('style: $style, ')
          ..write('finishTime: $finishTime, ')
          ..write('startTime: $startTime, ')
          ..write('suspensionCount: $suspensionCount, ')
          ..write('fallCount: $fallCount, ')
          ..write('downClimbing: $downClimbing, ')
          ..write('fail: $fail, ')
          ..write('ascentType: $ascentType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftTrekkingPathsTableTable extends DriftTrekkingPathsTable
    with TableInfo<$DriftTrekkingPathsTableTable, DriftTrekkingPath> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTrekkingPathsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
      'region', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _trekIdMeta = const VerificationMeta('trekId');
  @override
  late final GeneratedColumn<String> trekId = GeneratedColumn<String>(
      'trek_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _trekMeta = const VerificationMeta('trek');
  @override
  late final GeneratedColumn<String> trek = GeneratedColumn<String>(
      'trek', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _currentSectionMeta =
      const VerificationMeta('currentSection');
  @override
  late final GeneratedColumn<String> currentSection = GeneratedColumn<String>(
      'current_section', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _climbDownMeta =
      const VerificationMeta('climbDown');
  @override
  late final GeneratedColumn<int> climbDown = GeneratedColumn<int>(
      'climb_down', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _climbUpMeta =
      const VerificationMeta('climbUp');
  @override
  late final GeneratedColumn<int> climbUp = GeneratedColumn<int>(
      'climb_up', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _turnMeta = const VerificationMeta('turn');
  @override
  late final GeneratedColumn<bool> turn =
      GeneratedColumn<bool>('turn', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("turn" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  static const VerificationMeta _lengthMeta = const VerificationMeta('length');
  @override
  late final GeneratedColumn<double> length = GeneratedColumn<double>(
      'length', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        region,
        trekId,
        trek,
        type,
        date,
        finish,
        start,
        currentSection,
        climbDown,
        climbUp,
        turn,
        length
      ];
  @override
  String get aliasedName => _alias ?? 'drift_trekking_paths_table';
  @override
  String get actualTableName => 'drift_trekking_paths_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftTrekkingPath> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('region')) {
      context.handle(_regionMeta,
          region.isAcceptableOrUnknown(data['region']!, _regionMeta));
    } else if (isInserting) {
      context.missing(_regionMeta);
    }
    if (data.containsKey('trek_id')) {
      context.handle(_trekIdMeta,
          trekId.isAcceptableOrUnknown(data['trek_id']!, _trekIdMeta));
    }
    if (data.containsKey('trek')) {
      context.handle(
          _trekMeta, trek.isAcceptableOrUnknown(data['trek']!, _trekMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    if (data.containsKey('current_section')) {
      context.handle(
          _currentSectionMeta,
          currentSection.isAcceptableOrUnknown(
              data['current_section']!, _currentSectionMeta));
    }
    if (data.containsKey('climb_down')) {
      context.handle(_climbDownMeta,
          climbDown.isAcceptableOrUnknown(data['climb_down']!, _climbDownMeta));
    } else if (isInserting) {
      context.missing(_climbDownMeta);
    }
    if (data.containsKey('climb_up')) {
      context.handle(_climbUpMeta,
          climbUp.isAcceptableOrUnknown(data['climb_up']!, _climbUpMeta));
    } else if (isInserting) {
      context.missing(_climbUpMeta);
    }
    if (data.containsKey('turn')) {
      context.handle(
          _turnMeta, turn.isAcceptableOrUnknown(data['turn']!, _turnMeta));
    } else if (isInserting) {
      context.missing(_turnMeta);
    }
    if (data.containsKey('length')) {
      context.handle(_lengthMeta,
          length.isAcceptableOrUnknown(data['length']!, _lengthMeta));
    } else if (isInserting) {
      context.missing(_lengthMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftTrekkingPath map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTrekkingPath(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      region: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}region'])!,
      trekId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trek_id']),
      trek: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trek']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
      currentSection: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}current_section']),
      climbDown: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}climb_down'])!,
      climbUp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}climb_up'])!,
      turn: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}turn'])!,
      length: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}length'])!,
    );
  }

  @override
  $DriftTrekkingPathsTableTable createAlias(String alias) {
    return $DriftTrekkingPathsTableTable(attachedDatabase, alias);
  }
}

class DriftTrekkingPath extends DataClass
    implements Insertable<DriftTrekkingPath> {
  final String id;
  final String region;
  final String? trekId;
  final String? trek;
  final String type;
  final DateTime date;
  final DateTime? finish;
  final DateTime? start;
  final String? currentSection;
  final int climbDown;
  final int climbUp;
  final bool turn;
  final double length;
  const DriftTrekkingPath(
      {required this.id,
      required this.region,
      this.trekId,
      this.trek,
      required this.type,
      required this.date,
      this.finish,
      this.start,
      this.currentSection,
      required this.climbDown,
      required this.climbUp,
      required this.turn,
      required this.length});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['region'] = Variable<String>(region);
    if (!nullToAbsent || trekId != null) {
      map['trek_id'] = Variable<String>(trekId);
    }
    if (!nullToAbsent || trek != null) {
      map['trek'] = Variable<String>(trek);
    }
    map['type'] = Variable<String>(type);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    if (!nullToAbsent || currentSection != null) {
      map['current_section'] = Variable<String>(currentSection);
    }
    map['climb_down'] = Variable<int>(climbDown);
    map['climb_up'] = Variable<int>(climbUp);
    map['turn'] = Variable<bool>(turn);
    map['length'] = Variable<double>(length);
    return map;
  }

  DriftTrekkingPathsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftTrekkingPathsTableCompanion(
      id: Value(id),
      region: Value(region),
      trekId:
          trekId == null && nullToAbsent ? const Value.absent() : Value(trekId),
      trek: trek == null && nullToAbsent ? const Value.absent() : Value(trek),
      type: Value(type),
      date: Value(date),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
      currentSection: currentSection == null && nullToAbsent
          ? const Value.absent()
          : Value(currentSection),
      climbDown: Value(climbDown),
      climbUp: Value(climbUp),
      turn: Value(turn),
      length: Value(length),
    );
  }

  factory DriftTrekkingPath.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTrekkingPath(
      id: serializer.fromJson<String>(json['id']),
      region: serializer.fromJson<String>(json['region']),
      trekId: serializer.fromJson<String?>(json['trekId']),
      trek: serializer.fromJson<String?>(json['trek']),
      type: serializer.fromJson<String>(json['type']),
      date: serializer.fromJson<DateTime>(json['date']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
      start: serializer.fromJson<DateTime?>(json['start']),
      currentSection: serializer.fromJson<String?>(json['currentSection']),
      climbDown: serializer.fromJson<int>(json['climbDown']),
      climbUp: serializer.fromJson<int>(json['climbUp']),
      turn: serializer.fromJson<bool>(json['turn']),
      length: serializer.fromJson<double>(json['length']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'region': serializer.toJson<String>(region),
      'trekId': serializer.toJson<String?>(trekId),
      'trek': serializer.toJson<String?>(trek),
      'type': serializer.toJson<String>(type),
      'date': serializer.toJson<DateTime>(date),
      'finish': serializer.toJson<DateTime?>(finish),
      'start': serializer.toJson<DateTime?>(start),
      'currentSection': serializer.toJson<String?>(currentSection),
      'climbDown': serializer.toJson<int>(climbDown),
      'climbUp': serializer.toJson<int>(climbUp),
      'turn': serializer.toJson<bool>(turn),
      'length': serializer.toJson<double>(length),
    };
  }

  DriftTrekkingPath copyWith(
          {String? id,
          String? region,
          Value<String?> trekId = const Value.absent(),
          Value<String?> trek = const Value.absent(),
          String? type,
          DateTime? date,
          Value<DateTime?> finish = const Value.absent(),
          Value<DateTime?> start = const Value.absent(),
          Value<String?> currentSection = const Value.absent(),
          int? climbDown,
          int? climbUp,
          bool? turn,
          double? length}) =>
      DriftTrekkingPath(
        id: id ?? this.id,
        region: region ?? this.region,
        trekId: trekId.present ? trekId.value : this.trekId,
        trek: trek.present ? trek.value : this.trek,
        type: type ?? this.type,
        date: date ?? this.date,
        finish: finish.present ? finish.value : this.finish,
        start: start.present ? start.value : this.start,
        currentSection:
            currentSection.present ? currentSection.value : this.currentSection,
        climbDown: climbDown ?? this.climbDown,
        climbUp: climbUp ?? this.climbUp,
        turn: turn ?? this.turn,
        length: length ?? this.length,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTrekkingPath(')
          ..write('id: $id, ')
          ..write('region: $region, ')
          ..write('trekId: $trekId, ')
          ..write('trek: $trek, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('currentSection: $currentSection, ')
          ..write('climbDown: $climbDown, ')
          ..write('climbUp: $climbUp, ')
          ..write('turn: $turn, ')
          ..write('length: $length')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, region, trekId, trek, type, date, finish,
      start, currentSection, climbDown, climbUp, turn, length);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftTrekkingPath &&
          other.id == this.id &&
          other.region == this.region &&
          other.trekId == this.trekId &&
          other.trek == this.trek &&
          other.type == this.type &&
          other.date == this.date &&
          other.finish == this.finish &&
          other.start == this.start &&
          other.currentSection == this.currentSection &&
          other.climbDown == this.climbDown &&
          other.climbUp == this.climbUp &&
          other.turn == this.turn &&
          other.length == this.length);
}

class DriftTrekkingPathsTableCompanion
    extends UpdateCompanion<DriftTrekkingPath> {
  final Value<String> id;
  final Value<String> region;
  final Value<String?> trekId;
  final Value<String?> trek;
  final Value<String> type;
  final Value<DateTime> date;
  final Value<DateTime?> finish;
  final Value<DateTime?> start;
  final Value<String?> currentSection;
  final Value<int> climbDown;
  final Value<int> climbUp;
  final Value<bool> turn;
  final Value<double> length;
  final Value<int> rowid;
  const DriftTrekkingPathsTableCompanion({
    this.id = const Value.absent(),
    this.region = const Value.absent(),
    this.trekId = const Value.absent(),
    this.trek = const Value.absent(),
    this.type = const Value.absent(),
    this.date = const Value.absent(),
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.currentSection = const Value.absent(),
    this.climbDown = const Value.absent(),
    this.climbUp = const Value.absent(),
    this.turn = const Value.absent(),
    this.length = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftTrekkingPathsTableCompanion.insert({
    required String id,
    required String region,
    this.trekId = const Value.absent(),
    this.trek = const Value.absent(),
    required String type,
    required DateTime date,
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.currentSection = const Value.absent(),
    required int climbDown,
    required int climbUp,
    required bool turn,
    required double length,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        region = Value(region),
        type = Value(type),
        date = Value(date),
        climbDown = Value(climbDown),
        climbUp = Value(climbUp),
        turn = Value(turn),
        length = Value(length);
  static Insertable<DriftTrekkingPath> custom({
    Expression<String>? id,
    Expression<String>? region,
    Expression<String>? trekId,
    Expression<String>? trek,
    Expression<String>? type,
    Expression<DateTime>? date,
    Expression<DateTime>? finish,
    Expression<DateTime>? start,
    Expression<String>? currentSection,
    Expression<int>? climbDown,
    Expression<int>? climbUp,
    Expression<bool>? turn,
    Expression<double>? length,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (region != null) 'region': region,
      if (trekId != null) 'trek_id': trekId,
      if (trek != null) 'trek': trek,
      if (type != null) 'type': type,
      if (date != null) 'date': date,
      if (finish != null) 'finish': finish,
      if (start != null) 'start': start,
      if (currentSection != null) 'current_section': currentSection,
      if (climbDown != null) 'climb_down': climbDown,
      if (climbUp != null) 'climb_up': climbUp,
      if (turn != null) 'turn': turn,
      if (length != null) 'length': length,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftTrekkingPathsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? region,
      Value<String?>? trekId,
      Value<String?>? trek,
      Value<String>? type,
      Value<DateTime>? date,
      Value<DateTime?>? finish,
      Value<DateTime?>? start,
      Value<String?>? currentSection,
      Value<int>? climbDown,
      Value<int>? climbUp,
      Value<bool>? turn,
      Value<double>? length,
      Value<int>? rowid}) {
    return DriftTrekkingPathsTableCompanion(
      id: id ?? this.id,
      region: region ?? this.region,
      trekId: trekId ?? this.trekId,
      trek: trek ?? this.trek,
      type: type ?? this.type,
      date: date ?? this.date,
      finish: finish ?? this.finish,
      start: start ?? this.start,
      currentSection: currentSection ?? this.currentSection,
      climbDown: climbDown ?? this.climbDown,
      climbUp: climbUp ?? this.climbUp,
      turn: turn ?? this.turn,
      length: length ?? this.length,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (trekId.present) {
      map['trek_id'] = Variable<String>(trekId.value);
    }
    if (trek.present) {
      map['trek'] = Variable<String>(trek.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (currentSection.present) {
      map['current_section'] = Variable<String>(currentSection.value);
    }
    if (climbDown.present) {
      map['climb_down'] = Variable<int>(climbDown.value);
    }
    if (climbUp.present) {
      map['climb_up'] = Variable<int>(climbUp.value);
    }
    if (turn.present) {
      map['turn'] = Variable<bool>(turn.value);
    }
    if (length.present) {
      map['length'] = Variable<double>(length.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftTrekkingPathsTableCompanion(')
          ..write('id: $id, ')
          ..write('region: $region, ')
          ..write('trekId: $trekId, ')
          ..write('trek: $trek, ')
          ..write('type: $type, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('currentSection: $currentSection, ')
          ..write('climbDown: $climbDown, ')
          ..write('climbUp: $climbUp, ')
          ..write('turn: $turn, ')
          ..write('length: $length, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftTrekkingPathEventsTableTable extends DriftTrekkingPathEventsTable
    with TableInfo<$DriftTrekkingPathEventsTableTable, DriftTrekkingPathEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTrekkingPathEventsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pathIdMeta = const VerificationMeta('pathId');
  @override
  late final GeneratedColumn<String> pathId = GeneratedColumn<String>(
      'path_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_trekking_paths_table (id)'));
  static const VerificationMeta _pointMeta = const VerificationMeta('point');
  @override
  late final GeneratedColumn<String> point = GeneratedColumn<String>(
      'point', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _pointIdMeta =
      const VerificationMeta('pointId');
  @override
  late final GeneratedColumn<String> pointId = GeneratedColumn<String>(
      'point_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, type, pathId, point, pointId, time];
  @override
  String get aliasedName => _alias ?? 'drift_trekking_path_events_table';
  @override
  String get actualTableName => 'drift_trekking_path_events_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftTrekkingPathEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('path_id')) {
      context.handle(_pathIdMeta,
          pathId.isAcceptableOrUnknown(data['path_id']!, _pathIdMeta));
    } else if (isInserting) {
      context.missing(_pathIdMeta);
    }
    if (data.containsKey('point')) {
      context.handle(
          _pointMeta, point.isAcceptableOrUnknown(data['point']!, _pointMeta));
    }
    if (data.containsKey('point_id')) {
      context.handle(_pointIdMeta,
          pointId.isAcceptableOrUnknown(data['point_id']!, _pointIdMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftTrekkingPathEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTrekkingPathEvent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      pathId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}path_id'])!,
      point: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}point']),
      pointId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}point_id']),
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time'])!,
    );
  }

  @override
  $DriftTrekkingPathEventsTableTable createAlias(String alias) {
    return $DriftTrekkingPathEventsTableTable(attachedDatabase, alias);
  }
}

class DriftTrekkingPathEvent extends DataClass
    implements Insertable<DriftTrekkingPathEvent> {
  final String id;
  final String type;
  final String pathId;
  final String? point;
  final String? pointId;
  final DateTime time;
  const DriftTrekkingPathEvent(
      {required this.id,
      required this.type,
      required this.pathId,
      this.point,
      this.pointId,
      required this.time});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['path_id'] = Variable<String>(pathId);
    if (!nullToAbsent || point != null) {
      map['point'] = Variable<String>(point);
    }
    if (!nullToAbsent || pointId != null) {
      map['point_id'] = Variable<String>(pointId);
    }
    map['time'] = Variable<DateTime>(time);
    return map;
  }

  DriftTrekkingPathEventsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftTrekkingPathEventsTableCompanion(
      id: Value(id),
      type: Value(type),
      pathId: Value(pathId),
      point:
          point == null && nullToAbsent ? const Value.absent() : Value(point),
      pointId: pointId == null && nullToAbsent
          ? const Value.absent()
          : Value(pointId),
      time: Value(time),
    );
  }

  factory DriftTrekkingPathEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTrekkingPathEvent(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      pathId: serializer.fromJson<String>(json['pathId']),
      point: serializer.fromJson<String?>(json['point']),
      pointId: serializer.fromJson<String?>(json['pointId']),
      time: serializer.fromJson<DateTime>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'pathId': serializer.toJson<String>(pathId),
      'point': serializer.toJson<String?>(point),
      'pointId': serializer.toJson<String?>(pointId),
      'time': serializer.toJson<DateTime>(time),
    };
  }

  DriftTrekkingPathEvent copyWith(
          {String? id,
          String? type,
          String? pathId,
          Value<String?> point = const Value.absent(),
          Value<String?> pointId = const Value.absent(),
          DateTime? time}) =>
      DriftTrekkingPathEvent(
        id: id ?? this.id,
        type: type ?? this.type,
        pathId: pathId ?? this.pathId,
        point: point.present ? point.value : this.point,
        pointId: pointId.present ? pointId.value : this.pointId,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTrekkingPathEvent(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('pathId: $pathId, ')
          ..write('point: $point, ')
          ..write('pointId: $pointId, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, pathId, point, pointId, time);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftTrekkingPathEvent &&
          other.id == this.id &&
          other.type == this.type &&
          other.pathId == this.pathId &&
          other.point == this.point &&
          other.pointId == this.pointId &&
          other.time == this.time);
}

class DriftTrekkingPathEventsTableCompanion
    extends UpdateCompanion<DriftTrekkingPathEvent> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> pathId;
  final Value<String?> point;
  final Value<String?> pointId;
  final Value<DateTime> time;
  final Value<int> rowid;
  const DriftTrekkingPathEventsTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.pathId = const Value.absent(),
    this.point = const Value.absent(),
    this.pointId = const Value.absent(),
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftTrekkingPathEventsTableCompanion.insert({
    required String id,
    required String type,
    required String pathId,
    this.point = const Value.absent(),
    this.pointId = const Value.absent(),
    required DateTime time,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        pathId = Value(pathId),
        time = Value(time);
  static Insertable<DriftTrekkingPathEvent> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? pathId,
    Expression<String>? point,
    Expression<String>? pointId,
    Expression<DateTime>? time,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (pathId != null) 'path_id': pathId,
      if (point != null) 'point': point,
      if (pointId != null) 'point_id': pointId,
      if (time != null) 'time': time,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftTrekkingPathEventsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<String>? pathId,
      Value<String?>? point,
      Value<String?>? pointId,
      Value<DateTime>? time,
      Value<int>? rowid}) {
    return DriftTrekkingPathEventsTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      pathId: pathId ?? this.pathId,
      point: point ?? this.point,
      pointId: pointId ?? this.pointId,
      time: time ?? this.time,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (pathId.present) {
      map['path_id'] = Variable<String>(pathId.value);
    }
    if (point.present) {
      map['point'] = Variable<String>(point.value);
    }
    if (pointId.present) {
      map['point_id'] = Variable<String>(pointId.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftTrekkingPathEventsTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('pathId: $pathId, ')
          ..write('point: $point, ')
          ..write('pointId: $pointId, ')
          ..write('time: $time, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftTechniqueTreaningsTableTable extends DriftTechniqueTreaningsTable
    with TableInfo<$DriftTechniqueTreaningsTableTable, DriftTechniqueTreaning> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTechniqueTreaningsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, comment, date, finish, start];
  @override
  String get aliasedName => _alias ?? 'drift_technique_treanings_table';
  @override
  String get actualTableName => 'drift_technique_treanings_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftTechniqueTreaning> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftTechniqueTreaning map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTechniqueTreaning(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
    );
  }

  @override
  $DriftTechniqueTreaningsTableTable createAlias(String alias) {
    return $DriftTechniqueTreaningsTableTable(attachedDatabase, alias);
  }
}

class DriftTechniqueTreaning extends DataClass
    implements Insertable<DriftTechniqueTreaning> {
  final String id;
  final String comment;
  final DateTime date;
  final DateTime? finish;
  final DateTime? start;
  const DriftTechniqueTreaning(
      {required this.id,
      required this.comment,
      required this.date,
      this.finish,
      this.start});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['comment'] = Variable<String>(comment);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    return map;
  }

  DriftTechniqueTreaningsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftTechniqueTreaningsTableCompanion(
      id: Value(id),
      comment: Value(comment),
      date: Value(date),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
    );
  }

  factory DriftTechniqueTreaning.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTechniqueTreaning(
      id: serializer.fromJson<String>(json['id']),
      comment: serializer.fromJson<String>(json['comment']),
      date: serializer.fromJson<DateTime>(json['date']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
      start: serializer.fromJson<DateTime?>(json['start']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'comment': serializer.toJson<String>(comment),
      'date': serializer.toJson<DateTime>(date),
      'finish': serializer.toJson<DateTime?>(finish),
      'start': serializer.toJson<DateTime?>(start),
    };
  }

  DriftTechniqueTreaning copyWith(
          {String? id,
          String? comment,
          DateTime? date,
          Value<DateTime?> finish = const Value.absent(),
          Value<DateTime?> start = const Value.absent()}) =>
      DriftTechniqueTreaning(
        id: id ?? this.id,
        comment: comment ?? this.comment,
        date: date ?? this.date,
        finish: finish.present ? finish.value : this.finish,
        start: start.present ? start.value : this.start,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTechniqueTreaning(')
          ..write('id: $id, ')
          ..write('comment: $comment, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, comment, date, finish, start);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftTechniqueTreaning &&
          other.id == this.id &&
          other.comment == this.comment &&
          other.date == this.date &&
          other.finish == this.finish &&
          other.start == this.start);
}

class DriftTechniqueTreaningsTableCompanion
    extends UpdateCompanion<DriftTechniqueTreaning> {
  final Value<String> id;
  final Value<String> comment;
  final Value<DateTime> date;
  final Value<DateTime?> finish;
  final Value<DateTime?> start;
  final Value<int> rowid;
  const DriftTechniqueTreaningsTableCompanion({
    this.id = const Value.absent(),
    this.comment = const Value.absent(),
    this.date = const Value.absent(),
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftTechniqueTreaningsTableCompanion.insert({
    required String id,
    required String comment,
    required DateTime date,
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        comment = Value(comment),
        date = Value(date);
  static Insertable<DriftTechniqueTreaning> custom({
    Expression<String>? id,
    Expression<String>? comment,
    Expression<DateTime>? date,
    Expression<DateTime>? finish,
    Expression<DateTime>? start,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (comment != null) 'comment': comment,
      if (date != null) 'date': date,
      if (finish != null) 'finish': finish,
      if (start != null) 'start': start,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftTechniqueTreaningsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? comment,
      Value<DateTime>? date,
      Value<DateTime?>? finish,
      Value<DateTime?>? start,
      Value<int>? rowid}) {
    return DriftTechniqueTreaningsTableCompanion(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      finish: finish ?? this.finish,
      start: start ?? this.start,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftTechniqueTreaningsTableCompanion(')
          ..write('id: $id, ')
          ..write('comment: $comment, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftTechniqueTreaningItemsTableTable
    extends DriftTechniqueTreaningItemsTable
    with
        TableInfo<$DriftTechniqueTreaningItemsTableTable,
            DriftTechniqueTreaningItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTechniqueTreaningItemsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _treaningIdMeta =
      const VerificationMeta('treaningId');
  @override
  late final GeneratedColumn<String> treaningId = GeneratedColumn<String>(
      'treaning_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_technique_treanings_table (id)'));
  static const VerificationMeta _optionsMeta =
      const VerificationMeta('options');
  @override
  late final GeneratedColumn<String> options = GeneratedColumn<String>(
      'options', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _finishTimeMeta =
      const VerificationMeta('finishTime');
  @override
  late final GeneratedColumn<DateTime> finishTime = GeneratedColumn<DateTime>(
      'finish_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _groupMeta = const VerificationMeta('group');
  @override
  late final GeneratedColumn<String> group = GeneratedColumn<String>(
      'group', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _techniqueMeta =
      const VerificationMeta('technique');
  @override
  late final GeneratedColumn<String> technique = GeneratedColumn<String>(
      'technique', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _techniqueIdMeta =
      const VerificationMeta('techniqueId');
  @override
  late final GeneratedColumn<String> techniqueId = GeneratedColumn<String>(
      'technique_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        comment,
        treaningId,
        options,
        finishTime,
        startTime,
        group,
        technique,
        techniqueId,
        groupId
      ];
  @override
  String get aliasedName => _alias ?? 'drift_technique_treaning_items_table';
  @override
  String get actualTableName => 'drift_technique_treaning_items_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftTechniqueTreaningItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('treaning_id')) {
      context.handle(
          _treaningIdMeta,
          treaningId.isAcceptableOrUnknown(
              data['treaning_id']!, _treaningIdMeta));
    } else if (isInserting) {
      context.missing(_treaningIdMeta);
    }
    if (data.containsKey('options')) {
      context.handle(_optionsMeta,
          options.isAcceptableOrUnknown(data['options']!, _optionsMeta));
    }
    if (data.containsKey('finish_time')) {
      context.handle(
          _finishTimeMeta,
          finishTime.isAcceptableOrUnknown(
              data['finish_time']!, _finishTimeMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('group')) {
      context.handle(
          _groupMeta, group.isAcceptableOrUnknown(data['group']!, _groupMeta));
    } else if (isInserting) {
      context.missing(_groupMeta);
    }
    if (data.containsKey('technique')) {
      context.handle(_techniqueMeta,
          technique.isAcceptableOrUnknown(data['technique']!, _techniqueMeta));
    } else if (isInserting) {
      context.missing(_techniqueMeta);
    }
    if (data.containsKey('technique_id')) {
      context.handle(
          _techniqueIdMeta,
          techniqueId.isAcceptableOrUnknown(
              data['technique_id']!, _techniqueIdMeta));
    } else if (isInserting) {
      context.missing(_techniqueIdMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftTechniqueTreaningItem map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTechniqueTreaningItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment'])!,
      treaningId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}treaning_id'])!,
      options: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}options']),
      finishTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish_time']),
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      group: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group'])!,
      technique: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}technique'])!,
      techniqueId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}technique_id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
    );
  }

  @override
  $DriftTechniqueTreaningItemsTableTable createAlias(String alias) {
    return $DriftTechniqueTreaningItemsTableTable(attachedDatabase, alias);
  }
}

class DriftTechniqueTreaningItem extends DataClass
    implements Insertable<DriftTechniqueTreaningItem> {
  final String id;
  final String comment;
  final String treaningId;
  final String? options;
  final DateTime? finishTime;
  final DateTime? startTime;
  final String group;
  final String technique;
  final String techniqueId;
  final String groupId;
  const DriftTechniqueTreaningItem(
      {required this.id,
      required this.comment,
      required this.treaningId,
      this.options,
      this.finishTime,
      this.startTime,
      required this.group,
      required this.technique,
      required this.techniqueId,
      required this.groupId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['comment'] = Variable<String>(comment);
    map['treaning_id'] = Variable<String>(treaningId);
    if (!nullToAbsent || options != null) {
      map['options'] = Variable<String>(options);
    }
    if (!nullToAbsent || finishTime != null) {
      map['finish_time'] = Variable<DateTime>(finishTime);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    map['group'] = Variable<String>(group);
    map['technique'] = Variable<String>(technique);
    map['technique_id'] = Variable<String>(techniqueId);
    map['group_id'] = Variable<String>(groupId);
    return map;
  }

  DriftTechniqueTreaningItemsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftTechniqueTreaningItemsTableCompanion(
      id: Value(id),
      comment: Value(comment),
      treaningId: Value(treaningId),
      options: options == null && nullToAbsent
          ? const Value.absent()
          : Value(options),
      finishTime: finishTime == null && nullToAbsent
          ? const Value.absent()
          : Value(finishTime),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      group: Value(group),
      technique: Value(technique),
      techniqueId: Value(techniqueId),
      groupId: Value(groupId),
    );
  }

  factory DriftTechniqueTreaningItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTechniqueTreaningItem(
      id: serializer.fromJson<String>(json['id']),
      comment: serializer.fromJson<String>(json['comment']),
      treaningId: serializer.fromJson<String>(json['treaningId']),
      options: serializer.fromJson<String?>(json['options']),
      finishTime: serializer.fromJson<DateTime?>(json['finishTime']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      group: serializer.fromJson<String>(json['group']),
      technique: serializer.fromJson<String>(json['technique']),
      techniqueId: serializer.fromJson<String>(json['techniqueId']),
      groupId: serializer.fromJson<String>(json['groupId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'comment': serializer.toJson<String>(comment),
      'treaningId': serializer.toJson<String>(treaningId),
      'options': serializer.toJson<String?>(options),
      'finishTime': serializer.toJson<DateTime?>(finishTime),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'group': serializer.toJson<String>(group),
      'technique': serializer.toJson<String>(technique),
      'techniqueId': serializer.toJson<String>(techniqueId),
      'groupId': serializer.toJson<String>(groupId),
    };
  }

  DriftTechniqueTreaningItem copyWith(
          {String? id,
          String? comment,
          String? treaningId,
          Value<String?> options = const Value.absent(),
          Value<DateTime?> finishTime = const Value.absent(),
          Value<DateTime?> startTime = const Value.absent(),
          String? group,
          String? technique,
          String? techniqueId,
          String? groupId}) =>
      DriftTechniqueTreaningItem(
        id: id ?? this.id,
        comment: comment ?? this.comment,
        treaningId: treaningId ?? this.treaningId,
        options: options.present ? options.value : this.options,
        finishTime: finishTime.present ? finishTime.value : this.finishTime,
        startTime: startTime.present ? startTime.value : this.startTime,
        group: group ?? this.group,
        technique: technique ?? this.technique,
        techniqueId: techniqueId ?? this.techniqueId,
        groupId: groupId ?? this.groupId,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTechniqueTreaningItem(')
          ..write('id: $id, ')
          ..write('comment: $comment, ')
          ..write('treaningId: $treaningId, ')
          ..write('options: $options, ')
          ..write('finishTime: $finishTime, ')
          ..write('startTime: $startTime, ')
          ..write('group: $group, ')
          ..write('technique: $technique, ')
          ..write('techniqueId: $techniqueId, ')
          ..write('groupId: $groupId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, comment, treaningId, options, finishTime,
      startTime, group, technique, techniqueId, groupId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftTechniqueTreaningItem &&
          other.id == this.id &&
          other.comment == this.comment &&
          other.treaningId == this.treaningId &&
          other.options == this.options &&
          other.finishTime == this.finishTime &&
          other.startTime == this.startTime &&
          other.group == this.group &&
          other.technique == this.technique &&
          other.techniqueId == this.techniqueId &&
          other.groupId == this.groupId);
}

class DriftTechniqueTreaningItemsTableCompanion
    extends UpdateCompanion<DriftTechniqueTreaningItem> {
  final Value<String> id;
  final Value<String> comment;
  final Value<String> treaningId;
  final Value<String?> options;
  final Value<DateTime?> finishTime;
  final Value<DateTime?> startTime;
  final Value<String> group;
  final Value<String> technique;
  final Value<String> techniqueId;
  final Value<String> groupId;
  final Value<int> rowid;
  const DriftTechniqueTreaningItemsTableCompanion({
    this.id = const Value.absent(),
    this.comment = const Value.absent(),
    this.treaningId = const Value.absent(),
    this.options = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.startTime = const Value.absent(),
    this.group = const Value.absent(),
    this.technique = const Value.absent(),
    this.techniqueId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftTechniqueTreaningItemsTableCompanion.insert({
    required String id,
    required String comment,
    required String treaningId,
    this.options = const Value.absent(),
    this.finishTime = const Value.absent(),
    this.startTime = const Value.absent(),
    required String group,
    required String technique,
    required String techniqueId,
    required String groupId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        comment = Value(comment),
        treaningId = Value(treaningId),
        group = Value(group),
        technique = Value(technique),
        techniqueId = Value(techniqueId),
        groupId = Value(groupId);
  static Insertable<DriftTechniqueTreaningItem> custom({
    Expression<String>? id,
    Expression<String>? comment,
    Expression<String>? treaningId,
    Expression<String>? options,
    Expression<DateTime>? finishTime,
    Expression<DateTime>? startTime,
    Expression<String>? group,
    Expression<String>? technique,
    Expression<String>? techniqueId,
    Expression<String>? groupId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (comment != null) 'comment': comment,
      if (treaningId != null) 'treaning_id': treaningId,
      if (options != null) 'options': options,
      if (finishTime != null) 'finish_time': finishTime,
      if (startTime != null) 'start_time': startTime,
      if (group != null) 'group': group,
      if (technique != null) 'technique': technique,
      if (techniqueId != null) 'technique_id': techniqueId,
      if (groupId != null) 'group_id': groupId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftTechniqueTreaningItemsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? comment,
      Value<String>? treaningId,
      Value<String?>? options,
      Value<DateTime?>? finishTime,
      Value<DateTime?>? startTime,
      Value<String>? group,
      Value<String>? technique,
      Value<String>? techniqueId,
      Value<String>? groupId,
      Value<int>? rowid}) {
    return DriftTechniqueTreaningItemsTableCompanion(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      treaningId: treaningId ?? this.treaningId,
      options: options ?? this.options,
      finishTime: finishTime ?? this.finishTime,
      startTime: startTime ?? this.startTime,
      group: group ?? this.group,
      technique: technique ?? this.technique,
      techniqueId: techniqueId ?? this.techniqueId,
      groupId: groupId ?? this.groupId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (treaningId.present) {
      map['treaning_id'] = Variable<String>(treaningId.value);
    }
    if (options.present) {
      map['options'] = Variable<String>(options.value);
    }
    if (finishTime.present) {
      map['finish_time'] = Variable<DateTime>(finishTime.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (group.present) {
      map['group'] = Variable<String>(group.value);
    }
    if (technique.present) {
      map['technique'] = Variable<String>(technique.value);
    }
    if (techniqueId.present) {
      map['technique_id'] = Variable<String>(techniqueId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftTechniqueTreaningItemsTableCompanion(')
          ..write('id: $id, ')
          ..write('comment: $comment, ')
          ..write('treaningId: $treaningId, ')
          ..write('options: $options, ')
          ..write('finishTime: $finishTime, ')
          ..write('startTime: $startTime, ')
          ..write('group: $group, ')
          ..write('technique: $technique, ')
          ..write('techniqueId: $techniqueId, ')
          ..write('groupId: $groupId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftAscensionsTableTable extends DriftAscensionsTable
    with TableInfo<$DriftAscensionsTableTable, DriftAscension> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftAscensionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _mountainMeta =
      const VerificationMeta('mountain');
  @override
  late final GeneratedColumn<String> mountain = GeneratedColumn<String>(
      'mountain', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mountainIdMeta =
      const VerificationMeta('mountainId');
  @override
  late final GeneratedColumn<String> mountainId = GeneratedColumn<String>(
      'mountain_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _routeIdMeta =
      const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<String> routeId = GeneratedColumn<String>(
      'route_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _routeMeta = const VerificationMeta('route');
  @override
  late final GeneratedColumn<String> route = GeneratedColumn<String>(
      'route', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, mountain, mountainId, routeId, route, date, finish, start];
  @override
  String get aliasedName => _alias ?? 'drift_ascensions_table';
  @override
  String get actualTableName => 'drift_ascensions_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftAscension> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mountain')) {
      context.handle(_mountainMeta,
          mountain.isAcceptableOrUnknown(data['mountain']!, _mountainMeta));
    } else if (isInserting) {
      context.missing(_mountainMeta);
    }
    if (data.containsKey('mountain_id')) {
      context.handle(
          _mountainIdMeta,
          mountainId.isAcceptableOrUnknown(
              data['mountain_id']!, _mountainIdMeta));
    } else if (isInserting) {
      context.missing(_mountainIdMeta);
    }
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    }
    if (data.containsKey('route')) {
      context.handle(
          _routeMeta, route.isAcceptableOrUnknown(data['route']!, _routeMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftAscension map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftAscension(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      mountain: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mountain'])!,
      mountainId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mountain_id'])!,
      routeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}route_id']),
      route: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}route']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
    );
  }

  @override
  $DriftAscensionsTableTable createAlias(String alias) {
    return $DriftAscensionsTableTable(attachedDatabase, alias);
  }
}

class DriftAscension extends DataClass implements Insertable<DriftAscension> {
  final String id;
  final String mountain;
  final String mountainId;
  final String? routeId;
  final String? route;
  final DateTime date;
  final DateTime? finish;
  final DateTime? start;
  const DriftAscension(
      {required this.id,
      required this.mountain,
      required this.mountainId,
      this.routeId,
      this.route,
      required this.date,
      this.finish,
      this.start});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mountain'] = Variable<String>(mountain);
    map['mountain_id'] = Variable<String>(mountainId);
    if (!nullToAbsent || routeId != null) {
      map['route_id'] = Variable<String>(routeId);
    }
    if (!nullToAbsent || route != null) {
      map['route'] = Variable<String>(route);
    }
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    return map;
  }

  DriftAscensionsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftAscensionsTableCompanion(
      id: Value(id),
      mountain: Value(mountain),
      mountainId: Value(mountainId),
      routeId: routeId == null && nullToAbsent
          ? const Value.absent()
          : Value(routeId),
      route:
          route == null && nullToAbsent ? const Value.absent() : Value(route),
      date: Value(date),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
    );
  }

  factory DriftAscension.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftAscension(
      id: serializer.fromJson<String>(json['id']),
      mountain: serializer.fromJson<String>(json['mountain']),
      mountainId: serializer.fromJson<String>(json['mountainId']),
      routeId: serializer.fromJson<String?>(json['routeId']),
      route: serializer.fromJson<String?>(json['route']),
      date: serializer.fromJson<DateTime>(json['date']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
      start: serializer.fromJson<DateTime?>(json['start']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mountain': serializer.toJson<String>(mountain),
      'mountainId': serializer.toJson<String>(mountainId),
      'routeId': serializer.toJson<String?>(routeId),
      'route': serializer.toJson<String?>(route),
      'date': serializer.toJson<DateTime>(date),
      'finish': serializer.toJson<DateTime?>(finish),
      'start': serializer.toJson<DateTime?>(start),
    };
  }

  DriftAscension copyWith(
          {String? id,
          String? mountain,
          String? mountainId,
          Value<String?> routeId = const Value.absent(),
          Value<String?> route = const Value.absent(),
          DateTime? date,
          Value<DateTime?> finish = const Value.absent(),
          Value<DateTime?> start = const Value.absent()}) =>
      DriftAscension(
        id: id ?? this.id,
        mountain: mountain ?? this.mountain,
        mountainId: mountainId ?? this.mountainId,
        routeId: routeId.present ? routeId.value : this.routeId,
        route: route.present ? route.value : this.route,
        date: date ?? this.date,
        finish: finish.present ? finish.value : this.finish,
        start: start.present ? start.value : this.start,
      );
  @override
  String toString() {
    return (StringBuffer('DriftAscension(')
          ..write('id: $id, ')
          ..write('mountain: $mountain, ')
          ..write('mountainId: $mountainId, ')
          ..write('routeId: $routeId, ')
          ..write('route: $route, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, mountain, mountainId, routeId, route, date, finish, start);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftAscension &&
          other.id == this.id &&
          other.mountain == this.mountain &&
          other.mountainId == this.mountainId &&
          other.routeId == this.routeId &&
          other.route == this.route &&
          other.date == this.date &&
          other.finish == this.finish &&
          other.start == this.start);
}

class DriftAscensionsTableCompanion extends UpdateCompanion<DriftAscension> {
  final Value<String> id;
  final Value<String> mountain;
  final Value<String> mountainId;
  final Value<String?> routeId;
  final Value<String?> route;
  final Value<DateTime> date;
  final Value<DateTime?> finish;
  final Value<DateTime?> start;
  final Value<int> rowid;
  const DriftAscensionsTableCompanion({
    this.id = const Value.absent(),
    this.mountain = const Value.absent(),
    this.mountainId = const Value.absent(),
    this.routeId = const Value.absent(),
    this.route = const Value.absent(),
    this.date = const Value.absent(),
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftAscensionsTableCompanion.insert({
    required String id,
    required String mountain,
    required String mountainId,
    this.routeId = const Value.absent(),
    this.route = const Value.absent(),
    required DateTime date,
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        mountain = Value(mountain),
        mountainId = Value(mountainId),
        date = Value(date);
  static Insertable<DriftAscension> custom({
    Expression<String>? id,
    Expression<String>? mountain,
    Expression<String>? mountainId,
    Expression<String>? routeId,
    Expression<String>? route,
    Expression<DateTime>? date,
    Expression<DateTime>? finish,
    Expression<DateTime>? start,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mountain != null) 'mountain': mountain,
      if (mountainId != null) 'mountain_id': mountainId,
      if (routeId != null) 'route_id': routeId,
      if (route != null) 'route': route,
      if (date != null) 'date': date,
      if (finish != null) 'finish': finish,
      if (start != null) 'start': start,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftAscensionsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? mountain,
      Value<String>? mountainId,
      Value<String?>? routeId,
      Value<String?>? route,
      Value<DateTime>? date,
      Value<DateTime?>? finish,
      Value<DateTime?>? start,
      Value<int>? rowid}) {
    return DriftAscensionsTableCompanion(
      id: id ?? this.id,
      mountain: mountain ?? this.mountain,
      mountainId: mountainId ?? this.mountainId,
      routeId: routeId ?? this.routeId,
      route: route ?? this.route,
      date: date ?? this.date,
      finish: finish ?? this.finish,
      start: start ?? this.start,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mountain.present) {
      map['mountain'] = Variable<String>(mountain.value);
    }
    if (mountainId.present) {
      map['mountain_id'] = Variable<String>(mountainId.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<String>(routeId.value);
    }
    if (route.present) {
      map['route'] = Variable<String>(route.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftAscensionsTableCompanion(')
          ..write('id: $id, ')
          ..write('mountain: $mountain, ')
          ..write('mountainId: $mountainId, ')
          ..write('routeId: $routeId, ')
          ..write('route: $route, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftAscensionEventsTableTable extends DriftAscensionEventsTable
    with TableInfo<$DriftAscensionEventsTableTable, DriftAscensionEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftAscensionEventsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ascensionIdMeta =
      const VerificationMeta('ascensionId');
  @override
  late final GeneratedColumn<String> ascensionId = GeneratedColumn<String>(
      'ascension_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_ascensions_table (id)'));
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
      'time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _planedTimeMeta =
      const VerificationMeta('planedTime');
  @override
  late final GeneratedColumn<DateTime> planedTime = GeneratedColumn<DateTime>(
      'planed_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, type, ascensionId, time, planedTime];
  @override
  String get aliasedName => _alias ?? 'drift_ascension_events_table';
  @override
  String get actualTableName => 'drift_ascension_events_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DriftAscensionEvent> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('ascension_id')) {
      context.handle(
          _ascensionIdMeta,
          ascensionId.isAcceptableOrUnknown(
              data['ascension_id']!, _ascensionIdMeta));
    } else if (isInserting) {
      context.missing(_ascensionIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    }
    if (data.containsKey('planed_time')) {
      context.handle(
          _planedTimeMeta,
          planedTime.isAcceptableOrUnknown(
              data['planed_time']!, _planedTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftAscensionEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftAscensionEvent(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      ascensionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ascension_id'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}time']),
      planedTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}planed_time']),
    );
  }

  @override
  $DriftAscensionEventsTableTable createAlias(String alias) {
    return $DriftAscensionEventsTableTable(attachedDatabase, alias);
  }
}

class DriftAscensionEvent extends DataClass
    implements Insertable<DriftAscensionEvent> {
  final String id;
  final String type;
  final String ascensionId;
  final DateTime? time;
  final DateTime? planedTime;
  const DriftAscensionEvent(
      {required this.id,
      required this.type,
      required this.ascensionId,
      this.time,
      this.planedTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['ascension_id'] = Variable<String>(ascensionId);
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<DateTime>(time);
    }
    if (!nullToAbsent || planedTime != null) {
      map['planed_time'] = Variable<DateTime>(planedTime);
    }
    return map;
  }

  DriftAscensionEventsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftAscensionEventsTableCompanion(
      id: Value(id),
      type: Value(type),
      ascensionId: Value(ascensionId),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      planedTime: planedTime == null && nullToAbsent
          ? const Value.absent()
          : Value(planedTime),
    );
  }

  factory DriftAscensionEvent.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftAscensionEvent(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      ascensionId: serializer.fromJson<String>(json['ascensionId']),
      time: serializer.fromJson<DateTime?>(json['time']),
      planedTime: serializer.fromJson<DateTime?>(json['planedTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'ascensionId': serializer.toJson<String>(ascensionId),
      'time': serializer.toJson<DateTime?>(time),
      'planedTime': serializer.toJson<DateTime?>(planedTime),
    };
  }

  DriftAscensionEvent copyWith(
          {String? id,
          String? type,
          String? ascensionId,
          Value<DateTime?> time = const Value.absent(),
          Value<DateTime?> planedTime = const Value.absent()}) =>
      DriftAscensionEvent(
        id: id ?? this.id,
        type: type ?? this.type,
        ascensionId: ascensionId ?? this.ascensionId,
        time: time.present ? time.value : this.time,
        planedTime: planedTime.present ? planedTime.value : this.planedTime,
      );
  @override
  String toString() {
    return (StringBuffer('DriftAscensionEvent(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('ascensionId: $ascensionId, ')
          ..write('time: $time, ')
          ..write('planedTime: $planedTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, ascensionId, time, planedTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftAscensionEvent &&
          other.id == this.id &&
          other.type == this.type &&
          other.ascensionId == this.ascensionId &&
          other.time == this.time &&
          other.planedTime == this.planedTime);
}

class DriftAscensionEventsTableCompanion
    extends UpdateCompanion<DriftAscensionEvent> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> ascensionId;
  final Value<DateTime?> time;
  final Value<DateTime?> planedTime;
  final Value<int> rowid;
  const DriftAscensionEventsTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.ascensionId = const Value.absent(),
    this.time = const Value.absent(),
    this.planedTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftAscensionEventsTableCompanion.insert({
    required String id,
    required String type,
    required String ascensionId,
    this.time = const Value.absent(),
    this.planedTime = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        ascensionId = Value(ascensionId);
  static Insertable<DriftAscensionEvent> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? ascensionId,
    Expression<DateTime>? time,
    Expression<DateTime>? planedTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (ascensionId != null) 'ascension_id': ascensionId,
      if (time != null) 'time': time,
      if (planedTime != null) 'planed_time': planedTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftAscensionEventsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<String>? ascensionId,
      Value<DateTime?>? time,
      Value<DateTime?>? planedTime,
      Value<int>? rowid}) {
    return DriftAscensionEventsTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      ascensionId: ascensionId ?? this.ascensionId,
      time: time ?? this.time,
      planedTime: planedTime ?? this.planedTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (ascensionId.present) {
      map['ascension_id'] = Variable<String>(ascensionId.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (planedTime.present) {
      map['planed_time'] = Variable<DateTime>(planedTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftAscensionEventsTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('ascensionId: $ascensionId, ')
          ..write('time: $time, ')
          ..write('planedTime: $planedTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftTravelsTableTable extends DriftTravelsTable
    with TableInfo<$DriftTravelsTableTable, DriftTravel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTravelsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _regionsMeta =
      const VerificationMeta('regions');
  @override
  late final GeneratedColumn<String> regions = GeneratedColumn<String>(
      'regions', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currenciesMeta =
      const VerificationMeta('currencies');
  @override
  late final GeneratedColumn<String> currencies = GeneratedColumn<String>(
      'currencies', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _budgetCurrencyMeta =
      const VerificationMeta('budgetCurrency');
  @override
  late final GeneratedColumn<int> budgetCurrency = GeneratedColumn<int>(
      'budget_currency', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        finish,
        start,
        regions,
        name,
        description,
        currencies,
        status,
        budgetCurrency
      ];
  @override
  String get aliasedName => _alias ?? 'drift_travels_table';
  @override
  String get actualTableName => 'drift_travels_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftTravel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    if (data.containsKey('regions')) {
      context.handle(_regionsMeta,
          regions.isAcceptableOrUnknown(data['regions']!, _regionsMeta));
    } else if (isInserting) {
      context.missing(_regionsMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('currencies')) {
      context.handle(
          _currenciesMeta,
          currencies.isAcceptableOrUnknown(
              data['currencies']!, _currenciesMeta));
    } else if (isInserting) {
      context.missing(_currenciesMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('budget_currency')) {
      context.handle(
          _budgetCurrencyMeta,
          budgetCurrency.isAcceptableOrUnknown(
              data['budget_currency']!, _budgetCurrencyMeta));
    } else if (isInserting) {
      context.missing(_budgetCurrencyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftTravel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTravel(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      finish: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
      regions: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}regions'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      currencies: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currencies'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      budgetCurrency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}budget_currency'])!,
    );
  }

  @override
  $DriftTravelsTableTable createAlias(String alias) {
    return $DriftTravelsTableTable(attachedDatabase, alias);
  }
}

class DriftTravel extends DataClass implements Insertable<DriftTravel> {
  final String id;
  final DateTime date;
  final DateTime? finish;
  final DateTime? start;
  final String regions;
  final String name;
  final String description;
  final String currencies;
  final String status;
  final int budgetCurrency;
  const DriftTravel(
      {required this.id,
      required this.date,
      this.finish,
      this.start,
      required this.regions,
      required this.name,
      required this.description,
      required this.currencies,
      required this.status,
      required this.budgetCurrency});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    map['regions'] = Variable<String>(regions);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['currencies'] = Variable<String>(currencies);
    map['status'] = Variable<String>(status);
    map['budget_currency'] = Variable<int>(budgetCurrency);
    return map;
  }

  DriftTravelsTableCompanion toCompanion(bool nullToAbsent) {
    return DriftTravelsTableCompanion(
      id: Value(id),
      date: Value(date),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
      regions: Value(regions),
      name: Value(name),
      description: Value(description),
      currencies: Value(currencies),
      status: Value(status),
      budgetCurrency: Value(budgetCurrency),
    );
  }

  factory DriftTravel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTravel(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
      start: serializer.fromJson<DateTime?>(json['start']),
      regions: serializer.fromJson<String>(json['regions']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      currencies: serializer.fromJson<String>(json['currencies']),
      status: serializer.fromJson<String>(json['status']),
      budgetCurrency: serializer.fromJson<int>(json['budgetCurrency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'finish': serializer.toJson<DateTime?>(finish),
      'start': serializer.toJson<DateTime?>(start),
      'regions': serializer.toJson<String>(regions),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'currencies': serializer.toJson<String>(currencies),
      'status': serializer.toJson<String>(status),
      'budgetCurrency': serializer.toJson<int>(budgetCurrency),
    };
  }

  DriftTravel copyWith(
          {String? id,
          DateTime? date,
          Value<DateTime?> finish = const Value.absent(),
          Value<DateTime?> start = const Value.absent(),
          String? regions,
          String? name,
          String? description,
          String? currencies,
          String? status,
          int? budgetCurrency}) =>
      DriftTravel(
        id: id ?? this.id,
        date: date ?? this.date,
        finish: finish.present ? finish.value : this.finish,
        start: start.present ? start.value : this.start,
        regions: regions ?? this.regions,
        name: name ?? this.name,
        description: description ?? this.description,
        currencies: currencies ?? this.currencies,
        status: status ?? this.status,
        budgetCurrency: budgetCurrency ?? this.budgetCurrency,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTravel(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('regions: $regions, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('currencies: $currencies, ')
          ..write('status: $status, ')
          ..write('budgetCurrency: $budgetCurrency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, finish, start, regions, name,
      description, currencies, status, budgetCurrency);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftTravel &&
          other.id == this.id &&
          other.date == this.date &&
          other.finish == this.finish &&
          other.start == this.start &&
          other.regions == this.regions &&
          other.name == this.name &&
          other.description == this.description &&
          other.currencies == this.currencies &&
          other.status == this.status &&
          other.budgetCurrency == this.budgetCurrency);
}

class DriftTravelsTableCompanion extends UpdateCompanion<DriftTravel> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<DateTime?> finish;
  final Value<DateTime?> start;
  final Value<String> regions;
  final Value<String> name;
  final Value<String> description;
  final Value<String> currencies;
  final Value<String> status;
  final Value<int> budgetCurrency;
  final Value<int> rowid;
  const DriftTravelsTableCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.regions = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.currencies = const Value.absent(),
    this.status = const Value.absent(),
    this.budgetCurrency = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftTravelsTableCompanion.insert({
    required String id,
    required DateTime date,
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    required String regions,
    required String name,
    required String description,
    required String currencies,
    required String status,
    required int budgetCurrency,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date),
        regions = Value(regions),
        name = Value(name),
        description = Value(description),
        currencies = Value(currencies),
        status = Value(status),
        budgetCurrency = Value(budgetCurrency);
  static Insertable<DriftTravel> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<DateTime>? finish,
    Expression<DateTime>? start,
    Expression<String>? regions,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? currencies,
    Expression<String>? status,
    Expression<int>? budgetCurrency,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (finish != null) 'finish': finish,
      if (start != null) 'start': start,
      if (regions != null) 'regions': regions,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (currencies != null) 'currencies': currencies,
      if (status != null) 'status': status,
      if (budgetCurrency != null) 'budget_currency': budgetCurrency,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftTravelsTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? date,
      Value<DateTime?>? finish,
      Value<DateTime?>? start,
      Value<String>? regions,
      Value<String>? name,
      Value<String>? description,
      Value<String>? currencies,
      Value<String>? status,
      Value<int>? budgetCurrency,
      Value<int>? rowid}) {
    return DriftTravelsTableCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      finish: finish ?? this.finish,
      start: start ?? this.start,
      regions: regions ?? this.regions,
      name: name ?? this.name,
      description: description ?? this.description,
      currencies: currencies ?? this.currencies,
      status: status ?? this.status,
      budgetCurrency: budgetCurrency ?? this.budgetCurrency,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (regions.present) {
      map['regions'] = Variable<String>(regions.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (currencies.present) {
      map['currencies'] = Variable<String>(currencies.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (budgetCurrency.present) {
      map['budget_currency'] = Variable<int>(budgetCurrency.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftTravelsTableCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('regions: $regions, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('currencies: $currencies, ')
          ..write('status: $status, ')
          ..write('budgetCurrency: $budgetCurrency, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftTravelDaysTableTable extends DriftTravelDaysTable
    with TableInfo<$DriftTravelDaysTableTable, DriftTravelDay> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftTravelDaysTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
      'number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _transportLinesMeta =
      const VerificationMeta('transportLines');
  @override
  late final GeneratedColumn<String> transportLines = GeneratedColumn<String>(
      'transport_lines', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _feedingsLinesMeta =
      const VerificationMeta('feedingsLines');
  @override
  late final GeneratedColumn<String> feedingsLines = GeneratedColumn<String>(
      'feedings_lines', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stayLinesMeta =
      const VerificationMeta('stayLines');
  @override
  late final GeneratedColumn<String> stayLines = GeneratedColumn<String>(
      'stay_lines', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _travelIdMeta =
      const VerificationMeta('travelId');
  @override
  late final GeneratedColumn<String> travelId = GeneratedColumn<String>(
      'travel_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_travels_table (id)'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        date,
        start,
        number,
        transportLines,
        feedingsLines,
        stayLines,
        travelId
      ];
  @override
  String get aliasedName => _alias ?? 'drift_travel_days_table';
  @override
  String get actualTableName => 'drift_travel_days_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftTravelDay> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('transport_lines')) {
      context.handle(
          _transportLinesMeta,
          transportLines.isAcceptableOrUnknown(
              data['transport_lines']!, _transportLinesMeta));
    } else if (isInserting) {
      context.missing(_transportLinesMeta);
    }
    if (data.containsKey('feedings_lines')) {
      context.handle(
          _feedingsLinesMeta,
          feedingsLines.isAcceptableOrUnknown(
              data['feedings_lines']!, _feedingsLinesMeta));
    } else if (isInserting) {
      context.missing(_feedingsLinesMeta);
    }
    if (data.containsKey('stay_lines')) {
      context.handle(_stayLinesMeta,
          stayLines.isAcceptableOrUnknown(data['stay_lines']!, _stayLinesMeta));
    } else if (isInserting) {
      context.missing(_stayLinesMeta);
    }
    if (data.containsKey('travel_id')) {
      context.handle(_travelIdMeta,
          travelId.isAcceptableOrUnknown(data['travel_id']!, _travelIdMeta));
    } else if (isInserting) {
      context.missing(_travelIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftTravelDay map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftTravelDay(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      start: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}number'])!,
      transportLines: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}transport_lines'])!,
      feedingsLines: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}feedings_lines'])!,
      stayLines: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stay_lines'])!,
      travelId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}travel_id'])!,
    );
  }

  @override
  $DriftTravelDaysTableTable createAlias(String alias) {
    return $DriftTravelDaysTableTable(attachedDatabase, alias);
  }
}

class DriftTravelDay extends DataClass implements Insertable<DriftTravelDay> {
  final String id;
  final DateTime date;
  final DateTime? start;
  final int number;
  final String transportLines;
  final String feedingsLines;
  final String stayLines;
  final String travelId;
  const DriftTravelDay(
      {required this.id,
      required this.date,
      this.start,
      required this.number,
      required this.transportLines,
      required this.feedingsLines,
      required this.stayLines,
      required this.travelId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    map['number'] = Variable<int>(number);
    map['transport_lines'] = Variable<String>(transportLines);
    map['feedings_lines'] = Variable<String>(feedingsLines);
    map['stay_lines'] = Variable<String>(stayLines);
    map['travel_id'] = Variable<String>(travelId);
    return map;
  }

  DriftTravelDaysTableCompanion toCompanion(bool nullToAbsent) {
    return DriftTravelDaysTableCompanion(
      id: Value(id),
      date: Value(date),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
      number: Value(number),
      transportLines: Value(transportLines),
      feedingsLines: Value(feedingsLines),
      stayLines: Value(stayLines),
      travelId: Value(travelId),
    );
  }

  factory DriftTravelDay.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftTravelDay(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<DateTime>(json['date']),
      start: serializer.fromJson<DateTime?>(json['start']),
      number: serializer.fromJson<int>(json['number']),
      transportLines: serializer.fromJson<String>(json['transportLines']),
      feedingsLines: serializer.fromJson<String>(json['feedingsLines']),
      stayLines: serializer.fromJson<String>(json['stayLines']),
      travelId: serializer.fromJson<String>(json['travelId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<DateTime>(date),
      'start': serializer.toJson<DateTime?>(start),
      'number': serializer.toJson<int>(number),
      'transportLines': serializer.toJson<String>(transportLines),
      'feedingsLines': serializer.toJson<String>(feedingsLines),
      'stayLines': serializer.toJson<String>(stayLines),
      'travelId': serializer.toJson<String>(travelId),
    };
  }

  DriftTravelDay copyWith(
          {String? id,
          DateTime? date,
          Value<DateTime?> start = const Value.absent(),
          int? number,
          String? transportLines,
          String? feedingsLines,
          String? stayLines,
          String? travelId}) =>
      DriftTravelDay(
        id: id ?? this.id,
        date: date ?? this.date,
        start: start.present ? start.value : this.start,
        number: number ?? this.number,
        transportLines: transportLines ?? this.transportLines,
        feedingsLines: feedingsLines ?? this.feedingsLines,
        stayLines: stayLines ?? this.stayLines,
        travelId: travelId ?? this.travelId,
      );
  @override
  String toString() {
    return (StringBuffer('DriftTravelDay(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('start: $start, ')
          ..write('number: $number, ')
          ..write('transportLines: $transportLines, ')
          ..write('feedingsLines: $feedingsLines, ')
          ..write('stayLines: $stayLines, ')
          ..write('travelId: $travelId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, start, number, transportLines,
      feedingsLines, stayLines, travelId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftTravelDay &&
          other.id == this.id &&
          other.date == this.date &&
          other.start == this.start &&
          other.number == this.number &&
          other.transportLines == this.transportLines &&
          other.feedingsLines == this.feedingsLines &&
          other.stayLines == this.stayLines &&
          other.travelId == this.travelId);
}

class DriftTravelDaysTableCompanion extends UpdateCompanion<DriftTravelDay> {
  final Value<String> id;
  final Value<DateTime> date;
  final Value<DateTime?> start;
  final Value<int> number;
  final Value<String> transportLines;
  final Value<String> feedingsLines;
  final Value<String> stayLines;
  final Value<String> travelId;
  final Value<int> rowid;
  const DriftTravelDaysTableCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.start = const Value.absent(),
    this.number = const Value.absent(),
    this.transportLines = const Value.absent(),
    this.feedingsLines = const Value.absent(),
    this.stayLines = const Value.absent(),
    this.travelId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftTravelDaysTableCompanion.insert({
    required String id,
    required DateTime date,
    this.start = const Value.absent(),
    required int number,
    required String transportLines,
    required String feedingsLines,
    required String stayLines,
    required String travelId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date),
        number = Value(number),
        transportLines = Value(transportLines),
        feedingsLines = Value(feedingsLines),
        stayLines = Value(stayLines),
        travelId = Value(travelId);
  static Insertable<DriftTravelDay> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<DateTime>? start,
    Expression<int>? number,
    Expression<String>? transportLines,
    Expression<String>? feedingsLines,
    Expression<String>? stayLines,
    Expression<String>? travelId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (start != null) 'start': start,
      if (number != null) 'number': number,
      if (transportLines != null) 'transport_lines': transportLines,
      if (feedingsLines != null) 'feedings_lines': feedingsLines,
      if (stayLines != null) 'stay_lines': stayLines,
      if (travelId != null) 'travel_id': travelId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftTravelDaysTableCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? date,
      Value<DateTime?>? start,
      Value<int>? number,
      Value<String>? transportLines,
      Value<String>? feedingsLines,
      Value<String>? stayLines,
      Value<String>? travelId,
      Value<int>? rowid}) {
    return DriftTravelDaysTableCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      start: start ?? this.start,
      number: number ?? this.number,
      transportLines: transportLines ?? this.transportLines,
      feedingsLines: feedingsLines ?? this.feedingsLines,
      stayLines: stayLines ?? this.stayLines,
      travelId: travelId ?? this.travelId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (transportLines.present) {
      map['transport_lines'] = Variable<String>(transportLines.value);
    }
    if (feedingsLines.present) {
      map['feedings_lines'] = Variable<String>(feedingsLines.value);
    }
    if (stayLines.present) {
      map['stay_lines'] = Variable<String>(stayLines.value);
    }
    if (travelId.present) {
      map['travel_id'] = Variable<String>(travelId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftTravelDaysTableCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('start: $start, ')
          ..write('number: $number, ')
          ..write('transportLines: $transportLines, ')
          ..write('feedingsLines: $feedingsLines, ')
          ..write('stayLines: $stayLines, ')
          ..write('travelId: $travelId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftCostLinesTableTable extends DriftCostLinesTable
    with TableInfo<$DriftCostLinesTableTable, DriftCostLine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftCostLinesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<int> currency = GeneratedColumn<int>(
      'currency', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _travelIdMeta =
      const VerificationMeta('travelId');
  @override
  late final GeneratedColumn<String> travelId = GeneratedColumn<String>(
      'travel_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_travels_table (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedColumn<double> sum = GeneratedColumn<double>(
      'sum', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _budgetSumMeta =
      const VerificationMeta('budgetSum');
  @override
  late final GeneratedColumn<double> budgetSum = GeneratedColumn<double>(
      'budget_sum', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _incomeExpenseMeta =
      const VerificationMeta('incomeExpense');
  @override
  late final GeneratedColumn<String> incomeExpense = GeneratedColumn<String>(
      'income_expense', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        currency,
        travelId,
        date,
        sum,
        budgetSum,
        description,
        incomeExpense
      ];
  @override
  String get aliasedName => _alias ?? 'drift_cost_lines_table';
  @override
  String get actualTableName => 'drift_cost_lines_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftCostLine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('travel_id')) {
      context.handle(_travelIdMeta,
          travelId.isAcceptableOrUnknown(data['travel_id']!, _travelIdMeta));
    } else if (isInserting) {
      context.missing(_travelIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('sum')) {
      context.handle(
          _sumMeta, sum.isAcceptableOrUnknown(data['sum']!, _sumMeta));
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    if (data.containsKey('budget_sum')) {
      context.handle(_budgetSumMeta,
          budgetSum.isAcceptableOrUnknown(data['budget_sum']!, _budgetSumMeta));
    } else if (isInserting) {
      context.missing(_budgetSumMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('income_expense')) {
      context.handle(
          _incomeExpenseMeta,
          incomeExpense.isAcceptableOrUnknown(
              data['income_expense']!, _incomeExpenseMeta));
    } else if (isInserting) {
      context.missing(_incomeExpenseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftCostLine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftCostLine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}currency'])!,
      travelId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}travel_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      sum: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}sum'])!,
      budgetSum: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}budget_sum'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      incomeExpense: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}income_expense'])!,
    );
  }

  @override
  $DriftCostLinesTableTable createAlias(String alias) {
    return $DriftCostLinesTableTable(attachedDatabase, alias);
  }
}

class DriftCostLine extends DataClass implements Insertable<DriftCostLine> {
  final String id;
  final String type;
  final int currency;
  final String travelId;
  final DateTime date;
  final double sum;
  final double budgetSum;
  final String description;
  final String incomeExpense;
  const DriftCostLine(
      {required this.id,
      required this.type,
      required this.currency,
      required this.travelId,
      required this.date,
      required this.sum,
      required this.budgetSum,
      required this.description,
      required this.incomeExpense});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['currency'] = Variable<int>(currency);
    map['travel_id'] = Variable<String>(travelId);
    map['date'] = Variable<DateTime>(date);
    map['sum'] = Variable<double>(sum);
    map['budget_sum'] = Variable<double>(budgetSum);
    map['description'] = Variable<String>(description);
    map['income_expense'] = Variable<String>(incomeExpense);
    return map;
  }

  DriftCostLinesTableCompanion toCompanion(bool nullToAbsent) {
    return DriftCostLinesTableCompanion(
      id: Value(id),
      type: Value(type),
      currency: Value(currency),
      travelId: Value(travelId),
      date: Value(date),
      sum: Value(sum),
      budgetSum: Value(budgetSum),
      description: Value(description),
      incomeExpense: Value(incomeExpense),
    );
  }

  factory DriftCostLine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftCostLine(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      currency: serializer.fromJson<int>(json['currency']),
      travelId: serializer.fromJson<String>(json['travelId']),
      date: serializer.fromJson<DateTime>(json['date']),
      sum: serializer.fromJson<double>(json['sum']),
      budgetSum: serializer.fromJson<double>(json['budgetSum']),
      description: serializer.fromJson<String>(json['description']),
      incomeExpense: serializer.fromJson<String>(json['incomeExpense']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'currency': serializer.toJson<int>(currency),
      'travelId': serializer.toJson<String>(travelId),
      'date': serializer.toJson<DateTime>(date),
      'sum': serializer.toJson<double>(sum),
      'budgetSum': serializer.toJson<double>(budgetSum),
      'description': serializer.toJson<String>(description),
      'incomeExpense': serializer.toJson<String>(incomeExpense),
    };
  }

  DriftCostLine copyWith(
          {String? id,
          String? type,
          int? currency,
          String? travelId,
          DateTime? date,
          double? sum,
          double? budgetSum,
          String? description,
          String? incomeExpense}) =>
      DriftCostLine(
        id: id ?? this.id,
        type: type ?? this.type,
        currency: currency ?? this.currency,
        travelId: travelId ?? this.travelId,
        date: date ?? this.date,
        sum: sum ?? this.sum,
        budgetSum: budgetSum ?? this.budgetSum,
        description: description ?? this.description,
        incomeExpense: incomeExpense ?? this.incomeExpense,
      );
  @override
  String toString() {
    return (StringBuffer('DriftCostLine(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('currency: $currency, ')
          ..write('travelId: $travelId, ')
          ..write('date: $date, ')
          ..write('sum: $sum, ')
          ..write('budgetSum: $budgetSum, ')
          ..write('description: $description, ')
          ..write('incomeExpense: $incomeExpense')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, currency, travelId, date, sum,
      budgetSum, description, incomeExpense);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftCostLine &&
          other.id == this.id &&
          other.type == this.type &&
          other.currency == this.currency &&
          other.travelId == this.travelId &&
          other.date == this.date &&
          other.sum == this.sum &&
          other.budgetSum == this.budgetSum &&
          other.description == this.description &&
          other.incomeExpense == this.incomeExpense);
}

class DriftCostLinesTableCompanion extends UpdateCompanion<DriftCostLine> {
  final Value<String> id;
  final Value<String> type;
  final Value<int> currency;
  final Value<String> travelId;
  final Value<DateTime> date;
  final Value<double> sum;
  final Value<double> budgetSum;
  final Value<String> description;
  final Value<String> incomeExpense;
  final Value<int> rowid;
  const DriftCostLinesTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.currency = const Value.absent(),
    this.travelId = const Value.absent(),
    this.date = const Value.absent(),
    this.sum = const Value.absent(),
    this.budgetSum = const Value.absent(),
    this.description = const Value.absent(),
    this.incomeExpense = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftCostLinesTableCompanion.insert({
    required String id,
    required String type,
    required int currency,
    required String travelId,
    required DateTime date,
    required double sum,
    required double budgetSum,
    required String description,
    required String incomeExpense,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        currency = Value(currency),
        travelId = Value(travelId),
        date = Value(date),
        sum = Value(sum),
        budgetSum = Value(budgetSum),
        description = Value(description),
        incomeExpense = Value(incomeExpense);
  static Insertable<DriftCostLine> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<int>? currency,
    Expression<String>? travelId,
    Expression<DateTime>? date,
    Expression<double>? sum,
    Expression<double>? budgetSum,
    Expression<String>? description,
    Expression<String>? incomeExpense,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (currency != null) 'currency': currency,
      if (travelId != null) 'travel_id': travelId,
      if (date != null) 'date': date,
      if (sum != null) 'sum': sum,
      if (budgetSum != null) 'budget_sum': budgetSum,
      if (description != null) 'description': description,
      if (incomeExpense != null) 'income_expense': incomeExpense,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftCostLinesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<int>? currency,
      Value<String>? travelId,
      Value<DateTime>? date,
      Value<double>? sum,
      Value<double>? budgetSum,
      Value<String>? description,
      Value<String>? incomeExpense,
      Value<int>? rowid}) {
    return DriftCostLinesTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      currency: currency ?? this.currency,
      travelId: travelId ?? this.travelId,
      date: date ?? this.date,
      sum: sum ?? this.sum,
      budgetSum: budgetSum ?? this.budgetSum,
      description: description ?? this.description,
      incomeExpense: incomeExpense ?? this.incomeExpense,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (currency.present) {
      map['currency'] = Variable<int>(currency.value);
    }
    if (travelId.present) {
      map['travel_id'] = Variable<String>(travelId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (sum.present) {
      map['sum'] = Variable<double>(sum.value);
    }
    if (budgetSum.present) {
      map['budget_sum'] = Variable<double>(budgetSum.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (incomeExpense.present) {
      map['income_expense'] = Variable<String>(incomeExpense.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftCostLinesTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('currency: $currency, ')
          ..write('travelId: $travelId, ')
          ..write('date: $date, ')
          ..write('sum: $sum, ')
          ..write('budgetSum: $budgetSum, ')
          ..write('description: $description, ')
          ..write('incomeExpense: $incomeExpense, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftBudgetLinesTableTable extends DriftBudgetLinesTable
    with TableInfo<$DriftBudgetLinesTableTable, DriftBudgetLine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftBudgetLinesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _travelIdMeta =
      const VerificationMeta('travelId');
  @override
  late final GeneratedColumn<String> travelId = GeneratedColumn<String>(
      'travel_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_travels_table (id)'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, type, amount, travelId, description];
  @override
  String get aliasedName => _alias ?? 'drift_budget_lines_table';
  @override
  String get actualTableName => 'drift_budget_lines_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftBudgetLine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('travel_id')) {
      context.handle(_travelIdMeta,
          travelId.isAcceptableOrUnknown(data['travel_id']!, _travelIdMeta));
    } else if (isInserting) {
      context.missing(_travelIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftBudgetLine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftBudgetLine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      travelId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}travel_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $DriftBudgetLinesTableTable createAlias(String alias) {
    return $DriftBudgetLinesTableTable(attachedDatabase, alias);
  }
}

class DriftBudgetLine extends DataClass implements Insertable<DriftBudgetLine> {
  final String id;
  final String type;
  final double amount;
  final String travelId;
  final String description;
  const DriftBudgetLine(
      {required this.id,
      required this.type,
      required this.amount,
      required this.travelId,
      required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['amount'] = Variable<double>(amount);
    map['travel_id'] = Variable<String>(travelId);
    map['description'] = Variable<String>(description);
    return map;
  }

  DriftBudgetLinesTableCompanion toCompanion(bool nullToAbsent) {
    return DriftBudgetLinesTableCompanion(
      id: Value(id),
      type: Value(type),
      amount: Value(amount),
      travelId: Value(travelId),
      description: Value(description),
    );
  }

  factory DriftBudgetLine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftBudgetLine(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      amount: serializer.fromJson<double>(json['amount']),
      travelId: serializer.fromJson<String>(json['travelId']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'amount': serializer.toJson<double>(amount),
      'travelId': serializer.toJson<String>(travelId),
      'description': serializer.toJson<String>(description),
    };
  }

  DriftBudgetLine copyWith(
          {String? id,
          String? type,
          double? amount,
          String? travelId,
          String? description}) =>
      DriftBudgetLine(
        id: id ?? this.id,
        type: type ?? this.type,
        amount: amount ?? this.amount,
        travelId: travelId ?? this.travelId,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('DriftBudgetLine(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('travelId: $travelId, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, amount, travelId, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftBudgetLine &&
          other.id == this.id &&
          other.type == this.type &&
          other.amount == this.amount &&
          other.travelId == this.travelId &&
          other.description == this.description);
}

class DriftBudgetLinesTableCompanion extends UpdateCompanion<DriftBudgetLine> {
  final Value<String> id;
  final Value<String> type;
  final Value<double> amount;
  final Value<String> travelId;
  final Value<String> description;
  final Value<int> rowid;
  const DriftBudgetLinesTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
    this.travelId = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftBudgetLinesTableCompanion.insert({
    required String id,
    required String type,
    required double amount,
    required String travelId,
    required String description,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        amount = Value(amount),
        travelId = Value(travelId),
        description = Value(description);
  static Insertable<DriftBudgetLine> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<double>? amount,
    Expression<String>? travelId,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
      if (travelId != null) 'travel_id': travelId,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftBudgetLinesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<double>? amount,
      Value<String>? travelId,
      Value<String>? description,
      Value<int>? rowid}) {
    return DriftBudgetLinesTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      amount: amount ?? this.amount,
      travelId: travelId ?? this.travelId,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (travelId.present) {
      map['travel_id'] = Variable<String>(travelId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftBudgetLinesTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('amount: $amount, ')
          ..write('travelId: $travelId, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriftInsuranceLinesTableTable extends DriftInsuranceLinesTable
    with TableInfo<$DriftInsuranceLinesTableTable, DriftInsuranceLine> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriftInsuranceLinesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _travelIdMeta =
      const VerificationMeta('travelId');
  @override
  late final GeneratedColumn<String> travelId = GeneratedColumn<String>(
      'travel_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES drift_travels_table (id)'));
  static const VerificationMeta _insurantMeta =
      const VerificationMeta('insurant');
  @override
  late final GeneratedColumn<String> insurant = GeneratedColumn<String>(
      'insurant', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _insurerMeta =
      const VerificationMeta('insurer');
  @override
  late final GeneratedColumn<String> insurer = GeneratedColumn<String>(
      'insurer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactsMeta =
      const VerificationMeta('contacts');
  @override
  late final GeneratedColumn<String> contacts = GeneratedColumn<String>(
      'contacts', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, number, travelId, insurant, description, insurer, contacts];
  @override
  String get aliasedName => _alias ?? 'drift_insurance_lines_table';
  @override
  String get actualTableName => 'drift_insurance_lines_table';
  @override
  VerificationContext validateIntegrity(Insertable<DriftInsuranceLine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('travel_id')) {
      context.handle(_travelIdMeta,
          travelId.isAcceptableOrUnknown(data['travel_id']!, _travelIdMeta));
    } else if (isInserting) {
      context.missing(_travelIdMeta);
    }
    if (data.containsKey('insurant')) {
      context.handle(_insurantMeta,
          insurant.isAcceptableOrUnknown(data['insurant']!, _insurantMeta));
    } else if (isInserting) {
      context.missing(_insurantMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('insurer')) {
      context.handle(_insurerMeta,
          insurer.isAcceptableOrUnknown(data['insurer']!, _insurerMeta));
    } else if (isInserting) {
      context.missing(_insurerMeta);
    }
    if (data.containsKey('contacts')) {
      context.handle(_contactsMeta,
          contacts.isAcceptableOrUnknown(data['contacts']!, _contactsMeta));
    } else if (isInserting) {
      context.missing(_contactsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriftInsuranceLine map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriftInsuranceLine(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number'])!,
      travelId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}travel_id'])!,
      insurant: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}insurant'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      insurer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}insurer'])!,
      contacts: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contacts'])!,
    );
  }

  @override
  $DriftInsuranceLinesTableTable createAlias(String alias) {
    return $DriftInsuranceLinesTableTable(attachedDatabase, alias);
  }
}

class DriftInsuranceLine extends DataClass
    implements Insertable<DriftInsuranceLine> {
  final String id;
  final String number;
  final String travelId;
  final String insurant;
  final String description;
  final String insurer;
  final String contacts;
  const DriftInsuranceLine(
      {required this.id,
      required this.number,
      required this.travelId,
      required this.insurant,
      required this.description,
      required this.insurer,
      required this.contacts});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['number'] = Variable<String>(number);
    map['travel_id'] = Variable<String>(travelId);
    map['insurant'] = Variable<String>(insurant);
    map['description'] = Variable<String>(description);
    map['insurer'] = Variable<String>(insurer);
    map['contacts'] = Variable<String>(contacts);
    return map;
  }

  DriftInsuranceLinesTableCompanion toCompanion(bool nullToAbsent) {
    return DriftInsuranceLinesTableCompanion(
      id: Value(id),
      number: Value(number),
      travelId: Value(travelId),
      insurant: Value(insurant),
      description: Value(description),
      insurer: Value(insurer),
      contacts: Value(contacts),
    );
  }

  factory DriftInsuranceLine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriftInsuranceLine(
      id: serializer.fromJson<String>(json['id']),
      number: serializer.fromJson<String>(json['number']),
      travelId: serializer.fromJson<String>(json['travelId']),
      insurant: serializer.fromJson<String>(json['insurant']),
      description: serializer.fromJson<String>(json['description']),
      insurer: serializer.fromJson<String>(json['insurer']),
      contacts: serializer.fromJson<String>(json['contacts']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'number': serializer.toJson<String>(number),
      'travelId': serializer.toJson<String>(travelId),
      'insurant': serializer.toJson<String>(insurant),
      'description': serializer.toJson<String>(description),
      'insurer': serializer.toJson<String>(insurer),
      'contacts': serializer.toJson<String>(contacts),
    };
  }

  DriftInsuranceLine copyWith(
          {String? id,
          String? number,
          String? travelId,
          String? insurant,
          String? description,
          String? insurer,
          String? contacts}) =>
      DriftInsuranceLine(
        id: id ?? this.id,
        number: number ?? this.number,
        travelId: travelId ?? this.travelId,
        insurant: insurant ?? this.insurant,
        description: description ?? this.description,
        insurer: insurer ?? this.insurer,
        contacts: contacts ?? this.contacts,
      );
  @override
  String toString() {
    return (StringBuffer('DriftInsuranceLine(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('travelId: $travelId, ')
          ..write('insurant: $insurant, ')
          ..write('description: $description, ')
          ..write('insurer: $insurer, ')
          ..write('contacts: $contacts')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, number, travelId, insurant, description, insurer, contacts);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftInsuranceLine &&
          other.id == this.id &&
          other.number == this.number &&
          other.travelId == this.travelId &&
          other.insurant == this.insurant &&
          other.description == this.description &&
          other.insurer == this.insurer &&
          other.contacts == this.contacts);
}

class DriftInsuranceLinesTableCompanion
    extends UpdateCompanion<DriftInsuranceLine> {
  final Value<String> id;
  final Value<String> number;
  final Value<String> travelId;
  final Value<String> insurant;
  final Value<String> description;
  final Value<String> insurer;
  final Value<String> contacts;
  final Value<int> rowid;
  const DriftInsuranceLinesTableCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.travelId = const Value.absent(),
    this.insurant = const Value.absent(),
    this.description = const Value.absent(),
    this.insurer = const Value.absent(),
    this.contacts = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriftInsuranceLinesTableCompanion.insert({
    required String id,
    required String number,
    required String travelId,
    required String insurant,
    required String description,
    required String insurer,
    required String contacts,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        number = Value(number),
        travelId = Value(travelId),
        insurant = Value(insurant),
        description = Value(description),
        insurer = Value(insurer),
        contacts = Value(contacts);
  static Insertable<DriftInsuranceLine> custom({
    Expression<String>? id,
    Expression<String>? number,
    Expression<String>? travelId,
    Expression<String>? insurant,
    Expression<String>? description,
    Expression<String>? insurer,
    Expression<String>? contacts,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (travelId != null) 'travel_id': travelId,
      if (insurant != null) 'insurant': insurant,
      if (description != null) 'description': description,
      if (insurer != null) 'insurer': insurer,
      if (contacts != null) 'contacts': contacts,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriftInsuranceLinesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? number,
      Value<String>? travelId,
      Value<String>? insurant,
      Value<String>? description,
      Value<String>? insurer,
      Value<String>? contacts,
      Value<int>? rowid}) {
    return DriftInsuranceLinesTableCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      travelId: travelId ?? this.travelId,
      insurant: insurant ?? this.insurant,
      description: description ?? this.description,
      insurer: insurer ?? this.insurer,
      contacts: contacts ?? this.contacts,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (travelId.present) {
      map['travel_id'] = Variable<String>(travelId.value);
    }
    if (insurant.present) {
      map['insurant'] = Variable<String>(insurant.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (insurer.present) {
      map['insurer'] = Variable<String>(insurer.value);
    }
    if (contacts.present) {
      map['contacts'] = Variable<String>(contacts.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriftInsuranceLinesTableCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('travelId: $travelId, ')
          ..write('insurant: $insurant, ')
          ..write('description: $description, ')
          ..write('insurer: $insurer, ')
          ..write('contacts: $contacts, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DriftDBLocalDataSource extends GeneratedDatabase {
  _$DriftDBLocalDataSource(QueryExecutor e) : super(e);
  late final $DriftStrengthExercisesTableTable driftStrengthExercisesTable =
      $DriftStrengthExercisesTableTable(this);
  late final $DriftHallTreaningsTableTable driftHallTreaningsTable =
      $DriftHallTreaningsTableTable(this);
  late final $DriftHallAttemptsTableTable driftHallAttemptsTable =
      $DriftHallAttemptsTableTable(this);
  late final $DriftCardioTreaningsTableTable driftCardioTreaningsTable =
      $DriftCardioTreaningsTableTable(this);
  late final $DriftStrengthTreaningsTableTable driftStrengthTreaningsTable =
      $DriftStrengthTreaningsTableTable(this);
  late final $DriftStrengthTreaningLinesTableTable
      driftStrengthTreaningLinesTable =
      $DriftStrengthTreaningLinesTableTable(this);
  late final $DriftIceTreaningsTableTable driftIceTreaningsTable =
      $DriftIceTreaningsTableTable(this);
  late final $DriftIceAttemptsTableTable driftIceAttemptsTable =
      $DriftIceAttemptsTableTable(this);
  late final $DriftRockTreaningsTableTable driftRockTreaningsTable =
      $DriftRockTreaningsTableTable(this);
  late final $DriftRockAttemptsTableTable driftRockAttemptsTable =
      $DriftRockAttemptsTableTable(this);
  late final $DriftTrekkingPathsTableTable driftTrekkingPathsTable =
      $DriftTrekkingPathsTableTable(this);
  late final $DriftTrekkingPathEventsTableTable driftTrekkingPathEventsTable =
      $DriftTrekkingPathEventsTableTable(this);
  late final $DriftTechniqueTreaningsTableTable driftTechniqueTreaningsTable =
      $DriftTechniqueTreaningsTableTable(this);
  late final $DriftTechniqueTreaningItemsTableTable
      driftTechniqueTreaningItemsTable =
      $DriftTechniqueTreaningItemsTableTable(this);
  late final $DriftAscensionsTableTable driftAscensionsTable =
      $DriftAscensionsTableTable(this);
  late final $DriftAscensionEventsTableTable driftAscensionEventsTable =
      $DriftAscensionEventsTableTable(this);
  late final $DriftTravelsTableTable driftTravelsTable =
      $DriftTravelsTableTable(this);
  late final $DriftTravelDaysTableTable driftTravelDaysTable =
      $DriftTravelDaysTableTable(this);
  late final $DriftCostLinesTableTable driftCostLinesTable =
      $DriftCostLinesTableTable(this);
  late final $DriftBudgetLinesTableTable driftBudgetLinesTable =
      $DriftBudgetLinesTableTable(this);
  late final $DriftInsuranceLinesTableTable driftInsuranceLinesTable =
      $DriftInsuranceLinesTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        driftStrengthExercisesTable,
        driftHallTreaningsTable,
        driftHallAttemptsTable,
        driftCardioTreaningsTable,
        driftStrengthTreaningsTable,
        driftStrengthTreaningLinesTable,
        driftIceTreaningsTable,
        driftIceAttemptsTable,
        driftRockTreaningsTable,
        driftRockAttemptsTable,
        driftTrekkingPathsTable,
        driftTrekkingPathEventsTable,
        driftTechniqueTreaningsTable,
        driftTechniqueTreaningItemsTable,
        driftAscensionsTable,
        driftAscensionEventsTable,
        driftTravelsTable,
        driftTravelDaysTable,
        driftCostLinesTable,
        driftBudgetLinesTable,
        driftInsuranceLinesTable
      ];
}

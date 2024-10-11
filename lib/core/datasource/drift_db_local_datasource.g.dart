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
  late final GeneratedColumn<bool> selected = GeneratedColumn<bool>(
      'selected', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("selected" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [repetitions, id, name, selected];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_strength_exercises_table';
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
  DriftStrengthExercise copyWithCompanion(
      DriftStrengthExercisesTableCompanion data) {
    return DriftStrengthExercise(
      repetitions:
          data.repetitions.present ? data.repetitions.value : this.repetitions,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      selected: data.selected.present ? data.selected.value : this.selected,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_hall_treanings_table';
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
  DriftHallTreaning copyWithCompanion(DriftHallTreaningsTableCompanion data) {
    return DriftHallTreaning(
      id: data.id.present ? data.id.value : this.id,
      hallId: data.hallId.present ? data.hallId.value : this.hallId,
      date: data.date.present ? data.date.value : this.date,
      finish: data.finish.present ? data.finish.value : this.finish,
      start: data.start.present ? data.start.value : this.start,
      climbingHall: data.climbingHall.present
          ? data.climbingHall.value
          : this.climbingHall,
    );
  }

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
  late final GeneratedColumn<bool> downClimbing = GeneratedColumn<bool>(
      'down_climbing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("down_climbing" IN (0, 1))'));
  static const VerificationMeta _failMeta = const VerificationMeta('fail');
  @override
  late final GeneratedColumn<bool> fail = GeneratedColumn<bool>(
      'fail', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fail" IN (0, 1))'));
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_hall_attempts_table';
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
  DriftHallAttempt copyWithCompanion(DriftHallAttemptsTableCompanion data) {
    return DriftHallAttempt(
      id: data.id.present ? data.id.value : this.id,
      treaningId:
          data.treaningId.present ? data.treaningId.value : this.treaningId,
      category: data.category.present ? data.category.value : this.category,
      style: data.style.present ? data.style.value : this.style,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      route: data.route.present ? data.route.value : this.route,
      finishTime:
          data.finishTime.present ? data.finishTime.value : this.finishTime,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      ascentType:
          data.ascentType.present ? data.ascentType.value : this.ascentType,
      suspensionCount: data.suspensionCount.present
          ? data.suspensionCount.value
          : this.suspensionCount,
      fallCount: data.fallCount.present ? data.fallCount.value : this.fallCount,
      downClimbing: data.downClimbing.present
          ? data.downClimbing.value
          : this.downClimbing,
      fail: data.fail.present ? data.fail.value : this.fail,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_cardio_treanings_table';
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
  DriftCardioTreanings copyWithCompanion(
      DriftCardioTreaningsTableCompanion data) {
    return DriftCardioTreanings(
      id: data.id.present ? data.id.value : this.id,
      exercise: data.exercise.present ? data.exercise.value : this.exercise,
      date: data.date.present ? data.date.value : this.date,
      finish: data.finish.present ? data.finish.value : this.finish,
      start: data.start.present ? data.start.value : this.start,
      duration: data.duration.present ? data.duration.value : this.duration,
      length: data.length.present ? data.length.value : this.length,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_strength_treanings_table';
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
  DriftStrengthTreaning copyWithCompanion(
      DriftStrengthTreaningsTableCompanion data) {
    return DriftStrengthTreaning(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      finish: data.finish.present ? data.finish.value : this.finish,
      start: data.start.present ? data.start.value : this.start,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_strength_treaning_lines_table';
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
  DriftStrengthTreaningLine copyWithCompanion(
      DriftStrengthTreaningLinesTableCompanion data) {
    return DriftStrengthTreaningLine(
      id: data.id.present ? data.id.value : this.id,
      repetitions:
          data.repetitions.present ? data.repetitions.value : this.repetitions,
      treaningId:
          data.treaningId.present ? data.treaningId.value : this.treaningId,
      exercise: data.exercise.present ? data.exercise.value : this.exercise,
      exerciseId:
          data.exerciseId.present ? data.exerciseId.value : this.exerciseId,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_ice_treanings_table';
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
  DriftIceTreanings copyWithCompanion(DriftIceTreaningsTableCompanion data) {
    return DriftIceTreanings(
      id: data.id.present ? data.id.value : this.id,
      district: data.district.present ? data.district.value : this.district,
      districtId:
          data.districtId.present ? data.districtId.value : this.districtId,
      date: data.date.present ? data.date.value : this.date,
      finish: data.finish.present ? data.finish.value : this.finish,
      start: data.start.present ? data.start.value : this.start,
      sectors: data.sectors.present ? data.sectors.value : this.sectors,
    );
  }

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
  late final GeneratedColumn<bool> downClimbing = GeneratedColumn<bool>(
      'down_climbing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("down_climbing" IN (0, 1))'));
  static const VerificationMeta _failMeta = const VerificationMeta('fail');
  @override
  late final GeneratedColumn<bool> fail = GeneratedColumn<bool>(
      'fail', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fail" IN (0, 1))'));
  static const VerificationMeta _installedIceScrewsMeta =
      const VerificationMeta('installedIceScrews');
  @override
  late final GeneratedColumn<bool> installedIceScrews = GeneratedColumn<bool>(
      'installed_ice_screws', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("installed_ice_screws" IN (0, 1))'));
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_ice_attempts_table';
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
  DriftIceAttempt copyWithCompanion(DriftIceAttemptsTableCompanion data) {
    return DriftIceAttempt(
      id: data.id.present ? data.id.value : this.id,
      sector: data.sector.present ? data.sector.value : this.sector,
      sectorId: data.sectorId.present ? data.sectorId.value : this.sectorId,
      treaningId:
          data.treaningId.present ? data.treaningId.value : this.treaningId,
      category: data.category.present ? data.category.value : this.category,
      style: data.style.present ? data.style.value : this.style,
      finishTime:
          data.finishTime.present ? data.finishTime.value : this.finishTime,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      wayLength: data.wayLength.present ? data.wayLength.value : this.wayLength,
      suspensionCount: data.suspensionCount.present
          ? data.suspensionCount.value
          : this.suspensionCount,
      fallCount: data.fallCount.present ? data.fallCount.value : this.fallCount,
      downClimbing: data.downClimbing.present
          ? data.downClimbing.value
          : this.downClimbing,
      fail: data.fail.present ? data.fail.value : this.fail,
      installedIceScrews: data.installedIceScrews.present
          ? data.installedIceScrews.value
          : this.installedIceScrews,
      iceScrewsCount: data.iceScrewsCount.present
          ? data.iceScrewsCount.value
          : this.iceScrewsCount,
      toolsCount:
          data.toolsCount.present ? data.toolsCount.value : this.toolsCount,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_rock_treanings_table';
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
  DriftRockTreanings copyWithCompanion(DriftRockTreaningsTableCompanion data) {
    return DriftRockTreanings(
      id: data.id.present ? data.id.value : this.id,
      districtId:
          data.districtId.present ? data.districtId.value : this.districtId,
      district: data.district.present ? data.district.value : this.district,
      date: data.date.present ? data.date.value : this.date,
      finish: data.finish.present ? data.finish.value : this.finish,
      start: data.start.present ? data.start.value : this.start,
      sectors: data.sectors.present ? data.sectors.value : this.sectors,
    );
  }

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
  late final GeneratedColumn<bool> downClimbing = GeneratedColumn<bool>(
      'down_climbing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("down_climbing" IN (0, 1))'));
  static const VerificationMeta _failMeta = const VerificationMeta('fail');
  @override
  late final GeneratedColumn<bool> fail = GeneratedColumn<bool>(
      'fail', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("fail" IN (0, 1))'));
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_rock_attempts_table';
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
  DriftRockAttempt copyWithCompanion(DriftRockAttemptsTableCompanion data) {
    return DriftRockAttempt(
      id: data.id.present ? data.id.value : this.id,
      sector: data.sector.present ? data.sector.value : this.sector,
      sectorId: data.sectorId.present ? data.sectorId.value : this.sectorId,
      treaningId:
          data.treaningId.present ? data.treaningId.value : this.treaningId,
      category: data.category.present ? data.category.value : this.category,
      route: data.route.present ? data.route.value : this.route,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      style: data.style.present ? data.style.value : this.style,
      finishTime:
          data.finishTime.present ? data.finishTime.value : this.finishTime,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      suspensionCount: data.suspensionCount.present
          ? data.suspensionCount.value
          : this.suspensionCount,
      fallCount: data.fallCount.present ? data.fallCount.value : this.fallCount,
      downClimbing: data.downClimbing.present
          ? data.downClimbing.value
          : this.downClimbing,
      fail: data.fail.present ? data.fail.value : this.fail,
      ascentType:
          data.ascentType.present ? data.ascentType.value : this.ascentType,
    );
  }

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
  late final GeneratedColumn<bool> turn = GeneratedColumn<bool>(
      'turn', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("turn" IN (0, 1))'));
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_trekking_paths_table';
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
  DriftTrekkingPath copyWithCompanion(DriftTrekkingPathsTableCompanion data) {
    return DriftTrekkingPath(
      id: data.id.present ? data.id.value : this.id,
      region: data.region.present ? data.region.value : this.region,
      trekId: data.trekId.present ? data.trekId.value : this.trekId,
      trek: data.trek.present ? data.trek.value : this.trek,
      type: data.type.present ? data.type.value : this.type,
      date: data.date.present ? data.date.value : this.date,
      finish: data.finish.present ? data.finish.value : this.finish,
      start: data.start.present ? data.start.value : this.start,
      currentSection: data.currentSection.present
          ? data.currentSection.value
          : this.currentSection,
      climbDown: data.climbDown.present ? data.climbDown.value : this.climbDown,
      climbUp: data.climbUp.present ? data.climbUp.value : this.climbUp,
      turn: data.turn.present ? data.turn.value : this.turn,
      length: data.length.present ? data.length.value : this.length,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_trekking_path_events_table';
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
  DriftTrekkingPathEvent copyWithCompanion(
      DriftTrekkingPathEventsTableCompanion data) {
    return DriftTrekkingPathEvent(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      pathId: data.pathId.present ? data.pathId.value : this.pathId,
      point: data.point.present ? data.point.value : this.point,
      pointId: data.pointId.present ? data.pointId.value : this.pointId,
      time: data.time.present ? data.time.value : this.time,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_technique_treanings_table';
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
  DriftTechniqueTreaning copyWithCompanion(
      DriftTechniqueTreaningsTableCompanion data) {
    return DriftTechniqueTreaning(
      id: data.id.present ? data.id.value : this.id,
      comment: data.comment.present ? data.comment.value : this.comment,
      date: data.date.present ? data.date.value : this.date,
      finish: data.finish.present ? data.finish.value : this.finish,
      start: data.start.present ? data.start.value : this.start,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_technique_treaning_items_table';
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
  DriftTechniqueTreaningItem copyWithCompanion(
      DriftTechniqueTreaningItemsTableCompanion data) {
    return DriftTechniqueTreaningItem(
      id: data.id.present ? data.id.value : this.id,
      comment: data.comment.present ? data.comment.value : this.comment,
      treaningId:
          data.treaningId.present ? data.treaningId.value : this.treaningId,
      options: data.options.present ? data.options.value : this.options,
      finishTime:
          data.finishTime.present ? data.finishTime.value : this.finishTime,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      group: data.group.present ? data.group.value : this.group,
      technique: data.technique.present ? data.technique.value : this.technique,
      techniqueId:
          data.techniqueId.present ? data.techniqueId.value : this.techniqueId,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_ascensions_table';
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
  DriftAscension copyWithCompanion(DriftAscensionsTableCompanion data) {
    return DriftAscension(
      id: data.id.present ? data.id.value : this.id,
      mountain: data.mountain.present ? data.mountain.value : this.mountain,
      mountainId:
          data.mountainId.present ? data.mountainId.value : this.mountainId,
      routeId: data.routeId.present ? data.routeId.value : this.routeId,
      route: data.route.present ? data.route.value : this.route,
      date: data.date.present ? data.date.value : this.date,
      finish: data.finish.present ? data.finish.value : this.finish,
      start: data.start.present ? data.start.value : this.start,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_ascension_events_table';
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
  DriftAscensionEvent copyWithCompanion(
      DriftAscensionEventsTableCompanion data) {
    return DriftAscensionEvent(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      ascensionId:
          data.ascensionId.present ? data.ascensionId.value : this.ascensionId,
      time: data.time.present ? data.time.value : this.time,
      planedTime:
          data.planedTime.present ? data.planedTime.value : this.planedTime,
    );
  }

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
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
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
        image,
        description,
        currencies,
        status,
        budgetCurrency
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_travels_table';
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
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
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
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
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
  final String image;
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
      required this.image,
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
    map['image'] = Variable<String>(image);
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
      image: Value(image),
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
      image: serializer.fromJson<String>(json['image']),
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
      'image': serializer.toJson<String>(image),
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
          String? image,
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
        image: image ?? this.image,
        description: description ?? this.description,
        currencies: currencies ?? this.currencies,
        status: status ?? this.status,
        budgetCurrency: budgetCurrency ?? this.budgetCurrency,
      );
  DriftTravel copyWithCompanion(DriftTravelsTableCompanion data) {
    return DriftTravel(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      finish: data.finish.present ? data.finish.value : this.finish,
      start: data.start.present ? data.start.value : this.start,
      regions: data.regions.present ? data.regions.value : this.regions,
      name: data.name.present ? data.name.value : this.name,
      image: data.image.present ? data.image.value : this.image,
      description:
          data.description.present ? data.description.value : this.description,
      currencies:
          data.currencies.present ? data.currencies.value : this.currencies,
      status: data.status.present ? data.status.value : this.status,
      budgetCurrency: data.budgetCurrency.present
          ? data.budgetCurrency.value
          : this.budgetCurrency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftTravel(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('regions: $regions, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('description: $description, ')
          ..write('currencies: $currencies, ')
          ..write('status: $status, ')
          ..write('budgetCurrency: $budgetCurrency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, finish, start, regions, name, image,
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
          other.image == this.image &&
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
  final Value<String> image;
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
    this.image = const Value.absent(),
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
    required String image,
    required String description,
    required String currencies,
    required String status,
    required int budgetCurrency,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date),
        regions = Value(regions),
        name = Value(name),
        image = Value(image),
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
    Expression<String>? image,
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
      if (image != null) 'image': image,
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
      Value<String>? image,
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
      image: image ?? this.image,
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
    if (image.present) {
      map['image'] = Variable<String>(image.value);
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
          ..write('image: $image, ')
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
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
        description,
        number,
        transportLines,
        feedingsLines,
        stayLines,
        travelId
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_travel_days_table';
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
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
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
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
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
  final String description;
  final int number;
  final String transportLines;
  final String feedingsLines;
  final String stayLines;
  final String travelId;
  const DriftTravelDay(
      {required this.id,
      required this.date,
      this.start,
      required this.description,
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
    map['description'] = Variable<String>(description);
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
      description: Value(description),
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
      description: serializer.fromJson<String>(json['description']),
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
      'description': serializer.toJson<String>(description),
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
          String? description,
          int? number,
          String? transportLines,
          String? feedingsLines,
          String? stayLines,
          String? travelId}) =>
      DriftTravelDay(
        id: id ?? this.id,
        date: date ?? this.date,
        start: start.present ? start.value : this.start,
        description: description ?? this.description,
        number: number ?? this.number,
        transportLines: transportLines ?? this.transportLines,
        feedingsLines: feedingsLines ?? this.feedingsLines,
        stayLines: stayLines ?? this.stayLines,
        travelId: travelId ?? this.travelId,
      );
  DriftTravelDay copyWithCompanion(DriftTravelDaysTableCompanion data) {
    return DriftTravelDay(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      start: data.start.present ? data.start.value : this.start,
      description:
          data.description.present ? data.description.value : this.description,
      number: data.number.present ? data.number.value : this.number,
      transportLines: data.transportLines.present
          ? data.transportLines.value
          : this.transportLines,
      feedingsLines: data.feedingsLines.present
          ? data.feedingsLines.value
          : this.feedingsLines,
      stayLines: data.stayLines.present ? data.stayLines.value : this.stayLines,
      travelId: data.travelId.present ? data.travelId.value : this.travelId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriftTravelDay(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('start: $start, ')
          ..write('description: $description, ')
          ..write('number: $number, ')
          ..write('transportLines: $transportLines, ')
          ..write('feedingsLines: $feedingsLines, ')
          ..write('stayLines: $stayLines, ')
          ..write('travelId: $travelId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, start, description, number,
      transportLines, feedingsLines, stayLines, travelId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriftTravelDay &&
          other.id == this.id &&
          other.date == this.date &&
          other.start == this.start &&
          other.description == this.description &&
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
  final Value<String> description;
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
    this.description = const Value.absent(),
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
    required String description,
    required int number,
    required String transportLines,
    required String feedingsLines,
    required String stayLines,
    required String travelId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        date = Value(date),
        description = Value(description),
        number = Value(number),
        transportLines = Value(transportLines),
        feedingsLines = Value(feedingsLines),
        stayLines = Value(stayLines),
        travelId = Value(travelId);
  static Insertable<DriftTravelDay> custom({
    Expression<String>? id,
    Expression<DateTime>? date,
    Expression<DateTime>? start,
    Expression<String>? description,
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
      if (description != null) 'description': description,
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
      Value<String>? description,
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
      description: description ?? this.description,
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
    if (description.present) {
      map['description'] = Variable<String>(description.value);
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
          ..write('description: $description, ')
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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_cost_lines_table';
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
  DriftCostLine copyWithCompanion(DriftCostLinesTableCompanion data) {
    return DriftCostLine(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      currency: data.currency.present ? data.currency.value : this.currency,
      travelId: data.travelId.present ? data.travelId.value : this.travelId,
      date: data.date.present ? data.date.value : this.date,
      sum: data.sum.present ? data.sum.value : this.sum,
      budgetSum: data.budgetSum.present ? data.budgetSum.value : this.budgetSum,
      description:
          data.description.present ? data.description.value : this.description,
      incomeExpense: data.incomeExpense.present
          ? data.incomeExpense.value
          : this.incomeExpense,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_budget_lines_table';
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
  DriftBudgetLine copyWithCompanion(DriftBudgetLinesTableCompanion data) {
    return DriftBudgetLine(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      amount: data.amount.present ? data.amount.value : this.amount,
      travelId: data.travelId.present ? data.travelId.value : this.travelId,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

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
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drift_insurance_lines_table';
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
  DriftInsuranceLine copyWithCompanion(DriftInsuranceLinesTableCompanion data) {
    return DriftInsuranceLine(
      id: data.id.present ? data.id.value : this.id,
      number: data.number.present ? data.number.value : this.number,
      travelId: data.travelId.present ? data.travelId.value : this.travelId,
      insurant: data.insurant.present ? data.insurant.value : this.insurant,
      description:
          data.description.present ? data.description.value : this.description,
      insurer: data.insurer.present ? data.insurer.value : this.insurer,
      contacts: data.contacts.present ? data.contacts.value : this.contacts,
    );
  }

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
  $DriftDBLocalDataSourceManager get managers =>
      $DriftDBLocalDataSourceManager(this);
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

typedef $$DriftStrengthExercisesTableTableCreateCompanionBuilder
    = DriftStrengthExercisesTableCompanion Function({
  required int repetitions,
  required String id,
  required String name,
  Value<bool> selected,
  Value<int> rowid,
});
typedef $$DriftStrengthExercisesTableTableUpdateCompanionBuilder
    = DriftStrengthExercisesTableCompanion Function({
  Value<int> repetitions,
  Value<String> id,
  Value<String> name,
  Value<bool> selected,
  Value<int> rowid,
});

final class $$DriftStrengthExercisesTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource,
    $DriftStrengthExercisesTableTable,
    DriftStrengthExercise> {
  $$DriftStrengthExercisesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DriftStrengthTreaningLinesTableTable,
          List<DriftStrengthTreaningLine>>
      _driftStrengthTreaningLinesTableRefsTable(_$DriftDBLocalDataSource db) =>
          MultiTypedResultKey.fromTable(db.driftStrengthTreaningLinesTable,
              aliasName: $_aliasNameGenerator(db.driftStrengthExercisesTable.id,
                  db.driftStrengthTreaningLinesTable.exerciseId));

  $$DriftStrengthTreaningLinesTableTableProcessedTableManager
      get driftStrengthTreaningLinesTableRefs {
    final manager = $$DriftStrengthTreaningLinesTableTableTableManager(
            $_db, $_db.driftStrengthTreaningLinesTable)
        .filter((f) => f.exerciseId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_driftStrengthTreaningLinesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftStrengthExercisesTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftStrengthExercisesTableTable> {
  $$DriftStrengthExercisesTableTableFilterComposer(super.$state);
  ColumnFilters<int> get repetitions => $state.composableBuilder(
      column: $state.table.repetitions,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get selected => $state.composableBuilder(
      column: $state.table.selected,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter driftStrengthTreaningLinesTableRefs(
      ComposableFilter Function(
              $$DriftStrengthTreaningLinesTableTableFilterComposer f)
          f) {
    final $$DriftStrengthTreaningLinesTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftStrengthTreaningLinesTable,
            getReferencedColumn: (t) => t.exerciseId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftStrengthTreaningLinesTableTableFilterComposer(
                    ComposerState(
                        $state.db,
                        $state.db.driftStrengthTreaningLinesTable,
                        joinBuilder,
                        parentComposers)));
    return f(composer);
  }
}

class $$DriftStrengthExercisesTableTableOrderingComposer
    extends OrderingComposer<_$DriftDBLocalDataSource,
        $DriftStrengthExercisesTableTable> {
  $$DriftStrengthExercisesTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get repetitions => $state.composableBuilder(
      column: $state.table.repetitions,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get selected => $state.composableBuilder(
      column: $state.table.selected,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$DriftStrengthExercisesTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftStrengthExercisesTableTable,
    DriftStrengthExercise,
    $$DriftStrengthExercisesTableTableFilterComposer,
    $$DriftStrengthExercisesTableTableOrderingComposer,
    $$DriftStrengthExercisesTableTableCreateCompanionBuilder,
    $$DriftStrengthExercisesTableTableUpdateCompanionBuilder,
    (DriftStrengthExercise, $$DriftStrengthExercisesTableTableReferences),
    DriftStrengthExercise,
    PrefetchHooks Function({bool driftStrengthTreaningLinesTableRefs})> {
  $$DriftStrengthExercisesTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftStrengthExercisesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftStrengthExercisesTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftStrengthExercisesTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> repetitions = const Value.absent(),
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> selected = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftStrengthExercisesTableCompanion(
            repetitions: repetitions,
            id: id,
            name: name,
            selected: selected,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int repetitions,
            required String id,
            required String name,
            Value<bool> selected = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftStrengthExercisesTableCompanion.insert(
            repetitions: repetitions,
            id: id,
            name: name,
            selected: selected,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftStrengthExercisesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {driftStrengthTreaningLinesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftStrengthTreaningLinesTableRefs)
                  db.driftStrengthTreaningLinesTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftStrengthTreaningLinesTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$DriftStrengthExercisesTableTableReferences
                                ._driftStrengthTreaningLinesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftStrengthExercisesTableTableReferences(
                                    db, table, p0)
                                .driftStrengthTreaningLinesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.exerciseId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftStrengthExercisesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftStrengthExercisesTableTable,
        DriftStrengthExercise,
        $$DriftStrengthExercisesTableTableFilterComposer,
        $$DriftStrengthExercisesTableTableOrderingComposer,
        $$DriftStrengthExercisesTableTableCreateCompanionBuilder,
        $$DriftStrengthExercisesTableTableUpdateCompanionBuilder,
        (DriftStrengthExercise, $$DriftStrengthExercisesTableTableReferences),
        DriftStrengthExercise,
        PrefetchHooks Function({bool driftStrengthTreaningLinesTableRefs})>;
typedef $$DriftHallTreaningsTableTableCreateCompanionBuilder
    = DriftHallTreaningsTableCompanion Function({
  required String id,
  required String hallId,
  required DateTime date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  required String climbingHall,
  Value<int> rowid,
});
typedef $$DriftHallTreaningsTableTableUpdateCompanionBuilder
    = DriftHallTreaningsTableCompanion Function({
  Value<String> id,
  Value<String> hallId,
  Value<DateTime> date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<String> climbingHall,
  Value<int> rowid,
});

final class $$DriftHallTreaningsTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource,
    $DriftHallTreaningsTableTable,
    DriftHallTreaning> {
  $$DriftHallTreaningsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DriftHallAttemptsTableTable,
      List<DriftHallAttempt>> _driftHallAttemptsTableRefsTable(
          _$DriftDBLocalDataSource db) =>
      MultiTypedResultKey.fromTable(db.driftHallAttemptsTable,
          aliasName: $_aliasNameGenerator(db.driftHallTreaningsTable.id,
              db.driftHallAttemptsTable.treaningId));

  $$DriftHallAttemptsTableTableProcessedTableManager
      get driftHallAttemptsTableRefs {
    final manager = $$DriftHallAttemptsTableTableTableManager(
            $_db, $_db.driftHallAttemptsTable)
        .filter((f) => f.treaningId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_driftHallAttemptsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftHallTreaningsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftHallTreaningsTableTable> {
  $$DriftHallTreaningsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get hallId => $state.composableBuilder(
      column: $state.table.hallId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get climbingHall => $state.composableBuilder(
      column: $state.table.climbingHall,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter driftHallAttemptsTableRefs(
      ComposableFilter Function($$DriftHallAttemptsTableTableFilterComposer f)
          f) {
    final $$DriftHallAttemptsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftHallAttemptsTable,
            getReferencedColumn: (t) => t.treaningId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftHallAttemptsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftHallAttemptsTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$DriftHallTreaningsTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftHallTreaningsTableTable> {
  $$DriftHallTreaningsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get hallId => $state.composableBuilder(
      column: $state.table.hallId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get climbingHall => $state.composableBuilder(
      column: $state.table.climbingHall,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$DriftHallTreaningsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftHallTreaningsTableTable,
    DriftHallTreaning,
    $$DriftHallTreaningsTableTableFilterComposer,
    $$DriftHallTreaningsTableTableOrderingComposer,
    $$DriftHallTreaningsTableTableCreateCompanionBuilder,
    $$DriftHallTreaningsTableTableUpdateCompanionBuilder,
    (DriftHallTreaning, $$DriftHallTreaningsTableTableReferences),
    DriftHallTreaning,
    PrefetchHooks Function({bool driftHallAttemptsTableRefs})> {
  $$DriftHallTreaningsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftHallTreaningsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftHallTreaningsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftHallTreaningsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> hallId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<String> climbingHall = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftHallTreaningsTableCompanion(
            id: id,
            hallId: hallId,
            date: date,
            finish: finish,
            start: start,
            climbingHall: climbingHall,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String hallId,
            required DateTime date,
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            required String climbingHall,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftHallTreaningsTableCompanion.insert(
            id: id,
            hallId: hallId,
            date: date,
            finish: finish,
            start: start,
            climbingHall: climbingHall,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftHallTreaningsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({driftHallAttemptsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftHallAttemptsTableRefs) db.driftHallAttemptsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftHallAttemptsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$DriftHallTreaningsTableTableReferences
                                ._driftHallAttemptsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftHallTreaningsTableTableReferences(
                                    db, table, p0)
                                .driftHallAttemptsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.treaningId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftHallTreaningsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftHallTreaningsTableTable,
        DriftHallTreaning,
        $$DriftHallTreaningsTableTableFilterComposer,
        $$DriftHallTreaningsTableTableOrderingComposer,
        $$DriftHallTreaningsTableTableCreateCompanionBuilder,
        $$DriftHallTreaningsTableTableUpdateCompanionBuilder,
        (DriftHallTreaning, $$DriftHallTreaningsTableTableReferences),
        DriftHallTreaning,
        PrefetchHooks Function({bool driftHallAttemptsTableRefs})>;
typedef $$DriftHallAttemptsTableTableCreateCompanionBuilder
    = DriftHallAttemptsTableCompanion Function({
  required String id,
  required String treaningId,
  required String category,
  required String style,
  Value<String?> routeId,
  Value<String?> route,
  Value<DateTime?> finishTime,
  Value<DateTime?> startTime,
  Value<String?> ascentType,
  required int suspensionCount,
  required int fallCount,
  required bool downClimbing,
  required bool fail,
  Value<int> rowid,
});
typedef $$DriftHallAttemptsTableTableUpdateCompanionBuilder
    = DriftHallAttemptsTableCompanion Function({
  Value<String> id,
  Value<String> treaningId,
  Value<String> category,
  Value<String> style,
  Value<String?> routeId,
  Value<String?> route,
  Value<DateTime?> finishTime,
  Value<DateTime?> startTime,
  Value<String?> ascentType,
  Value<int> suspensionCount,
  Value<int> fallCount,
  Value<bool> downClimbing,
  Value<bool> fail,
  Value<int> rowid,
});

final class $$DriftHallAttemptsTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource, $DriftHallAttemptsTableTable, DriftHallAttempt> {
  $$DriftHallAttemptsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftHallTreaningsTableTable _treaningIdTable(
          _$DriftDBLocalDataSource db) =>
      db.driftHallTreaningsTable.createAlias($_aliasNameGenerator(
          db.driftHallAttemptsTable.treaningId, db.driftHallTreaningsTable.id));

  $$DriftHallTreaningsTableTableProcessedTableManager? get treaningId {
    if ($_item.treaningId == null) return null;
    final manager = $$DriftHallTreaningsTableTableTableManager(
            $_db, $_db.driftHallTreaningsTable)
        .filter((f) => f.id($_item.treaningId!));
    final item = $_typedResult.readTableOrNull(_treaningIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftHallAttemptsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftHallAttemptsTableTable> {
  $$DriftHallAttemptsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get style => $state.composableBuilder(
      column: $state.table.style,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get routeId => $state.composableBuilder(
      column: $state.table.routeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get route => $state.composableBuilder(
      column: $state.table.route,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finishTime => $state.composableBuilder(
      column: $state.table.finishTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ascentType => $state.composableBuilder(
      column: $state.table.ascentType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get suspensionCount => $state.composableBuilder(
      column: $state.table.suspensionCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fallCount => $state.composableBuilder(
      column: $state.table.fallCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get downClimbing => $state.composableBuilder(
      column: $state.table.downClimbing,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get fail => $state.composableBuilder(
      column: $state.table.fail,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$DriftHallTreaningsTableTableFilterComposer get treaningId {
    final $$DriftHallTreaningsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.treaningId,
            referencedTable: $state.db.driftHallTreaningsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftHallTreaningsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftHallTreaningsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftHallAttemptsTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftHallAttemptsTableTable> {
  $$DriftHallAttemptsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get style => $state.composableBuilder(
      column: $state.table.style,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get routeId => $state.composableBuilder(
      column: $state.table.routeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get route => $state.composableBuilder(
      column: $state.table.route,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finishTime => $state.composableBuilder(
      column: $state.table.finishTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ascentType => $state.composableBuilder(
      column: $state.table.ascentType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get suspensionCount => $state.composableBuilder(
      column: $state.table.suspensionCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fallCount => $state.composableBuilder(
      column: $state.table.fallCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get downClimbing => $state.composableBuilder(
      column: $state.table.downClimbing,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get fail => $state.composableBuilder(
      column: $state.table.fail,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$DriftHallTreaningsTableTableOrderingComposer get treaningId {
    final $$DriftHallTreaningsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.treaningId,
            referencedTable: $state.db.driftHallTreaningsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftHallTreaningsTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.driftHallTreaningsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftHallAttemptsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftHallAttemptsTableTable,
    DriftHallAttempt,
    $$DriftHallAttemptsTableTableFilterComposer,
    $$DriftHallAttemptsTableTableOrderingComposer,
    $$DriftHallAttemptsTableTableCreateCompanionBuilder,
    $$DriftHallAttemptsTableTableUpdateCompanionBuilder,
    (DriftHallAttempt, $$DriftHallAttemptsTableTableReferences),
    DriftHallAttempt,
    PrefetchHooks Function({bool treaningId})> {
  $$DriftHallAttemptsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftHallAttemptsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftHallAttemptsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftHallAttemptsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> treaningId = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> style = const Value.absent(),
            Value<String?> routeId = const Value.absent(),
            Value<String?> route = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<String?> ascentType = const Value.absent(),
            Value<int> suspensionCount = const Value.absent(),
            Value<int> fallCount = const Value.absent(),
            Value<bool> downClimbing = const Value.absent(),
            Value<bool> fail = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftHallAttemptsTableCompanion(
            id: id,
            treaningId: treaningId,
            category: category,
            style: style,
            routeId: routeId,
            route: route,
            finishTime: finishTime,
            startTime: startTime,
            ascentType: ascentType,
            suspensionCount: suspensionCount,
            fallCount: fallCount,
            downClimbing: downClimbing,
            fail: fail,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String treaningId,
            required String category,
            required String style,
            Value<String?> routeId = const Value.absent(),
            Value<String?> route = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<String?> ascentType = const Value.absent(),
            required int suspensionCount,
            required int fallCount,
            required bool downClimbing,
            required bool fail,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftHallAttemptsTableCompanion.insert(
            id: id,
            treaningId: treaningId,
            category: category,
            style: style,
            routeId: routeId,
            route: route,
            finishTime: finishTime,
            startTime: startTime,
            ascentType: ascentType,
            suspensionCount: suspensionCount,
            fallCount: fallCount,
            downClimbing: downClimbing,
            fail: fail,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftHallAttemptsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({treaningId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treaningId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treaningId,
                    referencedTable: $$DriftHallAttemptsTableTableReferences
                        ._treaningIdTable(db),
                    referencedColumn: $$DriftHallAttemptsTableTableReferences
                        ._treaningIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftHallAttemptsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftHallAttemptsTableTable,
        DriftHallAttempt,
        $$DriftHallAttemptsTableTableFilterComposer,
        $$DriftHallAttemptsTableTableOrderingComposer,
        $$DriftHallAttemptsTableTableCreateCompanionBuilder,
        $$DriftHallAttemptsTableTableUpdateCompanionBuilder,
        (DriftHallAttempt, $$DriftHallAttemptsTableTableReferences),
        DriftHallAttempt,
        PrefetchHooks Function({bool treaningId})>;
typedef $$DriftCardioTreaningsTableTableCreateCompanionBuilder
    = DriftCardioTreaningsTableCompanion Function({
  required String id,
  required String exercise,
  required DateTime date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  required int duration,
  required double length,
  Value<int> rowid,
});
typedef $$DriftCardioTreaningsTableTableUpdateCompanionBuilder
    = DriftCardioTreaningsTableCompanion Function({
  Value<String> id,
  Value<String> exercise,
  Value<DateTime> date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<int> duration,
  Value<double> length,
  Value<int> rowid,
});

class $$DriftCardioTreaningsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftCardioTreaningsTableTable> {
  $$DriftCardioTreaningsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get exercise => $state.composableBuilder(
      column: $state.table.exercise,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get duration => $state.composableBuilder(
      column: $state.table.duration,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get length => $state.composableBuilder(
      column: $state.table.length,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$DriftCardioTreaningsTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftCardioTreaningsTableTable> {
  $$DriftCardioTreaningsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get exercise => $state.composableBuilder(
      column: $state.table.exercise,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get duration => $state.composableBuilder(
      column: $state.table.duration,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get length => $state.composableBuilder(
      column: $state.table.length,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$DriftCardioTreaningsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftCardioTreaningsTableTable,
    DriftCardioTreanings,
    $$DriftCardioTreaningsTableTableFilterComposer,
    $$DriftCardioTreaningsTableTableOrderingComposer,
    $$DriftCardioTreaningsTableTableCreateCompanionBuilder,
    $$DriftCardioTreaningsTableTableUpdateCompanionBuilder,
    (
      DriftCardioTreanings,
      BaseReferences<_$DriftDBLocalDataSource, $DriftCardioTreaningsTableTable,
          DriftCardioTreanings>
    ),
    DriftCardioTreanings,
    PrefetchHooks Function()> {
  $$DriftCardioTreaningsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftCardioTreaningsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftCardioTreaningsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftCardioTreaningsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> exercise = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<int> duration = const Value.absent(),
            Value<double> length = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftCardioTreaningsTableCompanion(
            id: id,
            exercise: exercise,
            date: date,
            finish: finish,
            start: start,
            duration: duration,
            length: length,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String exercise,
            required DateTime date,
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            required int duration,
            required double length,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftCardioTreaningsTableCompanion.insert(
            id: id,
            exercise: exercise,
            date: date,
            finish: finish,
            start: start,
            duration: duration,
            length: length,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DriftCardioTreaningsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftCardioTreaningsTableTable,
        DriftCardioTreanings,
        $$DriftCardioTreaningsTableTableFilterComposer,
        $$DriftCardioTreaningsTableTableOrderingComposer,
        $$DriftCardioTreaningsTableTableCreateCompanionBuilder,
        $$DriftCardioTreaningsTableTableUpdateCompanionBuilder,
        (
          DriftCardioTreanings,
          BaseReferences<_$DriftDBLocalDataSource,
              $DriftCardioTreaningsTableTable, DriftCardioTreanings>
        ),
        DriftCardioTreanings,
        PrefetchHooks Function()>;
typedef $$DriftStrengthTreaningsTableTableCreateCompanionBuilder
    = DriftStrengthTreaningsTableCompanion Function({
  required String id,
  required DateTime date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<int> rowid,
});
typedef $$DriftStrengthTreaningsTableTableUpdateCompanionBuilder
    = DriftStrengthTreaningsTableCompanion Function({
  Value<String> id,
  Value<DateTime> date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<int> rowid,
});

final class $$DriftStrengthTreaningsTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource,
    $DriftStrengthTreaningsTableTable,
    DriftStrengthTreaning> {
  $$DriftStrengthTreaningsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DriftStrengthTreaningLinesTableTable,
          List<DriftStrengthTreaningLine>>
      _driftStrengthTreaningLinesTableRefsTable(_$DriftDBLocalDataSource db) =>
          MultiTypedResultKey.fromTable(db.driftStrengthTreaningLinesTable,
              aliasName: $_aliasNameGenerator(db.driftStrengthTreaningsTable.id,
                  db.driftStrengthTreaningLinesTable.treaningId));

  $$DriftStrengthTreaningLinesTableTableProcessedTableManager
      get driftStrengthTreaningLinesTableRefs {
    final manager = $$DriftStrengthTreaningLinesTableTableTableManager(
            $_db, $_db.driftStrengthTreaningLinesTable)
        .filter((f) => f.treaningId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_driftStrengthTreaningLinesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftStrengthTreaningsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftStrengthTreaningsTableTable> {
  $$DriftStrengthTreaningsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter driftStrengthTreaningLinesTableRefs(
      ComposableFilter Function(
              $$DriftStrengthTreaningLinesTableTableFilterComposer f)
          f) {
    final $$DriftStrengthTreaningLinesTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftStrengthTreaningLinesTable,
            getReferencedColumn: (t) => t.treaningId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftStrengthTreaningLinesTableTableFilterComposer(
                    ComposerState(
                        $state.db,
                        $state.db.driftStrengthTreaningLinesTable,
                        joinBuilder,
                        parentComposers)));
    return f(composer);
  }
}

class $$DriftStrengthTreaningsTableTableOrderingComposer
    extends OrderingComposer<_$DriftDBLocalDataSource,
        $DriftStrengthTreaningsTableTable> {
  $$DriftStrengthTreaningsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$DriftStrengthTreaningsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftStrengthTreaningsTableTable,
    DriftStrengthTreaning,
    $$DriftStrengthTreaningsTableTableFilterComposer,
    $$DriftStrengthTreaningsTableTableOrderingComposer,
    $$DriftStrengthTreaningsTableTableCreateCompanionBuilder,
    $$DriftStrengthTreaningsTableTableUpdateCompanionBuilder,
    (DriftStrengthTreaning, $$DriftStrengthTreaningsTableTableReferences),
    DriftStrengthTreaning,
    PrefetchHooks Function({bool driftStrengthTreaningLinesTableRefs})> {
  $$DriftStrengthTreaningsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftStrengthTreaningsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftStrengthTreaningsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftStrengthTreaningsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftStrengthTreaningsTableCompanion(
            id: id,
            date: date,
            finish: finish,
            start: start,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime date,
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftStrengthTreaningsTableCompanion.insert(
            id: id,
            date: date,
            finish: finish,
            start: start,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftStrengthTreaningsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {driftStrengthTreaningLinesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftStrengthTreaningLinesTableRefs)
                  db.driftStrengthTreaningLinesTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftStrengthTreaningLinesTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$DriftStrengthTreaningsTableTableReferences
                                ._driftStrengthTreaningLinesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftStrengthTreaningsTableTableReferences(
                                    db, table, p0)
                                .driftStrengthTreaningLinesTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.treaningId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftStrengthTreaningsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftStrengthTreaningsTableTable,
        DriftStrengthTreaning,
        $$DriftStrengthTreaningsTableTableFilterComposer,
        $$DriftStrengthTreaningsTableTableOrderingComposer,
        $$DriftStrengthTreaningsTableTableCreateCompanionBuilder,
        $$DriftStrengthTreaningsTableTableUpdateCompanionBuilder,
        (DriftStrengthTreaning, $$DriftStrengthTreaningsTableTableReferences),
        DriftStrengthTreaning,
        PrefetchHooks Function({bool driftStrengthTreaningLinesTableRefs})>;
typedef $$DriftStrengthTreaningLinesTableTableCreateCompanionBuilder
    = DriftStrengthTreaningLinesTableCompanion Function({
  required String id,
  required String repetitions,
  required String treaningId,
  required String exercise,
  required String exerciseId,
  Value<int> rowid,
});
typedef $$DriftStrengthTreaningLinesTableTableUpdateCompanionBuilder
    = DriftStrengthTreaningLinesTableCompanion Function({
  Value<String> id,
  Value<String> repetitions,
  Value<String> treaningId,
  Value<String> exercise,
  Value<String> exerciseId,
  Value<int> rowid,
});

final class $$DriftStrengthTreaningLinesTableTableReferences
    extends BaseReferences<_$DriftDBLocalDataSource,
        $DriftStrengthTreaningLinesTableTable, DriftStrengthTreaningLine> {
  $$DriftStrengthTreaningLinesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftStrengthTreaningsTableTable _treaningIdTable(
          _$DriftDBLocalDataSource db) =>
      db.driftStrengthTreaningsTable.createAlias($_aliasNameGenerator(
          db.driftStrengthTreaningLinesTable.treaningId,
          db.driftStrengthTreaningsTable.id));

  $$DriftStrengthTreaningsTableTableProcessedTableManager? get treaningId {
    if ($_item.treaningId == null) return null;
    final manager = $$DriftStrengthTreaningsTableTableTableManager(
            $_db, $_db.driftStrengthTreaningsTable)
        .filter((f) => f.id($_item.treaningId!));
    final item = $_typedResult.readTableOrNull(_treaningIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DriftStrengthExercisesTableTable _exerciseIdTable(
          _$DriftDBLocalDataSource db) =>
      db.driftStrengthExercisesTable.createAlias($_aliasNameGenerator(
          db.driftStrengthTreaningLinesTable.exerciseId,
          db.driftStrengthExercisesTable.id));

  $$DriftStrengthExercisesTableTableProcessedTableManager? get exerciseId {
    if ($_item.exerciseId == null) return null;
    final manager = $$DriftStrengthExercisesTableTableTableManager(
            $_db, $_db.driftStrengthExercisesTable)
        .filter((f) => f.id($_item.exerciseId!));
    final item = $_typedResult.readTableOrNull(_exerciseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftStrengthTreaningLinesTableTableFilterComposer
    extends FilterComposer<_$DriftDBLocalDataSource,
        $DriftStrengthTreaningLinesTableTable> {
  $$DriftStrengthTreaningLinesTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get repetitions => $state.composableBuilder(
      column: $state.table.repetitions,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get exercise => $state.composableBuilder(
      column: $state.table.exercise,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$DriftStrengthTreaningsTableTableFilterComposer get treaningId {
    final $$DriftStrengthTreaningsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.treaningId,
            referencedTable: $state.db.driftStrengthTreaningsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftStrengthTreaningsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftStrengthTreaningsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }

  $$DriftStrengthExercisesTableTableFilterComposer get exerciseId {
    final $$DriftStrengthExercisesTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.exerciseId,
            referencedTable: $state.db.driftStrengthExercisesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftStrengthExercisesTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftStrengthExercisesTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftStrengthTreaningLinesTableTableOrderingComposer
    extends OrderingComposer<_$DriftDBLocalDataSource,
        $DriftStrengthTreaningLinesTableTable> {
  $$DriftStrengthTreaningLinesTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get repetitions => $state.composableBuilder(
      column: $state.table.repetitions,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get exercise => $state.composableBuilder(
      column: $state.table.exercise,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$DriftStrengthTreaningsTableTableOrderingComposer get treaningId {
    final $$DriftStrengthTreaningsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.treaningId,
            referencedTable: $state.db.driftStrengthTreaningsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftStrengthTreaningsTableTableOrderingComposer(
                    ComposerState(
                        $state.db,
                        $state.db.driftStrengthTreaningsTable,
                        joinBuilder,
                        parentComposers)));
    return composer;
  }

  $$DriftStrengthExercisesTableTableOrderingComposer get exerciseId {
    final $$DriftStrengthExercisesTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.exerciseId,
            referencedTable: $state.db.driftStrengthExercisesTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftStrengthExercisesTableTableOrderingComposer(
                    ComposerState(
                        $state.db,
                        $state.db.driftStrengthExercisesTable,
                        joinBuilder,
                        parentComposers)));
    return composer;
  }
}

class $$DriftStrengthTreaningLinesTableTableTableManager
    extends RootTableManager<
        _$DriftDBLocalDataSource,
        $DriftStrengthTreaningLinesTableTable,
        DriftStrengthTreaningLine,
        $$DriftStrengthTreaningLinesTableTableFilterComposer,
        $$DriftStrengthTreaningLinesTableTableOrderingComposer,
        $$DriftStrengthTreaningLinesTableTableCreateCompanionBuilder,
        $$DriftStrengthTreaningLinesTableTableUpdateCompanionBuilder,
        (
          DriftStrengthTreaningLine,
          $$DriftStrengthTreaningLinesTableTableReferences
        ),
        DriftStrengthTreaningLine,
        PrefetchHooks Function({bool treaningId, bool exerciseId})> {
  $$DriftStrengthTreaningLinesTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftStrengthTreaningLinesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DriftStrengthTreaningLinesTableTableFilterComposer(
                  ComposerState(db, table)),
          orderingComposer:
              $$DriftStrengthTreaningLinesTableTableOrderingComposer(
                  ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> repetitions = const Value.absent(),
            Value<String> treaningId = const Value.absent(),
            Value<String> exercise = const Value.absent(),
            Value<String> exerciseId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftStrengthTreaningLinesTableCompanion(
            id: id,
            repetitions: repetitions,
            treaningId: treaningId,
            exercise: exercise,
            exerciseId: exerciseId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String repetitions,
            required String treaningId,
            required String exercise,
            required String exerciseId,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftStrengthTreaningLinesTableCompanion.insert(
            id: id,
            repetitions: repetitions,
            treaningId: treaningId,
            exercise: exercise,
            exerciseId: exerciseId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftStrengthTreaningLinesTableTableReferences(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({treaningId = false, exerciseId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treaningId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treaningId,
                    referencedTable:
                        $$DriftStrengthTreaningLinesTableTableReferences
                            ._treaningIdTable(db),
                    referencedColumn:
                        $$DriftStrengthTreaningLinesTableTableReferences
                            ._treaningIdTable(db)
                            .id,
                  ) as T;
                }
                if (exerciseId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.exerciseId,
                    referencedTable:
                        $$DriftStrengthTreaningLinesTableTableReferences
                            ._exerciseIdTable(db),
                    referencedColumn:
                        $$DriftStrengthTreaningLinesTableTableReferences
                            ._exerciseIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftStrengthTreaningLinesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftStrengthTreaningLinesTableTable,
        DriftStrengthTreaningLine,
        $$DriftStrengthTreaningLinesTableTableFilterComposer,
        $$DriftStrengthTreaningLinesTableTableOrderingComposer,
        $$DriftStrengthTreaningLinesTableTableCreateCompanionBuilder,
        $$DriftStrengthTreaningLinesTableTableUpdateCompanionBuilder,
        (
          DriftStrengthTreaningLine,
          $$DriftStrengthTreaningLinesTableTableReferences
        ),
        DriftStrengthTreaningLine,
        PrefetchHooks Function({bool treaningId, bool exerciseId})>;
typedef $$DriftIceTreaningsTableTableCreateCompanionBuilder
    = DriftIceTreaningsTableCompanion Function({
  required String id,
  required String district,
  required String districtId,
  required DateTime date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<String?> sectors,
  Value<int> rowid,
});
typedef $$DriftIceTreaningsTableTableUpdateCompanionBuilder
    = DriftIceTreaningsTableCompanion Function({
  Value<String> id,
  Value<String> district,
  Value<String> districtId,
  Value<DateTime> date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<String?> sectors,
  Value<int> rowid,
});

final class $$DriftIceTreaningsTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource, $DriftIceTreaningsTableTable, DriftIceTreanings> {
  $$DriftIceTreaningsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DriftIceAttemptsTableTable, List<DriftIceAttempt>>
      _driftIceAttemptsTableRefsTable(_$DriftDBLocalDataSource db) =>
          MultiTypedResultKey.fromTable(db.driftIceAttemptsTable,
              aliasName: $_aliasNameGenerator(db.driftIceTreaningsTable.id,
                  db.driftIceAttemptsTable.treaningId));

  $$DriftIceAttemptsTableTableProcessedTableManager
      get driftIceAttemptsTableRefs {
    final manager = $$DriftIceAttemptsTableTableTableManager(
            $_db, $_db.driftIceAttemptsTable)
        .filter((f) => f.treaningId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_driftIceAttemptsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftIceTreaningsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftIceTreaningsTableTable> {
  $$DriftIceTreaningsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get district => $state.composableBuilder(
      column: $state.table.district,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get districtId => $state.composableBuilder(
      column: $state.table.districtId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sectors => $state.composableBuilder(
      column: $state.table.sectors,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter driftIceAttemptsTableRefs(
      ComposableFilter Function($$DriftIceAttemptsTableTableFilterComposer f)
          f) {
    final $$DriftIceAttemptsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftIceAttemptsTable,
            getReferencedColumn: (t) => t.treaningId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftIceAttemptsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftIceAttemptsTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$DriftIceTreaningsTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftIceTreaningsTableTable> {
  $$DriftIceTreaningsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get district => $state.composableBuilder(
      column: $state.table.district,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get districtId => $state.composableBuilder(
      column: $state.table.districtId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sectors => $state.composableBuilder(
      column: $state.table.sectors,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$DriftIceTreaningsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftIceTreaningsTableTable,
    DriftIceTreanings,
    $$DriftIceTreaningsTableTableFilterComposer,
    $$DriftIceTreaningsTableTableOrderingComposer,
    $$DriftIceTreaningsTableTableCreateCompanionBuilder,
    $$DriftIceTreaningsTableTableUpdateCompanionBuilder,
    (DriftIceTreanings, $$DriftIceTreaningsTableTableReferences),
    DriftIceTreanings,
    PrefetchHooks Function({bool driftIceAttemptsTableRefs})> {
  $$DriftIceTreaningsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftIceTreaningsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftIceTreaningsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftIceTreaningsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> district = const Value.absent(),
            Value<String> districtId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<String?> sectors = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftIceTreaningsTableCompanion(
            id: id,
            district: district,
            districtId: districtId,
            date: date,
            finish: finish,
            start: start,
            sectors: sectors,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String district,
            required String districtId,
            required DateTime date,
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<String?> sectors = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftIceTreaningsTableCompanion.insert(
            id: id,
            district: district,
            districtId: districtId,
            date: date,
            finish: finish,
            start: start,
            sectors: sectors,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftIceTreaningsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({driftIceAttemptsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftIceAttemptsTableRefs) db.driftIceAttemptsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftIceAttemptsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$DriftIceTreaningsTableTableReferences
                            ._driftIceAttemptsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftIceTreaningsTableTableReferences(
                                    db, table, p0)
                                .driftIceAttemptsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.treaningId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftIceTreaningsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftIceTreaningsTableTable,
        DriftIceTreanings,
        $$DriftIceTreaningsTableTableFilterComposer,
        $$DriftIceTreaningsTableTableOrderingComposer,
        $$DriftIceTreaningsTableTableCreateCompanionBuilder,
        $$DriftIceTreaningsTableTableUpdateCompanionBuilder,
        (DriftIceTreanings, $$DriftIceTreaningsTableTableReferences),
        DriftIceTreanings,
        PrefetchHooks Function({bool driftIceAttemptsTableRefs})>;
typedef $$DriftIceAttemptsTableTableCreateCompanionBuilder
    = DriftIceAttemptsTableCompanion Function({
  required String id,
  required String sector,
  required String sectorId,
  required String treaningId,
  required String category,
  required String style,
  Value<DateTime?> finishTime,
  Value<DateTime?> startTime,
  Value<int?> wayLength,
  required int suspensionCount,
  required int fallCount,
  required bool downClimbing,
  required bool fail,
  required bool installedIceScrews,
  required int iceScrewsCount,
  required int toolsCount,
  Value<int> rowid,
});
typedef $$DriftIceAttemptsTableTableUpdateCompanionBuilder
    = DriftIceAttemptsTableCompanion Function({
  Value<String> id,
  Value<String> sector,
  Value<String> sectorId,
  Value<String> treaningId,
  Value<String> category,
  Value<String> style,
  Value<DateTime?> finishTime,
  Value<DateTime?> startTime,
  Value<int?> wayLength,
  Value<int> suspensionCount,
  Value<int> fallCount,
  Value<bool> downClimbing,
  Value<bool> fail,
  Value<bool> installedIceScrews,
  Value<int> iceScrewsCount,
  Value<int> toolsCount,
  Value<int> rowid,
});

final class $$DriftIceAttemptsTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource, $DriftIceAttemptsTableTable, DriftIceAttempt> {
  $$DriftIceAttemptsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftIceTreaningsTableTable _treaningIdTable(
          _$DriftDBLocalDataSource db) =>
      db.driftIceTreaningsTable.createAlias($_aliasNameGenerator(
          db.driftIceAttemptsTable.treaningId, db.driftIceTreaningsTable.id));

  $$DriftIceTreaningsTableTableProcessedTableManager? get treaningId {
    if ($_item.treaningId == null) return null;
    final manager = $$DriftIceTreaningsTableTableTableManager(
            $_db, $_db.driftIceTreaningsTable)
        .filter((f) => f.id($_item.treaningId!));
    final item = $_typedResult.readTableOrNull(_treaningIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftIceAttemptsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftIceAttemptsTableTable> {
  $$DriftIceAttemptsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sector => $state.composableBuilder(
      column: $state.table.sector,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sectorId => $state.composableBuilder(
      column: $state.table.sectorId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get style => $state.composableBuilder(
      column: $state.table.style,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finishTime => $state.composableBuilder(
      column: $state.table.finishTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get wayLength => $state.composableBuilder(
      column: $state.table.wayLength,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get suspensionCount => $state.composableBuilder(
      column: $state.table.suspensionCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fallCount => $state.composableBuilder(
      column: $state.table.fallCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get downClimbing => $state.composableBuilder(
      column: $state.table.downClimbing,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get fail => $state.composableBuilder(
      column: $state.table.fail,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get installedIceScrews => $state.composableBuilder(
      column: $state.table.installedIceScrews,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get iceScrewsCount => $state.composableBuilder(
      column: $state.table.iceScrewsCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get toolsCount => $state.composableBuilder(
      column: $state.table.toolsCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$DriftIceTreaningsTableTableFilterComposer get treaningId {
    final $$DriftIceTreaningsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.treaningId,
            referencedTable: $state.db.driftIceTreaningsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftIceTreaningsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftIceTreaningsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftIceAttemptsTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftIceAttemptsTableTable> {
  $$DriftIceAttemptsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sector => $state.composableBuilder(
      column: $state.table.sector,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sectorId => $state.composableBuilder(
      column: $state.table.sectorId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get style => $state.composableBuilder(
      column: $state.table.style,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finishTime => $state.composableBuilder(
      column: $state.table.finishTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get wayLength => $state.composableBuilder(
      column: $state.table.wayLength,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get suspensionCount => $state.composableBuilder(
      column: $state.table.suspensionCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fallCount => $state.composableBuilder(
      column: $state.table.fallCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get downClimbing => $state.composableBuilder(
      column: $state.table.downClimbing,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get fail => $state.composableBuilder(
      column: $state.table.fail,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get installedIceScrews => $state.composableBuilder(
      column: $state.table.installedIceScrews,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get iceScrewsCount => $state.composableBuilder(
      column: $state.table.iceScrewsCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get toolsCount => $state.composableBuilder(
      column: $state.table.toolsCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$DriftIceTreaningsTableTableOrderingComposer get treaningId {
    final $$DriftIceTreaningsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.treaningId,
            referencedTable: $state.db.driftIceTreaningsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftIceTreaningsTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.driftIceTreaningsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftIceAttemptsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftIceAttemptsTableTable,
    DriftIceAttempt,
    $$DriftIceAttemptsTableTableFilterComposer,
    $$DriftIceAttemptsTableTableOrderingComposer,
    $$DriftIceAttemptsTableTableCreateCompanionBuilder,
    $$DriftIceAttemptsTableTableUpdateCompanionBuilder,
    (DriftIceAttempt, $$DriftIceAttemptsTableTableReferences),
    DriftIceAttempt,
    PrefetchHooks Function({bool treaningId})> {
  $$DriftIceAttemptsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftIceAttemptsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftIceAttemptsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftIceAttemptsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> sector = const Value.absent(),
            Value<String> sectorId = const Value.absent(),
            Value<String> treaningId = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> style = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<int?> wayLength = const Value.absent(),
            Value<int> suspensionCount = const Value.absent(),
            Value<int> fallCount = const Value.absent(),
            Value<bool> downClimbing = const Value.absent(),
            Value<bool> fail = const Value.absent(),
            Value<bool> installedIceScrews = const Value.absent(),
            Value<int> iceScrewsCount = const Value.absent(),
            Value<int> toolsCount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftIceAttemptsTableCompanion(
            id: id,
            sector: sector,
            sectorId: sectorId,
            treaningId: treaningId,
            category: category,
            style: style,
            finishTime: finishTime,
            startTime: startTime,
            wayLength: wayLength,
            suspensionCount: suspensionCount,
            fallCount: fallCount,
            downClimbing: downClimbing,
            fail: fail,
            installedIceScrews: installedIceScrews,
            iceScrewsCount: iceScrewsCount,
            toolsCount: toolsCount,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String sector,
            required String sectorId,
            required String treaningId,
            required String category,
            required String style,
            Value<DateTime?> finishTime = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<int?> wayLength = const Value.absent(),
            required int suspensionCount,
            required int fallCount,
            required bool downClimbing,
            required bool fail,
            required bool installedIceScrews,
            required int iceScrewsCount,
            required int toolsCount,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftIceAttemptsTableCompanion.insert(
            id: id,
            sector: sector,
            sectorId: sectorId,
            treaningId: treaningId,
            category: category,
            style: style,
            finishTime: finishTime,
            startTime: startTime,
            wayLength: wayLength,
            suspensionCount: suspensionCount,
            fallCount: fallCount,
            downClimbing: downClimbing,
            fail: fail,
            installedIceScrews: installedIceScrews,
            iceScrewsCount: iceScrewsCount,
            toolsCount: toolsCount,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftIceAttemptsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({treaningId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treaningId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treaningId,
                    referencedTable: $$DriftIceAttemptsTableTableReferences
                        ._treaningIdTable(db),
                    referencedColumn: $$DriftIceAttemptsTableTableReferences
                        ._treaningIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftIceAttemptsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftIceAttemptsTableTable,
        DriftIceAttempt,
        $$DriftIceAttemptsTableTableFilterComposer,
        $$DriftIceAttemptsTableTableOrderingComposer,
        $$DriftIceAttemptsTableTableCreateCompanionBuilder,
        $$DriftIceAttemptsTableTableUpdateCompanionBuilder,
        (DriftIceAttempt, $$DriftIceAttemptsTableTableReferences),
        DriftIceAttempt,
        PrefetchHooks Function({bool treaningId})>;
typedef $$DriftRockTreaningsTableTableCreateCompanionBuilder
    = DriftRockTreaningsTableCompanion Function({
  required String id,
  required String districtId,
  required String district,
  required DateTime date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<String?> sectors,
  Value<int> rowid,
});
typedef $$DriftRockTreaningsTableTableUpdateCompanionBuilder
    = DriftRockTreaningsTableCompanion Function({
  Value<String> id,
  Value<String> districtId,
  Value<String> district,
  Value<DateTime> date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<String?> sectors,
  Value<int> rowid,
});

final class $$DriftRockTreaningsTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource,
    $DriftRockTreaningsTableTable,
    DriftRockTreanings> {
  $$DriftRockTreaningsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DriftRockAttemptsTableTable,
      List<DriftRockAttempt>> _driftRockAttemptsTableRefsTable(
          _$DriftDBLocalDataSource db) =>
      MultiTypedResultKey.fromTable(db.driftRockAttemptsTable,
          aliasName: $_aliasNameGenerator(db.driftRockTreaningsTable.id,
              db.driftRockAttemptsTable.treaningId));

  $$DriftRockAttemptsTableTableProcessedTableManager
      get driftRockAttemptsTableRefs {
    final manager = $$DriftRockAttemptsTableTableTableManager(
            $_db, $_db.driftRockAttemptsTable)
        .filter((f) => f.treaningId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_driftRockAttemptsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftRockTreaningsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftRockTreaningsTableTable> {
  $$DriftRockTreaningsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get districtId => $state.composableBuilder(
      column: $state.table.districtId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get district => $state.composableBuilder(
      column: $state.table.district,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sectors => $state.composableBuilder(
      column: $state.table.sectors,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter driftRockAttemptsTableRefs(
      ComposableFilter Function($$DriftRockAttemptsTableTableFilterComposer f)
          f) {
    final $$DriftRockAttemptsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftRockAttemptsTable,
            getReferencedColumn: (t) => t.treaningId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftRockAttemptsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftRockAttemptsTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$DriftRockTreaningsTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftRockTreaningsTableTable> {
  $$DriftRockTreaningsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get districtId => $state.composableBuilder(
      column: $state.table.districtId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get district => $state.composableBuilder(
      column: $state.table.district,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sectors => $state.composableBuilder(
      column: $state.table.sectors,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$DriftRockTreaningsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftRockTreaningsTableTable,
    DriftRockTreanings,
    $$DriftRockTreaningsTableTableFilterComposer,
    $$DriftRockTreaningsTableTableOrderingComposer,
    $$DriftRockTreaningsTableTableCreateCompanionBuilder,
    $$DriftRockTreaningsTableTableUpdateCompanionBuilder,
    (DriftRockTreanings, $$DriftRockTreaningsTableTableReferences),
    DriftRockTreanings,
    PrefetchHooks Function({bool driftRockAttemptsTableRefs})> {
  $$DriftRockTreaningsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftRockTreaningsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftRockTreaningsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftRockTreaningsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> districtId = const Value.absent(),
            Value<String> district = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<String?> sectors = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftRockTreaningsTableCompanion(
            id: id,
            districtId: districtId,
            district: district,
            date: date,
            finish: finish,
            start: start,
            sectors: sectors,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String districtId,
            required String district,
            required DateTime date,
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<String?> sectors = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftRockTreaningsTableCompanion.insert(
            id: id,
            districtId: districtId,
            district: district,
            date: date,
            finish: finish,
            start: start,
            sectors: sectors,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftRockTreaningsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({driftRockAttemptsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftRockAttemptsTableRefs) db.driftRockAttemptsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftRockAttemptsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$DriftRockTreaningsTableTableReferences
                                ._driftRockAttemptsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftRockTreaningsTableTableReferences(
                                    db, table, p0)
                                .driftRockAttemptsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.treaningId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftRockTreaningsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftRockTreaningsTableTable,
        DriftRockTreanings,
        $$DriftRockTreaningsTableTableFilterComposer,
        $$DriftRockTreaningsTableTableOrderingComposer,
        $$DriftRockTreaningsTableTableCreateCompanionBuilder,
        $$DriftRockTreaningsTableTableUpdateCompanionBuilder,
        (DriftRockTreanings, $$DriftRockTreaningsTableTableReferences),
        DriftRockTreanings,
        PrefetchHooks Function({bool driftRockAttemptsTableRefs})>;
typedef $$DriftRockAttemptsTableTableCreateCompanionBuilder
    = DriftRockAttemptsTableCompanion Function({
  required String id,
  required String sector,
  required String sectorId,
  required String treaningId,
  required String category,
  Value<String?> route,
  Value<String?> routeId,
  required String style,
  Value<DateTime?> finishTime,
  Value<DateTime?> startTime,
  required int suspensionCount,
  required int fallCount,
  required bool downClimbing,
  required bool fail,
  Value<String?> ascentType,
  Value<int> rowid,
});
typedef $$DriftRockAttemptsTableTableUpdateCompanionBuilder
    = DriftRockAttemptsTableCompanion Function({
  Value<String> id,
  Value<String> sector,
  Value<String> sectorId,
  Value<String> treaningId,
  Value<String> category,
  Value<String?> route,
  Value<String?> routeId,
  Value<String> style,
  Value<DateTime?> finishTime,
  Value<DateTime?> startTime,
  Value<int> suspensionCount,
  Value<int> fallCount,
  Value<bool> downClimbing,
  Value<bool> fail,
  Value<String?> ascentType,
  Value<int> rowid,
});

final class $$DriftRockAttemptsTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource, $DriftRockAttemptsTableTable, DriftRockAttempt> {
  $$DriftRockAttemptsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftRockTreaningsTableTable _treaningIdTable(
          _$DriftDBLocalDataSource db) =>
      db.driftRockTreaningsTable.createAlias($_aliasNameGenerator(
          db.driftRockAttemptsTable.treaningId, db.driftRockTreaningsTable.id));

  $$DriftRockTreaningsTableTableProcessedTableManager? get treaningId {
    if ($_item.treaningId == null) return null;
    final manager = $$DriftRockTreaningsTableTableTableManager(
            $_db, $_db.driftRockTreaningsTable)
        .filter((f) => f.id($_item.treaningId!));
    final item = $_typedResult.readTableOrNull(_treaningIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftRockAttemptsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftRockAttemptsTableTable> {
  $$DriftRockAttemptsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sector => $state.composableBuilder(
      column: $state.table.sector,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sectorId => $state.composableBuilder(
      column: $state.table.sectorId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get route => $state.composableBuilder(
      column: $state.table.route,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get routeId => $state.composableBuilder(
      column: $state.table.routeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get style => $state.composableBuilder(
      column: $state.table.style,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finishTime => $state.composableBuilder(
      column: $state.table.finishTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get suspensionCount => $state.composableBuilder(
      column: $state.table.suspensionCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get fallCount => $state.composableBuilder(
      column: $state.table.fallCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get downClimbing => $state.composableBuilder(
      column: $state.table.downClimbing,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get fail => $state.composableBuilder(
      column: $state.table.fail,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ascentType => $state.composableBuilder(
      column: $state.table.ascentType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$DriftRockTreaningsTableTableFilterComposer get treaningId {
    final $$DriftRockTreaningsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.treaningId,
            referencedTable: $state.db.driftRockTreaningsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftRockTreaningsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftRockTreaningsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftRockAttemptsTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftRockAttemptsTableTable> {
  $$DriftRockAttemptsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sector => $state.composableBuilder(
      column: $state.table.sector,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sectorId => $state.composableBuilder(
      column: $state.table.sectorId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get category => $state.composableBuilder(
      column: $state.table.category,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get route => $state.composableBuilder(
      column: $state.table.route,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get routeId => $state.composableBuilder(
      column: $state.table.routeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get style => $state.composableBuilder(
      column: $state.table.style,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finishTime => $state.composableBuilder(
      column: $state.table.finishTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get suspensionCount => $state.composableBuilder(
      column: $state.table.suspensionCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get fallCount => $state.composableBuilder(
      column: $state.table.fallCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get downClimbing => $state.composableBuilder(
      column: $state.table.downClimbing,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get fail => $state.composableBuilder(
      column: $state.table.fail,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ascentType => $state.composableBuilder(
      column: $state.table.ascentType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$DriftRockTreaningsTableTableOrderingComposer get treaningId {
    final $$DriftRockTreaningsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.treaningId,
            referencedTable: $state.db.driftRockTreaningsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftRockTreaningsTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.driftRockTreaningsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftRockAttemptsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftRockAttemptsTableTable,
    DriftRockAttempt,
    $$DriftRockAttemptsTableTableFilterComposer,
    $$DriftRockAttemptsTableTableOrderingComposer,
    $$DriftRockAttemptsTableTableCreateCompanionBuilder,
    $$DriftRockAttemptsTableTableUpdateCompanionBuilder,
    (DriftRockAttempt, $$DriftRockAttemptsTableTableReferences),
    DriftRockAttempt,
    PrefetchHooks Function({bool treaningId})> {
  $$DriftRockAttemptsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftRockAttemptsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftRockAttemptsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftRockAttemptsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> sector = const Value.absent(),
            Value<String> sectorId = const Value.absent(),
            Value<String> treaningId = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String?> route = const Value.absent(),
            Value<String?> routeId = const Value.absent(),
            Value<String> style = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<int> suspensionCount = const Value.absent(),
            Value<int> fallCount = const Value.absent(),
            Value<bool> downClimbing = const Value.absent(),
            Value<bool> fail = const Value.absent(),
            Value<String?> ascentType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftRockAttemptsTableCompanion(
            id: id,
            sector: sector,
            sectorId: sectorId,
            treaningId: treaningId,
            category: category,
            route: route,
            routeId: routeId,
            style: style,
            finishTime: finishTime,
            startTime: startTime,
            suspensionCount: suspensionCount,
            fallCount: fallCount,
            downClimbing: downClimbing,
            fail: fail,
            ascentType: ascentType,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String sector,
            required String sectorId,
            required String treaningId,
            required String category,
            Value<String?> route = const Value.absent(),
            Value<String?> routeId = const Value.absent(),
            required String style,
            Value<DateTime?> finishTime = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            required int suspensionCount,
            required int fallCount,
            required bool downClimbing,
            required bool fail,
            Value<String?> ascentType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftRockAttemptsTableCompanion.insert(
            id: id,
            sector: sector,
            sectorId: sectorId,
            treaningId: treaningId,
            category: category,
            route: route,
            routeId: routeId,
            style: style,
            finishTime: finishTime,
            startTime: startTime,
            suspensionCount: suspensionCount,
            fallCount: fallCount,
            downClimbing: downClimbing,
            fail: fail,
            ascentType: ascentType,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftRockAttemptsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({treaningId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treaningId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treaningId,
                    referencedTable: $$DriftRockAttemptsTableTableReferences
                        ._treaningIdTable(db),
                    referencedColumn: $$DriftRockAttemptsTableTableReferences
                        ._treaningIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftRockAttemptsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftRockAttemptsTableTable,
        DriftRockAttempt,
        $$DriftRockAttemptsTableTableFilterComposer,
        $$DriftRockAttemptsTableTableOrderingComposer,
        $$DriftRockAttemptsTableTableCreateCompanionBuilder,
        $$DriftRockAttemptsTableTableUpdateCompanionBuilder,
        (DriftRockAttempt, $$DriftRockAttemptsTableTableReferences),
        DriftRockAttempt,
        PrefetchHooks Function({bool treaningId})>;
typedef $$DriftTrekkingPathsTableTableCreateCompanionBuilder
    = DriftTrekkingPathsTableCompanion Function({
  required String id,
  required String region,
  Value<String?> trekId,
  Value<String?> trek,
  required String type,
  required DateTime date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<String?> currentSection,
  required int climbDown,
  required int climbUp,
  required bool turn,
  required double length,
  Value<int> rowid,
});
typedef $$DriftTrekkingPathsTableTableUpdateCompanionBuilder
    = DriftTrekkingPathsTableCompanion Function({
  Value<String> id,
  Value<String> region,
  Value<String?> trekId,
  Value<String?> trek,
  Value<String> type,
  Value<DateTime> date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<String?> currentSection,
  Value<int> climbDown,
  Value<int> climbUp,
  Value<bool> turn,
  Value<double> length,
  Value<int> rowid,
});

final class $$DriftTrekkingPathsTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource,
    $DriftTrekkingPathsTableTable,
    DriftTrekkingPath> {
  $$DriftTrekkingPathsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DriftTrekkingPathEventsTableTable,
      List<DriftTrekkingPathEvent>> _driftTrekkingPathEventsTableRefsTable(
          _$DriftDBLocalDataSource db) =>
      MultiTypedResultKey.fromTable(db.driftTrekkingPathEventsTable,
          aliasName: $_aliasNameGenerator(db.driftTrekkingPathsTable.id,
              db.driftTrekkingPathEventsTable.pathId));

  $$DriftTrekkingPathEventsTableTableProcessedTableManager
      get driftTrekkingPathEventsTableRefs {
    final manager = $$DriftTrekkingPathEventsTableTableTableManager(
            $_db, $_db.driftTrekkingPathEventsTable)
        .filter((f) => f.pathId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_driftTrekkingPathEventsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftTrekkingPathsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftTrekkingPathsTableTable> {
  $$DriftTrekkingPathsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get region => $state.composableBuilder(
      column: $state.table.region,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get trekId => $state.composableBuilder(
      column: $state.table.trekId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get trek => $state.composableBuilder(
      column: $state.table.trek,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get currentSection => $state.composableBuilder(
      column: $state.table.currentSection,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get climbDown => $state.composableBuilder(
      column: $state.table.climbDown,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get climbUp => $state.composableBuilder(
      column: $state.table.climbUp,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get turn => $state.composableBuilder(
      column: $state.table.turn,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get length => $state.composableBuilder(
      column: $state.table.length,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter driftTrekkingPathEventsTableRefs(
      ComposableFilter Function(
              $$DriftTrekkingPathEventsTableTableFilterComposer f)
          f) {
    final $$DriftTrekkingPathEventsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftTrekkingPathEventsTable,
            getReferencedColumn: (t) => t.pathId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTrekkingPathEventsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftTrekkingPathEventsTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$DriftTrekkingPathsTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftTrekkingPathsTableTable> {
  $$DriftTrekkingPathsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get region => $state.composableBuilder(
      column: $state.table.region,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get trekId => $state.composableBuilder(
      column: $state.table.trekId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get trek => $state.composableBuilder(
      column: $state.table.trek,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get currentSection => $state.composableBuilder(
      column: $state.table.currentSection,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get climbDown => $state.composableBuilder(
      column: $state.table.climbDown,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get climbUp => $state.composableBuilder(
      column: $state.table.climbUp,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get turn => $state.composableBuilder(
      column: $state.table.turn,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get length => $state.composableBuilder(
      column: $state.table.length,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$DriftTrekkingPathsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftTrekkingPathsTableTable,
    DriftTrekkingPath,
    $$DriftTrekkingPathsTableTableFilterComposer,
    $$DriftTrekkingPathsTableTableOrderingComposer,
    $$DriftTrekkingPathsTableTableCreateCompanionBuilder,
    $$DriftTrekkingPathsTableTableUpdateCompanionBuilder,
    (DriftTrekkingPath, $$DriftTrekkingPathsTableTableReferences),
    DriftTrekkingPath,
    PrefetchHooks Function({bool driftTrekkingPathEventsTableRefs})> {
  $$DriftTrekkingPathsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftTrekkingPathsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftTrekkingPathsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftTrekkingPathsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> region = const Value.absent(),
            Value<String?> trekId = const Value.absent(),
            Value<String?> trek = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<String?> currentSection = const Value.absent(),
            Value<int> climbDown = const Value.absent(),
            Value<int> climbUp = const Value.absent(),
            Value<bool> turn = const Value.absent(),
            Value<double> length = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTrekkingPathsTableCompanion(
            id: id,
            region: region,
            trekId: trekId,
            trek: trek,
            type: type,
            date: date,
            finish: finish,
            start: start,
            currentSection: currentSection,
            climbDown: climbDown,
            climbUp: climbUp,
            turn: turn,
            length: length,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String region,
            Value<String?> trekId = const Value.absent(),
            Value<String?> trek = const Value.absent(),
            required String type,
            required DateTime date,
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<String?> currentSection = const Value.absent(),
            required int climbDown,
            required int climbUp,
            required bool turn,
            required double length,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTrekkingPathsTableCompanion.insert(
            id: id,
            region: region,
            trekId: trekId,
            trek: trek,
            type: type,
            date: date,
            finish: finish,
            start: start,
            currentSection: currentSection,
            climbDown: climbDown,
            climbUp: climbUp,
            turn: turn,
            length: length,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftTrekkingPathsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({driftTrekkingPathEventsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftTrekkingPathEventsTableRefs)
                  db.driftTrekkingPathEventsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftTrekkingPathEventsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$DriftTrekkingPathsTableTableReferences
                                ._driftTrekkingPathEventsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftTrekkingPathsTableTableReferences(
                                    db, table, p0)
                                .driftTrekkingPathEventsTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.pathId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftTrekkingPathsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftTrekkingPathsTableTable,
        DriftTrekkingPath,
        $$DriftTrekkingPathsTableTableFilterComposer,
        $$DriftTrekkingPathsTableTableOrderingComposer,
        $$DriftTrekkingPathsTableTableCreateCompanionBuilder,
        $$DriftTrekkingPathsTableTableUpdateCompanionBuilder,
        (DriftTrekkingPath, $$DriftTrekkingPathsTableTableReferences),
        DriftTrekkingPath,
        PrefetchHooks Function({bool driftTrekkingPathEventsTableRefs})>;
typedef $$DriftTrekkingPathEventsTableTableCreateCompanionBuilder
    = DriftTrekkingPathEventsTableCompanion Function({
  required String id,
  required String type,
  required String pathId,
  Value<String?> point,
  Value<String?> pointId,
  required DateTime time,
  Value<int> rowid,
});
typedef $$DriftTrekkingPathEventsTableTableUpdateCompanionBuilder
    = DriftTrekkingPathEventsTableCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<String> pathId,
  Value<String?> point,
  Value<String?> pointId,
  Value<DateTime> time,
  Value<int> rowid,
});

final class $$DriftTrekkingPathEventsTableTableReferences
    extends BaseReferences<_$DriftDBLocalDataSource,
        $DriftTrekkingPathEventsTableTable, DriftTrekkingPathEvent> {
  $$DriftTrekkingPathEventsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftTrekkingPathsTableTable _pathIdTable(
          _$DriftDBLocalDataSource db) =>
      db.driftTrekkingPathsTable.createAlias($_aliasNameGenerator(
          db.driftTrekkingPathEventsTable.pathId,
          db.driftTrekkingPathsTable.id));

  $$DriftTrekkingPathsTableTableProcessedTableManager? get pathId {
    if ($_item.pathId == null) return null;
    final manager = $$DriftTrekkingPathsTableTableTableManager(
            $_db, $_db.driftTrekkingPathsTable)
        .filter((f) => f.id($_item.pathId!));
    final item = $_typedResult.readTableOrNull(_pathIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftTrekkingPathEventsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftTrekkingPathEventsTableTable> {
  $$DriftTrekkingPathEventsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get point => $state.composableBuilder(
      column: $state.table.point,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get pointId => $state.composableBuilder(
      column: $state.table.pointId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$DriftTrekkingPathsTableTableFilterComposer get pathId {
    final $$DriftTrekkingPathsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.pathId,
            referencedTable: $state.db.driftTrekkingPathsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTrekkingPathsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftTrekkingPathsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftTrekkingPathEventsTableTableOrderingComposer
    extends OrderingComposer<_$DriftDBLocalDataSource,
        $DriftTrekkingPathEventsTableTable> {
  $$DriftTrekkingPathEventsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get point => $state.composableBuilder(
      column: $state.table.point,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get pointId => $state.composableBuilder(
      column: $state.table.pointId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$DriftTrekkingPathsTableTableOrderingComposer get pathId {
    final $$DriftTrekkingPathsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.pathId,
            referencedTable: $state.db.driftTrekkingPathsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTrekkingPathsTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.driftTrekkingPathsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftTrekkingPathEventsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftTrekkingPathEventsTableTable,
    DriftTrekkingPathEvent,
    $$DriftTrekkingPathEventsTableTableFilterComposer,
    $$DriftTrekkingPathEventsTableTableOrderingComposer,
    $$DriftTrekkingPathEventsTableTableCreateCompanionBuilder,
    $$DriftTrekkingPathEventsTableTableUpdateCompanionBuilder,
    (DriftTrekkingPathEvent, $$DriftTrekkingPathEventsTableTableReferences),
    DriftTrekkingPathEvent,
    PrefetchHooks Function({bool pathId})> {
  $$DriftTrekkingPathEventsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftTrekkingPathEventsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftTrekkingPathEventsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftTrekkingPathEventsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> pathId = const Value.absent(),
            Value<String?> point = const Value.absent(),
            Value<String?> pointId = const Value.absent(),
            Value<DateTime> time = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTrekkingPathEventsTableCompanion(
            id: id,
            type: type,
            pathId: pathId,
            point: point,
            pointId: pointId,
            time: time,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required String pathId,
            Value<String?> point = const Value.absent(),
            Value<String?> pointId = const Value.absent(),
            required DateTime time,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTrekkingPathEventsTableCompanion.insert(
            id: id,
            type: type,
            pathId: pathId,
            point: point,
            pointId: pointId,
            time: time,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftTrekkingPathEventsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pathId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (pathId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pathId,
                    referencedTable:
                        $$DriftTrekkingPathEventsTableTableReferences
                            ._pathIdTable(db),
                    referencedColumn:
                        $$DriftTrekkingPathEventsTableTableReferences
                            ._pathIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftTrekkingPathEventsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftTrekkingPathEventsTableTable,
        DriftTrekkingPathEvent,
        $$DriftTrekkingPathEventsTableTableFilterComposer,
        $$DriftTrekkingPathEventsTableTableOrderingComposer,
        $$DriftTrekkingPathEventsTableTableCreateCompanionBuilder,
        $$DriftTrekkingPathEventsTableTableUpdateCompanionBuilder,
        (DriftTrekkingPathEvent, $$DriftTrekkingPathEventsTableTableReferences),
        DriftTrekkingPathEvent,
        PrefetchHooks Function({bool pathId})>;
typedef $$DriftTechniqueTreaningsTableTableCreateCompanionBuilder
    = DriftTechniqueTreaningsTableCompanion Function({
  required String id,
  required String comment,
  required DateTime date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<int> rowid,
});
typedef $$DriftTechniqueTreaningsTableTableUpdateCompanionBuilder
    = DriftTechniqueTreaningsTableCompanion Function({
  Value<String> id,
  Value<String> comment,
  Value<DateTime> date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<int> rowid,
});

final class $$DriftTechniqueTreaningsTableTableReferences
    extends BaseReferences<_$DriftDBLocalDataSource,
        $DriftTechniqueTreaningsTableTable, DriftTechniqueTreaning> {
  $$DriftTechniqueTreaningsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DriftTechniqueTreaningItemsTableTable,
          List<DriftTechniqueTreaningItem>>
      _driftTechniqueTreaningItemsTableRefsTable(_$DriftDBLocalDataSource db) =>
          MultiTypedResultKey.fromTable(db.driftTechniqueTreaningItemsTable,
              aliasName: $_aliasNameGenerator(
                  db.driftTechniqueTreaningsTable.id,
                  db.driftTechniqueTreaningItemsTable.treaningId));

  $$DriftTechniqueTreaningItemsTableTableProcessedTableManager
      get driftTechniqueTreaningItemsTableRefs {
    final manager = $$DriftTechniqueTreaningItemsTableTableTableManager(
            $_db, $_db.driftTechniqueTreaningItemsTable)
        .filter((f) => f.treaningId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_driftTechniqueTreaningItemsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftTechniqueTreaningsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftTechniqueTreaningsTableTable> {
  $$DriftTechniqueTreaningsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter driftTechniqueTreaningItemsTableRefs(
      ComposableFilter Function(
              $$DriftTechniqueTreaningItemsTableTableFilterComposer f)
          f) {
    final $$DriftTechniqueTreaningItemsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftTechniqueTreaningItemsTable,
            getReferencedColumn: (t) => t.treaningId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTechniqueTreaningItemsTableTableFilterComposer(
                    ComposerState(
                        $state.db,
                        $state.db.driftTechniqueTreaningItemsTable,
                        joinBuilder,
                        parentComposers)));
    return f(composer);
  }
}

class $$DriftTechniqueTreaningsTableTableOrderingComposer
    extends OrderingComposer<_$DriftDBLocalDataSource,
        $DriftTechniqueTreaningsTableTable> {
  $$DriftTechniqueTreaningsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$DriftTechniqueTreaningsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftTechniqueTreaningsTableTable,
    DriftTechniqueTreaning,
    $$DriftTechniqueTreaningsTableTableFilterComposer,
    $$DriftTechniqueTreaningsTableTableOrderingComposer,
    $$DriftTechniqueTreaningsTableTableCreateCompanionBuilder,
    $$DriftTechniqueTreaningsTableTableUpdateCompanionBuilder,
    (DriftTechniqueTreaning, $$DriftTechniqueTreaningsTableTableReferences),
    DriftTechniqueTreaning,
    PrefetchHooks Function({bool driftTechniqueTreaningItemsTableRefs})> {
  $$DriftTechniqueTreaningsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftTechniqueTreaningsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftTechniqueTreaningsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftTechniqueTreaningsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> comment = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTechniqueTreaningsTableCompanion(
            id: id,
            comment: comment,
            date: date,
            finish: finish,
            start: start,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String comment,
            required DateTime date,
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTechniqueTreaningsTableCompanion.insert(
            id: id,
            comment: comment,
            date: date,
            finish: finish,
            start: start,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftTechniqueTreaningsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {driftTechniqueTreaningItemsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftTechniqueTreaningItemsTableRefs)
                  db.driftTechniqueTreaningItemsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftTechniqueTreaningItemsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$DriftTechniqueTreaningsTableTableReferences
                                ._driftTechniqueTreaningItemsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftTechniqueTreaningsTableTableReferences(
                                    db, table, p0)
                                .driftTechniqueTreaningItemsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.treaningId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftTechniqueTreaningsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftTechniqueTreaningsTableTable,
        DriftTechniqueTreaning,
        $$DriftTechniqueTreaningsTableTableFilterComposer,
        $$DriftTechniqueTreaningsTableTableOrderingComposer,
        $$DriftTechniqueTreaningsTableTableCreateCompanionBuilder,
        $$DriftTechniqueTreaningsTableTableUpdateCompanionBuilder,
        (DriftTechniqueTreaning, $$DriftTechniqueTreaningsTableTableReferences),
        DriftTechniqueTreaning,
        PrefetchHooks Function({bool driftTechniqueTreaningItemsTableRefs})>;
typedef $$DriftTechniqueTreaningItemsTableTableCreateCompanionBuilder
    = DriftTechniqueTreaningItemsTableCompanion Function({
  required String id,
  required String comment,
  required String treaningId,
  Value<String?> options,
  Value<DateTime?> finishTime,
  Value<DateTime?> startTime,
  required String group,
  required String technique,
  required String techniqueId,
  required String groupId,
  Value<int> rowid,
});
typedef $$DriftTechniqueTreaningItemsTableTableUpdateCompanionBuilder
    = DriftTechniqueTreaningItemsTableCompanion Function({
  Value<String> id,
  Value<String> comment,
  Value<String> treaningId,
  Value<String?> options,
  Value<DateTime?> finishTime,
  Value<DateTime?> startTime,
  Value<String> group,
  Value<String> technique,
  Value<String> techniqueId,
  Value<String> groupId,
  Value<int> rowid,
});

final class $$DriftTechniqueTreaningItemsTableTableReferences
    extends BaseReferences<_$DriftDBLocalDataSource,
        $DriftTechniqueTreaningItemsTableTable, DriftTechniqueTreaningItem> {
  $$DriftTechniqueTreaningItemsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftTechniqueTreaningsTableTable _treaningIdTable(
          _$DriftDBLocalDataSource db) =>
      db.driftTechniqueTreaningsTable.createAlias($_aliasNameGenerator(
          db.driftTechniqueTreaningItemsTable.treaningId,
          db.driftTechniqueTreaningsTable.id));

  $$DriftTechniqueTreaningsTableTableProcessedTableManager? get treaningId {
    if ($_item.treaningId == null) return null;
    final manager = $$DriftTechniqueTreaningsTableTableTableManager(
            $_db, $_db.driftTechniqueTreaningsTable)
        .filter((f) => f.id($_item.treaningId!));
    final item = $_typedResult.readTableOrNull(_treaningIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftTechniqueTreaningItemsTableTableFilterComposer
    extends FilterComposer<_$DriftDBLocalDataSource,
        $DriftTechniqueTreaningItemsTableTable> {
  $$DriftTechniqueTreaningItemsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get options => $state.composableBuilder(
      column: $state.table.options,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finishTime => $state.composableBuilder(
      column: $state.table.finishTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get group => $state.composableBuilder(
      column: $state.table.group,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get technique => $state.composableBuilder(
      column: $state.table.technique,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get techniqueId => $state.composableBuilder(
      column: $state.table.techniqueId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get groupId => $state.composableBuilder(
      column: $state.table.groupId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$DriftTechniqueTreaningsTableTableFilterComposer get treaningId {
    final $$DriftTechniqueTreaningsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.treaningId,
            referencedTable: $state.db.driftTechniqueTreaningsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTechniqueTreaningsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftTechniqueTreaningsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftTechniqueTreaningItemsTableTableOrderingComposer
    extends OrderingComposer<_$DriftDBLocalDataSource,
        $DriftTechniqueTreaningItemsTableTable> {
  $$DriftTechniqueTreaningItemsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get comment => $state.composableBuilder(
      column: $state.table.comment,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get options => $state.composableBuilder(
      column: $state.table.options,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finishTime => $state.composableBuilder(
      column: $state.table.finishTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get group => $state.composableBuilder(
      column: $state.table.group,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get technique => $state.composableBuilder(
      column: $state.table.technique,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get techniqueId => $state.composableBuilder(
      column: $state.table.techniqueId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get groupId => $state.composableBuilder(
      column: $state.table.groupId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$DriftTechniqueTreaningsTableTableOrderingComposer get treaningId {
    final $$DriftTechniqueTreaningsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.treaningId,
            referencedTable: $state.db.driftTechniqueTreaningsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTechniqueTreaningsTableTableOrderingComposer(
                    ComposerState(
                        $state.db,
                        $state.db.driftTechniqueTreaningsTable,
                        joinBuilder,
                        parentComposers)));
    return composer;
  }
}

class $$DriftTechniqueTreaningItemsTableTableTableManager
    extends RootTableManager<
        _$DriftDBLocalDataSource,
        $DriftTechniqueTreaningItemsTableTable,
        DriftTechniqueTreaningItem,
        $$DriftTechniqueTreaningItemsTableTableFilterComposer,
        $$DriftTechniqueTreaningItemsTableTableOrderingComposer,
        $$DriftTechniqueTreaningItemsTableTableCreateCompanionBuilder,
        $$DriftTechniqueTreaningItemsTableTableUpdateCompanionBuilder,
        (
          DriftTechniqueTreaningItem,
          $$DriftTechniqueTreaningItemsTableTableReferences
        ),
        DriftTechniqueTreaningItem,
        PrefetchHooks Function({bool treaningId})> {
  $$DriftTechniqueTreaningItemsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftTechniqueTreaningItemsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DriftTechniqueTreaningItemsTableTableFilterComposer(
                  ComposerState(db, table)),
          orderingComposer:
              $$DriftTechniqueTreaningItemsTableTableOrderingComposer(
                  ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> comment = const Value.absent(),
            Value<String> treaningId = const Value.absent(),
            Value<String?> options = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<String> group = const Value.absent(),
            Value<String> technique = const Value.absent(),
            Value<String> techniqueId = const Value.absent(),
            Value<String> groupId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTechniqueTreaningItemsTableCompanion(
            id: id,
            comment: comment,
            treaningId: treaningId,
            options: options,
            finishTime: finishTime,
            startTime: startTime,
            group: group,
            technique: technique,
            techniqueId: techniqueId,
            groupId: groupId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String comment,
            required String treaningId,
            Value<String?> options = const Value.absent(),
            Value<DateTime?> finishTime = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            required String group,
            required String technique,
            required String techniqueId,
            required String groupId,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTechniqueTreaningItemsTableCompanion.insert(
            id: id,
            comment: comment,
            treaningId: treaningId,
            options: options,
            finishTime: finishTime,
            startTime: startTime,
            group: group,
            technique: technique,
            techniqueId: techniqueId,
            groupId: groupId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftTechniqueTreaningItemsTableTableReferences(
                        db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({treaningId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (treaningId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.treaningId,
                    referencedTable:
                        $$DriftTechniqueTreaningItemsTableTableReferences
                            ._treaningIdTable(db),
                    referencedColumn:
                        $$DriftTechniqueTreaningItemsTableTableReferences
                            ._treaningIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftTechniqueTreaningItemsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftTechniqueTreaningItemsTableTable,
        DriftTechniqueTreaningItem,
        $$DriftTechniqueTreaningItemsTableTableFilterComposer,
        $$DriftTechniqueTreaningItemsTableTableOrderingComposer,
        $$DriftTechniqueTreaningItemsTableTableCreateCompanionBuilder,
        $$DriftTechniqueTreaningItemsTableTableUpdateCompanionBuilder,
        (
          DriftTechniqueTreaningItem,
          $$DriftTechniqueTreaningItemsTableTableReferences
        ),
        DriftTechniqueTreaningItem,
        PrefetchHooks Function({bool treaningId})>;
typedef $$DriftAscensionsTableTableCreateCompanionBuilder
    = DriftAscensionsTableCompanion Function({
  required String id,
  required String mountain,
  required String mountainId,
  Value<String?> routeId,
  Value<String?> route,
  required DateTime date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<int> rowid,
});
typedef $$DriftAscensionsTableTableUpdateCompanionBuilder
    = DriftAscensionsTableCompanion Function({
  Value<String> id,
  Value<String> mountain,
  Value<String> mountainId,
  Value<String?> routeId,
  Value<String?> route,
  Value<DateTime> date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<int> rowid,
});

final class $$DriftAscensionsTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource, $DriftAscensionsTableTable, DriftAscension> {
  $$DriftAscensionsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DriftAscensionEventsTableTable,
      List<DriftAscensionEvent>> _driftAscensionEventsTableRefsTable(
          _$DriftDBLocalDataSource db) =>
      MultiTypedResultKey.fromTable(db.driftAscensionEventsTable,
          aliasName: $_aliasNameGenerator(db.driftAscensionsTable.id,
              db.driftAscensionEventsTable.ascensionId));

  $$DriftAscensionEventsTableTableProcessedTableManager
      get driftAscensionEventsTableRefs {
    final manager = $$DriftAscensionEventsTableTableTableManager(
            $_db, $_db.driftAscensionEventsTable)
        .filter((f) => f.ascensionId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_driftAscensionEventsTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftAscensionsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftAscensionsTableTable> {
  $$DriftAscensionsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get mountain => $state.composableBuilder(
      column: $state.table.mountain,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get mountainId => $state.composableBuilder(
      column: $state.table.mountainId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get routeId => $state.composableBuilder(
      column: $state.table.routeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get route => $state.composableBuilder(
      column: $state.table.route,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter driftAscensionEventsTableRefs(
      ComposableFilter Function(
              $$DriftAscensionEventsTableTableFilterComposer f)
          f) {
    final $$DriftAscensionEventsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftAscensionEventsTable,
            getReferencedColumn: (t) => t.ascensionId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftAscensionEventsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftAscensionEventsTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$DriftAscensionsTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftAscensionsTableTable> {
  $$DriftAscensionsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get mountain => $state.composableBuilder(
      column: $state.table.mountain,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get mountainId => $state.composableBuilder(
      column: $state.table.mountainId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get routeId => $state.composableBuilder(
      column: $state.table.routeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get route => $state.composableBuilder(
      column: $state.table.route,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$DriftAscensionsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftAscensionsTableTable,
    DriftAscension,
    $$DriftAscensionsTableTableFilterComposer,
    $$DriftAscensionsTableTableOrderingComposer,
    $$DriftAscensionsTableTableCreateCompanionBuilder,
    $$DriftAscensionsTableTableUpdateCompanionBuilder,
    (DriftAscension, $$DriftAscensionsTableTableReferences),
    DriftAscension,
    PrefetchHooks Function({bool driftAscensionEventsTableRefs})> {
  $$DriftAscensionsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftAscensionsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftAscensionsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftAscensionsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> mountain = const Value.absent(),
            Value<String> mountainId = const Value.absent(),
            Value<String?> routeId = const Value.absent(),
            Value<String?> route = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftAscensionsTableCompanion(
            id: id,
            mountain: mountain,
            mountainId: mountainId,
            routeId: routeId,
            route: route,
            date: date,
            finish: finish,
            start: start,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String mountain,
            required String mountainId,
            Value<String?> routeId = const Value.absent(),
            Value<String?> route = const Value.absent(),
            required DateTime date,
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftAscensionsTableCompanion.insert(
            id: id,
            mountain: mountain,
            mountainId: mountainId,
            routeId: routeId,
            route: route,
            date: date,
            finish: finish,
            start: start,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftAscensionsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({driftAscensionEventsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftAscensionEventsTableRefs) db.driftAscensionEventsTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftAscensionEventsTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$DriftAscensionsTableTableReferences
                            ._driftAscensionEventsTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftAscensionsTableTableReferences(db, table, p0)
                                .driftAscensionEventsTableRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.ascensionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftAscensionsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftAscensionsTableTable,
        DriftAscension,
        $$DriftAscensionsTableTableFilterComposer,
        $$DriftAscensionsTableTableOrderingComposer,
        $$DriftAscensionsTableTableCreateCompanionBuilder,
        $$DriftAscensionsTableTableUpdateCompanionBuilder,
        (DriftAscension, $$DriftAscensionsTableTableReferences),
        DriftAscension,
        PrefetchHooks Function({bool driftAscensionEventsTableRefs})>;
typedef $$DriftAscensionEventsTableTableCreateCompanionBuilder
    = DriftAscensionEventsTableCompanion Function({
  required String id,
  required String type,
  required String ascensionId,
  Value<DateTime?> time,
  Value<DateTime?> planedTime,
  Value<int> rowid,
});
typedef $$DriftAscensionEventsTableTableUpdateCompanionBuilder
    = DriftAscensionEventsTableCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<String> ascensionId,
  Value<DateTime?> time,
  Value<DateTime?> planedTime,
  Value<int> rowid,
});

final class $$DriftAscensionEventsTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource,
    $DriftAscensionEventsTableTable,
    DriftAscensionEvent> {
  $$DriftAscensionEventsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftAscensionsTableTable _ascensionIdTable(
          _$DriftDBLocalDataSource db) =>
      db.driftAscensionsTable.createAlias($_aliasNameGenerator(
          db.driftAscensionEventsTable.ascensionId,
          db.driftAscensionsTable.id));

  $$DriftAscensionsTableTableProcessedTableManager? get ascensionId {
    if ($_item.ascensionId == null) return null;
    final manager =
        $$DriftAscensionsTableTableTableManager($_db, $_db.driftAscensionsTable)
            .filter((f) => f.id($_item.ascensionId!));
    final item = $_typedResult.readTableOrNull(_ascensionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftAscensionEventsTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftAscensionEventsTableTable> {
  $$DriftAscensionEventsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get planedTime => $state.composableBuilder(
      column: $state.table.planedTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$DriftAscensionsTableTableFilterComposer get ascensionId {
    final $$DriftAscensionsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.ascensionId,
            referencedTable: $state.db.driftAscensionsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftAscensionsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftAscensionsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftAscensionEventsTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftAscensionEventsTableTable> {
  $$DriftAscensionEventsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get planedTime => $state.composableBuilder(
      column: $state.table.planedTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$DriftAscensionsTableTableOrderingComposer get ascensionId {
    final $$DriftAscensionsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.ascensionId,
            referencedTable: $state.db.driftAscensionsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftAscensionsTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.driftAscensionsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftAscensionEventsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftAscensionEventsTableTable,
    DriftAscensionEvent,
    $$DriftAscensionEventsTableTableFilterComposer,
    $$DriftAscensionEventsTableTableOrderingComposer,
    $$DriftAscensionEventsTableTableCreateCompanionBuilder,
    $$DriftAscensionEventsTableTableUpdateCompanionBuilder,
    (DriftAscensionEvent, $$DriftAscensionEventsTableTableReferences),
    DriftAscensionEvent,
    PrefetchHooks Function({bool ascensionId})> {
  $$DriftAscensionEventsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftAscensionEventsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftAscensionEventsTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftAscensionEventsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> ascensionId = const Value.absent(),
            Value<DateTime?> time = const Value.absent(),
            Value<DateTime?> planedTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftAscensionEventsTableCompanion(
            id: id,
            type: type,
            ascensionId: ascensionId,
            time: time,
            planedTime: planedTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required String ascensionId,
            Value<DateTime?> time = const Value.absent(),
            Value<DateTime?> planedTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftAscensionEventsTableCompanion.insert(
            id: id,
            type: type,
            ascensionId: ascensionId,
            time: time,
            planedTime: planedTime,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftAscensionEventsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({ascensionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (ascensionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.ascensionId,
                    referencedTable: $$DriftAscensionEventsTableTableReferences
                        ._ascensionIdTable(db),
                    referencedColumn: $$DriftAscensionEventsTableTableReferences
                        ._ascensionIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftAscensionEventsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftAscensionEventsTableTable,
        DriftAscensionEvent,
        $$DriftAscensionEventsTableTableFilterComposer,
        $$DriftAscensionEventsTableTableOrderingComposer,
        $$DriftAscensionEventsTableTableCreateCompanionBuilder,
        $$DriftAscensionEventsTableTableUpdateCompanionBuilder,
        (DriftAscensionEvent, $$DriftAscensionEventsTableTableReferences),
        DriftAscensionEvent,
        PrefetchHooks Function({bool ascensionId})>;
typedef $$DriftTravelsTableTableCreateCompanionBuilder
    = DriftTravelsTableCompanion Function({
  required String id,
  required DateTime date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  required String regions,
  required String name,
  required String image,
  required String description,
  required String currencies,
  required String status,
  required int budgetCurrency,
  Value<int> rowid,
});
typedef $$DriftTravelsTableTableUpdateCompanionBuilder
    = DriftTravelsTableCompanion Function({
  Value<String> id,
  Value<DateTime> date,
  Value<DateTime?> finish,
  Value<DateTime?> start,
  Value<String> regions,
  Value<String> name,
  Value<String> image,
  Value<String> description,
  Value<String> currencies,
  Value<String> status,
  Value<int> budgetCurrency,
  Value<int> rowid,
});

final class $$DriftTravelsTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource, $DriftTravelsTableTable, DriftTravel> {
  $$DriftTravelsTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DriftTravelDaysTableTable, List<DriftTravelDay>>
      _driftTravelDaysTableRefsTable(_$DriftDBLocalDataSource db) =>
          MultiTypedResultKey.fromTable(db.driftTravelDaysTable,
              aliasName: $_aliasNameGenerator(
                  db.driftTravelsTable.id, db.driftTravelDaysTable.travelId));

  $$DriftTravelDaysTableTableProcessedTableManager
      get driftTravelDaysTableRefs {
    final manager =
        $$DriftTravelDaysTableTableTableManager($_db, $_db.driftTravelDaysTable)
            .filter((f) => f.travelId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_driftTravelDaysTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DriftCostLinesTableTable, List<DriftCostLine>>
      _driftCostLinesTableRefsTable(_$DriftDBLocalDataSource db) =>
          MultiTypedResultKey.fromTable(db.driftCostLinesTable,
              aliasName: $_aliasNameGenerator(
                  db.driftTravelsTable.id, db.driftCostLinesTable.travelId));

  $$DriftCostLinesTableTableProcessedTableManager get driftCostLinesTableRefs {
    final manager =
        $$DriftCostLinesTableTableTableManager($_db, $_db.driftCostLinesTable)
            .filter((f) => f.travelId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_driftCostLinesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DriftBudgetLinesTableTable, List<DriftBudgetLine>>
      _driftBudgetLinesTableRefsTable(_$DriftDBLocalDataSource db) =>
          MultiTypedResultKey.fromTable(db.driftBudgetLinesTable,
              aliasName: $_aliasNameGenerator(
                  db.driftTravelsTable.id, db.driftBudgetLinesTable.travelId));

  $$DriftBudgetLinesTableTableProcessedTableManager
      get driftBudgetLinesTableRefs {
    final manager = $$DriftBudgetLinesTableTableTableManager(
            $_db, $_db.driftBudgetLinesTable)
        .filter((f) => f.travelId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_driftBudgetLinesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$DriftInsuranceLinesTableTable,
      List<DriftInsuranceLine>> _driftInsuranceLinesTableRefsTable(
          _$DriftDBLocalDataSource db) =>
      MultiTypedResultKey.fromTable(db.driftInsuranceLinesTable,
          aliasName: $_aliasNameGenerator(
              db.driftTravelsTable.id, db.driftInsuranceLinesTable.travelId));

  $$DriftInsuranceLinesTableTableProcessedTableManager
      get driftInsuranceLinesTableRefs {
    final manager = $$DriftInsuranceLinesTableTableTableManager(
            $_db, $_db.driftInsuranceLinesTable)
        .filter((f) => f.travelId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_driftInsuranceLinesTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DriftTravelsTableTableFilterComposer
    extends FilterComposer<_$DriftDBLocalDataSource, $DriftTravelsTableTable> {
  $$DriftTravelsTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get regions => $state.composableBuilder(
      column: $state.table.regions,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get currencies => $state.composableBuilder(
      column: $state.table.currencies,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get budgetCurrency => $state.composableBuilder(
      column: $state.table.budgetCurrency,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter driftTravelDaysTableRefs(
      ComposableFilter Function($$DriftTravelDaysTableTableFilterComposer f)
          f) {
    final $$DriftTravelDaysTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftTravelDaysTable,
            getReferencedColumn: (t) => t.travelId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTravelDaysTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftTravelDaysTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }

  ComposableFilter driftCostLinesTableRefs(
      ComposableFilter Function($$DriftCostLinesTableTableFilterComposer f) f) {
    final $$DriftCostLinesTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftCostLinesTable,
            getReferencedColumn: (t) => t.travelId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftCostLinesTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftCostLinesTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }

  ComposableFilter driftBudgetLinesTableRefs(
      ComposableFilter Function($$DriftBudgetLinesTableTableFilterComposer f)
          f) {
    final $$DriftBudgetLinesTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftBudgetLinesTable,
            getReferencedColumn: (t) => t.travelId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftBudgetLinesTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftBudgetLinesTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }

  ComposableFilter driftInsuranceLinesTableRefs(
      ComposableFilter Function($$DriftInsuranceLinesTableTableFilterComposer f)
          f) {
    final $$DriftInsuranceLinesTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.driftInsuranceLinesTable,
            getReferencedColumn: (t) => t.travelId,
            builder: (joinBuilder, parentComposers) =>
                $$DriftInsuranceLinesTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftInsuranceLinesTable,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$DriftTravelsTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftTravelsTableTable> {
  $$DriftTravelsTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get finish => $state.composableBuilder(
      column: $state.table.finish,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get regions => $state.composableBuilder(
      column: $state.table.regions,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get currencies => $state.composableBuilder(
      column: $state.table.currencies,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get budgetCurrency => $state.composableBuilder(
      column: $state.table.budgetCurrency,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$DriftTravelsTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftTravelsTableTable,
    DriftTravel,
    $$DriftTravelsTableTableFilterComposer,
    $$DriftTravelsTableTableOrderingComposer,
    $$DriftTravelsTableTableCreateCompanionBuilder,
    $$DriftTravelsTableTableUpdateCompanionBuilder,
    (DriftTravel, $$DriftTravelsTableTableReferences),
    DriftTravel,
    PrefetchHooks Function(
        {bool driftTravelDaysTableRefs,
        bool driftCostLinesTableRefs,
        bool driftBudgetLinesTableRefs,
        bool driftInsuranceLinesTableRefs})> {
  $$DriftTravelsTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftTravelsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$DriftTravelsTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$DriftTravelsTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<String> regions = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> currencies = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> budgetCurrency = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTravelsTableCompanion(
            id: id,
            date: date,
            finish: finish,
            start: start,
            regions: regions,
            name: name,
            image: image,
            description: description,
            currencies: currencies,
            status: status,
            budgetCurrency: budgetCurrency,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime date,
            Value<DateTime?> finish = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            required String regions,
            required String name,
            required String image,
            required String description,
            required String currencies,
            required String status,
            required int budgetCurrency,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTravelsTableCompanion.insert(
            id: id,
            date: date,
            finish: finish,
            start: start,
            regions: regions,
            name: name,
            image: image,
            description: description,
            currencies: currencies,
            status: status,
            budgetCurrency: budgetCurrency,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftTravelsTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {driftTravelDaysTableRefs = false,
              driftCostLinesTableRefs = false,
              driftBudgetLinesTableRefs = false,
              driftInsuranceLinesTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (driftTravelDaysTableRefs) db.driftTravelDaysTable,
                if (driftCostLinesTableRefs) db.driftCostLinesTable,
                if (driftBudgetLinesTableRefs) db.driftBudgetLinesTable,
                if (driftInsuranceLinesTableRefs) db.driftInsuranceLinesTable
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (driftTravelDaysTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$DriftTravelsTableTableReferences
                            ._driftTravelDaysTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftTravelsTableTableReferences(db, table, p0)
                                .driftTravelDaysTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.travelId == item.id),
                        typedResults: items),
                  if (driftCostLinesTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$DriftTravelsTableTableReferences
                            ._driftCostLinesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftTravelsTableTableReferences(db, table, p0)
                                .driftCostLinesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.travelId == item.id),
                        typedResults: items),
                  if (driftBudgetLinesTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$DriftTravelsTableTableReferences
                            ._driftBudgetLinesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftTravelsTableTableReferences(db, table, p0)
                                .driftBudgetLinesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.travelId == item.id),
                        typedResults: items),
                  if (driftInsuranceLinesTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$DriftTravelsTableTableReferences
                            ._driftInsuranceLinesTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DriftTravelsTableTableReferences(db, table, p0)
                                .driftInsuranceLinesTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.travelId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DriftTravelsTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftDBLocalDataSource,
    $DriftTravelsTableTable,
    DriftTravel,
    $$DriftTravelsTableTableFilterComposer,
    $$DriftTravelsTableTableOrderingComposer,
    $$DriftTravelsTableTableCreateCompanionBuilder,
    $$DriftTravelsTableTableUpdateCompanionBuilder,
    (DriftTravel, $$DriftTravelsTableTableReferences),
    DriftTravel,
    PrefetchHooks Function(
        {bool driftTravelDaysTableRefs,
        bool driftCostLinesTableRefs,
        bool driftBudgetLinesTableRefs,
        bool driftInsuranceLinesTableRefs})>;
typedef $$DriftTravelDaysTableTableCreateCompanionBuilder
    = DriftTravelDaysTableCompanion Function({
  required String id,
  required DateTime date,
  Value<DateTime?> start,
  required String description,
  required int number,
  required String transportLines,
  required String feedingsLines,
  required String stayLines,
  required String travelId,
  Value<int> rowid,
});
typedef $$DriftTravelDaysTableTableUpdateCompanionBuilder
    = DriftTravelDaysTableCompanion Function({
  Value<String> id,
  Value<DateTime> date,
  Value<DateTime?> start,
  Value<String> description,
  Value<int> number,
  Value<String> transportLines,
  Value<String> feedingsLines,
  Value<String> stayLines,
  Value<String> travelId,
  Value<int> rowid,
});

final class $$DriftTravelDaysTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource, $DriftTravelDaysTableTable, DriftTravelDay> {
  $$DriftTravelDaysTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftTravelsTableTable _travelIdTable(_$DriftDBLocalDataSource db) =>
      db.driftTravelsTable.createAlias($_aliasNameGenerator(
          db.driftTravelDaysTable.travelId, db.driftTravelsTable.id));

  $$DriftTravelsTableTableProcessedTableManager? get travelId {
    if ($_item.travelId == null) return null;
    final manager =
        $$DriftTravelsTableTableTableManager($_db, $_db.driftTravelsTable)
            .filter((f) => f.id($_item.travelId!));
    final item = $_typedResult.readTableOrNull(_travelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftTravelDaysTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftTravelDaysTableTable> {
  $$DriftTravelDaysTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get number => $state.composableBuilder(
      column: $state.table.number,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get transportLines => $state.composableBuilder(
      column: $state.table.transportLines,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get feedingsLines => $state.composableBuilder(
      column: $state.table.feedingsLines,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get stayLines => $state.composableBuilder(
      column: $state.table.stayLines,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$DriftTravelsTableTableFilterComposer get travelId {
    final $$DriftTravelsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.travelId,
            referencedTable: $state.db.driftTravelsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTravelsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftTravelsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftTravelDaysTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftTravelDaysTableTable> {
  $$DriftTravelDaysTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get start => $state.composableBuilder(
      column: $state.table.start,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get number => $state.composableBuilder(
      column: $state.table.number,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get transportLines => $state.composableBuilder(
      column: $state.table.transportLines,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get feedingsLines => $state.composableBuilder(
      column: $state.table.feedingsLines,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get stayLines => $state.composableBuilder(
      column: $state.table.stayLines,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$DriftTravelsTableTableOrderingComposer get travelId {
    final $$DriftTravelsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.travelId,
            referencedTable: $state.db.driftTravelsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTravelsTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.driftTravelsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftTravelDaysTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftTravelDaysTableTable,
    DriftTravelDay,
    $$DriftTravelDaysTableTableFilterComposer,
    $$DriftTravelDaysTableTableOrderingComposer,
    $$DriftTravelDaysTableTableCreateCompanionBuilder,
    $$DriftTravelDaysTableTableUpdateCompanionBuilder,
    (DriftTravelDay, $$DriftTravelDaysTableTableReferences),
    DriftTravelDay,
    PrefetchHooks Function({bool travelId})> {
  $$DriftTravelDaysTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftTravelDaysTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftTravelDaysTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftTravelDaysTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<DateTime?> start = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> number = const Value.absent(),
            Value<String> transportLines = const Value.absent(),
            Value<String> feedingsLines = const Value.absent(),
            Value<String> stayLines = const Value.absent(),
            Value<String> travelId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTravelDaysTableCompanion(
            id: id,
            date: date,
            start: start,
            description: description,
            number: number,
            transportLines: transportLines,
            feedingsLines: feedingsLines,
            stayLines: stayLines,
            travelId: travelId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime date,
            Value<DateTime?> start = const Value.absent(),
            required String description,
            required int number,
            required String transportLines,
            required String feedingsLines,
            required String stayLines,
            required String travelId,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftTravelDaysTableCompanion.insert(
            id: id,
            date: date,
            start: start,
            description: description,
            number: number,
            transportLines: transportLines,
            feedingsLines: feedingsLines,
            stayLines: stayLines,
            travelId: travelId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftTravelDaysTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({travelId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (travelId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.travelId,
                    referencedTable: $$DriftTravelDaysTableTableReferences
                        ._travelIdTable(db),
                    referencedColumn: $$DriftTravelDaysTableTableReferences
                        ._travelIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftTravelDaysTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftTravelDaysTableTable,
        DriftTravelDay,
        $$DriftTravelDaysTableTableFilterComposer,
        $$DriftTravelDaysTableTableOrderingComposer,
        $$DriftTravelDaysTableTableCreateCompanionBuilder,
        $$DriftTravelDaysTableTableUpdateCompanionBuilder,
        (DriftTravelDay, $$DriftTravelDaysTableTableReferences),
        DriftTravelDay,
        PrefetchHooks Function({bool travelId})>;
typedef $$DriftCostLinesTableTableCreateCompanionBuilder
    = DriftCostLinesTableCompanion Function({
  required String id,
  required String type,
  required int currency,
  required String travelId,
  required DateTime date,
  required double sum,
  required double budgetSum,
  required String description,
  required String incomeExpense,
  Value<int> rowid,
});
typedef $$DriftCostLinesTableTableUpdateCompanionBuilder
    = DriftCostLinesTableCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<int> currency,
  Value<String> travelId,
  Value<DateTime> date,
  Value<double> sum,
  Value<double> budgetSum,
  Value<String> description,
  Value<String> incomeExpense,
  Value<int> rowid,
});

final class $$DriftCostLinesTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource, $DriftCostLinesTableTable, DriftCostLine> {
  $$DriftCostLinesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftTravelsTableTable _travelIdTable(_$DriftDBLocalDataSource db) =>
      db.driftTravelsTable.createAlias($_aliasNameGenerator(
          db.driftCostLinesTable.travelId, db.driftTravelsTable.id));

  $$DriftTravelsTableTableProcessedTableManager? get travelId {
    if ($_item.travelId == null) return null;
    final manager =
        $$DriftTravelsTableTableTableManager($_db, $_db.driftTravelsTable)
            .filter((f) => f.id($_item.travelId!));
    final item = $_typedResult.readTableOrNull(_travelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftCostLinesTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftCostLinesTableTable> {
  $$DriftCostLinesTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get currency => $state.composableBuilder(
      column: $state.table.currency,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get sum => $state.composableBuilder(
      column: $state.table.sum,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get budgetSum => $state.composableBuilder(
      column: $state.table.budgetSum,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get incomeExpense => $state.composableBuilder(
      column: $state.table.incomeExpense,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$DriftTravelsTableTableFilterComposer get travelId {
    final $$DriftTravelsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.travelId,
            referencedTable: $state.db.driftTravelsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTravelsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftTravelsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftCostLinesTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftCostLinesTableTable> {
  $$DriftCostLinesTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get currency => $state.composableBuilder(
      column: $state.table.currency,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get date => $state.composableBuilder(
      column: $state.table.date,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get sum => $state.composableBuilder(
      column: $state.table.sum,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get budgetSum => $state.composableBuilder(
      column: $state.table.budgetSum,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get incomeExpense => $state.composableBuilder(
      column: $state.table.incomeExpense,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$DriftTravelsTableTableOrderingComposer get travelId {
    final $$DriftTravelsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.travelId,
            referencedTable: $state.db.driftTravelsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTravelsTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.driftTravelsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftCostLinesTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftCostLinesTableTable,
    DriftCostLine,
    $$DriftCostLinesTableTableFilterComposer,
    $$DriftCostLinesTableTableOrderingComposer,
    $$DriftCostLinesTableTableCreateCompanionBuilder,
    $$DriftCostLinesTableTableUpdateCompanionBuilder,
    (DriftCostLine, $$DriftCostLinesTableTableReferences),
    DriftCostLine,
    PrefetchHooks Function({bool travelId})> {
  $$DriftCostLinesTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftCostLinesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftCostLinesTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftCostLinesTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int> currency = const Value.absent(),
            Value<String> travelId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<double> sum = const Value.absent(),
            Value<double> budgetSum = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> incomeExpense = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftCostLinesTableCompanion(
            id: id,
            type: type,
            currency: currency,
            travelId: travelId,
            date: date,
            sum: sum,
            budgetSum: budgetSum,
            description: description,
            incomeExpense: incomeExpense,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required int currency,
            required String travelId,
            required DateTime date,
            required double sum,
            required double budgetSum,
            required String description,
            required String incomeExpense,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftCostLinesTableCompanion.insert(
            id: id,
            type: type,
            currency: currency,
            travelId: travelId,
            date: date,
            sum: sum,
            budgetSum: budgetSum,
            description: description,
            incomeExpense: incomeExpense,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftCostLinesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({travelId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (travelId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.travelId,
                    referencedTable:
                        $$DriftCostLinesTableTableReferences._travelIdTable(db),
                    referencedColumn: $$DriftCostLinesTableTableReferences
                        ._travelIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftCostLinesTableTableProcessedTableManager = ProcessedTableManager<
    _$DriftDBLocalDataSource,
    $DriftCostLinesTableTable,
    DriftCostLine,
    $$DriftCostLinesTableTableFilterComposer,
    $$DriftCostLinesTableTableOrderingComposer,
    $$DriftCostLinesTableTableCreateCompanionBuilder,
    $$DriftCostLinesTableTableUpdateCompanionBuilder,
    (DriftCostLine, $$DriftCostLinesTableTableReferences),
    DriftCostLine,
    PrefetchHooks Function({bool travelId})>;
typedef $$DriftBudgetLinesTableTableCreateCompanionBuilder
    = DriftBudgetLinesTableCompanion Function({
  required String id,
  required String type,
  required double amount,
  required String travelId,
  required String description,
  Value<int> rowid,
});
typedef $$DriftBudgetLinesTableTableUpdateCompanionBuilder
    = DriftBudgetLinesTableCompanion Function({
  Value<String> id,
  Value<String> type,
  Value<double> amount,
  Value<String> travelId,
  Value<String> description,
  Value<int> rowid,
});

final class $$DriftBudgetLinesTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource, $DriftBudgetLinesTableTable, DriftBudgetLine> {
  $$DriftBudgetLinesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftTravelsTableTable _travelIdTable(_$DriftDBLocalDataSource db) =>
      db.driftTravelsTable.createAlias($_aliasNameGenerator(
          db.driftBudgetLinesTable.travelId, db.driftTravelsTable.id));

  $$DriftTravelsTableTableProcessedTableManager? get travelId {
    if ($_item.travelId == null) return null;
    final manager =
        $$DriftTravelsTableTableTableManager($_db, $_db.driftTravelsTable)
            .filter((f) => f.id($_item.travelId!));
    final item = $_typedResult.readTableOrNull(_travelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftBudgetLinesTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftBudgetLinesTableTable> {
  $$DriftBudgetLinesTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$DriftTravelsTableTableFilterComposer get travelId {
    final $$DriftTravelsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.travelId,
            referencedTable: $state.db.driftTravelsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTravelsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftTravelsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftBudgetLinesTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftBudgetLinesTableTable> {
  $$DriftBudgetLinesTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$DriftTravelsTableTableOrderingComposer get travelId {
    final $$DriftTravelsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.travelId,
            referencedTable: $state.db.driftTravelsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTravelsTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.driftTravelsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftBudgetLinesTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftBudgetLinesTableTable,
    DriftBudgetLine,
    $$DriftBudgetLinesTableTableFilterComposer,
    $$DriftBudgetLinesTableTableOrderingComposer,
    $$DriftBudgetLinesTableTableCreateCompanionBuilder,
    $$DriftBudgetLinesTableTableUpdateCompanionBuilder,
    (DriftBudgetLine, $$DriftBudgetLinesTableTableReferences),
    DriftBudgetLine,
    PrefetchHooks Function({bool travelId})> {
  $$DriftBudgetLinesTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftBudgetLinesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftBudgetLinesTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftBudgetLinesTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> travelId = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftBudgetLinesTableCompanion(
            id: id,
            type: type,
            amount: amount,
            travelId: travelId,
            description: description,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required double amount,
            required String travelId,
            required String description,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftBudgetLinesTableCompanion.insert(
            id: id,
            type: type,
            amount: amount,
            travelId: travelId,
            description: description,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftBudgetLinesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({travelId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (travelId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.travelId,
                    referencedTable: $$DriftBudgetLinesTableTableReferences
                        ._travelIdTable(db),
                    referencedColumn: $$DriftBudgetLinesTableTableReferences
                        ._travelIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftBudgetLinesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftBudgetLinesTableTable,
        DriftBudgetLine,
        $$DriftBudgetLinesTableTableFilterComposer,
        $$DriftBudgetLinesTableTableOrderingComposer,
        $$DriftBudgetLinesTableTableCreateCompanionBuilder,
        $$DriftBudgetLinesTableTableUpdateCompanionBuilder,
        (DriftBudgetLine, $$DriftBudgetLinesTableTableReferences),
        DriftBudgetLine,
        PrefetchHooks Function({bool travelId})>;
typedef $$DriftInsuranceLinesTableTableCreateCompanionBuilder
    = DriftInsuranceLinesTableCompanion Function({
  required String id,
  required String number,
  required String travelId,
  required String insurant,
  required String description,
  required String insurer,
  required String contacts,
  Value<int> rowid,
});
typedef $$DriftInsuranceLinesTableTableUpdateCompanionBuilder
    = DriftInsuranceLinesTableCompanion Function({
  Value<String> id,
  Value<String> number,
  Value<String> travelId,
  Value<String> insurant,
  Value<String> description,
  Value<String> insurer,
  Value<String> contacts,
  Value<int> rowid,
});

final class $$DriftInsuranceLinesTableTableReferences extends BaseReferences<
    _$DriftDBLocalDataSource,
    $DriftInsuranceLinesTableTable,
    DriftInsuranceLine> {
  $$DriftInsuranceLinesTableTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $DriftTravelsTableTable _travelIdTable(_$DriftDBLocalDataSource db) =>
      db.driftTravelsTable.createAlias($_aliasNameGenerator(
          db.driftInsuranceLinesTable.travelId, db.driftTravelsTable.id));

  $$DriftTravelsTableTableProcessedTableManager? get travelId {
    if ($_item.travelId == null) return null;
    final manager =
        $$DriftTravelsTableTableTableManager($_db, $_db.driftTravelsTable)
            .filter((f) => f.id($_item.travelId!));
    final item = $_typedResult.readTableOrNull(_travelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DriftInsuranceLinesTableTableFilterComposer extends FilterComposer<
    _$DriftDBLocalDataSource, $DriftInsuranceLinesTableTable> {
  $$DriftInsuranceLinesTableTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get number => $state.composableBuilder(
      column: $state.table.number,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get insurant => $state.composableBuilder(
      column: $state.table.insurant,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get insurer => $state.composableBuilder(
      column: $state.table.insurer,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get contacts => $state.composableBuilder(
      column: $state.table.contacts,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$DriftTravelsTableTableFilterComposer get travelId {
    final $$DriftTravelsTableTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.travelId,
            referencedTable: $state.db.driftTravelsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTravelsTableTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.driftTravelsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftInsuranceLinesTableTableOrderingComposer extends OrderingComposer<
    _$DriftDBLocalDataSource, $DriftInsuranceLinesTableTable> {
  $$DriftInsuranceLinesTableTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get number => $state.composableBuilder(
      column: $state.table.number,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get insurant => $state.composableBuilder(
      column: $state.table.insurant,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get insurer => $state.composableBuilder(
      column: $state.table.insurer,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get contacts => $state.composableBuilder(
      column: $state.table.contacts,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$DriftTravelsTableTableOrderingComposer get travelId {
    final $$DriftTravelsTableTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.travelId,
            referencedTable: $state.db.driftTravelsTable,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$DriftTravelsTableTableOrderingComposer(ComposerState(
                    $state.db,
                    $state.db.driftTravelsTable,
                    joinBuilder,
                    parentComposers)));
    return composer;
  }
}

class $$DriftInsuranceLinesTableTableTableManager extends RootTableManager<
    _$DriftDBLocalDataSource,
    $DriftInsuranceLinesTableTable,
    DriftInsuranceLine,
    $$DriftInsuranceLinesTableTableFilterComposer,
    $$DriftInsuranceLinesTableTableOrderingComposer,
    $$DriftInsuranceLinesTableTableCreateCompanionBuilder,
    $$DriftInsuranceLinesTableTableUpdateCompanionBuilder,
    (DriftInsuranceLine, $$DriftInsuranceLinesTableTableReferences),
    DriftInsuranceLine,
    PrefetchHooks Function({bool travelId})> {
  $$DriftInsuranceLinesTableTableTableManager(
      _$DriftDBLocalDataSource db, $DriftInsuranceLinesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$DriftInsuranceLinesTableTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$DriftInsuranceLinesTableTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> number = const Value.absent(),
            Value<String> travelId = const Value.absent(),
            Value<String> insurant = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> insurer = const Value.absent(),
            Value<String> contacts = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftInsuranceLinesTableCompanion(
            id: id,
            number: number,
            travelId: travelId,
            insurant: insurant,
            description: description,
            insurer: insurer,
            contacts: contacts,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String number,
            required String travelId,
            required String insurant,
            required String description,
            required String insurer,
            required String contacts,
            Value<int> rowid = const Value.absent(),
          }) =>
              DriftInsuranceLinesTableCompanion.insert(
            id: id,
            number: number,
            travelId: travelId,
            insurant: insurant,
            description: description,
            insurer: insurer,
            contacts: contacts,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DriftInsuranceLinesTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({travelId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (travelId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.travelId,
                    referencedTable: $$DriftInsuranceLinesTableTableReferences
                        ._travelIdTable(db),
                    referencedColumn: $$DriftInsuranceLinesTableTableReferences
                        ._travelIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DriftInsuranceLinesTableTableProcessedTableManager
    = ProcessedTableManager<
        _$DriftDBLocalDataSource,
        $DriftInsuranceLinesTableTable,
        DriftInsuranceLine,
        $$DriftInsuranceLinesTableTableFilterComposer,
        $$DriftInsuranceLinesTableTableOrderingComposer,
        $$DriftInsuranceLinesTableTableCreateCompanionBuilder,
        $$DriftInsuranceLinesTableTableUpdateCompanionBuilder,
        (DriftInsuranceLine, $$DriftInsuranceLinesTableTableReferences),
        DriftInsuranceLine,
        PrefetchHooks Function({bool travelId})>;

class $DriftDBLocalDataSourceManager {
  final _$DriftDBLocalDataSource _db;
  $DriftDBLocalDataSourceManager(this._db);
  $$DriftStrengthExercisesTableTableTableManager
      get driftStrengthExercisesTable =>
          $$DriftStrengthExercisesTableTableTableManager(
              _db, _db.driftStrengthExercisesTable);
  $$DriftHallTreaningsTableTableTableManager get driftHallTreaningsTable =>
      $$DriftHallTreaningsTableTableTableManager(
          _db, _db.driftHallTreaningsTable);
  $$DriftHallAttemptsTableTableTableManager get driftHallAttemptsTable =>
      $$DriftHallAttemptsTableTableTableManager(
          _db, _db.driftHallAttemptsTable);
  $$DriftCardioTreaningsTableTableTableManager get driftCardioTreaningsTable =>
      $$DriftCardioTreaningsTableTableTableManager(
          _db, _db.driftCardioTreaningsTable);
  $$DriftStrengthTreaningsTableTableTableManager
      get driftStrengthTreaningsTable =>
          $$DriftStrengthTreaningsTableTableTableManager(
              _db, _db.driftStrengthTreaningsTable);
  $$DriftStrengthTreaningLinesTableTableTableManager
      get driftStrengthTreaningLinesTable =>
          $$DriftStrengthTreaningLinesTableTableTableManager(
              _db, _db.driftStrengthTreaningLinesTable);
  $$DriftIceTreaningsTableTableTableManager get driftIceTreaningsTable =>
      $$DriftIceTreaningsTableTableTableManager(
          _db, _db.driftIceTreaningsTable);
  $$DriftIceAttemptsTableTableTableManager get driftIceAttemptsTable =>
      $$DriftIceAttemptsTableTableTableManager(_db, _db.driftIceAttemptsTable);
  $$DriftRockTreaningsTableTableTableManager get driftRockTreaningsTable =>
      $$DriftRockTreaningsTableTableTableManager(
          _db, _db.driftRockTreaningsTable);
  $$DriftRockAttemptsTableTableTableManager get driftRockAttemptsTable =>
      $$DriftRockAttemptsTableTableTableManager(
          _db, _db.driftRockAttemptsTable);
  $$DriftTrekkingPathsTableTableTableManager get driftTrekkingPathsTable =>
      $$DriftTrekkingPathsTableTableTableManager(
          _db, _db.driftTrekkingPathsTable);
  $$DriftTrekkingPathEventsTableTableTableManager
      get driftTrekkingPathEventsTable =>
          $$DriftTrekkingPathEventsTableTableTableManager(
              _db, _db.driftTrekkingPathEventsTable);
  $$DriftTechniqueTreaningsTableTableTableManager
      get driftTechniqueTreaningsTable =>
          $$DriftTechniqueTreaningsTableTableTableManager(
              _db, _db.driftTechniqueTreaningsTable);
  $$DriftTechniqueTreaningItemsTableTableTableManager
      get driftTechniqueTreaningItemsTable =>
          $$DriftTechniqueTreaningItemsTableTableTableManager(
              _db, _db.driftTechniqueTreaningItemsTable);
  $$DriftAscensionsTableTableTableManager get driftAscensionsTable =>
      $$DriftAscensionsTableTableTableManager(_db, _db.driftAscensionsTable);
  $$DriftAscensionEventsTableTableTableManager get driftAscensionEventsTable =>
      $$DriftAscensionEventsTableTableTableManager(
          _db, _db.driftAscensionEventsTable);
  $$DriftTravelsTableTableTableManager get driftTravelsTable =>
      $$DriftTravelsTableTableTableManager(_db, _db.driftTravelsTable);
  $$DriftTravelDaysTableTableTableManager get driftTravelDaysTable =>
      $$DriftTravelDaysTableTableTableManager(_db, _db.driftTravelDaysTable);
  $$DriftCostLinesTableTableTableManager get driftCostLinesTable =>
      $$DriftCostLinesTableTableTableManager(_db, _db.driftCostLinesTable);
  $$DriftBudgetLinesTableTableTableManager get driftBudgetLinesTable =>
      $$DriftBudgetLinesTableTableTableManager(_db, _db.driftBudgetLinesTable);
  $$DriftInsuranceLinesTableTableTableManager get driftInsuranceLinesTable =>
      $$DriftInsuranceLinesTableTableTableManager(
          _db, _db.driftInsuranceLinesTable);
}

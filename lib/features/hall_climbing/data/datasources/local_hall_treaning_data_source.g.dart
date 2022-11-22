// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_hall_treaning_data_source.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class HallTreaningItem extends DataClass
    implements Insertable<HallTreaningItem> {
  final int id;
  final int hallId;
  final DateTime date;
  final DateTime? finish;
  const HallTreaningItem(
      {required this.id,
      required this.hallId,
      required this.date,
      this.finish});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hall_id'] = Variable<int>(hallId);
    map['date'] = Variable<DateTime>(date);
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    return map;
  }

  HallTreaningTableCompanion toCompanion(bool nullToAbsent) {
    return HallTreaningTableCompanion(
      id: Value(id),
      hallId: Value(hallId),
      date: Value(date),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
    );
  }

  factory HallTreaningItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HallTreaningItem(
      id: serializer.fromJson<int>(json['id']),
      hallId: serializer.fromJson<int>(json['hallId']),
      date: serializer.fromJson<DateTime>(json['date']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hallId': serializer.toJson<int>(hallId),
      'date': serializer.toJson<DateTime>(date),
      'finish': serializer.toJson<DateTime?>(finish),
    };
  }

  HallTreaningItem copyWith(
          {int? id,
          int? hallId,
          DateTime? date,
          Value<DateTime?> finish = const Value.absent()}) =>
      HallTreaningItem(
        id: id ?? this.id,
        hallId: hallId ?? this.hallId,
        date: date ?? this.date,
        finish: finish.present ? finish.value : this.finish,
      );
  @override
  String toString() {
    return (StringBuffer('HallTreaningItem(')
          ..write('id: $id, ')
          ..write('hallId: $hallId, ')
          ..write('date: $date, ')
          ..write('finish: $finish')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, hallId, date, finish);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HallTreaningItem &&
          other.id == this.id &&
          other.hallId == this.hallId &&
          other.date == this.date &&
          other.finish == this.finish);
}

class HallTreaningTableCompanion extends UpdateCompanion<HallTreaningItem> {
  final Value<int> id;
  final Value<int> hallId;
  final Value<DateTime> date;
  final Value<DateTime?> finish;
  const HallTreaningTableCompanion({
    this.id = const Value.absent(),
    this.hallId = const Value.absent(),
    this.date = const Value.absent(),
    this.finish = const Value.absent(),
  });
  HallTreaningTableCompanion.insert({
    this.id = const Value.absent(),
    required int hallId,
    required DateTime date,
    this.finish = const Value.absent(),
  })  : hallId = Value(hallId),
        date = Value(date);
  static Insertable<HallTreaningItem> custom({
    Expression<int>? id,
    Expression<int>? hallId,
    Expression<DateTime>? date,
    Expression<DateTime>? finish,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hallId != null) 'hall_id': hallId,
      if (date != null) 'date': date,
      if (finish != null) 'finish': finish,
    });
  }

  HallTreaningTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? hallId,
      Value<DateTime>? date,
      Value<DateTime?>? finish}) {
    return HallTreaningTableCompanion(
      id: id ?? this.id,
      hallId: hallId ?? this.hallId,
      date: date ?? this.date,
      finish: finish ?? this.finish,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hallId.present) {
      map['hall_id'] = Variable<int>(hallId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HallTreaningTableCompanion(')
          ..write('id: $id, ')
          ..write('hallId: $hallId, ')
          ..write('date: $date, ')
          ..write('finish: $finish')
          ..write(')'))
        .toString();
  }
}

class $HallTreaningTableTable extends HallTreaningTable
    with TableInfo<$HallTreaningTableTable, HallTreaningItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HallTreaningTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _hallIdMeta = const VerificationMeta('hallId');
  @override
  late final GeneratedColumn<int> hallId = GeneratedColumn<int>(
      'hall_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, hallId, date, finish];
  @override
  String get aliasedName => _alias ?? 'hall_treaning_table';
  @override
  String get actualTableName => 'hall_treaning_table';
  @override
  VerificationContext validateIntegrity(Insertable<HallTreaningItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HallTreaningItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HallTreaningItem(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hallId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}hall_id'])!,
      date: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      finish: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
    );
  }

  @override
  $HallTreaningTableTable createAlias(String alias) {
    return $HallTreaningTableTable(attachedDatabase, alias);
  }
}

class HallAttemptItem extends DataClass implements Insertable<HallAttemptItem> {
  final int id;
  final int treaningId;
  final int categoryId;
  final int styleId;
  final int? routeId;
  final DateTime? finish;
  final DateTime? start;
  final int? ascentTypeId;
  final int suspensionCount;
  final int fallCount;
  final bool downClimbing;
  final bool fail;
  const HallAttemptItem(
      {required this.id,
      required this.treaningId,
      required this.categoryId,
      required this.styleId,
      this.routeId,
      this.finish,
      this.start,
      this.ascentTypeId,
      required this.suspensionCount,
      required this.fallCount,
      required this.downClimbing,
      required this.fail});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['treaning_id'] = Variable<int>(treaningId);
    map['category_id'] = Variable<int>(categoryId);
    map['style_id'] = Variable<int>(styleId);
    if (!nullToAbsent || routeId != null) {
      map['route_id'] = Variable<int>(routeId);
    }
    if (!nullToAbsent || finish != null) {
      map['finish'] = Variable<DateTime>(finish);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    if (!nullToAbsent || ascentTypeId != null) {
      map['ascent_type_id'] = Variable<int>(ascentTypeId);
    }
    map['suspension_count'] = Variable<int>(suspensionCount);
    map['fall_count'] = Variable<int>(fallCount);
    map['down_climbing'] = Variable<bool>(downClimbing);
    map['fail'] = Variable<bool>(fail);
    return map;
  }

  HallAttemptTableCompanion toCompanion(bool nullToAbsent) {
    return HallAttemptTableCompanion(
      id: Value(id),
      treaningId: Value(treaningId),
      categoryId: Value(categoryId),
      styleId: Value(styleId),
      routeId: routeId == null && nullToAbsent
          ? const Value.absent()
          : Value(routeId),
      finish:
          finish == null && nullToAbsent ? const Value.absent() : Value(finish),
      start:
          start == null && nullToAbsent ? const Value.absent() : Value(start),
      ascentTypeId: ascentTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(ascentTypeId),
      suspensionCount: Value(suspensionCount),
      fallCount: Value(fallCount),
      downClimbing: Value(downClimbing),
      fail: Value(fail),
    );
  }

  factory HallAttemptItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HallAttemptItem(
      id: serializer.fromJson<int>(json['id']),
      treaningId: serializer.fromJson<int>(json['treaningId']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      styleId: serializer.fromJson<int>(json['styleId']),
      routeId: serializer.fromJson<int?>(json['routeId']),
      finish: serializer.fromJson<DateTime?>(json['finish']),
      start: serializer.fromJson<DateTime?>(json['start']),
      ascentTypeId: serializer.fromJson<int?>(json['ascentTypeId']),
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
      'id': serializer.toJson<int>(id),
      'treaningId': serializer.toJson<int>(treaningId),
      'categoryId': serializer.toJson<int>(categoryId),
      'styleId': serializer.toJson<int>(styleId),
      'routeId': serializer.toJson<int?>(routeId),
      'finish': serializer.toJson<DateTime?>(finish),
      'start': serializer.toJson<DateTime?>(start),
      'ascentTypeId': serializer.toJson<int?>(ascentTypeId),
      'suspensionCount': serializer.toJson<int>(suspensionCount),
      'fallCount': serializer.toJson<int>(fallCount),
      'downClimbing': serializer.toJson<bool>(downClimbing),
      'fail': serializer.toJson<bool>(fail),
    };
  }

  HallAttemptItem copyWith(
          {int? id,
          int? treaningId,
          int? categoryId,
          int? styleId,
          Value<int?> routeId = const Value.absent(),
          Value<DateTime?> finish = const Value.absent(),
          Value<DateTime?> start = const Value.absent(),
          Value<int?> ascentTypeId = const Value.absent(),
          int? suspensionCount,
          int? fallCount,
          bool? downClimbing,
          bool? fail}) =>
      HallAttemptItem(
        id: id ?? this.id,
        treaningId: treaningId ?? this.treaningId,
        categoryId: categoryId ?? this.categoryId,
        styleId: styleId ?? this.styleId,
        routeId: routeId.present ? routeId.value : this.routeId,
        finish: finish.present ? finish.value : this.finish,
        start: start.present ? start.value : this.start,
        ascentTypeId:
            ascentTypeId.present ? ascentTypeId.value : this.ascentTypeId,
        suspensionCount: suspensionCount ?? this.suspensionCount,
        fallCount: fallCount ?? this.fallCount,
        downClimbing: downClimbing ?? this.downClimbing,
        fail: fail ?? this.fail,
      );
  @override
  String toString() {
    return (StringBuffer('HallAttemptItem(')
          ..write('id: $id, ')
          ..write('treaningId: $treaningId, ')
          ..write('categoryId: $categoryId, ')
          ..write('styleId: $styleId, ')
          ..write('routeId: $routeId, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('ascentTypeId: $ascentTypeId, ')
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
      categoryId,
      styleId,
      routeId,
      finish,
      start,
      ascentTypeId,
      suspensionCount,
      fallCount,
      downClimbing,
      fail);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HallAttemptItem &&
          other.id == this.id &&
          other.treaningId == this.treaningId &&
          other.categoryId == this.categoryId &&
          other.styleId == this.styleId &&
          other.routeId == this.routeId &&
          other.finish == this.finish &&
          other.start == this.start &&
          other.ascentTypeId == this.ascentTypeId &&
          other.suspensionCount == this.suspensionCount &&
          other.fallCount == this.fallCount &&
          other.downClimbing == this.downClimbing &&
          other.fail == this.fail);
}

class HallAttemptTableCompanion extends UpdateCompanion<HallAttemptItem> {
  final Value<int> id;
  final Value<int> treaningId;
  final Value<int> categoryId;
  final Value<int> styleId;
  final Value<int?> routeId;
  final Value<DateTime?> finish;
  final Value<DateTime?> start;
  final Value<int?> ascentTypeId;
  final Value<int> suspensionCount;
  final Value<int> fallCount;
  final Value<bool> downClimbing;
  final Value<bool> fail;
  const HallAttemptTableCompanion({
    this.id = const Value.absent(),
    this.treaningId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.styleId = const Value.absent(),
    this.routeId = const Value.absent(),
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.ascentTypeId = const Value.absent(),
    this.suspensionCount = const Value.absent(),
    this.fallCount = const Value.absent(),
    this.downClimbing = const Value.absent(),
    this.fail = const Value.absent(),
  });
  HallAttemptTableCompanion.insert({
    this.id = const Value.absent(),
    required int treaningId,
    required int categoryId,
    required int styleId,
    this.routeId = const Value.absent(),
    this.finish = const Value.absent(),
    this.start = const Value.absent(),
    this.ascentTypeId = const Value.absent(),
    required int suspensionCount,
    required int fallCount,
    required bool downClimbing,
    required bool fail,
  })  : treaningId = Value(treaningId),
        categoryId = Value(categoryId),
        styleId = Value(styleId),
        suspensionCount = Value(suspensionCount),
        fallCount = Value(fallCount),
        downClimbing = Value(downClimbing),
        fail = Value(fail);
  static Insertable<HallAttemptItem> custom({
    Expression<int>? id,
    Expression<int>? treaningId,
    Expression<int>? categoryId,
    Expression<int>? styleId,
    Expression<int>? routeId,
    Expression<DateTime>? finish,
    Expression<DateTime>? start,
    Expression<int>? ascentTypeId,
    Expression<int>? suspensionCount,
    Expression<int>? fallCount,
    Expression<bool>? downClimbing,
    Expression<bool>? fail,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (treaningId != null) 'treaning_id': treaningId,
      if (categoryId != null) 'category_id': categoryId,
      if (styleId != null) 'style_id': styleId,
      if (routeId != null) 'route_id': routeId,
      if (finish != null) 'finish': finish,
      if (start != null) 'start': start,
      if (ascentTypeId != null) 'ascent_type_id': ascentTypeId,
      if (suspensionCount != null) 'suspension_count': suspensionCount,
      if (fallCount != null) 'fall_count': fallCount,
      if (downClimbing != null) 'down_climbing': downClimbing,
      if (fail != null) 'fail': fail,
    });
  }

  HallAttemptTableCompanion copyWith(
      {Value<int>? id,
      Value<int>? treaningId,
      Value<int>? categoryId,
      Value<int>? styleId,
      Value<int?>? routeId,
      Value<DateTime?>? finish,
      Value<DateTime?>? start,
      Value<int?>? ascentTypeId,
      Value<int>? suspensionCount,
      Value<int>? fallCount,
      Value<bool>? downClimbing,
      Value<bool>? fail}) {
    return HallAttemptTableCompanion(
      id: id ?? this.id,
      treaningId: treaningId ?? this.treaningId,
      categoryId: categoryId ?? this.categoryId,
      styleId: styleId ?? this.styleId,
      routeId: routeId ?? this.routeId,
      finish: finish ?? this.finish,
      start: start ?? this.start,
      ascentTypeId: ascentTypeId ?? this.ascentTypeId,
      suspensionCount: suspensionCount ?? this.suspensionCount,
      fallCount: fallCount ?? this.fallCount,
      downClimbing: downClimbing ?? this.downClimbing,
      fail: fail ?? this.fail,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (treaningId.present) {
      map['treaning_id'] = Variable<int>(treaningId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (styleId.present) {
      map['style_id'] = Variable<int>(styleId.value);
    }
    if (routeId.present) {
      map['route_id'] = Variable<int>(routeId.value);
    }
    if (finish.present) {
      map['finish'] = Variable<DateTime>(finish.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (ascentTypeId.present) {
      map['ascent_type_id'] = Variable<int>(ascentTypeId.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HallAttemptTableCompanion(')
          ..write('id: $id, ')
          ..write('treaningId: $treaningId, ')
          ..write('categoryId: $categoryId, ')
          ..write('styleId: $styleId, ')
          ..write('routeId: $routeId, ')
          ..write('finish: $finish, ')
          ..write('start: $start, ')
          ..write('ascentTypeId: $ascentTypeId, ')
          ..write('suspensionCount: $suspensionCount, ')
          ..write('fallCount: $fallCount, ')
          ..write('downClimbing: $downClimbing, ')
          ..write('fail: $fail')
          ..write(')'))
        .toString();
  }
}

class $HallAttemptTableTable extends HallAttemptTable
    with TableInfo<$HallAttemptTableTable, HallAttemptItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HallAttemptTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _treaningIdMeta = const VerificationMeta('treaningId');
  @override
  late final GeneratedColumn<int> treaningId = GeneratedColumn<int>(
      'treaning_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES "hall_treaning_table" ("id")');
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _styleIdMeta = const VerificationMeta('styleId');
  @override
  late final GeneratedColumn<int> styleId = GeneratedColumn<int>(
      'style_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _routeIdMeta = const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<int> routeId = GeneratedColumn<int>(
      'route_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _finishMeta = const VerificationMeta('finish');
  @override
  late final GeneratedColumn<DateTime> finish = GeneratedColumn<DateTime>(
      'finish', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
      'start', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  final VerificationMeta _ascentTypeIdMeta =
      const VerificationMeta('ascentTypeId');
  @override
  late final GeneratedColumn<int> ascentTypeId = GeneratedColumn<int>(
      'ascent_type_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _suspensionCountMeta =
      const VerificationMeta('suspensionCount');
  @override
  late final GeneratedColumn<int> suspensionCount = GeneratedColumn<int>(
      'suspension_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _fallCountMeta = const VerificationMeta('fallCount');
  @override
  late final GeneratedColumn<int> fallCount = GeneratedColumn<int>(
      'fall_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _downClimbingMeta =
      const VerificationMeta('downClimbing');
  @override
  late final GeneratedColumn<bool> downClimbing = GeneratedColumn<bool>(
      'down_climbing', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("down_climbing" IN (0, 1))');
  final VerificationMeta _failMeta = const VerificationMeta('fail');
  @override
  late final GeneratedColumn<bool> fail = GeneratedColumn<bool>(
      'fail', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK ("fail" IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        treaningId,
        categoryId,
        styleId,
        routeId,
        finish,
        start,
        ascentTypeId,
        suspensionCount,
        fallCount,
        downClimbing,
        fail
      ];
  @override
  String get aliasedName => _alias ?? 'hall_attempt_table';
  @override
  String get actualTableName => 'hall_attempt_table';
  @override
  VerificationContext validateIntegrity(Insertable<HallAttemptItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('treaning_id')) {
      context.handle(
          _treaningIdMeta,
          treaningId.isAcceptableOrUnknown(
              data['treaning_id']!, _treaningIdMeta));
    } else if (isInserting) {
      context.missing(_treaningIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('style_id')) {
      context.handle(_styleIdMeta,
          styleId.isAcceptableOrUnknown(data['style_id']!, _styleIdMeta));
    } else if (isInserting) {
      context.missing(_styleIdMeta);
    }
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    }
    if (data.containsKey('finish')) {
      context.handle(_finishMeta,
          finish.isAcceptableOrUnknown(data['finish']!, _finishMeta));
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    }
    if (data.containsKey('ascent_type_id')) {
      context.handle(
          _ascentTypeIdMeta,
          ascentTypeId.isAcceptableOrUnknown(
              data['ascent_type_id']!, _ascentTypeIdMeta));
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
  HallAttemptItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HallAttemptItem(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      treaningId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}treaning_id'])!,
      categoryId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      styleId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}style_id'])!,
      routeId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}route_id']),
      finish: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}finish']),
      start: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start']),
      ascentTypeId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}ascent_type_id']),
      suspensionCount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}suspension_count'])!,
      fallCount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}fall_count'])!,
      downClimbing: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}down_climbing'])!,
      fail: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}fail'])!,
    );
  }

  @override
  $HallAttemptTableTable createAlias(String alias) {
    return $HallAttemptTableTable(attachedDatabase, alias);
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  late final $HallTreaningTableTable hallTreaningTable =
      $HallTreaningTableTable(this);
  late final $HallAttemptTableTable hallAttemptTable =
      $HallAttemptTableTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [hallTreaningTable, hallAttemptTable];
}

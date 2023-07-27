// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TravelPageState {
  int get tabIndex => throw _privateConstructorUsedError;
  List<CostLine> get costs => throw _privateConstructorUsedError;
  List<InsuranceLine> get insurances => throw _privateConstructorUsedError;
  List<TravelBudgetLine> get budgetLines => throw _privateConstructorUsedError;
  List<TravelDay> get days => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TravelPageStateCopyWith<TravelPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelPageStateCopyWith<$Res> {
  factory $TravelPageStateCopyWith(
          TravelPageState value, $Res Function(TravelPageState) then) =
      _$TravelPageStateCopyWithImpl<$Res, TravelPageState>;
  @useResult
  $Res call(
      {int tabIndex,
      List<CostLine> costs,
      List<InsuranceLine> insurances,
      List<TravelBudgetLine> budgetLines,
      List<TravelDay> days,
      bool loading});
}

/// @nodoc
class _$TravelPageStateCopyWithImpl<$Res, $Val extends TravelPageState>
    implements $TravelPageStateCopyWith<$Res> {
  _$TravelPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabIndex = null,
    Object? costs = null,
    Object? insurances = null,
    Object? budgetLines = null,
    Object? days = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      costs: null == costs
          ? _value.costs
          : costs // ignore: cast_nullable_to_non_nullable
              as List<CostLine>,
      insurances: null == insurances
          ? _value.insurances
          : insurances // ignore: cast_nullable_to_non_nullable
              as List<InsuranceLine>,
      budgetLines: null == budgetLines
          ? _value.budgetLines
          : budgetLines // ignore: cast_nullable_to_non_nullable
              as List<TravelBudgetLine>,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<TravelDay>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TravelPageStateCopyWith<$Res>
    implements $TravelPageStateCopyWith<$Res> {
  factory _$$_TravelPageStateCopyWith(
          _$_TravelPageState value, $Res Function(_$_TravelPageState) then) =
      __$$_TravelPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int tabIndex,
      List<CostLine> costs,
      List<InsuranceLine> insurances,
      List<TravelBudgetLine> budgetLines,
      List<TravelDay> days,
      bool loading});
}

/// @nodoc
class __$$_TravelPageStateCopyWithImpl<$Res>
    extends _$TravelPageStateCopyWithImpl<$Res, _$_TravelPageState>
    implements _$$_TravelPageStateCopyWith<$Res> {
  __$$_TravelPageStateCopyWithImpl(
      _$_TravelPageState _value, $Res Function(_$_TravelPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabIndex = null,
    Object? costs = null,
    Object? insurances = null,
    Object? budgetLines = null,
    Object? days = null,
    Object? loading = null,
  }) {
    return _then(_$_TravelPageState(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      costs: null == costs
          ? _value._costs
          : costs // ignore: cast_nullable_to_non_nullable
              as List<CostLine>,
      insurances: null == insurances
          ? _value._insurances
          : insurances // ignore: cast_nullable_to_non_nullable
              as List<InsuranceLine>,
      budgetLines: null == budgetLines
          ? _value._budgetLines
          : budgetLines // ignore: cast_nullable_to_non_nullable
              as List<TravelBudgetLine>,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<TravelDay>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TravelPageState implements _TravelPageState {
  const _$_TravelPageState(
      {required this.tabIndex,
      required final List<CostLine> costs,
      required final List<InsuranceLine> insurances,
      required final List<TravelBudgetLine> budgetLines,
      required final List<TravelDay> days,
      required this.loading})
      : _costs = costs,
        _insurances = insurances,
        _budgetLines = budgetLines,
        _days = days;

  @override
  final int tabIndex;
  final List<CostLine> _costs;
  @override
  List<CostLine> get costs {
    if (_costs is EqualUnmodifiableListView) return _costs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_costs);
  }

  final List<InsuranceLine> _insurances;
  @override
  List<InsuranceLine> get insurances {
    if (_insurances is EqualUnmodifiableListView) return _insurances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insurances);
  }

  final List<TravelBudgetLine> _budgetLines;
  @override
  List<TravelBudgetLine> get budgetLines {
    if (_budgetLines is EqualUnmodifiableListView) return _budgetLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_budgetLines);
  }

  final List<TravelDay> _days;
  @override
  List<TravelDay> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  final bool loading;

  @override
  String toString() {
    return 'TravelPageState(tabIndex: $tabIndex, costs: $costs, insurances: $insurances, budgetLines: $budgetLines, days: $days, loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TravelPageState &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex) &&
            const DeepCollectionEquality().equals(other._costs, _costs) &&
            const DeepCollectionEquality()
                .equals(other._insurances, _insurances) &&
            const DeepCollectionEquality()
                .equals(other._budgetLines, _budgetLines) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      tabIndex,
      const DeepCollectionEquality().hash(_costs),
      const DeepCollectionEquality().hash(_insurances),
      const DeepCollectionEquality().hash(_budgetLines),
      const DeepCollectionEquality().hash(_days),
      loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TravelPageStateCopyWith<_$_TravelPageState> get copyWith =>
      __$$_TravelPageStateCopyWithImpl<_$_TravelPageState>(this, _$identity);
}

abstract class _TravelPageState implements TravelPageState {
  const factory _TravelPageState(
      {required final int tabIndex,
      required final List<CostLine> costs,
      required final List<InsuranceLine> insurances,
      required final List<TravelBudgetLine> budgetLines,
      required final List<TravelDay> days,
      required final bool loading}) = _$_TravelPageState;

  @override
  int get tabIndex;
  @override
  List<CostLine> get costs;
  @override
  List<InsuranceLine> get insurances;
  @override
  List<TravelBudgetLine> get budgetLines;
  @override
  List<TravelDay> get days;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$_TravelPageStateCopyWith<_$_TravelPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

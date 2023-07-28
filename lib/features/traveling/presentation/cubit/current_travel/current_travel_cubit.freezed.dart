// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_travel_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrentTravelState {
  Travel? get travel => throw _privateConstructorUsedError;
  bool get useFilter => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentTravelStateCopyWith<CurrentTravelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentTravelStateCopyWith<$Res> {
  factory $CurrentTravelStateCopyWith(
          CurrentTravelState value, $Res Function(CurrentTravelState) then) =
      _$CurrentTravelStateCopyWithImpl<$Res, CurrentTravelState>;
  @useResult
  $Res call({Travel? travel, bool useFilter, String errorMessage});
}

/// @nodoc
class _$CurrentTravelStateCopyWithImpl<$Res, $Val extends CurrentTravelState>
    implements $CurrentTravelStateCopyWith<$Res> {
  _$CurrentTravelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = freezed,
    Object? useFilter = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      travel: freezed == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as Travel?,
      useFilter: null == useFilter
          ? _value.useFilter
          : useFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrentTravelStateCopyWith<$Res>
    implements $CurrentTravelStateCopyWith<$Res> {
  factory _$$_CurrentTravelStateCopyWith(_$_CurrentTravelState value,
          $Res Function(_$_CurrentTravelState) then) =
      __$$_CurrentTravelStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Travel? travel, bool useFilter, String errorMessage});
}

/// @nodoc
class __$$_CurrentTravelStateCopyWithImpl<$Res>
    extends _$CurrentTravelStateCopyWithImpl<$Res, _$_CurrentTravelState>
    implements _$$_CurrentTravelStateCopyWith<$Res> {
  __$$_CurrentTravelStateCopyWithImpl(
      _$_CurrentTravelState _value, $Res Function(_$_CurrentTravelState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = freezed,
    Object? useFilter = null,
    Object? errorMessage = null,
  }) {
    return _then(_$_CurrentTravelState(
      travel: freezed == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as Travel?,
      useFilter: null == useFilter
          ? _value.useFilter
          : useFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CurrentTravelState implements _CurrentTravelState {
  const _$_CurrentTravelState(
      {this.travel, required this.useFilter, required this.errorMessage});

  @override
  final Travel? travel;
  @override
  final bool useFilter;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'CurrentTravelState(travel: $travel, useFilter: $useFilter, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrentTravelState &&
            (identical(other.travel, travel) || other.travel == travel) &&
            (identical(other.useFilter, useFilter) ||
                other.useFilter == useFilter) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, travel, useFilter, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrentTravelStateCopyWith<_$_CurrentTravelState> get copyWith =>
      __$$_CurrentTravelStateCopyWithImpl<_$_CurrentTravelState>(
          this, _$identity);
}

abstract class _CurrentTravelState implements CurrentTravelState {
  const factory _CurrentTravelState(
      {final Travel? travel,
      required final bool useFilter,
      required final String errorMessage}) = _$_CurrentTravelState;

  @override
  Travel? get travel;
  @override
  bool get useFilter;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$_CurrentTravelStateCopyWith<_$_CurrentTravelState> get copyWith =>
      throw _privateConstructorUsedError;
}

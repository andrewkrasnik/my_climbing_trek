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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrentTravelState {
  Travel? get travel => throw _privateConstructorUsedError;
  TravelDay? get travelDay => throw _privateConstructorUsedError;
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
  $Res call(
      {Travel? travel,
      TravelDay? travelDay,
      bool useFilter,
      String errorMessage});
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
    Object? travelDay = freezed,
    Object? useFilter = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      travel: freezed == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as Travel?,
      travelDay: freezed == travelDay
          ? _value.travelDay
          : travelDay // ignore: cast_nullable_to_non_nullable
              as TravelDay?,
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
abstract class _$$CurrentTravelStateImplCopyWith<$Res>
    implements $CurrentTravelStateCopyWith<$Res> {
  factory _$$CurrentTravelStateImplCopyWith(_$CurrentTravelStateImpl value,
          $Res Function(_$CurrentTravelStateImpl) then) =
      __$$CurrentTravelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Travel? travel,
      TravelDay? travelDay,
      bool useFilter,
      String errorMessage});
}

/// @nodoc
class __$$CurrentTravelStateImplCopyWithImpl<$Res>
    extends _$CurrentTravelStateCopyWithImpl<$Res, _$CurrentTravelStateImpl>
    implements _$$CurrentTravelStateImplCopyWith<$Res> {
  __$$CurrentTravelStateImplCopyWithImpl(_$CurrentTravelStateImpl _value,
      $Res Function(_$CurrentTravelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travel = freezed,
    Object? travelDay = freezed,
    Object? useFilter = null,
    Object? errorMessage = null,
  }) {
    return _then(_$CurrentTravelStateImpl(
      travel: freezed == travel
          ? _value.travel
          : travel // ignore: cast_nullable_to_non_nullable
              as Travel?,
      travelDay: freezed == travelDay
          ? _value.travelDay
          : travelDay // ignore: cast_nullable_to_non_nullable
              as TravelDay?,
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

class _$CurrentTravelStateImpl implements _CurrentTravelState {
  const _$CurrentTravelStateImpl(
      {this.travel,
      this.travelDay,
      required this.useFilter,
      required this.errorMessage});

  @override
  final Travel? travel;
  @override
  final TravelDay? travelDay;
  @override
  final bool useFilter;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'CurrentTravelState(travel: $travel, travelDay: $travelDay, useFilter: $useFilter, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentTravelStateImpl &&
            (identical(other.travel, travel) || other.travel == travel) &&
            (identical(other.travelDay, travelDay) ||
                other.travelDay == travelDay) &&
            (identical(other.useFilter, useFilter) ||
                other.useFilter == useFilter) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, travel, travelDay, useFilter, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentTravelStateImplCopyWith<_$CurrentTravelStateImpl> get copyWith =>
      __$$CurrentTravelStateImplCopyWithImpl<_$CurrentTravelStateImpl>(
          this, _$identity);
}

abstract class _CurrentTravelState implements CurrentTravelState {
  const factory _CurrentTravelState(
      {final Travel? travel,
      final TravelDay? travelDay,
      required final bool useFilter,
      required final String errorMessage}) = _$CurrentTravelStateImpl;

  @override
  Travel? get travel;
  @override
  TravelDay? get travelDay;
  @override
  bool get useFilter;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$CurrentTravelStateImplCopyWith<_$CurrentTravelStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

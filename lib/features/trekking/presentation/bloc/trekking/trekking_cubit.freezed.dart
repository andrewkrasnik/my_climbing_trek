// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trekking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrekkingState {
  TrekkingPath? get currentPath => throw _privateConstructorUsedError;
  TrekkingPath? get previosPath => throw _privateConstructorUsedError;
  TrekkingPathEvent? get currentEvent => throw _privateConstructorUsedError;
  TrekPoint? get currentPoint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrekkingStateCopyWith<TrekkingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrekkingStateCopyWith<$Res> {
  factory $TrekkingStateCopyWith(
          TrekkingState value, $Res Function(TrekkingState) then) =
      _$TrekkingStateCopyWithImpl<$Res, TrekkingState>;
  @useResult
  $Res call(
      {TrekkingPath? currentPath,
      TrekkingPath? previosPath,
      TrekkingPathEvent? currentEvent,
      TrekPoint? currentPoint});
}

/// @nodoc
class _$TrekkingStateCopyWithImpl<$Res, $Val extends TrekkingState>
    implements $TrekkingStateCopyWith<$Res> {
  _$TrekkingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPath = freezed,
    Object? previosPath = freezed,
    Object? currentEvent = freezed,
    Object? currentPoint = freezed,
  }) {
    return _then(_value.copyWith(
      currentPath: freezed == currentPath
          ? _value.currentPath
          : currentPath // ignore: cast_nullable_to_non_nullable
              as TrekkingPath?,
      previosPath: freezed == previosPath
          ? _value.previosPath
          : previosPath // ignore: cast_nullable_to_non_nullable
              as TrekkingPath?,
      currentEvent: freezed == currentEvent
          ? _value.currentEvent
          : currentEvent // ignore: cast_nullable_to_non_nullable
              as TrekkingPathEvent?,
      currentPoint: freezed == currentPoint
          ? _value.currentPoint
          : currentPoint // ignore: cast_nullable_to_non_nullable
              as TrekPoint?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrekkingStateImplCopyWith<$Res>
    implements $TrekkingStateCopyWith<$Res> {
  factory _$$TrekkingStateImplCopyWith(
          _$TrekkingStateImpl value, $Res Function(_$TrekkingStateImpl) then) =
      __$$TrekkingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TrekkingPath? currentPath,
      TrekkingPath? previosPath,
      TrekkingPathEvent? currentEvent,
      TrekPoint? currentPoint});
}

/// @nodoc
class __$$TrekkingStateImplCopyWithImpl<$Res>
    extends _$TrekkingStateCopyWithImpl<$Res, _$TrekkingStateImpl>
    implements _$$TrekkingStateImplCopyWith<$Res> {
  __$$TrekkingStateImplCopyWithImpl(
      _$TrekkingStateImpl _value, $Res Function(_$TrekkingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPath = freezed,
    Object? previosPath = freezed,
    Object? currentEvent = freezed,
    Object? currentPoint = freezed,
  }) {
    return _then(_$TrekkingStateImpl(
      currentPath: freezed == currentPath
          ? _value.currentPath
          : currentPath // ignore: cast_nullable_to_non_nullable
              as TrekkingPath?,
      previosPath: freezed == previosPath
          ? _value.previosPath
          : previosPath // ignore: cast_nullable_to_non_nullable
              as TrekkingPath?,
      currentEvent: freezed == currentEvent
          ? _value.currentEvent
          : currentEvent // ignore: cast_nullable_to_non_nullable
              as TrekkingPathEvent?,
      currentPoint: freezed == currentPoint
          ? _value.currentPoint
          : currentPoint // ignore: cast_nullable_to_non_nullable
              as TrekPoint?,
    ));
  }
}

/// @nodoc

class _$TrekkingStateImpl implements _TrekkingState {
  const _$TrekkingStateImpl(
      {this.currentPath,
      this.previosPath,
      this.currentEvent,
      this.currentPoint});

  @override
  final TrekkingPath? currentPath;
  @override
  final TrekkingPath? previosPath;
  @override
  final TrekkingPathEvent? currentEvent;
  @override
  final TrekPoint? currentPoint;

  @override
  String toString() {
    return 'TrekkingState(currentPath: $currentPath, previosPath: $previosPath, currentEvent: $currentEvent, currentPoint: $currentPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrekkingStateImpl &&
            (identical(other.currentPath, currentPath) ||
                other.currentPath == currentPath) &&
            (identical(other.previosPath, previosPath) ||
                other.previosPath == previosPath) &&
            (identical(other.currentEvent, currentEvent) ||
                other.currentEvent == currentEvent) &&
            (identical(other.currentPoint, currentPoint) ||
                other.currentPoint == currentPoint));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currentPath, previosPath, currentEvent, currentPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrekkingStateImplCopyWith<_$TrekkingStateImpl> get copyWith =>
      __$$TrekkingStateImplCopyWithImpl<_$TrekkingStateImpl>(this, _$identity);
}

abstract class _TrekkingState implements TrekkingState {
  const factory _TrekkingState(
      {final TrekkingPath? currentPath,
      final TrekkingPath? previosPath,
      final TrekkingPathEvent? currentEvent,
      final TrekPoint? currentPoint}) = _$TrekkingStateImpl;

  @override
  TrekkingPath? get currentPath;
  @override
  TrekkingPath? get previosPath;
  @override
  TrekkingPathEvent? get currentEvent;
  @override
  TrekPoint? get currentPoint;
  @override
  @JsonKey(ignore: true)
  _$$TrekkingStateImplCopyWith<_$TrekkingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

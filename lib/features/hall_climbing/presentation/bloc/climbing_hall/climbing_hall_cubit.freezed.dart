// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'climbing_hall_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ClimbingHallState {
  List<ClimbingHallRoute>? get routes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClimbingHallStateCopyWith<ClimbingHallState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClimbingHallStateCopyWith<$Res> {
  factory $ClimbingHallStateCopyWith(
          ClimbingHallState value, $Res Function(ClimbingHallState) then) =
      _$ClimbingHallStateCopyWithImpl<$Res, ClimbingHallState>;
  @useResult
  $Res call({List<ClimbingHallRoute>? routes});
}

/// @nodoc
class _$ClimbingHallStateCopyWithImpl<$Res, $Val extends ClimbingHallState>
    implements $ClimbingHallStateCopyWith<$Res> {
  _$ClimbingHallStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(_value.copyWith(
      routes: freezed == routes
          ? _value.routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<ClimbingHallRoute>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClimbingHallStateCopyWith<$Res>
    implements $ClimbingHallStateCopyWith<$Res> {
  factory _$$_ClimbingHallStateCopyWith(_$_ClimbingHallState value,
          $Res Function(_$_ClimbingHallState) then) =
      __$$_ClimbingHallStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ClimbingHallRoute>? routes});
}

/// @nodoc
class __$$_ClimbingHallStateCopyWithImpl<$Res>
    extends _$ClimbingHallStateCopyWithImpl<$Res, _$_ClimbingHallState>
    implements _$$_ClimbingHallStateCopyWith<$Res> {
  __$$_ClimbingHallStateCopyWithImpl(
      _$_ClimbingHallState _value, $Res Function(_$_ClimbingHallState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routes = freezed,
  }) {
    return _then(_$_ClimbingHallState(
      routes: freezed == routes
          ? _value._routes
          : routes // ignore: cast_nullable_to_non_nullable
              as List<ClimbingHallRoute>?,
    ));
  }
}

/// @nodoc

class _$_ClimbingHallState implements _ClimbingHallState {
  const _$_ClimbingHallState({final List<ClimbingHallRoute>? routes})
      : _routes = routes;

  final List<ClimbingHallRoute>? _routes;
  @override
  List<ClimbingHallRoute>? get routes {
    final value = _routes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClimbingHallState(routes: $routes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClimbingHallState &&
            const DeepCollectionEquality().equals(other._routes, _routes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_routes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClimbingHallStateCopyWith<_$_ClimbingHallState> get copyWith =>
      __$$_ClimbingHallStateCopyWithImpl<_$_ClimbingHallState>(
          this, _$identity);
}

abstract class _ClimbingHallState implements ClimbingHallState {
  const factory _ClimbingHallState({final List<ClimbingHallRoute>? routes}) =
      _$_ClimbingHallState;

  @override
  List<ClimbingHallRoute>? get routes;
  @override
  @JsonKey(ignore: true)
  _$$_ClimbingHallStateCopyWith<_$_ClimbingHallState> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  $Res call({int tabIndex});
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
  }) {
    return _then(_value.copyWith(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({int tabIndex});
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
  }) {
    return _then(_$_TravelPageState(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TravelPageState implements _TravelPageState {
  const _$_TravelPageState({required this.tabIndex});

  @override
  final int tabIndex;

  @override
  String toString() {
    return 'TravelPageState(tabIndex: $tabIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TravelPageState &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TravelPageStateCopyWith<_$_TravelPageState> get copyWith =>
      __$$_TravelPageStateCopyWithImpl<_$_TravelPageState>(this, _$identity);
}

abstract class _TravelPageState implements TravelPageState {
  const factory _TravelPageState({required final int tabIndex}) =
      _$_TravelPageState;

  @override
  int get tabIndex;
  @override
  @JsonKey(ignore: true)
  _$$_TravelPageStateCopyWith<_$_TravelPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

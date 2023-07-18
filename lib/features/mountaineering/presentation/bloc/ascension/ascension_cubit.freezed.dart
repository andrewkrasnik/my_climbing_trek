// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ascension_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AscensionState {
  Ascension? get ascension => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AscensionStateCopyWith<AscensionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AscensionStateCopyWith<$Res> {
  factory $AscensionStateCopyWith(
          AscensionState value, $Res Function(AscensionState) then) =
      _$AscensionStateCopyWithImpl<$Res, AscensionState>;
  @useResult
  $Res call({Ascension? ascension});
}

/// @nodoc
class _$AscensionStateCopyWithImpl<$Res, $Val extends AscensionState>
    implements $AscensionStateCopyWith<$Res> {
  _$AscensionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ascension = freezed,
  }) {
    return _then(_value.copyWith(
      ascension: freezed == ascension
          ? _value.ascension
          : ascension // ignore: cast_nullable_to_non_nullable
              as Ascension?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AscensionStateCopyWith<$Res>
    implements $AscensionStateCopyWith<$Res> {
  factory _$$_AscensionStateCopyWith(
          _$_AscensionState value, $Res Function(_$_AscensionState) then) =
      __$$_AscensionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ascension? ascension});
}

/// @nodoc
class __$$_AscensionStateCopyWithImpl<$Res>
    extends _$AscensionStateCopyWithImpl<$Res, _$_AscensionState>
    implements _$$_AscensionStateCopyWith<$Res> {
  __$$_AscensionStateCopyWithImpl(
      _$_AscensionState _value, $Res Function(_$_AscensionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ascension = freezed,
  }) {
    return _then(_$_AscensionState(
      ascension: freezed == ascension
          ? _value.ascension
          : ascension // ignore: cast_nullable_to_non_nullable
              as Ascension?,
    ));
  }
}

/// @nodoc

class _$_AscensionState implements _AscensionState {
  const _$_AscensionState({this.ascension});

  @override
  final Ascension? ascension;

  @override
  String toString() {
    return 'AscensionState(ascension: $ascension)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AscensionState &&
            (identical(other.ascension, ascension) ||
                other.ascension == ascension));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ascension);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AscensionStateCopyWith<_$_AscensionState> get copyWith =>
      __$$_AscensionStateCopyWithImpl<_$_AscensionState>(this, _$identity);
}

abstract class _AscensionState implements AscensionState {
  const factory _AscensionState({final Ascension? ascension}) =
      _$_AscensionState;

  @override
  Ascension? get ascension;
  @override
  @JsonKey(ignore: true)
  _$$_AscensionStateCopyWith<_$_AscensionState> get copyWith =>
      throw _privateConstructorUsedError;
}

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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$AscensionStateImplCopyWith<$Res>
    implements $AscensionStateCopyWith<$Res> {
  factory _$$AscensionStateImplCopyWith(_$AscensionStateImpl value,
          $Res Function(_$AscensionStateImpl) then) =
      __$$AscensionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Ascension? ascension});
}

/// @nodoc
class __$$AscensionStateImplCopyWithImpl<$Res>
    extends _$AscensionStateCopyWithImpl<$Res, _$AscensionStateImpl>
    implements _$$AscensionStateImplCopyWith<$Res> {
  __$$AscensionStateImplCopyWithImpl(
      _$AscensionStateImpl _value, $Res Function(_$AscensionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ascension = freezed,
  }) {
    return _then(_$AscensionStateImpl(
      ascension: freezed == ascension
          ? _value.ascension
          : ascension // ignore: cast_nullable_to_non_nullable
              as Ascension?,
    ));
  }
}

/// @nodoc

class _$AscensionStateImpl implements _AscensionState {
  const _$AscensionStateImpl({this.ascension});

  @override
  final Ascension? ascension;

  @override
  String toString() {
    return 'AscensionState(ascension: $ascension)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AscensionStateImpl &&
            (identical(other.ascension, ascension) ||
                other.ascension == ascension));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ascension);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AscensionStateImplCopyWith<_$AscensionStateImpl> get copyWith =>
      __$$AscensionStateImplCopyWithImpl<_$AscensionStateImpl>(
          this, _$identity);
}

abstract class _AscensionState implements AscensionState {
  const factory _AscensionState({final Ascension? ascension}) =
      _$AscensionStateImpl;

  @override
  Ascension? get ascension;
  @override
  @JsonKey(ignore: true)
  _$$AscensionStateImplCopyWith<_$AscensionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

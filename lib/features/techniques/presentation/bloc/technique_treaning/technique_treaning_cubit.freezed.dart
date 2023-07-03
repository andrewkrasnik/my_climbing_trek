// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'technique_treaning_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TechniqueTreaningState {
  TechniqueTreaning? get currentTreaning => throw _privateConstructorUsedError;
  TechniqueTreaning? get previosTreaning => throw _privateConstructorUsedError;
  Technique? get currentTechnique => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TechniqueTreaningStateCopyWith<TechniqueTreaningState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TechniqueTreaningStateCopyWith<$Res> {
  factory $TechniqueTreaningStateCopyWith(TechniqueTreaningState value,
          $Res Function(TechniqueTreaningState) then) =
      _$TechniqueTreaningStateCopyWithImpl<$Res, TechniqueTreaningState>;
  @useResult
  $Res call(
      {TechniqueTreaning? currentTreaning,
      TechniqueTreaning? previosTreaning,
      Technique? currentTechnique});
}

/// @nodoc
class _$TechniqueTreaningStateCopyWithImpl<$Res,
        $Val extends TechniqueTreaningState>
    implements $TechniqueTreaningStateCopyWith<$Res> {
  _$TechniqueTreaningStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTreaning = freezed,
    Object? previosTreaning = freezed,
    Object? currentTechnique = freezed,
  }) {
    return _then(_value.copyWith(
      currentTreaning: freezed == currentTreaning
          ? _value.currentTreaning
          : currentTreaning // ignore: cast_nullable_to_non_nullable
              as TechniqueTreaning?,
      previosTreaning: freezed == previosTreaning
          ? _value.previosTreaning
          : previosTreaning // ignore: cast_nullable_to_non_nullable
              as TechniqueTreaning?,
      currentTechnique: freezed == currentTechnique
          ? _value.currentTechnique
          : currentTechnique // ignore: cast_nullable_to_non_nullable
              as Technique?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TechniqueTreaningStateCopyWith<$Res>
    implements $TechniqueTreaningStateCopyWith<$Res> {
  factory _$$_TechniqueTreaningStateCopyWith(_$_TechniqueTreaningState value,
          $Res Function(_$_TechniqueTreaningState) then) =
      __$$_TechniqueTreaningStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TechniqueTreaning? currentTreaning,
      TechniqueTreaning? previosTreaning,
      Technique? currentTechnique});
}

/// @nodoc
class __$$_TechniqueTreaningStateCopyWithImpl<$Res>
    extends _$TechniqueTreaningStateCopyWithImpl<$Res,
        _$_TechniqueTreaningState>
    implements _$$_TechniqueTreaningStateCopyWith<$Res> {
  __$$_TechniqueTreaningStateCopyWithImpl(_$_TechniqueTreaningState _value,
      $Res Function(_$_TechniqueTreaningState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTreaning = freezed,
    Object? previosTreaning = freezed,
    Object? currentTechnique = freezed,
  }) {
    return _then(_$_TechniqueTreaningState(
      currentTreaning: freezed == currentTreaning
          ? _value.currentTreaning
          : currentTreaning // ignore: cast_nullable_to_non_nullable
              as TechniqueTreaning?,
      previosTreaning: freezed == previosTreaning
          ? _value.previosTreaning
          : previosTreaning // ignore: cast_nullable_to_non_nullable
              as TechniqueTreaning?,
      currentTechnique: freezed == currentTechnique
          ? _value.currentTechnique
          : currentTechnique // ignore: cast_nullable_to_non_nullable
              as Technique?,
    ));
  }
}

/// @nodoc

class _$_TechniqueTreaningState implements _TechniqueTreaningState {
  const _$_TechniqueTreaningState(
      {this.currentTreaning, this.previosTreaning, this.currentTechnique});

  @override
  final TechniqueTreaning? currentTreaning;
  @override
  final TechniqueTreaning? previosTreaning;
  @override
  final Technique? currentTechnique;

  @override
  String toString() {
    return 'TechniqueTreaningState(currentTreaning: $currentTreaning, previosTreaning: $previosTreaning, currentTechnique: $currentTechnique)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TechniqueTreaningState &&
            (identical(other.currentTreaning, currentTreaning) ||
                other.currentTreaning == currentTreaning) &&
            (identical(other.previosTreaning, previosTreaning) ||
                other.previosTreaning == previosTreaning) &&
            (identical(other.currentTechnique, currentTechnique) ||
                other.currentTechnique == currentTechnique));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currentTreaning, previosTreaning, currentTechnique);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TechniqueTreaningStateCopyWith<_$_TechniqueTreaningState> get copyWith =>
      __$$_TechniqueTreaningStateCopyWithImpl<_$_TechniqueTreaningState>(
          this, _$identity);
}

abstract class _TechniqueTreaningState implements TechniqueTreaningState {
  const factory _TechniqueTreaningState(
      {final TechniqueTreaning? currentTreaning,
      final TechniqueTreaning? previosTreaning,
      final Technique? currentTechnique}) = _$_TechniqueTreaningState;

  @override
  TechniqueTreaning? get currentTreaning;
  @override
  TechniqueTreaning? get previosTreaning;
  @override
  Technique? get currentTechnique;
  @override
  @JsonKey(ignore: true)
  _$$_TechniqueTreaningStateCopyWith<_$_TechniqueTreaningState> get copyWith =>
      throw _privateConstructorUsedError;
}

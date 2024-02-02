// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_day_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TravelDayState {
  String get description => throw _privateConstructorUsedError;
  List<TransportLine> get transportLines => throw _privateConstructorUsedError;
  List<FeedingLine> get feedingsLines => throw _privateConstructorUsedError;
  List<StayLine> get stayLines => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TravelDayStateCopyWith<TravelDayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelDayStateCopyWith<$Res> {
  factory $TravelDayStateCopyWith(
          TravelDayState value, $Res Function(TravelDayState) then) =
      _$TravelDayStateCopyWithImpl<$Res, TravelDayState>;
  @useResult
  $Res call(
      {String description,
      List<TransportLine> transportLines,
      List<FeedingLine> feedingsLines,
      List<StayLine> stayLines,
      bool loading,
      String errorMessage});
}

/// @nodoc
class _$TravelDayStateCopyWithImpl<$Res, $Val extends TravelDayState>
    implements $TravelDayStateCopyWith<$Res> {
  _$TravelDayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? transportLines = null,
    Object? feedingsLines = null,
    Object? stayLines = null,
    Object? loading = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      transportLines: null == transportLines
          ? _value.transportLines
          : transportLines // ignore: cast_nullable_to_non_nullable
              as List<TransportLine>,
      feedingsLines: null == feedingsLines
          ? _value.feedingsLines
          : feedingsLines // ignore: cast_nullable_to_non_nullable
              as List<FeedingLine>,
      stayLines: null == stayLines
          ? _value.stayLines
          : stayLines // ignore: cast_nullable_to_non_nullable
              as List<StayLine>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TravelDayStateImplCopyWith<$Res>
    implements $TravelDayStateCopyWith<$Res> {
  factory _$$TravelDayStateImplCopyWith(_$TravelDayStateImpl value,
          $Res Function(_$TravelDayStateImpl) then) =
      __$$TravelDayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      List<TransportLine> transportLines,
      List<FeedingLine> feedingsLines,
      List<StayLine> stayLines,
      bool loading,
      String errorMessage});
}

/// @nodoc
class __$$TravelDayStateImplCopyWithImpl<$Res>
    extends _$TravelDayStateCopyWithImpl<$Res, _$TravelDayStateImpl>
    implements _$$TravelDayStateImplCopyWith<$Res> {
  __$$TravelDayStateImplCopyWithImpl(
      _$TravelDayStateImpl _value, $Res Function(_$TravelDayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? transportLines = null,
    Object? feedingsLines = null,
    Object? stayLines = null,
    Object? loading = null,
    Object? errorMessage = null,
  }) {
    return _then(_$TravelDayStateImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      transportLines: null == transportLines
          ? _value._transportLines
          : transportLines // ignore: cast_nullable_to_non_nullable
              as List<TransportLine>,
      feedingsLines: null == feedingsLines
          ? _value._feedingsLines
          : feedingsLines // ignore: cast_nullable_to_non_nullable
              as List<FeedingLine>,
      stayLines: null == stayLines
          ? _value._stayLines
          : stayLines // ignore: cast_nullable_to_non_nullable
              as List<StayLine>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TravelDayStateImpl implements _TravelDayState {
  const _$TravelDayStateImpl(
      {required this.description,
      required final List<TransportLine> transportLines,
      required final List<FeedingLine> feedingsLines,
      required final List<StayLine> stayLines,
      required this.loading,
      required this.errorMessage})
      : _transportLines = transportLines,
        _feedingsLines = feedingsLines,
        _stayLines = stayLines;

  @override
  final String description;
  final List<TransportLine> _transportLines;
  @override
  List<TransportLine> get transportLines {
    if (_transportLines is EqualUnmodifiableListView) return _transportLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transportLines);
  }

  final List<FeedingLine> _feedingsLines;
  @override
  List<FeedingLine> get feedingsLines {
    if (_feedingsLines is EqualUnmodifiableListView) return _feedingsLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_feedingsLines);
  }

  final List<StayLine> _stayLines;
  @override
  List<StayLine> get stayLines {
    if (_stayLines is EqualUnmodifiableListView) return _stayLines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stayLines);
  }

  @override
  final bool loading;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'TravelDayState(description: $description, transportLines: $transportLines, feedingsLines: $feedingsLines, stayLines: $stayLines, loading: $loading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelDayStateImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._transportLines, _transportLines) &&
            const DeepCollectionEquality()
                .equals(other._feedingsLines, _feedingsLines) &&
            const DeepCollectionEquality()
                .equals(other._stayLines, _stayLines) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      const DeepCollectionEquality().hash(_transportLines),
      const DeepCollectionEquality().hash(_feedingsLines),
      const DeepCollectionEquality().hash(_stayLines),
      loading,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelDayStateImplCopyWith<_$TravelDayStateImpl> get copyWith =>
      __$$TravelDayStateImplCopyWithImpl<_$TravelDayStateImpl>(
          this, _$identity);
}

abstract class _TravelDayState implements TravelDayState {
  const factory _TravelDayState(
      {required final String description,
      required final List<TransportLine> transportLines,
      required final List<FeedingLine> feedingsLines,
      required final List<StayLine> stayLines,
      required final bool loading,
      required final String errorMessage}) = _$TravelDayStateImpl;

  @override
  String get description;
  @override
  List<TransportLine> get transportLines;
  @override
  List<FeedingLine> get feedingsLines;
  @override
  List<StayLine> get stayLines;
  @override
  bool get loading;
  @override
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$TravelDayStateImplCopyWith<_$TravelDayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

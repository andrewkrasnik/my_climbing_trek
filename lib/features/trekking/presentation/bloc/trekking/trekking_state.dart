part of 'trekking_cubit.dart';

@freezed
class TrekkingState with _$TrekkingState {
  const factory TrekkingState({
    TrekkingPath? currentPath,
    TrekkingPath? previosPath,
    TrekkingPathEvent? currentEvent,
    TrekPoint? currentPoint,
  }) = _TrekkingState;

  factory TrekkingState.initial() => const TrekkingState();
}

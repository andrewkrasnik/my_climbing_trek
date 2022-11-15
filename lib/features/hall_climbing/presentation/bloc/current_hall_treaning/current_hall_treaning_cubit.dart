import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart';
import 'package:climbing_diary/features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'current_hall_treaning_state.dart';
part 'current_hall_treaning_cubit.freezed.dart';

@Injectable()
class CurrentHallTreaningCubit extends Cubit<CurrentHallTreaningState> {
  final NewHallAttemptFromRoute newHallAttemptFromRoute;
  final NewHallTreaning newHallTreaning;
  final NewHallAttempt newHallAttempt;

  bool get treaningStarted => state.current != null;

  bool get attemptStarted => state.currentAttempt != null;

  CurrentHallTreaningCubit({
    required this.newHallAttemptFromRoute,
    required this.newHallTreaning,
    required this.newHallAttempt,
  }) : super(CurrentHallTreaningState.initial());

  Future<void> loadData() async {}

  Future<void> startAttempt({required ClimbingHallAttempt attempt}) async {
    if (!attemptStarted) {
      attempt.start();
      emit(state.copyWith(currentAttempt: attempt));
    }
  }

  Future<void> attemptFromRoute(
      {required ClimbingHall climbingHall,
      required ClimbingHallRoute route,
      required ClimbingStyle style}) async {
    final failureOrTreaning = await newHallAttemptFromRoute(
      route: route,
      style: style,
      climbingHall: climbingHall,
    );

    failureOrTreaning.fold(
        (failure) => null,
        (treaning) => emit(state.copyWith(
            current: treaning, currentAttempt: treaning.currentAttempt)));
  }

  Future<void> finishCurrentAttempt({
    int suspensionCount = 0,
    int fallCount = 0,
    bool downClimbing = false,
    bool fail = false,
    int attemptCount = 0,
  }) async {
    final currentAttempt = state.currentAttempt;
    if (attemptStarted) {
      currentAttempt?.finish(
        attemptCount: attemptCount,
        downClimbing: downClimbing,
        fail: fail,
        fallCount: fallCount,
        suspensionCount: suspensionCount,
      );
      emit(state.copyWith(currentAttempt: null, lastAttempt: currentAttempt));
    }
  }

  Future<void> repeatAttempt({required ClimbingHallAttempt attempt}) async {
    final currentTreaning = state.current;
    if (currentTreaning != null) {
      final currentAttempt = state.currentAttempt;
      if (currentAttempt == null) {
        final newAttempt = attempt.copy();
        currentTreaning.attempts.add(newAttempt..start());
        emit(state.copyWith(currentAttempt: newAttempt));
      }
    }
  }

  Future<void> finishCurrentTreaning() async {
    final currentTreaning = state.current;

    if (currentTreaning != null) {
      final currentAttempt = state.currentAttempt;

      if (currentAttempt == null) {
        currentTreaning.finish();
        emit(state.copyWith(
          current: null,
          last: currentTreaning,
          currentAttempt: null,
          lastAttempt: null,
        ));
      }
    }
  }

  Future<void> repeatTreaning({required ClimbingHallTreaning treaning}) async {
    final currentTreaning = state.current;

    if (currentTreaning == null) {
      emit(state.copyWith(current: treaning.copy()));
    }
  }

  Future<void> newTreaning({required ClimbingHall climbingHall}) async {
    if (state.current == null) {
      final failureOrTreaning =
          await newHallTreaning(climbingHall: climbingHall);

      failureOrTreaning.fold((failure) => null,
          (treaning) => emit(state.copyWith(current: treaning)));
    }
  }

  Future<void> newAttempt({
    required ClimbingCategory category,
    required ClimbingStyle style,
    ClimbingHallRoute? route,
  }) async {
    if (state.current != null) {
      final failureOrAttempt = await newHallAttempt(
          treaning: state.current!,
          style: style,
          category: category,
          start: true,
          route: route);

      failureOrAttempt.fold((failure) => null,
          (attempt) => emit(state.copyWith(currentAttempt: attempt)));
    }
  }
}

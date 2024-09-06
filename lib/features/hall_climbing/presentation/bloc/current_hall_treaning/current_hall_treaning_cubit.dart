import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/data/difficulty_category.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/gym_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/get_gym_route_statistic.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/get_hall_treaning_usecase.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_attempt.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/save_hall_treaning_usecase.dart';

part 'current_hall_treaning_state.dart';
part 'current_hall_treaning_cubit.freezed.dart';

@Injectable()
class CurrentHallTreaningCubit extends Cubit<CurrentHallTreaningState> {
  final NewHallAttemptFromRoute newHallAttemptFromRoute;
  final NewHallTreaning newHallTreaning;
  final NewHallAttempt newHallAttempt;
  final CurrentHallTreaning currentHallTreaning;
  final FinishHallAttempt finishHallAttempt;
  final FinishHallTreaning finishHallTreaning;
  final LastHallTreaning lastHallTreaning;
  final DeleteHallAttempt deleteHallAttempt;
  final GetGymRouteStatistic getGymRouteStatistic;
  final GetHallTreaningUseCase _getHallTreaningUseCase;
  final SaveHallTreaningUseCase _saveHallTreaningUseCase;

  bool get treaningStarted => state.current != null;

  bool get attemptStarted => state.currentAttempt != null;

  CurrentHallTreaningCubit(
    this._getHallTreaningUseCase,
    this._saveHallTreaningUseCase, {
    required this.newHallAttemptFromRoute,
    required this.newHallTreaning,
    required this.newHallAttempt,
    required this.currentHallTreaning,
    required this.finishHallAttempt,
    required this.finishHallTreaning,
    required this.lastHallTreaning,
    required this.deleteHallAttempt,
    required this.getGymRouteStatistic,
  }) : super(CurrentHallTreaningState.initial());

  Future<void> loadCurrentTreanings() async {
    final failureOrCurrentTreaning = await currentHallTreaning();

    final failureOrLastTreaning = await lastHallTreaning();

    final treaning = failureOrCurrentTreaning.fold(
      (failure) => null,
      (treaning) => treaning,
    );

    emit(state.copyWith(
      current: treaning,
      last:
          failureOrLastTreaning.fold((failure) => null, (treaning) => treaning),
      currentAttempt: treaning?.currentAttempt,
      lastAttempt: treaning?.lastAttempt,
      currentRouteStatistic: null,
      lastRouteStatistic: null,
    ));

    if (treaning?.currentAttempt != null &&
        treaning?.currentAttempt?.route != null) {
      final route = treaning!.currentAttempt!.route!;
      final failureOrStatistic = await getGymRouteStatistic(routes: [route]);

      failureOrStatistic.fold(
          (l) => null,
          (statistic) =>
              emit(state.copyWith(currentRouteStatistic: statistic[route])));
    }

    if (treaning?.lastAttempt != null && treaning?.lastAttempt?.route != null) {
      final route = treaning!.lastAttempt!.route!;
      final failureOrStatistic = await getGymRouteStatistic(routes: [route]);

      failureOrStatistic.fold(
          (l) => null,
          (statistic) =>
              emit(state.copyWith(lastRouteStatistic: statistic[route])));
    }
  }

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

    failureOrTreaning.fold((failure) => null, (treaning) async {
      emit(state.copyWith(
          current: treaning, currentAttempt: treaning.currentAttempt));

      if (treaning.currentAttempt != null &&
          treaning.currentAttempt?.route != null) {
        final route = treaning.currentAttempt!.route!;
        final failureOrStatistic = await getGymRouteStatistic(routes: [route]);

        failureOrStatistic.fold(
            (l) => null,
            (statistic) =>
                emit(state.copyWith(currentRouteStatistic: statistic[route])));
      }
    });
  }

  Future<void> finishCurrentAttempt({
    int suspensionCount = 0,
    int fallCount = 0,
    bool downClimbing = false,
    bool fail = false,
    int attemptCount = 0,
  }) async {
    if (attemptStarted) {
      final failureOrAttempt = await finishHallAttempt(
        attempt: state.currentAttempt!,
        treaning: state.current!,
        attemptCount: attemptCount,
        downClimbing: downClimbing,
        fail: fail,
        fallCount: fallCount,
        suspensionCount: suspensionCount,
      );

      failureOrAttempt.fold(
        (failure) async => null,
        (attempt) async {
          final failureOrTreaning = await currentHallTreaning();

          failureOrTreaning.fold(
            (l) => null,
            (treaning) async {
              emit(
                state.copyWith(
                  currentAttempt: null,
                  currentRouteStatistic: null,
                  lastAttempt: attempt,
                  current: treaning,
                  lastRouteStatistic: null,
                ),
              );

              if (attempt.route != null) {
                final failureOrStatistic =
                    await getGymRouteStatistic(routes: [attempt.route!]);
                failureOrStatistic.fold(
                  (l) => null,
                  (statistic) {
                    if (statistic.isNotEmpty) {
                      emit(
                        state.copyWith(
                          lastRouteStatistic: statistic[attempt.route!],
                        ),
                      );
                    }
                  },
                );
              }
            },
          );
        },
      );
    }
  }

  Future<void> finishCurrentTreaning() async {
    if (treaningStarted && !attemptStarted) {
      final failureOrTreaning =
          await finishHallTreaning(treaning: state.current!);

      failureOrTreaning.fold(
          (failure) => null,
          (treaning) => emit(state.copyWith(
                current: null,
                last: treaning,
                currentAttempt: null,
                lastAttempt: null,
                currentRouteStatistic: null,
                lastRouteStatistic: null,
              )));
    }
  }

  Future<void> repeatAttempt({required ClimbingHallAttempt attempt}) async {
    if (treaningStarted && !attemptStarted && state.lastAttempt != null) {
      final currentAttempt = state.currentAttempt;
      if (currentAttempt == null) {
        final failureOrAttempt = await newHallAttempt(
            treaning: state.current!,
            style: state.currentAttempt!.style,
            category: state.currentAttempt!.category,
            start: true,
            route: state.currentAttempt!.route);

        failureOrAttempt.fold((failure) => null,
            (attempt) => emit(state.copyWith(currentAttempt: attempt)));
      }
    }
  }

  Future<void> repeatTreaning({required ClimbingHallTreaning treaning}) async {
    // final currentTreaning = state.current;

    // if (currentTreaning == null) {
    //   emit(state.copyWith(current: treaning.copy()));
    // }
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
    required DifficultyCategory category,
    required ClimbingStyle style,
    ClimbingHallRoute? route,
  }) async {
    if (treaningStarted) {
      final failureOrAttempt = await newHallAttempt(
          treaning: state.current!,
          style: style,
          category: category,
          start: true,
          route: route);

      failureOrAttempt.fold((failure) => null, (attempt) async {
        emit(state.copyWith(
            currentAttempt: attempt,
            current: (await currentHallTreaning())
                .fold((failure) => null, (treaning) => treaning)));
      });
    }
  }

  Future<void> deleteAttempt({required ClimbingHallAttempt attempt}) async {
    final failureOrUnit = await deleteHallAttempt(attempt: attempt);

    failureOrUnit.fold((failure) => null, (_) => loadData());
  }

  setTreaning({required ClimbingHallTreaning treaning}) {
    emit(state.copyWith(current: treaning));
  }

  void changeDate({required DateTime date}) async {
    if (state.current == null) {
      return;
    }

    emit(state.copyWith(loading: true));

    final failureOrTreaning = await _saveHallTreaningUseCase(
        treaning: state.current!.copyWith(date: date));

    failureOrTreaning.fold(
      (failure) => null,
      (treaning) => emit(state.copyWith(current: treaning, loading: false)),
    );
  }

  Future<void> loadData() async {
    if (state.current == null) {
      return;
    }

    emit(state.copyWith(loading: true));

    final failureOrTreaning =
        await _getHallTreaningUseCase(treaning: state.current!);

    failureOrTreaning.fold(
      (failure) => null,
      (treaning) => emit(
        state.copyWith(current: treaning, loading: false),
      ),
    );
  }
}

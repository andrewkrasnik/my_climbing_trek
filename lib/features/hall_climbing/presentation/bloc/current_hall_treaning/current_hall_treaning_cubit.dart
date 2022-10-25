import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart';
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

  CurrentHallTreaningCubit({
    required this.newHallAttemptFromRoute,
  }) : super(CurrentHallTreaningState.initial());

  Future<void> loadData() async {}

  Future<void> attemptFromRoute(
      {required ClimbingHallRoute route, required ClimbingStyle style}) async {
    final failureOrTreaning = await newHallAttemptFromRoute(
      route: route,
      style: style,
    );

    failureOrTreaning.fold(
        (failure) => null,
        (treaning) => emit(state.copyWith(
            current: treaning, currentAttempt: treaning.currentAttempt)));
  }

  Future<void> finishCurrentAttempt() async {
    final currentAttempt = state.currentAttempt;
    if (currentAttempt != null) {
      emit(state.copyWith(currentAttempt: null, lastAttempt: currentAttempt));
    }
  }

  Future<void> repeatAttempt({required ClimbingHallAttempt attempt}) async {
    final currentTreaning = state.current;
    if (currentTreaning != null) {
      final currentAttempt = state.currentAttempt;
      if (currentAttempt == null) {
        final newAttempt = attempt.copy();
        currentTreaning.attempts.add(newAttempt);
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
}

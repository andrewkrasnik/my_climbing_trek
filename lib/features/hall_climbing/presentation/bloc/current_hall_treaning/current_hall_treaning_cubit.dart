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

  Future<void> attemptFromRoute({required ClimbingHallRoute route}) async {
    final failureOrTreaning = await newHallAttemptFromRoute(route: route);

    failureOrTreaning.fold(
        (failure) => null,
        (treaning) => emit(state.copyWith(
            current: treaning, currentAttempt: treaning.currentAttempt)));
  }
}

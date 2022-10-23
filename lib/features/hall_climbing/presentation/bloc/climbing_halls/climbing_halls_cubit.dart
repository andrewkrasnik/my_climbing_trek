import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:climbing_diary/features/hall_climbing/domain/usecases/all_climbing_halls.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'climbing_halls_state.dart';
part 'climbing_halls_cubit.freezed.dart';

@Injectable()
class ClimbingHallsCubit extends Cubit<ClimbingHallsState> {
  final AllClimbingHalls allClimbingHalls;
  ClimbingHallsCubit({
    required this.allClimbingHalls,
  }) : super(const ClimbingHallsState.initial());

  Future<void> loadData() async {
    emit(const ClimbingHallsState.loading());
    final failureOrHalls = await allClimbingHalls();
    failureOrHalls.fold(
        (l) => null, (halls) => emit(ClimbingHallsState.data(halls: halls)));
  }
}

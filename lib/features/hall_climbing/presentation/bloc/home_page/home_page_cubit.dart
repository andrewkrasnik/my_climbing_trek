import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/usecases/all_climbing_halls.dart';

part 'home_page_cubit.freezed.dart';
part 'home_page_state.dart';

@Injectable()
class HomePageCubit extends Cubit<HomePageState> {
  final AllClimbingHalls allClimbingHalls;
  HomePageCubit({
    required this.allClimbingHalls,
  }) : super(const HomePageState.initial());

  Future<void> loadData() async {
    emit(const HomePageState.loading());
    final failureOrHalls = await allClimbingHalls();
    failureOrHalls.fold(
        (l) => null, (halls) => emit(HomePageState.data(halls: halls)));
  }
}

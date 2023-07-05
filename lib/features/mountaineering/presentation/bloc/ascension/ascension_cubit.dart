import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/add_ascension_usecase.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/get_ascension_usecase.dart';

part 'ascension_cubit.freezed.dart';
part 'ascension_state.dart';

@Injectable()
class AscensionCubit extends Cubit<AscensionState> {
  final AddAscensionUsecase _addAscensionUsecase;
  final GetAscensionUsecase _getAscensionUsecase;

  AscensionCubit(
    this._addAscensionUsecase,
    this._getAscensionUsecase,
  ) : super(AscensionState.initial());

  Future<void> loadData() async {
    final failureOrAscension = await _getAscensionUsecase();

    failureOrAscension.fold((failure) => null,
        (ascension) => emit(state.copyWith(ascension: ascension)));
  }

  Future<void> addAscension({
    required Mountain mountain,
    required MountainRoute route,
  }) async {
    final failureOrAscension = await _addAscensionUsecase(
      mountain: mountain,
      route: route,
    );

    failureOrAscension.fold((failure) => null,
        (ascension) => emit(state.copyWith(ascension: ascension)));
  }
}

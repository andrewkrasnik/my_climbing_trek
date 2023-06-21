import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/treanings/domain/usecases/delete_treaning.dart';
import 'package:my_climbing_trek/features/treanings/domain/usecases/get_all_treanings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'treanings_state.dart';
part 'treanings_cubit.freezed.dart';

@injectable
class TreaningsCubit extends Cubit<TreaningsState> {
  final GetAllTreanings _allTreanings;
  final DeleteTreaning _deleteTreaning;

  TreaningsCubit(
    this._allTreanings,
    this._deleteTreaning,
  ) : super(const TreaningsState.initial());

  Future<void> loadData({
    required bool rock,
    required bool gym,
    required bool ice,
    required bool cardio,
    required bool strength,
    required bool travel,
    required bool trekking,
  }) async {
    emit(const TreaningsState.loading());

    final failureOrTreanings = await _allTreanings(
      cardio: cardio,
      gym: gym,
      ice: ice,
      rock: rock,
      strength: strength,
      travel: travel,
      trekking: trekking,
    );

    failureOrTreanings.fold(
        (failure) => emit(TreaningsState.error(
              description: failure.toString(),
            )),
        (treanings) => emit(
              TreaningsState.data(treanings: treanings),
            ));
  }

  Future<void> delete({
    required Treaning treaning,
    required bool rock,
    required bool gym,
    required bool ice,
    required bool cardio,
    required bool strength,
    required bool travel,
    required bool trekking,
  }) async {
    final failureOrUnit = await _deleteTreaning(treaning: treaning);

    failureOrUnit.fold(
      (failure) => emit(TreaningsState.error(
        description: failure.toString(),
      )),
      (_) => loadData(
          rock: rock,
          gym: gym,
          ice: ice,
          cardio: cardio,
          strength: strength,
          travel: travel,
          trekking: trekking),
    );

    // loadData();
  }
}

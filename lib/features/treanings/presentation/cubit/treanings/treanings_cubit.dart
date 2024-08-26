import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';
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
    required TreaningsSettings settings,
  }) async {
    emit(const TreaningsState.loading());

    final failureOrTreanings = await _allTreanings(
      cardio: settings.useCardioTreanings,
      gym: settings.useGymTreanings,
      ice: settings.useIceTreanings,
      rock: settings.useRockTraining,
      strength: settings.useStrengthTraining,
      travel: settings.useTraveling,
      trekking: settings.useTrekking,
      techniques: settings.useTechniques,
      mountaneering: settings.useMountaineering,
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
    required TreaningsSettings settings,
  }) async {
    final failureOrUnit = await _deleteTreaning(treaning: treaning);

    failureOrUnit.fold(
      (failure) => emit(TreaningsState.error(
        description: failure.toString(),
      )),
      (_) => loadData(settings: settings),
    );

    // loadData();
  }
}

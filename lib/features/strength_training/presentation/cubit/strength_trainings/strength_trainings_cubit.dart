import 'package:my_climbing_trek/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/usecases/delete_strength_treaning.dart';
import 'package:my_climbing_trek/features/strength_training/domain/usecases/get_strength_treanings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'strength_trainings_state.dart';
part 'strength_trainings_cubit.freezed.dart';

@Injectable()
class StrengthTrainingsCubit extends Cubit<StrengthTrainingsState> {
  final GetStrengthTreanings _getStrengthTreanings;
  final DeleteStrengthTreaning _deleteStrengthTreaning;

  StrengthTrainingsCubit(
    this._getStrengthTreanings,
    this._deleteStrengthTreaning,
  ) : super(const StrengthTrainingsState.initial());

  Future<void> loadData() async {
    emit(const StrengthTrainingsState.loading());

    final failureOrTreanings = await _getStrengthTreanings();

    failureOrTreanings.fold(
        (failure) => emit(StrengthTrainingsState.error(
              description: failure.toString(),
            )),
        (treanings) => emit(
              StrengthTrainingsState.data(treanings: treanings),
            ));
  }

  Future<void> delete({required StrengthTreaning treaning}) async {
    final failureOrUnit = await _deleteStrengthTreaning(treaning: treaning);

    failureOrUnit.fold(
        (failure) => emit(StrengthTrainingsState.error(
              description: failure.toString(),
            )),
        (_) => null);

    loadData();
  }
}

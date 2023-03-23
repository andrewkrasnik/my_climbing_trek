import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/domain/usecases/get_strength_treanings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'strength_trainings_state.dart';
part 'strength_trainings_cubit.freezed.dart';

@Injectable()
class StrengthTrainingsCubit extends Cubit<StrengthTrainingsState> {
  final GetStrengthTreanings _getStrengthTreanings;

  StrengthTrainingsCubit(this._getStrengthTreanings)
      : super(const StrengthTrainingsState.initial());

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

  void delete({required StrengthTreaning treaning}) {}
}

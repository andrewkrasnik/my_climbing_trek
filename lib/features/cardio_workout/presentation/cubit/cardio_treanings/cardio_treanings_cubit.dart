import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_exercise.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/features/cardio_workout/domain/entities/cardio_treaning.dart';
import 'package:climbing_diary/features/cardio_workout/domain/usecases/delete_cardio_treaning.dart';
import 'package:climbing_diary/features/cardio_workout/domain/usecases/get_cardio_treanings.dart';
import 'package:climbing_diary/features/cardio_workout/domain/usecases/save_cardio_treaning.dart';

part 'cardio_treanings_cubit.freezed.dart';
part 'cardio_treanings_state.dart';

@Injectable()
class CardioTreaningsCubit extends Cubit<CardioTreaningsState> {
  final GetCardioTreanings getCardioTreanings;
  final DeleteCardioTreaning deleteCardioTreaning;
  final SaveCardioTreaning saveCardioTreaning;

  CardioTreaningsCubit(
    this.getCardioTreanings,
    this.deleteCardioTreaning,
    this.saveCardioTreaning,
  ) : super(const CardioTreaningsState.initial());

  Future<void> loadData() async {
    emit(const CardioTreaningsState.loading());

    final failureOrTreanings = await getCardioTreanings();

    failureOrTreanings.fold(
        (failure) => emit(CardioTreaningsState.error(
              description: failure.toString(),
            )),
        (treanings) => emit(
              CardioTreaningsState.data(treanings: treanings),
            ));
  }

  Future<void> save({
    String id = '',
    required DateTime date,
    required int duration,
    required CardioExercise exercise,
    required double length,
  }) async {
    emit(const CardioTreaningsState.loading());

    final failureOrTreaning = await saveCardioTreaning(
      date: date,
      duration: duration,
      exercise: exercise,
      length: length,
      id: id,
    );

    failureOrTreaning.fold(
        (failure) => emit(CardioTreaningsState.error(
              description: failure.toString(),
            )),
        (treaning) => loadData());
  }

  Future<void> delete({
    required CardioTreaning treaning,
  }) async {
    emit(const CardioTreaningsState.loading());

    final failureOrUnit = await deleteCardioTreaning(treaning: treaning);

    failureOrUnit.fold(
        (failure) => emit(CardioTreaningsState.error(
              description: failure.toString(),
            )),
        (unit) => loadData());
  }
}

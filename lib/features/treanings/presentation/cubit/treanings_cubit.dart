import 'package:climbing_diary/core/data/treaning.dart';
import 'package:climbing_diary/features/treanings/domain/usecases/get_all_treanings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'treanings_state.dart';
part 'treanings_cubit.freezed.dart';

@injectable
class TreaningsCubit extends Cubit<TreaningsState> {
  final GetAllTreanings _allTreanings;

  TreaningsCubit(this._allTreanings) : super(const TreaningsState.initial());

  Future<void> loadData() async {
    emit(const TreaningsState.loading());

    final failureOrTreanings = await _allTreanings();

    failureOrTreanings.fold(
        (failure) => emit(TreaningsState.error(
              description: failure.toString(),
            )),
        (treanings) => emit(
              TreaningsState.data(treanings: treanings),
            ));
  }

  Future<void> delete({required Treaning treaning}) async {
    // final failureOrUnit = await _deleteStrengthTreaning(treaning: treaning);

    // failureOrUnit.fold(
    //     (failure) => emit(StrengthTrainingsState.error(
    //           description: failure.toString(),
    //         )),
    //     (_) => null);

    // loadData();
  }
}

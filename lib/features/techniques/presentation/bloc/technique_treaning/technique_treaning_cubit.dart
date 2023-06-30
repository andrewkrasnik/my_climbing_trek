import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/add_technique_to_treaning_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/add_technique_treaning_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/current_technique_treaning_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/finish_technique_treaning_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/previos_technique_treaning_usecase.dart';

part 'technique_treaning_state.dart';
part 'technique_treaning_cubit.freezed.dart';

@Injectable()
class TechniqueTreaningCubit extends Cubit<TechniqueTreaningState> {
  final AddTechniqueTreaningUseCase _addTechniqueTreaningUseCase;
  final PreviosTechniqueTreaningUseCase _previosTechniqueTreaningUseCase;
  final CurrentTechniqueTreaningUseCase _currentTechniqueTreaningUseCase;
  final AddTechniqueToTreaningUseCase _addTechniqueToTreaningUseCase;
  final FinishTechniqueTreaningUseCase _finishTechniqueTreaningUseCase;

  TechniqueTreaningCubit(
    this._addTechniqueTreaningUseCase,
    this._previosTechniqueTreaningUseCase,
    this._currentTechniqueTreaningUseCase,
    this._addTechniqueToTreaningUseCase,
    this._finishTechniqueTreaningUseCase,
  ) : super(TechniqueTreaningState.initial());

  Future<void> loadData() async {
    final failureOrCurrentTreaning = await _currentTechniqueTreaningUseCase();

    failureOrCurrentTreaning.fold((failure) => null, (treaning) async {
      emit(state.copyWith(
        currentTreaning: treaning,
      ));

      final failureOrPath = await _previosTechniqueTreaningUseCase();

      failureOrPath.fold((failure) => null, (treaning) async {
        emit(state.copyWith(previosTreaning: treaning));
      });
    });
  }

  Future<void> addTechniqueGroup({
    required TechniqueGroup group,
    Technique? technique,
  }) async {
    if (state.currentTreaning == null) {
      final failureOrTreaning = await _addTechniqueTreaningUseCase(
          group: group, technique: technique);

      failureOrTreaning.fold((failure) => null, (treaning) {
        emit(state.copyWith(
          currentTreaning: treaning,
          currentTechnique: technique,
        ));
      });
    } else {
      final failureOrTreaning = await _addTechniqueToTreaningUseCase(
          treaning: state.currentTreaning!, group: group, technique: technique);

      failureOrTreaning.fold((failure) => null, (treaning) {
        emit(state.copyWith(
          currentTechnique: technique,
        ));
      });
    }
  }

  Future<void> addTechnique({
    required TechniqueGroup group,
    required Technique technique,
  }) async {}

  Future<void> addOption({
    required Technique technique,
    required TechniqueOption option,
  }) async {}

  Future<void> finishTreaning() async {
    if (state.currentTreaning != null) {
      final failureOrTreaning = await _finishTechniqueTreaningUseCase(
          treaning: state.currentTreaning!);

      failureOrTreaning.fold((failure) => null, (treaning) => loadData());
    }
  }
}

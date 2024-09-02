import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/add_technique_to_treaning_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/add_technique_treaning_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/current_technique_treaning_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/delete_technique_treaning_item_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/edit_technique_item_usecase.dart';
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
  final EditTechniqueItemUseCase _editTechniqueItemUseCase;
  final DeleteTechniqueTreaningItemUseCase _deleteTechniqueTreaningItemUseCase;

  TechniqueTreaningCubit(
    this._addTechniqueTreaningUseCase,
    this._previosTechniqueTreaningUseCase,
    this._currentTechniqueTreaningUseCase,
    this._addTechniqueToTreaningUseCase,
    this._finishTechniqueTreaningUseCase,
    this._editTechniqueItemUseCase,
    this._deleteTechniqueTreaningItemUseCase,
  ) : super(TechniqueTreaningState.initial());

  Future<void> setTreaning({required TechniqueTreaning treaning}) async {
    emit(TechniqueTreaningState(currentTreaning: treaning));
  }

  Future<void> loadData() async {
    final failureOrCurrentTreaning = await _currentTechniqueTreaningUseCase();

    failureOrCurrentTreaning.fold((failure) => null, (treaning) async {
      emit(state.copyWith(
        currentTreaning: treaning,
        currentTechnique: null,
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
    List<TechniqueOption>? options,
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
        treaning: state.currentTreaning!,
        group: group,
        technique: technique,
        options: options,
      );

      failureOrTreaning.fold((failure) => null, (treaning) {
        emit(state.copyWith(
          currentTechnique: technique,
        ));
      });
    }
  }

  Future<void> editTreaningItem({
    required TechniqueTreaningItem item,
    required List<TechniqueOption> options,
    required String comment,
    DateTime? startTime,
    DateTime? finishTime,
  }) async {
    if (state.currentTreaning != null) {
      final failureOrItem = await _editTechniqueItemUseCase(
        item: item,
        comment: comment,
        options: options,
        startTime: startTime,
        finishTime: finishTime,
      );

      failureOrItem.fold((failure) => null, (treaning) => loadData());
    }
  }

  Future<void> startTreaningItem({
    required TechniqueTreaningItem item,
    DateTime? time,
  }) async {}

  Future<void> finishTreaningItem({
    required TechniqueTreaningItem item,
    DateTime? time,
  }) async {}

  Future<void> finishTreaning() async {
    if (state.currentTreaning != null) {
      final failureOrTreaning = await _finishTechniqueTreaningUseCase(
          treaning: state.currentTreaning!);

      failureOrTreaning.fold((failure) => null, (treaning) => loadData());
    }
  }

  Future<void> deleteItem({required TechniqueTreaningItem item}) async {
    if (state.currentTreaning != null) {
      final failureOrUnit =
          await _deleteTechniqueTreaningItemUseCase(item: item);

      failureOrUnit.fold((failure) => null, (treaning) => loadData());
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/add_my_technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/delete_my_technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/delete_technique_group_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/get_technique_groups_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/get_techniques_editing_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/load_my_technique_groups.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/save_technique_group_usecase.dart';

part 'technique_groups_state.dart';
part 'technique_groups_cubit.freezed.dart';

@Injectable()
class TechniqueGroupsCubit extends Cubit<TechniqueGroupsState> {
  final GetTechniqueGroupsUsecase _getTechniqueGroupsUsecase;
  final DeleteTechniqueGroupUsecase _deleteTechniqueGroupUsecase;
  final SaveTechniqueGroupUsecase _saveTechniqueGroupUsecase;
  final LoadMyTechniqueGroup _loadMyTechniqueGroup;
  final DeleteMyTechniqueGroup _deleteMyTechniqueGroup;
  final AddMyTechniqueGroup _addMyTechniqueGroup;

  final GetTechniquesEditingUsecase _getTechniquesEditingUsecase;

  TechniqueGroupsCubit(
    this._getTechniqueGroupsUsecase,
    this._getTechniquesEditingUsecase,
    this._deleteTechniqueGroupUsecase,
    this._saveTechniqueGroupUsecase,
    this._loadMyTechniqueGroup,
    this._deleteMyTechniqueGroup,
    this._addMyTechniqueGroup,
  ) : super(const TechniqueGroupsState.initial());

  Future<void> loadData() async {
    emit(const TechniqueGroupsState.loading());

    final failureOrGroups = await _getTechniqueGroupsUsecase();

    failureOrGroups.fold(
      (failure) =>
          emit(TechniqueGroupsState.error(description: failure.toString())),
      (groups) async {
        emit(
          TechniqueGroupsState.data(
            groups: groups,
            editing: false,
          ),
        );

        final failureOrBool = await _getTechniquesEditingUsecase();

        failureOrBool.fold(
          (failure) =>
              emit(TechniqueGroupsState.error(description: failure.toString())),
          (editing) => emit(
            TechniqueGroupsState.data(
              groups: groups,
              editing: editing,
            ),
          ),
        );
      },
    );
  }

  Future<void> save({
    required String name,
    required String id,
    required String description,
    required String image,
  }) async {
    emit(const TechniqueGroupsState.loading());

    final failureOrUnit = await _saveTechniqueGroupUsecase(
      description: description,
      id: id,
      image: image,
      name: name,
    );

    failureOrUnit.fold(
      (failure) =>
          emit(TechniqueGroupsState.error(description: failure.toString())),
      (_) => loadData(),
    );
  }

  Future<void> delete({
    required TechniqueGroup group,
  }) async {
    final failureOrUnit = await _deleteTechniqueGroupUsecase(
      group: group,
    );

    failureOrUnit.fold(
      (failure) =>
          emit(TechniqueGroupsState.error(description: failure.toString())),
      (_) => loadData(),
    );
  }

  Future<void> loadMyData() async {
    emit(const TechniqueGroupsState.loading());

    final failureOrGroups = await _loadMyTechniqueGroup();

    failureOrGroups.fold(
        (failure) =>
            emit(TechniqueGroupsState.error(description: failure.toString())),
        (groups) =>
            emit(TechniqueGroupsState.data(groups: groups, editing: false)));
  }

  Future<void> bookmarGroup(
      {required TechniqueGroup group, bool myData = false}) async {
    emit(const TechniqueGroupsState.loading());

    if (group.localData) {
      final failureOrUnit = await _deleteMyTechniqueGroup(group: group);

      failureOrUnit.fold(
        (failure) =>
            emit(TechniqueGroupsState.error(description: failure.toString())),
        (_) {
          if (myData) {
            loadMyData();
          } else {
            loadData();
          }
        },
      );
    } else {
      final failureOrUnit = await _addMyTechniqueGroup(group: group);

      failureOrUnit.fold(
        (failure) =>
            emit(TechniqueGroupsState.error(description: failure.toString())),
        (_) {
          if (myData) {
            loadMyData();
          } else {
            loadData();
          }
        },
      );
    }
  }
}

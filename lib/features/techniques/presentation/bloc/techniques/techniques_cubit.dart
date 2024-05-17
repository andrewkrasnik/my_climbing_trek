import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/delete_technique_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/get_techniques_editing_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/get_techniques_usecase.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/save_technique_usecase.dart';

part 'techniques_state.dart';
part 'techniques_cubit.freezed.dart';

@Injectable()
class TechniquesCubit extends Cubit<TechniquesState> {
  final GetTechniquesUsecase _getTechniquesUsecase;
  final GetTechniquesEditingUsecase _getTechniquesEditingUsecase;
  final DeleteTechniqueUsecase _deleteTechniqueUsecase;
  final SaveTechniqueUsecase _saveTechniqueUsecase;

  TechniquesCubit(
    this._getTechniquesUsecase,
    this._getTechniquesEditingUsecase,
    this._deleteTechniqueUsecase,
    this._saveTechniqueUsecase,
  ) : super(const TechniquesState.initial());

  Future<void> loadData({required TechniqueGroup group}) async {
    emit(const TechniquesState.loading());

    final failureOrTechniques = await _getTechniquesUsecase(group: group);

    failureOrTechniques.fold(
      (failure) => emit(TechniquesState.error(description: failure.toString())),
      (techniques) async {
        emit(
          TechniquesState.data(
            techniques: techniques,
            editing: false,
          ),
        );

        final failureOrBool = await _getTechniquesEditingUsecase();

        failureOrBool.fold(
          (failure) =>
              emit(TechniquesState.error(description: failure.toString())),
          (editing) => emit(
            TechniquesState.data(
              techniques: techniques,
              editing: editing,
            ),
          ),
        );
      },
    );
  }

  Future<void> saveTechnique({
    required TechniqueGroup group,
    required String name,
    required String id,
    required String description,
    String? image,
    List<TechniqueOption>? options,
    List<String>? links,
  }) async {
    emit(const TechniquesState.loading());

    final failureOrUnit = await _saveTechniqueUsecase(
      group: group,
      name: name,
      description: description,
      id: id,
      image: image,
      links: links,
      options: options,
    );

    failureOrUnit.fold(
      (failure) => emit(TechniquesState.error(description: failure.toString())),
      (_) => loadData(group: group),
    );
  }

  Future<void> deleteTechnique(
      {required TechniqueGroup group, required Technique technique}) async {
    emit(const TechniquesState.loading());

    final failureOrUnit = await _deleteTechniqueUsecase(
      group: group,
      technique: technique,
    );

    failureOrUnit.fold(
      (failure) => emit(TechniquesState.error(description: failure.toString())),
      (_) => loadData(group: group),
    );
  }
}

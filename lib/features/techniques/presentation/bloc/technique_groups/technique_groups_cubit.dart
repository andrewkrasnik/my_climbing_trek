import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/get_technique_groups_usecase.dart';

part 'technique_groups_state.dart';
part 'technique_groups_cubit.freezed.dart';

@Injectable()
class TechniqueGroupsCubit extends Cubit<TechniqueGroupsState> {
  final GetTechniqueGroupsUsecase _getTechniqueGroupsUsecase;
  TechniqueGroupsCubit(this._getTechniqueGroupsUsecase)
      : super(const TechniqueGroupsState.initial());

  Future<void> loadData() async {
    emit(const TechniqueGroupsState.loading());
    final failureOrGroups = await _getTechniqueGroupsUsecase();
    failureOrGroups.fold(
        (failure) =>
            emit(TechniqueGroupsState.error(description: failure.toString())),
        (groups) => emit(TechniqueGroupsState.data(groups: groups)));
  }
}

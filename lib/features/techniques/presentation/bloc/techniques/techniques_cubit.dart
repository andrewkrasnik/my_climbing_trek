import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/usecases/get_techniques_usecase.dart';

part 'techniques_state.dart';
part 'techniques_cubit.freezed.dart';

@Injectable()
class TechniquesCubit extends Cubit<TechniquesState> {
  final GetTechniquesUsecase _getTechniquesUsecase;

  TechniquesCubit(this._getTechniquesUsecase)
      : super(const TechniquesState.initial());

  Future<void> loadData({required TechniqueGroup group}) async {
    emit(const TechniquesState.loading());
    final failureOrTechniques = await _getTechniquesUsecase(group: group);
    failureOrTechniques.fold(
        (failure) =>
            emit(TechniquesState.error(description: failure.toString())),
        (techniques) => emit(TechniquesState.data(techniques: techniques)));
  }
}

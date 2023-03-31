import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'ice_districts_state.dart';
part 'ice_districts_cubit.freezed.dart';

@Injectable()
class IceDistrictsCubit extends Cubit<IceDistrictsState> {
  final LoadDistrictsUseCase loadDistrictsUseCase;
  IceDistrictsCubit({required this.loadDistrictsUseCase})
      : super(const IceDistrictsState.initial());

  Future<void> loadData() async {
    emit(const IceDistrictsState.loading());
    final failureOrDistricts = await loadDistrictsUseCase();
    failureOrDistricts.fold(
        (failure) =>
            emit(IceDistrictsState.error(description: failure.toString())),
        (districts) => emit(IceDistrictsState.data(districts: districts)));
  }
}

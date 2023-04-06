import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/load_rock_districts.dart';

part 'rock_districts_state.dart';
part 'rock_districts_cubit.freezed.dart';

@Injectable()
class RockDistrictsCubit extends Cubit<RockDistrictsState> {
  final LoadRockDistricts _loadRockDistricts;

  RockDistrictsCubit(this._loadRockDistricts)
      : super(const RockDistrictsState.initial());

  Future<void> loadData() async {
    emit(const RockDistrictsState.loading());
    final failureOrDistricts = await _loadRockDistricts();
    failureOrDistricts.fold(
        (failure) =>
            emit(RockDistrictsState.error(description: failure.toString())),
        (districts) => emit(RockDistrictsState.data(districts: districts)));
  }
}

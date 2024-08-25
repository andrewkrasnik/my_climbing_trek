import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/add_my_rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/delete_my_rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/load_my_rock_districts.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/load_rock_districts.dart';

part 'rock_districts_state.dart';
part 'rock_districts_cubit.freezed.dart';

@Injectable()
class RockDistrictsCubit extends Cubit<RockDistrictsState> {
  final LoadRockDistricts _loadRockDistricts;
  final LoadMyRockDistricts _loadMyRockDistricts;
  final AddMyRockDistrict _addMyRockDistrict;
  final DeleteMyRockDistrict _deleteMyRockDistrict;

  RockDistrictsCubit(
    this._loadRockDistricts,
    this._loadMyRockDistricts,
    this._addMyRockDistrict,
    this._deleteMyRockDistrict,
  ) : super(const RockDistrictsState.initial());

  Future<void> loadData() async {
    emit(const RockDistrictsState.loading());
    final failureOrDistricts = await _loadRockDistricts();
    failureOrDistricts.fold(
        (failure) =>
            emit(RockDistrictsState.error(description: failure.toString())),
        (districts) => emit(RockDistrictsState.data(districts: districts)));
  }

  Future<void> loadMyData() async {
    emit(const RockDistrictsState.loading());
    final failureOrDistricts = await _loadMyRockDistricts();
    failureOrDistricts.fold(
        (failure) =>
            emit(RockDistrictsState.error(description: failure.toString())),
        (districts) => emit(RockDistrictsState.data(districts: districts)));
  }

  Future<void> bookmark(
      {required RockDistrict district, bool myData = false}) async {
    emit(const RockDistrictsState.loading());

    if (district.localData) {
      final failureOrUnit = await _deleteMyRockDistrict(district: district);

      failureOrUnit.fold(
        (failure) =>
            emit(RockDistrictsState.error(description: failure.toString())),
        (_) {
          if (myData) {
            loadMyData();
          } else {
            loadData();
          }
        },
      );
    } else {
      final failureOrUnit = await _addMyRockDistrict(district: district);

      failureOrUnit.fold(
        (failure) =>
            emit(RockDistrictsState.error(description: failure.toString())),
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

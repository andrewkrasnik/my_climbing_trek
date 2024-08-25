import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/add_my_ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/delete_my_ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/load_my_ice_districts.dart';

part 'ice_districts_state.dart';
part 'ice_districts_cubit.freezed.dart';

@Injectable()
class IceDistrictsCubit extends Cubit<IceDistrictsState> {
  final LoadDistrictsUseCase _loadDistrictsUseCase;
  final LoadMyIceDistricts _loadMyIceDistricts;
  final DeleteMyIceDistrict _deleteMyIceDistrict;
  final AddMyIceDistrict _addMyIceDistrict;

  IceDistrictsCubit(
    this._loadDistrictsUseCase,
    this._loadMyIceDistricts,
    this._deleteMyIceDistrict,
    this._addMyIceDistrict,
  ) : super(const IceDistrictsState.initial());

  Future<void> loadData() async {
    emit(const IceDistrictsState.loading());
    final failureOrDistricts = await _loadDistrictsUseCase();
    failureOrDistricts.fold(
        (failure) =>
            emit(IceDistrictsState.error(description: failure.toString())),
        (districts) => emit(IceDistrictsState.data(districts: districts)));
  }

  Future<void> loadMyData() async {
    emit(const IceDistrictsState.loading());

    final failureOrRegions = await _loadMyIceDistricts();

    failureOrRegions.fold(
        (failure) =>
            emit(IceDistrictsState.error(description: failure.toString())),
        (districts) => emit(IceDistrictsState.data(districts: districts)));
  }

  Future<void> bookmarkDistrict(
      {required IceDistrict district, bool myData = false}) async {
    emit(const IceDistrictsState.loading());

    if (district.localData) {
      final failureOrUnit = await _deleteMyIceDistrict(district: district);

      failureOrUnit.fold(
        (failure) =>
            emit(IceDistrictsState.error(description: failure.toString())),
        (_) {
          if (myData) {
            loadMyData();
          } else {
            loadData();
          }
        },
      );
    } else {
      final failureOrUnit = await _addMyIceDistrict(district: district);

      failureOrUnit.fold(
        (failure) =>
            emit(IceDistrictsState.error(description: failure.toString())),
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

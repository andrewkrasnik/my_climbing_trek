import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/add_my_mountain_region_usecase.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/delete_my_mountain_region_usecase.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/get_mountain_regions.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/get_my_mountain_regions.dart';

part 'mountain_regions_state.dart';
part 'mountain_regions_cubit.freezed.dart';

@Injectable()
class MountainRegionsCubit extends Cubit<MountainRegionsState> {
  final GetMountainRegions _getMountainRegions;
  final GetMyMountainRegions _getMyMountainRegions;
  final AddMyMountainRegionUseCase _addMyMountainRegionUseCase;
  final DeleteMyMountainRegionUseCase _deleteMyMountainRegionUseCase;

  MountainRegionsCubit(
    this._getMountainRegions,
    this._getMyMountainRegions,
    this._addMyMountainRegionUseCase,
    this._deleteMyMountainRegionUseCase,
  ) : super(const MountainRegionsState.initial());

  Future<void> loadData() async {
    emit(const MountainRegionsState.loading());
    final failureOrRegions = await _getMountainRegions();
    failureOrRegions.fold(
        (failure) =>
            emit(MountainRegionsState.error(description: failure.toString())),
        (regions) => emit(MountainRegionsState.data(regions: regions)));
  }

  Future<void> loadMyData() async {
    emit(const MountainRegionsState.loading());

    final failureOrRegions = await _getMyMountainRegions();

    failureOrRegions.fold(
        (failure) =>
            emit(MountainRegionsState.error(description: failure.toString())),
        (regions) => emit(MountainRegionsState.data(regions: regions)));
  }

  Future<void> bookmarkRegion(
      {required Region region, bool myData = false}) async {
    emit(const MountainRegionsState.loading());

    if (region.localData) {
      final failureOrUnit =
          await _deleteMyMountainRegionUseCase(region: region);

      failureOrUnit.fold(
        (failure) =>
            emit(MountainRegionsState.error(description: failure.toString())),
        (_) {
          if (myData) {
            loadMyData();
          } else {
            loadData();
          }
        },
      );
    } else {
      final failureOrUnit = await _addMyMountainRegionUseCase(region: region);

      failureOrUnit.fold(
        (failure) =>
            emit(MountainRegionsState.error(description: failure.toString())),
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

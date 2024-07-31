import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/add_my_trekking_region_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/delete_my__trekking_region_usecase.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/get_my__trekking_regions.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/get_trekking_regions.dart';

part 'trekking_regions_state.dart';
part 'trekking_regions_cubit.freezed.dart';

@Injectable()
class TrekkingRegionsCubit extends Cubit<TrekkingRegionsState> {
  final GetTrekkingRegions _getTrekkingRegions;
  final DeleteMyTrekkingRegionUseCase _deleteMyTrekkingRegionUseCase;
  final AddMyTrekkingRegionUseCase _addMyTrekkingRegionUseCase;
  final GetMyTrekkingRegions _getMyTrekkingRegions;

  TrekkingRegionsCubit(
    this._getTrekkingRegions,
    this._deleteMyTrekkingRegionUseCase,
    this._addMyTrekkingRegionUseCase,
    this._getMyTrekkingRegions,
  ) : super(const TrekkingRegionsState.initial());

  Future<void> loadData() async {
    emit(const TrekkingRegionsState.loading());
    final failureOrRegions = await _getTrekkingRegions();
    failureOrRegions.fold(
      (failure) =>
          emit(TrekkingRegionsState.error(description: failure.toString())),
      (regions) => emit(
        TrekkingRegionsState.data(regions: regions),
      ),
    );
  }

  Future<void> loadMyData() async {
    emit(const TrekkingRegionsState.loading());

    final failureOrRegions = await _getMyTrekkingRegions();

    failureOrRegions.fold(
        (failure) =>
            emit(TrekkingRegionsState.error(description: failure.toString())),
        (regions) => emit(TrekkingRegionsState.data(regions: regions)));
  }

  Future<void> bookmarkRegion(
      {required Region region, bool myData = false}) async {
    emit(const TrekkingRegionsState.loading());

    if (region.localData) {
      final failureOrUnit =
          await _deleteMyTrekkingRegionUseCase(region: region);

      failureOrUnit.fold(
        (failure) =>
            emit(TrekkingRegionsState.error(description: failure.toString())),
        (_) {
          if (myData) {
            loadMyData();
          } else {
            loadData();
          }
        },
      );
    } else {
      final failureOrUnit = await _addMyTrekkingRegionUseCase(region: region);

      failureOrUnit.fold(
        (failure) =>
            emit(TrekkingRegionsState.error(description: failure.toString())),
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

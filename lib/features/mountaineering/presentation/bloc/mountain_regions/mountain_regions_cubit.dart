import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/get_mountain_regions.dart';

part 'mountain_regions_state.dart';
part 'mountain_regions_cubit.freezed.dart';

@Injectable()
class MountainRegionsCubit extends Cubit<MountainRegionsState> {
  final GetMountainRegions _getMountainRegions;

  MountainRegionsCubit(this._getMountainRegions)
      : super(const MountainRegionsState.initial());

  Future<void> loadData() async {
    emit(const MountainRegionsState.loading());
    final failureOrRegions = await _getMountainRegions();
    failureOrRegions.fold(
        (failure) =>
            emit(MountainRegionsState.error(description: failure.toString())),
        (regions) => emit(MountainRegionsState.data(regions: regions)));
  }
}

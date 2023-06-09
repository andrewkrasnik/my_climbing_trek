import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/get_trekking_regions.dart';

part 'trekking_regions_state.dart';
part 'trekking_regions_cubit.freezed.dart';

@Injectable()
class TrekkingRegionsCubit extends Cubit<TrekkingRegionsState> {
  final GetTrekkingRegions _getTrekkingRegions;
  TrekkingRegionsCubit(this._getTrekkingRegions)
      : super(const TrekkingRegionsState.initial());

  Future<void> loadData() async {
    emit(const TrekkingRegionsState.loading());
    final failureOrRegions = await _getTrekkingRegions();
    failureOrRegions.fold(
        (failure) =>
            emit(TrekkingRegionsState.error(description: failure.toString())),
        (regions) => emit(TrekkingRegionsState.data(regions: regions)));
  }
}

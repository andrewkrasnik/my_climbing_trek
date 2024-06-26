import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/get_mountaints.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/save_mountain_usecase.dart';

part 'mountains_state.dart';
part 'mountains_cubit.freezed.dart';

@Injectable()
class MountainsCubit extends Cubit<MountainsState> {
  final GetMountains _getMountains;
  final SaveMountainUsecase _saveMountainUsecase;

  MountainsCubit(
    this._getMountains,
    this._saveMountainUsecase,
  ) : super(const MountainsState.initial());

  Future<void> loadData({required Region region}) async {
    emit(const MountainsState.loading());

    final failureOrMountains = await _getMountains(region: region);

    failureOrMountains.fold(
        (failure) =>
            emit(MountainsState.error(description: failure.toString())),
        (mountains) => emit(MountainsState.data(mountains: mountains)));
  }

  Future<void> saveMountain({
    required Region region,
    required String id,
    required String name,
    required String image,
    required int altitude,
  }) async {
    emit(const MountainsState.loading());

    final failureOrMountains = await _saveMountainUsecase(
      altitude: altitude,
      id: id,
      name: name,
      image: image,
      region: region,
    );

    failureOrMountains.fold(
        (failure) =>
            emit(MountainsState.error(description: failure.toString())),
        (_) => loadData(region: region));
  }
}

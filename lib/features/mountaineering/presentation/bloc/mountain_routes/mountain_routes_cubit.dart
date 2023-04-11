import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/usecases/get_mountain_routes.dart';

part 'mountain_routes_state.dart';
part 'mountain_routes_cubit.freezed.dart';

@Injectable()
class MountainRoutesCubit extends Cubit<MountainRoutesState> {
  final GetMountainRoutes _getMountainRoutes;

  MountainRoutesCubit(this._getMountainRoutes)
      : super(const MountainRoutesState.initial());

  Future<void> loadData({required Mountain mountain}) async {
    emit(const MountainRoutesState.loading());
    final failureOrRoutes = await _getMountainRoutes(mountain: mountain);
    failureOrRoutes.fold(
        (failure) =>
            emit(MountainRoutesState.error(description: failure.toString())),
        (routes) => emit(MountainRoutesState.data(routes: routes)));
  }
}

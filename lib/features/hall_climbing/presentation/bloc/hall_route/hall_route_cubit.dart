import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/features/hall_climbing/domain/usecases/new_hall_route.dart';

part 'hall_route_cubit.freezed.dart';
part 'hall_route_state.dart';

@Injectable()
class HallRouteCubit extends Cubit<HallRouteState> {
  final NewHallRoute newHallRoute;
  HallRouteCubit(
    this.newHallRoute,
  ) : super(const HallRouteState.initial());

  Future<void> saveRoute({required ClimbingHallRoute route}) async {
    await newHallRoute(route: route);
  }
}

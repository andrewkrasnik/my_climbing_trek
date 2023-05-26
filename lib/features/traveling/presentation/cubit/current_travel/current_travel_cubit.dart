import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/current_travel_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/get_planed_travels_usecase.dart';

part 'current_travel_state.dart';
part 'current_travel_cubit.freezed.dart';

@Injectable()
class CurrentTravelCubit extends Cubit<CurrentTravelState> {
  final CurrentTravelUsecase _currentTravelUsecase;
  final GetPlanedTravelsUsecase _getPlanedTravelsUsecase;

  CurrentTravelCubit(this._currentTravelUsecase, this._getPlanedTravelsUsecase)
      : super(CurrentTravelState.initial());

  Future<void> loadData() async {
    final failureOrTravel = await _currentTravelUsecase();

    failureOrTravel.fold((failure) => null,
        (travel) => emit(CurrentTravelState(travel: travel)));
  }

  Future<void> loadPlanedData() async {
    final failureOrTravel = await _currentTravelUsecase();

    failureOrTravel.fold((failure) => null,
        (travel) => emit(CurrentTravelState(travel: travel)));
  }
}

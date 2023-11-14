import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/current_travel_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/get_current_travel_day_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/edit_cost_line_usecase.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/edit_cost_line_interface.dart';

part 'current_travel_state.dart';
part 'current_travel_cubit.freezed.dart';

@Injectable()
class CurrentTravelCubit extends Cubit<CurrentTravelState>
    implements EditCostLineIntreface {
  final CurrentTravelUsecase _currentTravelUsecase;
  final EditCostLineUsecase _editCostLineUsecase;
  final GetCurrentTravelDayUsecase _getCurrentTravelDayUsecase;

  CurrentTravelCubit(
    this._currentTravelUsecase,
    this._editCostLineUsecase,
    this._getCurrentTravelDayUsecase,
  ) : super(CurrentTravelState.initial());

  Future<void> loadData() async {
    final failureOrTravel = await _currentTravelUsecase();

    failureOrTravel.fold(
      (failure) => (failure) => state.copyWith(
            errorMessage: failure.toString(),
          ),
      (travel) async {
        emit(
          CurrentTravelState(
            travel: travel,
            useFilter: false,
            errorMessage: '',
          ),
        );
        if (travel != null) {
          final failureOrDay =
              await _getCurrentTravelDayUsecase(travel: travel);

          failureOrDay.fold(
            (failure) => (failure) => state.copyWith(
                  errorMessage: failure.toString(),
                ),
            (day) => emit(state.copyWith(travelDay: day)),
          );
        }
      },
    );
  }

  Future<void> changeUseFilter() async {
    emit(state.copyWith(useFilter: !state.useFilter));
  }

  @override
  Future<void> editCostLine({
    required Currency currency,
    required IncomeExpense incomeExpense,
    required Travel travel,
    required String description,
    required CostType type,
    double sum = 0,
    DateTime? date,
    String id = '',
  }) async {
    final failureOrUnit = await _editCostLineUsecase(
      currency: currency,
      description: description,
      incomeExpense: incomeExpense,
      travel: travel,
      type: type,
      date: date,
      id: id,
      sum: sum,
    );

    failureOrUnit.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
      ),
      (_) {},
    );
  }
}

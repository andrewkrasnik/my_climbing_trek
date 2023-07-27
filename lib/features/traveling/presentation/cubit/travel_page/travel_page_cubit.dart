import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/delete_cost_line_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/edit_cost_line_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/get_cost_lines_usecase.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/add_travel_interface.dart';

part 'travel_page_state.dart';
part 'travel_page_cubit.freezed.dart';

@Injectable()
class TravelPageCubit extends Cubit<TravelPageState>
    implements AddTravelInterface {
  final DeleteCostLineUsecase _deleteCostLineUsecase;
  final EditCostLineUsecase _editCostLineUsecase;
  final GetCostLinesUsecase _getCostLinesUsecase;

  TravelPageCubit(
    this._deleteCostLineUsecase,
    this._editCostLineUsecase,
    this._getCostLinesUsecase,
  ) : super(TravelPageState.initial());

  void selectTab({required int tabIndex}) {
    emit(state.copyWith(tabIndex: tabIndex));
  }

  @override
  Future<void> addTravel(
      {required String name,
      required String description,
      required String image,
      DateTime? date,
      DateTime? start,
      DateTime? finish}) {
    // TODO: implement addTravel
    throw UnimplementedError();
  }

  Future<void> loadData({required Travel travel}) async {
    emit(state.copyWith(loading: true));

    final failureOrList = await _getCostLinesUsecase(travel: travel);

    failureOrList.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (costs) => emit(state.copyWith(costs: costs, loading: false)),
    );
  }

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
    emit(state.copyWith(loading: true));

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
        loading: false,
      ),
      (_) async {
        final failureOrList = await _getCostLinesUsecase(travel: travel);

        failureOrList.fold(
          (failure) => state.copyWith(
            errorMessage: failure.toString(),
            loading: false,
          ),
          (costs) => emit(state.copyWith(costs: costs, loading: false)),
        );
      },
    );
  }

  Future<void> deleteCostLine({
    required Travel travel,
    required CostLine line,
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrUnit = await _deleteCostLineUsecase(line: line);

    failureOrUnit.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (_) async {
        final failureOrList = await _getCostLinesUsecase(travel: travel);

        failureOrList.fold(
          (failure) => state.copyWith(
            errorMessage: failure.toString(),
            loading: false,
          ),
          (costs) => emit(state.copyWith(costs: costs, loading: false)),
        );
      },
    );
  }

  void clearErrorMessage() {
    emit(state.copyWith(errorMessage: ''));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_statistic.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/edit_travel_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/delete_budget_line_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/delete_cost_line_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/delete_insurance_line_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/edit_budget_line_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/edit_cost_line_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/edit_insurance_line_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/get_budget_line_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/get_cost_lines_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/get_day_lines_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/get_feeding_statistic_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/travel_page/get_insurance_lines_usecase.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/add_travel_interface.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/edit_cost_line_interface.dart';

part 'travel_page_state.dart';
part 'travel_page_cubit.freezed.dart';

@Injectable()
class TravelPageCubit extends Cubit<TravelPageState>
    implements AddTravelInterface, EditCostLineIntreface {
  final DeleteCostLineUsecase _deleteCostLineUsecase;
  final EditCostLineUsecase _editCostLineUsecase;
  final GetCostLinesUsecase _getCostLinesUsecase;
  final GetInsuranceLineUsecase _getInsuranceLineUsecase;
  final GetBudgetLinesUsecase _getBudgetLinesUsecase;
  final EditInsuranceLineUsecase _editInsuranceLineUsecase;
  final EditBudgetLineUsecase _editBudgetLineUsecase;
  final DeleteInsuranceLineUsecase _deleteInsuranceLineUsecase;
  final DeleteBudgetLineUsecase _deleteBudgetLineUsecase;
  final GetDayLinesUsecase _getDayLinesUsecase;
  final GetFeedingStatisticUsecase _getFeedingStatisticUsecase;
  final EditTravelUsecase _editTravelUsecase;

  TravelPageCubit(
    this._deleteCostLineUsecase,
    this._editCostLineUsecase,
    this._getCostLinesUsecase,
    this._getInsuranceLineUsecase,
    this._getBudgetLinesUsecase,
    this._editInsuranceLineUsecase,
    this._editBudgetLineUsecase,
    this._deleteInsuranceLineUsecase,
    this._deleteBudgetLineUsecase,
    this._getDayLinesUsecase,
    this._getFeedingStatisticUsecase,
    this._editTravelUsecase,
  ) : super(TravelPageState.initial());

  void selectTab({required int tabIndex}) {
    emit(state.copyWith(tabIndex: tabIndex));
  }

  @override
  Future<void> addTravel({
    required String name,
    required String description,
    required String image,
    DateTime? date,
    DateTime? start,
    DateTime? finish,
    Travel? travel,
  }) async {
    if (travel != null) {
      emit(state.copyWith(loading: true));
      final failureOrTravel = await _editTravelUsecase(
        travel: travel,
        name: name,
        description: description,
        start: start,
        finish: finish,
        image: image,
      );

      failureOrTravel.fold(
        (failure) => state.copyWith(
          errorMessage: failure.toString(),
          loading: false,
        ),
        (travel) => loadData(travel: travel),
      );
    }
  }

  Future<void> loadData({required Travel travel}) async {
    emit(state.copyWith(travel: travel, loading: true));

    final failureOrDays = await _getDayLinesUsecase(travel: travel);

    failureOrDays.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (days) async {
        emit(state.copyWith(days: days, loading: false));

        final failureOrStatistic =
            await _getFeedingStatisticUsecase(lines: days);

        failureOrStatistic.fold(
          (failure) => state.copyWith(
            errorMessage: failure.toString(),
          ),
          (statistic) => emit(state.copyWith(feedingStatistic: statistic)),
        );
      },
    );

    final failureOrCostList = await _getCostLinesUsecase(travel: travel);

    failureOrCostList.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (costs) => emit(state.copyWith(costs: costs, loading: false)),
    );

    final failureOrBubgetList = await _getBudgetLinesUsecase(travel: travel);

    failureOrBubgetList.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (budgetLines) =>
          emit(state.copyWith(budgetLines: budgetLines, loading: false)),
    );

    final failureOrInsuranceList =
        await _getInsuranceLineUsecase(travel: travel);

    failureOrInsuranceList.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (insurances) =>
          emit(state.copyWith(insurances: insurances, loading: false)),
    );
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

  Future<void> editInsuranceLine({
    required String insurer,
    required String number,
    required String insurant,
    required Travel travel,
    required String description,
    List<ContactLine>? contacts,
    String id = '',
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrUnit = await _editInsuranceLineUsecase(
      description: description,
      travel: travel,
      id: id,
      insurant: insurant,
      insurer: insurer,
      number: number,
      contacts: contacts,
    );

    failureOrUnit.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (_) async {
        final failureOrList = await _getInsuranceLineUsecase(travel: travel);

        failureOrList.fold(
          (failure) => state.copyWith(
            errorMessage: failure.toString(),
            loading: false,
          ),
          (costs) => emit(state.copyWith(insurances: costs, loading: false)),
        );
      },
    );
  }

  Future<void> editContactForInsuranceLine({
    required InsuranceLine line,
    required Travel travel,
    required String contactData,
    required ContactType contactType,
    required String contactDescription,
    String contactId = '',
  }) async {
    emit(state.copyWith(loading: true));

    final contact = ContactLine(
      type: contactType,
      data: contactData,
      description: contactDescription,
      id: contactId,
    );

    final List<ContactLine> contacts = line.contacts as List<ContactLine>;

    final int index = contacts.indexOf(contact);

    if (index < 0) {
      contacts.add(contact);
    } else {
      contacts[index] = contact;
    }

    final failureOrUnit = await _editInsuranceLineUsecase(
      description: line.description,
      travel: travel,
      id: line.id,
      insurant: line.insurant,
      insurer: line.insurer,
      number: line.number,
      contacts: contacts,
    );

    failureOrUnit.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (_) async {
        final failureOrList = await _getInsuranceLineUsecase(travel: travel);

        failureOrList.fold(
          (failure) => state.copyWith(
            errorMessage: failure.toString(),
            loading: false,
          ),
          (costs) => emit(state.copyWith(insurances: costs, loading: false)),
        );
      },
    );
  }

  Future<void> deleteContactForInsuranceLine({
    required InsuranceLine line,
    required Travel travel,
    required ContactLine contact,
  }) async {
    emit(state.copyWith(loading: true));

    final contacts = line.contacts;

    contacts.remove(contact);

    final failureOrUnit = await _editInsuranceLineUsecase(
      description: line.description,
      travel: travel,
      id: line.id,
      insurant: line.insurant,
      insurer: line.insurer,
      number: line.number,
      contacts: contacts,
    );

    failureOrUnit.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (_) async {
        final failureOrList = await _getInsuranceLineUsecase(travel: travel);

        failureOrList.fold(
          (failure) => state.copyWith(
            errorMessage: failure.toString(),
            loading: false,
          ),
          (costs) => emit(state.copyWith(insurances: costs, loading: false)),
        );
      },
    );
  }

  Future<void> deleteInsuranceLine({
    required Travel travel,
    required InsuranceLine line,
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrUnit = await _deleteInsuranceLineUsecase(line: line);

    failureOrUnit.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (_) async {
        final failureOrList = await _getInsuranceLineUsecase(travel: travel);

        failureOrList.fold(
          (failure) => state.copyWith(
            errorMessage: failure.toString(),
            loading: false,
          ),
          (insurances) =>
              emit(state.copyWith(insurances: insurances, loading: false)),
        );
      },
    );
  }

  Future<void> editBudgetLine({
    required Travel travel,
    required String description,
    required CostType type,
    double amount = 0,
    String id = '',
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrUnit = await _editBudgetLineUsecase(
      description: description,
      travel: travel,
      type: type,
      id: id,
      amount: amount,
    );

    failureOrUnit.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (_) async {
        final failureOrList = await _getBudgetLinesUsecase(travel: travel);

        failureOrList.fold(
          (failure) => state.copyWith(
            errorMessage: failure.toString(),
            loading: false,
          ),
          (budgetLines) =>
              emit(state.copyWith(budgetLines: budgetLines, loading: false)),
        );
      },
    );
  }

  Future<void> deleteBudgetLine({
    required Travel travel,
    required TravelBudgetLine line,
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrUnit = await _deleteBudgetLineUsecase(line: line);

    failureOrUnit.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (_) async {
        final failureOrList = await _getBudgetLinesUsecase(travel: travel);

        failureOrList.fold(
          (failure) => state.copyWith(
            errorMessage: failure.toString(),
            loading: false,
          ),
          (budgetLines) =>
              emit(state.copyWith(budgetLines: budgetLines, loading: false)),
        );
      },
    );
  }

  Future<void> setStatus({
    required Travel travel,
    required TravelStatus status,
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrTravel = await _editTravelUsecase(
      travel: travel,
      status: status,
    );

    failureOrTravel.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (travel) => loadData(travel: travel),
    );
  }

  Future<void> setCurrencies({
    required Travel travel,
    required List<Currency> currencies,
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrTravel = await _editTravelUsecase(
      travel: travel,
      currencies: currencies,
    );

    failureOrTravel.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (travel) => loadData(travel: travel),
    );
  }

  Future<void> setBudgetCurrency({
    required Travel travel,
    required Currency currency,
  }) async {
    emit(state.copyWith(loading: true));

    final failureOrTravel = await _editTravelUsecase(
      travel: travel,
      budgetCurrency: currency,
    );

    failureOrTravel.fold(
      (failure) => state.copyWith(
        errorMessage: failure.toString(),
        loading: false,
      ),
      (travel) => loadData(travel: travel),
    );
  }

  void clearErrorMessage() {
    emit(state.copyWith(errorMessage: ''));
  }
}

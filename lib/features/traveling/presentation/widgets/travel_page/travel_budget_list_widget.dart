import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/selectable_chip_group_widget.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/budget_parameters_widget.dart';

class TravelBudgetListWidget extends StatelessWidget {
  const TravelBudgetListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelPageCubit, TravelPageState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<TravelPageCubit>(context);

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Итого: ${cubit.budgetSum}'),
                const SizedBox(width: 4),
                SelectableChipGroupWidget<Currency>(
                  title: const Text('Валюта:'),
                  onTap: (currency) {
                    cubit.setBudgetCurrency(
                        travel: state.travel!, currency: currency);
                  },
                  currentValue: state.travel!.budgetCurrency,
                  lines: state.travel!.currencies,
                ),
              ],
            ),
            ...state.budgetLines.map(
              (line) => SlidableDataLineWidget(
                onDelete: (context) {
                  cubit.deleteBudgetLine(travel: state.travel!, line: line);
                },
                onEdit: (context) {
                  showMyModalBottomSheet<void>(
                    context: context,
                    heightPersent: 0.8,
                    child: BudgetParametersWidget(
                      travel: state.travel!,
                      cubit: cubit,
                      line: line,
                    ),
                  );
                },
                child: ListTile(
                  title: Text(line.type.name),
                  subtitle: Text(line.description),
                  trailing: Text(
                    line.amount.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/cost_parameters_widget.dart';

class TravelCostListWdget extends StatelessWidget {
  const TravelCostListWdget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelPageCubit, TravelPageState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<TravelPageCubit>(context);

        return Column(
          children: [
            ...state.costs.map(
              (cost) => SlidableDataLineWidget(
                onDelete: (context) {
                  cubit.deleteCostLine(travel: state.travel!, line: cost);
                },
                onEdit: (context) {
                  showMyModalBottomSheet<void>(
                    context: context,
                    heightPersent: 0.8,
                    child: CostParametersWidget(
                      travel: state.travel!,
                      incomeExpense: cost.incomeExpense,
                      line: cost,
                      currencies: state.travel!.currencies,
                      cubit: cubit,
                    ),
                  );
                },
                child: ListTile(
                  leading: cost.incomeExpense == IncomeExpense.expense
                      ? const Icon(
                          Icons.remove,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.add,
                          color: Colors.green,
                        ),
                  title: Text(cost.type.name),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (cost.description.isNotEmpty) Text(cost.description),
                      Text(cost.date.dayString()),
                    ],
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        cost.sum.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        cost.currency.name,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
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

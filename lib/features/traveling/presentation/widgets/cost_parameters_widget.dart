import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/widgets/selectable_chip_group_widget.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart';

class CostParametersWidget extends HookWidget {
  final CostLine? line;
  final Travel travel;
  final IncomeExpense incomeExpense;
  final List<Currency> currencies;
  final TravelPageCubit cubit;

  const CostParametersWidget({
    required this.travel,
    required this.incomeExpense,
    required this.currencies,
    required this.cubit,
    this.line,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typeController = useState<CostType>(line?.type ?? CostType.transport);

    final currencyController =
        useState<Currency>(line?.currency ?? currencies.first);

    final descriptionController =
        useTextEditingController(text: line?.description);

    final sumController = useTextEditingController(text: line?.sum.toString());

    final descriptionFocusNode = useFocusNode();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              Text(
                incomeExpense.description,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16,
              ),
              SelectableChipGroupWidget<CostType>(
                controller: typeController,
                lines: CostType.values,
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: sumController,
                decoration: const InputDecoration(
                    labelText: 'Сумма', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              if (currencies.length > 1) ...[
                SelectableChipGroupWidget<Currency>(
                  controller: currencyController,
                  lines: currencies,
                ),
                const SizedBox(height: 16),
              ],
              TextFormField(
                minLines: 1,
                maxLines: 3,
                controller: descriptionController,
                focusNode: descriptionFocusNode,
                decoration: const InputDecoration(
                    labelText: 'Описание', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    cubit.editCostLine(
                      currency: currencyController.value,
                      incomeExpense: incomeExpense,
                      travel: travel,
                      description: descriptionController.text,
                      type: typeController.value,
                      sum: double.tryParse(sumController.text) ?? 0,
                      id: line?.id ?? '',
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Сохранить'))
            ],
          ),
        ),
      ),
    );
  }
}

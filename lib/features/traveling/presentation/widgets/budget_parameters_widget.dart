import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/widgets/selectable_chip_group_widget.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart';

class BudgetParametersWidget extends HookWidget {
  final TravelBudgetLine? line;
  final TravelPageCubit cubit;
  final Travel travel;

  const BudgetParametersWidget({
    required this.travel,
    required this.cubit,
    this.line,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typeController = useState<CostType>(line?.type ?? CostType.transport);

    final descriptionController =
        useTextEditingController(text: line?.description);

    final amountController =
        useTextEditingController(text: line?.amount.toString());

    final descriptionFocusNode = useFocusNode();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              Text(
                'Строка бюджета',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16,
              ),
              SelectableChipGroupWidget<CostType>(
                onTap: (value) {
                  typeController.value = value;
                },
                currentValue: typeController.value,
                lines: CostType.values,
              ),
              const SizedBox(height: 16),
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: amountController,
                decoration: const InputDecoration(
                    labelText: 'Сумма', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
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
                    cubit.editBudgetLine(
                      travel: travel,
                      description: descriptionController.text,
                      type: typeController.value,
                      amount: double.tryParse(amountController.text) ?? 0,
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

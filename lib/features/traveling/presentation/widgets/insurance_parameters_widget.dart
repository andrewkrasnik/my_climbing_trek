import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart';

class InsuranceParametersWidget extends HookWidget {
  final InsuranceLine? line;
  final TravelPageCubit cubit;
  final Travel travel;

  const InsuranceParametersWidget({
    this.line,
    required this.cubit,
    required this.travel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final descriptionController =
        useTextEditingController(text: line?.description);

    final insurerController = useTextEditingController(text: line?.insurer);

    final insurantController = useTextEditingController(text: line?.insurant);

    final numberController = useTextEditingController(text: line?.number);

    final descriptionFocusNode = useFocusNode();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              Text(
                'Страхование',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: insurerController,
                decoration: const InputDecoration(
                    labelText: 'Страховая компания',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: numberController,
                decoration: const InputDecoration(
                    labelText: 'Страховой полис', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: insurantController,
                decoration: const InputDecoration(
                    labelText: 'Застрахованное лицо',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                minLines: 3,
                maxLines: 5,
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
                    cubit.editInsuranceLine(
                      insurer: insurerController.text,
                      number: numberController.text,
                      insurant: insurantController.text,
                      travel: travel,
                      description: descriptionController.text,
                      id: line?.id ?? '',
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Сохранить')),
            ],
          ),
        ),
      ),
    );
  }
}

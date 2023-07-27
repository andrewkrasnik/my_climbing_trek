import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';

class InsuranceParametersWidget extends HookWidget {
  final InsuranceLine? line;

  const InsuranceParametersWidget({this.line, Key? key}) : super(key: key);

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

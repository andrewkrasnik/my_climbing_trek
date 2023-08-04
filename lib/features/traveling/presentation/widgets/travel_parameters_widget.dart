import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/add_travel_interface.dart';

class TravelParametersWidget extends HookWidget {
  final Travel? travel;
  final AddTravelInterface cubit;

  const TravelParametersWidget({required this.cubit, this.travel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final descriptionController =
        useTextEditingController(text: travel?.description);

    final nameController = useTextEditingController(text: travel?.name);

    final imageController = useTextEditingController(text: travel?.image);

    final finishController = useState<DateTime?>(travel?.finish);

    final startController = useState<DateTime?>(travel?.start);

    final descriptionFocusNode = useFocusNode();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              Text(
                'Путешествие',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'Название', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: imageController,
                decoration: const InputDecoration(
                    labelText: 'Адрес картинки', border: OutlineInputBorder()),
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
              InkWell(
                onTap: () async {
                  final newDate = await showDatePicker(
                    context: context,
                    initialDate: startController.value ?? DateTime.now(),
                    firstDate: startController.value ?? DateTime.now(),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                  );

                  if (newDate != null) {
                    startController.value = newDate;
                  }
                },
                child: Row(
                  children: [
                    const Text('Начало:'),
                    const SizedBox(width: 16),
                    Text(startController.value?.dayString() ?? ''),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () async {
                  final newDate = await showDatePicker(
                    context: context,
                    initialDate: startController.value ?? DateTime.now(),
                    firstDate: startController.value ?? DateTime.now(),
                    lastDate:
                        DateTime.now().add(const Duration(days: 365 * 10)),
                  );

                  if (newDate != null) {
                    finishController.value = newDate;
                  }
                },
                child: Row(
                  children: [
                    const Text('Окончание:'),
                    const SizedBox(width: 16),
                    Text(finishController.value?.dayString() ?? ''),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    cubit.addTravel(
                      name: nameController.text,
                      description: descriptionController.text,
                      image: imageController.text,
                      start: startController.value,
                      finish: finishController.value,
                      travel: travel,
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

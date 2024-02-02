import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/extentions/time_of_day_extention.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/stay_line.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_day/travel_day_cubit.dart';

class StayParametersWidget extends HookWidget {
  final StayLine? line;
  final TravelDayCubit? cubit;

  const StayParametersWidget({this.cubit, this.line, super.key});

  @override
  Widget build(BuildContext context) {
    final typeController = useState<StayType>(line?.type ?? StayType.sleep);

    final timeController =
        useState<TimeOfDay>(line?.time ?? const TimeOfDay(hour: 12, minute: 0));

    final descriptionController =
        useTextEditingController(text: line?.description);

    final descriptionFocusNode = useFocusNode();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            Text(
              typeController.value.description,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: StayType.values.map((type) {
                    final current = type == typeController.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                          onPressed: () {
                            typeController.value = type;
                          },
                          color: current
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context)
                                  .colorScheme
                                  .surface
                                  .withOpacity(0.5),
                          icon: Icon(
                            type.icon,
                            size: 40,
                          )),
                    );
                  }).toList()),
            ),
            const SizedBox(height: 16),
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
            InkWell(
              onTap: () async {
                final newTime = await showTimePicker(
                  context: context,
                  initialTime: timeController.value,
                );

                if (newTime != null) {
                  timeController.value = newTime;
                }
              },
              child: Row(
                children: [
                  const Text('Прибытие:'),
                  const SizedBox(width: 16),
                  Text(timeController.value.timeString()),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  if (cubit != null) {
                    cubit!.editStayLine(
                      description: descriptionController.text,
                      type: typeController.value,
                      time: timeController.value,
                      line: line,
                    );
                  }

                  Navigator.of(context).pop();
                },
                child: const Text('Сохранить'))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/extentions/time_of_day_extention.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_type.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_day/travel_day_cubit.dart';

class TransportParametersWidget extends HookWidget {
  final TransportLine? line;
  final TravelDayCubit? cubit;
  const TransportParametersWidget({this.cubit, this.line, super.key});

  @override
  Widget build(BuildContext context) {
    final contactType =
        useState<TransportType>(line?.type ?? TransportType.airplane);

    final timeController =
        useState<TimeOfDay>(line?.time ?? const TimeOfDay(hour: 12, minute: 0));

    final finishTimeController = useState<TimeOfDay?>(line?.finishTime);

    final descriptionController =
        useTextEditingController(text: line?.description);

    final descriptionFocusNode = useFocusNode();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            Text(
              contactType.value.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: TransportType.values.map((type) {
                    final current = type == contactType.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                          onPressed: () {
                            contactType.value = type;
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
                  const Text('Отправление:'),
                  const SizedBox(width: 16),
                  Text(timeController.value.timeString()),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () async {
                final newTime = await showTimePicker(
                  context: context,
                  initialTime: finishTimeController.value ??
                      const TimeOfDay(hour: 12, minute: 0),
                );

                if (newTime != null) {
                  finishTimeController.value = newTime;
                }
              },
              child: Row(
                children: [
                  const Text('Прибытие:'),
                  const SizedBox(width: 16),
                  Text(finishTimeController.value?.timeString() ?? ''),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  if (cubit != null) {
                    cubit!.editTransportLine(
                      description: descriptionController.text,
                      type: contactType.value,
                      time: timeController.value,
                      finishTime: finishTimeController.value,
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

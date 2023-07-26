import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_type.dart';

class TransportParametersWidget extends HookWidget {
  final TransportLine? line;
  final DateTime date;
  const TransportParametersWidget({required this.date, this.line, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactType =
        useState<TransportType>(line?.type ?? TransportType.airplane);

    final dateController = useState<DateTime>(line?.date ?? date.toDayStart());

    final finishController = useState<DateTime?>(line?.finish);

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
                  initialTime: TimeOfDay.fromDateTime(
                    dateController.value,
                  ),
                );

                if (newTime != null) {
                  dateController.value = date.toDayStart().add(
                        Duration(
                          hours: newTime.hour,
                          minutes: newTime.minute,
                        ),
                      );
                }
              },
              child: Row(
                children: [
                  const Text('Отправление:'),
                  const SizedBox(width: 16),
                  Text(dateController.value.timeString()),
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
                  initialTime: TimeOfDay.fromDateTime(
                    finishController.value ?? date.toDayStart(),
                  ),
                );

                if (newTime != null) {
                  finishController.value = date.toDayStart().add(
                        Duration(
                          hours: newTime.hour,
                          minutes: newTime.minute,
                        ),
                      );
                }
              },
              child: Row(
                children: [
                  const Text('Прибытие:'),
                  const SizedBox(width: 16),
                  Text(finishController.value?.timeString() ?? ''),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Сохранить'))
          ],
        ),
      ),
    );
  }
}

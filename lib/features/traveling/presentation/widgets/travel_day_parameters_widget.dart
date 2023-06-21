import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_type.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

class TravelDayParametersWidget extends HookWidget {
  final TravelDay day;

  const TravelDayParametersWidget({required this.day, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transportType = useState<TransportType>(TransportType.airplane);

    final startState = useState<TimeOfDay?>(null);

    final finishState = useState<TimeOfDay?>(null);

    final transportController = useTextEditingController(text: '');

    final descriptionController =
        useTextEditingController(text: day.description);

    final descriptionFocusNode = useFocusNode();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('День ${day.number}: '),
                const SizedBox(width: 4),
                Text(day.dateString),
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionController,
              focusNode: descriptionFocusNode,
              decoration: const InputDecoration(
                  labelText: 'Описание', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: TransportType.values.map((type) {
                    final current = type == transportType.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: IconButton(
                          onPressed: () {
                            transportType.value = type;
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
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    final newTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (newTime != null) {
                      startState.value = newTime;
                    }
                  },
                  child: Text(startState.value == null
                      ? 'с...'
                      : 'с ${startState.value!.format(context)}'),
                ),
                InkWell(
                  onTap: () async {
                    final newTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );

                    if (newTime != null) {
                      finishState.value = newTime;
                    }
                  },
                  child: Text(
                    finishState.value == null
                        ? ' по...'
                        : ' по ${finishState.value!.format(context)}',
                  ),
                ),
                // TextField(
                //   controller: transportController,
                //   decoration: const InputDecoration(
                //       labelText: 'Описание', border: OutlineInputBorder()),
                // ),
              ],
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

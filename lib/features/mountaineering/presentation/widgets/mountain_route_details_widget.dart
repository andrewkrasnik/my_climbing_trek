import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_roop_widget.dart';

class MountainRouteDetailsWidget extends HookWidget {
  final MountainRoute route;

  const MountainRouteDetailsWidget({required this.route, super.key});

  @override
  Widget build(BuildContext context) {
    final indexState = useState<int>(-1);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (indexState.value == -1) ...[
              const Text('Подход:'),
              Text(route.passage),
            ],
            if (indexState.value >= 0 && indexState.value < route.roops.length)
              MountainRoopWidget(roop: route.roops[indexState.value]),
            if (indexState.value == route.roops.length) ...[
              const Text('Спуск:'),
              Text(route.descent),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (indexState.value == -1) {
                        indexState.value = route.roops.length;
                      } else {
                        indexState.value = indexState.value - 1;
                      }
                    },
                    child: const Text('Назад')),
                ElevatedButton(
                    onPressed: () {
                      if (indexState.value == route.roops.length) {
                        indexState.value = -1;
                      } else {
                        indexState.value = indexState.value + 1;
                      }
                    },
                    child: const Text('Далее')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

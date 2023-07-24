import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

class FeedingLinesWidget extends StatelessWidget {
  final TravelDay travelDay;
  final bool editing;

  const FeedingLinesWidget(
      {required this.travelDay, this.editing = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: travelDay.feedingsLines
          .map((line) => editing
              ? FeedingLineWidget(line: line)
              : Text('${line.meal.description}: ${line.type.description}'))
          .toList(),
    );
  }
}

class FeedingLineWidget extends HookWidget {
  final FeedingLine line;

  const FeedingLineWidget({required this.line, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final typeController = useState<FeedingType>(line.type);
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text('${line.meal.description}:'),
        const SizedBox(width: 4),
        ...FeedingType.values.map((value) {
          final bool current = typeController.value == value;
          return InkWell(
            onTap: () {
              typeController.value = value;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Chip(
                backgroundColor: current
                    ? Theme.of(context).hintColor
                    : Theme.of(context).hintColor.withOpacity(0.1),
                label: Text(
                  value.description,
                  style: current
                      ? const TextStyle(color: Colors.white)
                      : TextStyle(color: Theme.of(context).colorScheme.surface),
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}

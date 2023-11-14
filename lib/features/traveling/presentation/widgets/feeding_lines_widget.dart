import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';

class FeedingLinesWidget extends StatelessWidget {
  final List<FeedingLine> lines;
  final bool editing;
  final Function(FeedingLine line, FeedingType type)? onTap;

  const FeedingLinesWidget(
      {required this.lines, this.editing = false, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: lines
          .map((line) => editing
              ? FeedingLineWidget(line: line, onTap: onTap)
              : Text('${line.meal.description}: ${line.type.description}'))
          .toList(),
    );
  }
}

class FeedingLineWidget extends StatelessWidget {
  final FeedingLine line;
  final Function(FeedingLine line, FeedingType type)? onTap;

  const FeedingLineWidget({required this.line, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text('${line.meal.description}:'),
        const SizedBox(width: 4),
        ...FeedingType.values.map((value) {
          final bool current = line.type == value;
          return InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!(line, value);
              }
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

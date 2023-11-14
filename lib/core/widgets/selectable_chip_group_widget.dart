import 'package:flutter/material.dart';

class SelectableChipGroupWidget<T> extends StatelessWidget {
  final T? currentValue;
  final List<T> lines;
  final Widget? title;
  final void Function(T value) onTap;

  const SelectableChipGroupWidget({
    required this.lines,
    required this.onTap,
    this.currentValue,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (title != null) ...[
          title!,
          const SizedBox(width: 4),
        ],
        ...lines.map((value) {
          final bool current = currentValue == value;
          return InkWell(
            onTap: () {
              onTap(value);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Chip(
                backgroundColor: current
                    ? Theme.of(context).hintColor
                    : Theme.of(context).hintColor.withOpacity(0.1),
                label: Text(
                  value.toString(),
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

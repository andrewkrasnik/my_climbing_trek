import 'package:flutter/material.dart';

class MultiSelectableChipGroupWidget<T> extends StatelessWidget {
  final List<T> lines;
  final List<T> selectedLines;
  final Widget? title;
  final void Function(bool selected, T value) onTap;

  const MultiSelectableChipGroupWidget({
    required this.lines,
    required this.onTap,
    required this.selectedLines,
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
          final bool selected = selectedLines.contains(value);
          return InkWell(
            onTap: () {
              onTap(selected, value);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Chip(
                backgroundColor: selected
                    ? Theme.of(context).hintColor
                    : Theme.of(context).hintColor.withOpacity(0.1),
                label: Text(
                  value.toString(),
                  style: selected
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

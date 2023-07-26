import 'package:flutter/material.dart';

class SelectableChipGroupWidget<T> extends StatelessWidget {
  final List<T> lines;
  final Widget? title;
  final ValueNotifier<T> controller;

  const SelectableChipGroupWidget({
    required this.lines,
    required this.controller,
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
          final bool current = controller.value == value;
          return InkWell(
            onTap: () {
              controller.value = value;
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

import 'package:flutter/material.dart';

class IntCounterWidget extends StatelessWidget {
  final String? title;
  final ValueNotifier<int> valueState;
  final bool editing;
  final int part;
  final int maxValue;
  final int minValue;
  const IntCounterWidget(
      {Key? key,
      this.title,
      required this.valueState,
      this.editing = true,
      this.part = 1,
      this.maxValue = 0,
      this.minValue = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (title != null) Text(title!),
        IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: editing
                ? () {
                    final int newValue = valueState.value - part;
                    if (newValue >= minValue) {
                      valueState.value = newValue;
                    }
                  }
                : null,
            icon: const Icon(Icons.remove)),
        SizedBox(
          width: 20,
          child: Text(
            valueState.value.toString(),
            textAlign: TextAlign.center,
          ),
        ),
        IconButton(
          padding: const EdgeInsets.all(0),
          onPressed: editing
              ? () {
                  final int newValue = valueState.value + part;
                  if (maxValue == 0 || maxValue >= newValue) {
                    valueState.value = newValue;
                  }
                }
              : null,
          icon: const Icon(
            Icons.add,
          ),
        ),
      ],
    );
  }
}

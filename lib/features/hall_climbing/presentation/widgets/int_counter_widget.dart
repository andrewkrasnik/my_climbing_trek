import 'package:flutter/material.dart';

class IntCounterWidget extends StatelessWidget {
  final String title;
  final ValueNotifier<int> valueState;
  final bool editing;
  const IntCounterWidget({
    super.key,
    required this.title,
    required this.valueState,
    this.editing = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 96, child: Text(title)),
        IconButton(
            onPressed: editing
                ? () {
                    if (valueState.value > 0) {
                      valueState.value--;
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
          onPressed: editing
              ? () {
                  valueState.value++;
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

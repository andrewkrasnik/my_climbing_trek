import 'package:flutter/material.dart';

class BoolValueWidget extends StatelessWidget {
  final String title;
  final ValueNotifier<bool> valueState;
  final bool editing;
  const BoolValueWidget({
    super.key,
    required this.title,
    required this.valueState,
    required this.editing,
  });

  @override
  Widget build(BuildContext context) {
    if (editing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 120, child: Text(title)),
          Switch(
              value: valueState.value,
              onChanged: (value) => valueState.value = value),
        ],
      );
    } else {
      return valueState.value ? Text(title) : const SizedBox();
    }
  }
}

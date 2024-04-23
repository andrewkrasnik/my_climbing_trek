import 'package:flutter/material.dart';

class ChipSelectorWidget extends StatelessWidget {
  final ValueNotifier<bool> state;
  final String name;

  const ChipSelectorWidget({
    required this.name,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () {
          state.value = !state.value;
        },
        child: Chip(
          label: Text(
            name,
            style: state.value
                ? const TextStyle(color: Colors.white)
                : TextStyle(color: Theme.of(context).colorScheme.surface),
          ),
          backgroundColor: state.value ? Theme.of(context).hintColor : null,
        ),
      ),
    );
  }
}

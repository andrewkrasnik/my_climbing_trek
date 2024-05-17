import 'package:flutter/material.dart';

class ChipSelectedWidget<T> extends StatelessWidget {
  final List<T> values;

  final ValueNotifier<T?> state;

  // final void Function()? onTap;

  const ChipSelectedWidget({
    required this.values,
    required this.state,
    super.key,
    // this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: values
          .map((value) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: InkWell(
                    onTap: () {
                      state.value = value;
                    },
                    child: Chip(
                      label: Text(
                        value.toString(),
                        style: state.value == value
                            ? const TextStyle(color: Colors.white)
                            : TextStyle(
                                color: Theme.of(context).colorScheme.surface),
                      ),
                      backgroundColor: state.value == value
                          ? Theme.of(context).hintColor
                          : null,
                    )),
              ))
          .toList(),
    );
  }
}

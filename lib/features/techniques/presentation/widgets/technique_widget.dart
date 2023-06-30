import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';

class TechniqueWidget extends StatelessWidget {
  final Technique technique;
  final void Function()? onPressed;

  const TechniqueWidget({required this.technique, this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  technique.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_box,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    onPressed: onPressed,
                  ),
                )
              ],
            ),
            if (technique.options.isNotEmpty)
              Wrap(
                children: technique.options
                    .map((option) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Chip(label: Text(option.name)),
                        ))
                    .toList(),
              )
          ],
        ),
      ),
    );
  }
}

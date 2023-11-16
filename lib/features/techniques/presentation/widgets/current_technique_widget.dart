import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';

class CurrentTechniqueWidget extends StatelessWidget {
  final Technique technique;

  const CurrentTechniqueWidget({required this.technique, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Text(technique.name),
                if (technique.options.isNotEmpty)
                  Wrap(
                    children: technique.options
                        .map((option) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Chip(label: Text(option.name)),
                            ))
                        .toList(),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

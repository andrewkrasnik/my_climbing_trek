import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';

class TechniqueWidget extends StatelessWidget {
  final Technique technique;

  const TechniqueWidget({required this.technique, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [Text(technique.name)],
        ),
      ),
    );
  }
}

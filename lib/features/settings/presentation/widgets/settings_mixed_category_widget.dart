import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/data/mixed_category.dart';

class SettingsMixedCategoryWidget extends StatelessWidget {
  final MixedCategory category;
  final bool selected;

  const SettingsMixedCategoryWidget({
    super.key,
    required this.category,
    this.selected = true,
  });

  @override
  Widget build(BuildContext context) {
    final title = category.name;
    double fontSize = 24;
    if (title.length > 2) {
      fontSize = 18;
    }
    final double opacity = selected ? 1 : 0.5;

    return CircleAvatar(
      backgroundColor: Colors.tealAccent.withOpacity(opacity),
      radius: 24,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(opacity),
        radius: 20,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black.withOpacity(opacity),
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

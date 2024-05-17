import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:flutter/material.dart';

class SettingsAidCategoryWidget extends StatelessWidget {
  final AidCategory category;
  final bool selected;

  const SettingsAidCategoryWidget({
    super.key,
    required this.category,
    this.selected = true,
  });

  @override
  Widget build(BuildContext context) {
    final title = category.name;
    double fontSize = 24;
    if (title.length > 4) {
      fontSize = 14;
    } else if (title.length > 3) {
      fontSize = 16;
    } else if (title.length > 2) {
      fontSize = 20;
    }

    final double opacity = selected ? 1 : 0.5;

    return CircleAvatar(
      backgroundColor: Colors.black.withOpacity(opacity),
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

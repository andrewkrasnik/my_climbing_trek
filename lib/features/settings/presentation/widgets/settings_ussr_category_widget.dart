import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';

class SettingsUssrCategoryWidget extends StatelessWidget {
  final UssrClimbingCategory category;

  const SettingsUssrCategoryWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final title = category.name;
    double fontSize = 24;
    if (title.length > 4) {
      fontSize = 18;
    } else if (title.length > 3) {
      fontSize = 18;
    } else if (title.length > 2) {
      fontSize = 20;
    }
    return CircleAvatar(
      backgroundColor: Colors.blueAccent,
      radius: 24,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

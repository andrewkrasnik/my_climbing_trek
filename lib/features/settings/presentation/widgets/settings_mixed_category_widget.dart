import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/data/mixed_category.dart';

class SettingsMixedCategoryWidget extends StatelessWidget {
  final MixedCategory category;

  const SettingsMixedCategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = category.name;
    double fontSize = 24;
    if (title.length > 2) {
      fontSize = 18;
    }
    return CircleAvatar(
      backgroundColor: Colors.tealAccent,
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

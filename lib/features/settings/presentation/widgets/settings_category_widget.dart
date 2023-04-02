import 'package:my_climbing_trek/core/data/category_type.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:flutter/material.dart';

class SettingsCategoryWidget extends StatelessWidget {
  final ClimbingCategory category;
  final CategoryType type;

  const SettingsCategoryWidget({
    Key? key,
    required this.category,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = category.title(type);
    double fontSize = 24;
    if (title.length > 4) {
      fontSize = 14;
    } else if (title.length > 3) {
      fontSize = 16;
    } else if (title.length > 2) {
      fontSize = 20;
    }
    return CircleAvatar(
      backgroundColor: Colors.red,
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

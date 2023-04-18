import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:flutter/material.dart';

class SettingsAidCategoryWidget extends StatelessWidget {
  final AidCategory category;

  const SettingsAidCategoryWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

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
    return CircleAvatar(
      backgroundColor: Colors.black,
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

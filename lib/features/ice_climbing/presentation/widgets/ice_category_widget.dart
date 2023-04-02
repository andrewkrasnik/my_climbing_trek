import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:flutter/material.dart';

class IceCategoryWidget extends StatelessWidget {
  final IceCategory category;

  final String prefix;

  const IceCategoryWidget({
    Key? key,
    required this.category,
    this.prefix = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = category.name;
    double fontSize = 20;
    if (title.length > 4) {
      fontSize = 12;
    } else if (title.length > 3) {
      fontSize = 14;
    } else if (title.length > 2) {
      fontSize = 16;
    }
    return CircleAvatar(
      backgroundColor: Colors.blueAccent,
      radius: 24,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: Text(
          '$prefix$title',
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

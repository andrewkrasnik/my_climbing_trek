import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:flutter/material.dart';

class IceCategoryWidget extends StatelessWidget {
  final IceCategory category;

  final String prefix;

  final bool planed;

  const IceCategoryWidget({
    super.key,
    required this.category,
    this.planed = false,
    this.prefix = '',
  });

  @override
  Widget build(BuildContext context) {
    final title = category.name;
    double fontSize = 20;

    final double opacity = planed ? 0.5 : 1;

    if (title.length > 4) {
      fontSize = 12;
    } else if (title.length > 3) {
      fontSize = 14;
    } else if (title.length > 2) {
      fontSize = 16;
    }
    return CircleAvatar(
      backgroundColor: Colors.blueAccent.withOpacity(opacity),
      radius: 24,
      child: CircleAvatar(
        backgroundColor: Colors.white.withOpacity(opacity),
        radius: 20,
        child: Text(
          '$prefix$title',
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

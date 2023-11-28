import 'package:flutter/material.dart';

import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';

class TechniqueTreaningPictureWidget extends StatelessWidget {
  final TechniqueTreaning treaning;

  const TechniqueTreaningPictureWidget({
    super.key,
    required this.treaning,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      shadows: [Shadow(offset: Offset.fromDirection(1, 1))],
    );
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}

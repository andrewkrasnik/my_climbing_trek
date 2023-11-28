import 'package:flutter/material.dart';

import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';

class TrekkingPathPictureWidget extends StatelessWidget {
  final TrekkingPath path;

  const TrekkingPathPictureWidget({
    super.key,
    required this.path,
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

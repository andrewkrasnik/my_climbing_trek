import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';

class TrekWidget extends StatelessWidget {
  final Trek trek;

  const TrekWidget({required this.trek, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 240,
        width: 180,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Hero(
          tag: 'Trek${trek.id}',
          child: Stack(
            fit: StackFit.expand,
            children: [
              MyCachedNetworkImage(
                  imageUrl: trek.imageUrl, fit: BoxFit.fitWidth),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trek.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    ),
                    Text(
                      trek.region.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

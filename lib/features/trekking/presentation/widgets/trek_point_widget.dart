import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';

class TrekPointWidget extends StatelessWidget {
  final TrekPoint point;

  const TrekPointWidget({required this.point, Key? key}) : super(key: key);

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
          tag: 'TrekPoint${point.id}',
          child: Stack(
            fit: StackFit.expand,
            children: [
              MyCachedNetworkImage(
                  imageUrl: point.image!, fit: BoxFit.fitWidth),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      point.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    ),
                    Text(
                      '${point.altitude} м.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: point.features
                        .map((feature) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Icon(
                                feature.icon,
                                color: Colors.white,
                                size: 40,
                                shadows: [
                                  Shadow(offset: Offset.fromDirection(1))
                                ],
                              ),
                            ))
                        .toList(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

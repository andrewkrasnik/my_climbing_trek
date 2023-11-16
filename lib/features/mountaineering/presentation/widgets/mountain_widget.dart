import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';

class MountainWidget extends StatelessWidget {
  final Mountain mountain;

  const MountainWidget({required this.mountain, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 240,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Hero(
          tag: 'Mountain${mountain.id}',
          child: Stack(
            fit: StackFit.expand,
            children: [
              MyCachedNetworkImage(imageUrl: mountain.image, fit: BoxFit.fill),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${mountain.name}, ${mountain.altitude} м.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(offset: Offset.fromDirection(1))]),
                      ),
                      Text(
                        mountain.region.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(offset: Offset.fromDirection(1))]),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

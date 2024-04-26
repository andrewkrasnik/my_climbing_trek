import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TrekPointWidget extends StatelessWidget {
  final TrekPoint point;

  const TrekPointWidget({required this.point, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 240,
        child: Hero(
          tag: 'TrekPoint${point.id}',
          child: Stack(
            fit: StackFit.expand,
            children: [
              MyCachedNetworkImage(imageUrl: point.image!, fit: BoxFit.cover),
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
                  )),
              if (point.mapPoint != null)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        launchUrlString(
                          'https://maps.yandex.ru/?ll=${point.mapPoint!.coordinates}&spn=2.124481,0.671008&z=15&l=map&pt=${point.mapPoint!.coordinates},pmrdm1',
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      icon: Icon(
                        Icons.place,
                        color: Colors.white,
                        shadows: [Shadow(offset: Offset.fromDirection(1))],
                        size: 40,
                      )),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

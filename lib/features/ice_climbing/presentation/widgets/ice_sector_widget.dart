import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:flutter/material.dart';

class IceSectorWidget extends StatelessWidget {
  final IceSector sector;
  final IceDistrict district;
  final void Function()? onTap;
  final double height;

  const IceSectorWidget({
    required this.district,
    required this.sector,
    this.onTap,
    this.height = 180,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            MyCachedNetworkImage(
              imageUrl: sector.image,
              fit: BoxFit.cover,
              cacheKey: district.cacheKey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sector.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    ),
                    Text(
                      'до ${sector.length.toString()} м., сложность до ${sector.maxCategory.name}',
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
    );
  }
}

import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';

class RockDistrictWidget extends StatelessWidget {
  final RockDistrict district;
  final void Function()? onTap;

  const RockDistrictWidget({required this.district, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        width: 180,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            MyCachedNetworkImage(imageUrl: district.image, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      district.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    ),
                    Text(
                      district.region.name,
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
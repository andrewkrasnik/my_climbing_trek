import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:flutter/material.dart';

class IceDistrictWidget extends StatelessWidget {
  final IceDistrict district;
  final void Function()? onTap;

  const IceDistrictWidget({required this.district, this.onTap, Key? key})
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
          image: DecorationImage(
              image: NetworkImage(
                district.image,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
    );
  }
}

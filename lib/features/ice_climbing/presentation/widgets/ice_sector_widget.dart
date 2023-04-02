import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:flutter/material.dart';

class IceSectorWidget extends StatelessWidget {
  final IceSector sector;
  final void Function()? onTap;
  const IceSectorWidget({required this.sector, this.onTap, Key? key})
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
                sector.image,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            sector.name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(offset: Offset.fromDirection(1))]),
          ),
          Text(
            sector.lenght.toString(),
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

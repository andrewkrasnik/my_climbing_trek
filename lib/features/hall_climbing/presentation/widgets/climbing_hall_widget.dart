import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:flutter/material.dart';

class ClimbingHallWidget extends StatelessWidget {
  final ClimbingHall climbingHall;
  final void Function()? onTap;
  const ClimbingHallWidget({
    Key? key,
    required this.climbingHall,
    this.onTap,
  }) : super(key: key);

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
                climbingHall.image,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            climbingHall.name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(offset: Offset.fromDirection(1))]),
          ),
          Text(
            climbingHall.city.name,
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

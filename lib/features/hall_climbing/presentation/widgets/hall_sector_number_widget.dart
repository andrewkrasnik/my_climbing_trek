import 'package:flutter/material.dart';

import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';

class HallSectorNumberWidget extends StatelessWidget {
  final Widget child;
  final ClimbingHallRoute? route;
  const HallSectorNumberWidget({
    Key? key,
    required this.child,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color textColor;
    if (route?.color.materialColor.value == Colors.white.value) {
      textColor = Colors.black;
    } else {
      textColor = Colors.white;
    }
    return route != null
        ? Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              child,
              if (route!.sectorNumber > 0)
                Text(
                  route!.sectorNumber.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
            ],
          )
        : child;
  }
}

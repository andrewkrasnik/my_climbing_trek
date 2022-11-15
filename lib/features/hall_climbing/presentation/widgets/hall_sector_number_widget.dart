import 'package:flutter/material.dart';

import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';

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
    return route != null
        ? Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              child,
              if (route!.sectorNumber > 0)
                Text(
                  route!.sectorNumber.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              // if (route!.sectorNumber > 0)
              //   Positioned(
              //       top: 0,
              //       right: 0,
              //       child: CircleAvatar(
              //         backgroundColor: Colors.black,
              //         radius: 10,
              //         child: Text(
              //           route!.sectorNumber.toString(),
              //           style: const TextStyle(
              //             fontSize: 12,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ))
            ],
          )
        : child;
  }
}

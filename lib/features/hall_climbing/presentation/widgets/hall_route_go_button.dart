import 'package:climbing_diary/core/data/climbing_route_type.dart';
import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:flutter/material.dart';

import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallRouteGoButton extends StatelessWidget {
  final ClimbingHall climbingHall;
  final ClimbingHallRoute route;
  final void Function()? callback;
  const HallRouteGoButton({
    Key? key,
    required this.route,
    required this.climbingHall,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (route.type == ClimbingRouteType.rope) {
      return Row(
        children: [
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<CurrentHallTreaningCubit>(context)
                    .attemptFromRoute(
                  climbingHall: climbingHall,
                  route: route,
                  style: ClimbingStyle.lead,
                );

                if (callback != null) {
                  callback!();
                }
              },
              child: const Text(
                'GO\nLEAD!',
                textAlign: TextAlign.center,
              )),
          const SizedBox(
            width: 16,
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<CurrentHallTreaningCubit>(context)
                    .attemptFromRoute(
                  climbingHall: climbingHall,
                  route: route,
                  style: ClimbingStyle.topRope,
                );
                if (callback != null) {
                  callback!();
                }
              },
              child: const Text(
                'GO\nTOP ROPE!',
                textAlign: TextAlign.center,
              )),
        ],
      );
    } else if (route.type == ClimbingRouteType.bouldering) {
      return ElevatedButton(
        onPressed: () {
          BlocProvider.of<CurrentHallTreaningCubit>(context).attemptFromRoute(
            climbingHall: climbingHall,
            route: route,
            style: ClimbingStyle.bouldering,
          );
          if (callback != null) {
            callback!();
          }
        },
        child: const Text('GO!'),
      );
    } else {
      return const SizedBox();
    }
  }
}

import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallRouteWidget extends StatelessWidget {
  final ClimbingHallRoute route;
  const HallRouteWidget({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: double.infinity,
      child: Row(
        children: [
          Text(route.type.name),
          const SizedBox(
            width: 16,
          ),
          Text(route.color.name),
          const SizedBox(
            width: 16,
          ),
          Text(route.category.french),
          const SizedBox(
            width: 16,
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<CurrentHallTreaningCubit>(context)
                    .attemptFromRoute(route: route);
              },
              child: const Text('GO!'))
        ],
      ),
    );
  }
}

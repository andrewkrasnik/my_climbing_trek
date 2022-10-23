import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:flutter/material.dart';

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
          ElevatedButton(onPressed: () {}, child: Text('GO!'))
        ],
      ),
    );
  }
}

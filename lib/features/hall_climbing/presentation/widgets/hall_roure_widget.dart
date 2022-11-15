import 'package:climbing_diary/core/data/climbing_route_type.dart';
import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/pages/hall_route_page.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_route_category_widget.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_route_go_button.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_sector_number_widget.dart';
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
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Row(
        children: [
          Text(route.type.name),
          const SizedBox(
            width: 16,
          ),
          HallSectorNumberWidget(
            route: route,
            child: HallRouteCategoryWidget(
              category: route.category,
              color: route.color.materialColor,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          HallRouteGoButton(
            route: route,
            callback: () => Navigator.of(context).pop(),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HallRoutePage(
                          climbingHall: route.climbingHall,
                          route: route,
                        )));
              },
              icon: const Icon(Icons.edit)),
        ],
      ),
    );
  }
}

import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/core/data/climbing_route_type.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/hall_routes_filter.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/pages/hall_route_page.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_roure_widget.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/select_category_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../bloc/climbing_hall/climbing_hall_cubit.dart';

class SelectHallRouteWidget extends HookWidget {
  final ClimbingHallTreaning treaning;
  final ClimbingRouteType type;
  const SelectHallRouteWidget({
    Key? key,
    required this.treaning,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = useState<ClimbingCategory?>(null);

    return BlocProvider(
      create: (context) => getIt<ClimbingHallCubit>()
        ..loadData(
          treaning.climbingHall,
          filter: HallRouteFilter(
            category: category.value,
            type: type,
          ),
        ),
      child: BlocBuilder<ClimbingHallCubit, ClimbingHallState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SelectCategoryWidget(
                  currentCategory: category.value,
                  onTap: (selectedCategory) {
                    category.value = selectedCategory;
                    BlocProvider.of<ClimbingHallCubit>(context).loadData(
                      treaning.climbingHall,
                      filter: HallRouteFilter(
                        category: selectedCategory,
                        type: type,
                      ),
                    );
                  },
                ),
                if (state.routes != null)
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            HallRouteWidget(route: state.routes![index]),
                        separatorBuilder: (_, __) => const SizedBox(
                              height: 8,
                            ),
                        itemCount: state.routes!.length),
                  ),
                ElevatedButton(
                  onPressed: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HallRoutePage(
                          climbingHall: treaning.climbingHall,
                          initialCategory: category.value,
                          initialType: type,
                        ),
                      ),
                    );
                    BlocProvider.of<ClimbingHallCubit>(context).loadData(
                      treaning.climbingHall,
                      filter: HallRouteFilter(
                        category: category.value,
                        type: type,
                      ),
                    );
                  },
                  child: const Text('Добавить'),
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CurrentHallTreaningCubit>(context)
                        .newAttempt(
                      category: category.value!,
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Старт'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

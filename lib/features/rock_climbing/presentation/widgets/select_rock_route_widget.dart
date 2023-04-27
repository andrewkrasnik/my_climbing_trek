import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_routes_filter.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_sector_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/select_rock_category_widget.dart';

class SelectRockRouteWidget extends HookWidget {
  final RockTreaning treaning;
  final ClimbingStyle style;
  final RockTreaningCubit cubit;

  const SelectRockRouteWidget({
    Key? key,
    required this.treaning,
    required this.style,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roureFilter = useState<RockRouteFilter>(RockRouteFilter(
      category: null,
      type: style.type,
    ));

    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          style.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      SelectRockCategoryWidget(
        currentCategory: roureFilter.value.category,
        onTap: (selectedCategory) {
          roureFilter.value =
              roureFilter.value.copyWith(category: selectedCategory);
        },
      ),
      // SizedBox(
      //   height: 30,
      //   child: ListView(
      //     scrollDirection: Axis.horizontal,
      //     children: [
      //       ...RouteStatus.values.map((status) => Chip(
      //             label: Text(status.name),
      //           )),
      //       Chip(
      //         label: Text('Все'),
      //       ),
      //     ],
      //   ),
      // ),
      Expanded(
        child: ListView.builder(
          itemCount: treaning.sectors.length,
          itemBuilder: (context, index) {
            final sector = treaning.sectors[index];
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RockSectorWidget(
                  sector: sector,
                  district: treaning.district,
                  filter: roureFilter.value,
                  onTapGo: (route) {
                    cubit.addAttempt(
                        sector: sector, style: style, route: route);
                    Navigator.of(context).pop();
                  },
                ));
          },
        ),
      ),
    ]);
  }
}

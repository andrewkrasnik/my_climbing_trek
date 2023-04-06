import 'package:flutter/material.dart';

import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_sector_widget.dart';

class SelectRockRouteWidget extends StatelessWidget {
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
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          style.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
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

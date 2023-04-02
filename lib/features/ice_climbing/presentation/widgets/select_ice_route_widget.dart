import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_category_widget.dart';
import 'package:flutter/material.dart';

import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';

class SelectIceRouteWidget extends StatelessWidget {
  final IceTreaning treaning;
  final ClimbingStyle style;
  final CurrentIceTreaningCubit cubit;

  const SelectIceRouteWidget({
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
              child: Row(children: [
                Image(
                  width: MediaQuery.of(context).size.width / 4,
                  image: NetworkImage(
                    sector.image,
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${sector.name}, ${sector.lenght} м.',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text('Сложность до:'),
                        const SizedBox(width: 8),
                        IceCategoryWidget(
                          category: sector.maxCategory,
                          prefix: sector.icePrefix,
                        ),
                        const SizedBox(width: 24),
                        ElevatedButton(
                          onPressed: () {
                            cubit.addAttempt(sector: sector, style: style);

                            Navigator.of(context).pop();
                          },
                          child: const Text('GO'),
                        ),
                      ],
                    )
                  ],
                )
              ]),
            );
          },
        ),
      ),
    ]);
  }
}

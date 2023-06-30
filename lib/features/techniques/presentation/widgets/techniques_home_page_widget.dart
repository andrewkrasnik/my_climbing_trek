import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/pages/technique_group_page.dart';
import 'package:my_climbing_trek/features/techniques/presentation/pages/technique_groups_page.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/technique_group_widget.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/technique_treaning_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

import 'current_technique_widget.dart';

class TechniquesHomePageWidget extends StatelessWidget {
  const TechniquesHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return BlocBuilder<TechniqueTreaningCubit, TechniqueTreaningState>(
      builder: (context, state) {
        return Column(children: [
          const Text(
            'Технические тернировки',
            style: titleTextStyle,
          ),
          const SizedBox(height: 16),
          if (state.currentTechnique != null) ...[
            CurrentTechniqueWidget(
              technique: state.currentTechnique!,
            ),
            const SizedBox(height: 8),
          ],
          if (state.currentTreaning != null) ...[
            const Text(
              'Текущая тренировка',
              style: titleTextStyle,
            ),
            const SizedBox(height: 8),
            TechniqueTreaningWidget(
              treaning: state.currentTreaning!,
              editing: true,
            )
          ],
          if (state.previosTreaning != null) ...[
            const Text(
              'Предыдущая тренировка',
              style: titleTextStyle,
            ),
            const SizedBox(height: 8),
            TechniqueTreaningWidget(
              treaning: state.previosTreaning!,
            )
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Техники:'),
              TextButton(
                child: const Text('Смотреть все'),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TechniqueGroupsPage())),
              ),
            ],
          ),
          BlocProvider(
            create: (context) => getIt<TechniqueGroupsCubit>()..loadData(),
            child: SizedBox(
              height: 120,
              child: BlocBuilder<TechniqueGroupsCubit, TechniqueGroupsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    loading: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    data: (dataState) => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Hero(
                                  tag:
                                      'TechniqueGroup${dataState.groups[index].id}',
                                  child: TechniqueGroupWidget(
                                    group: dataState.groups[index],
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TechniqueGroupPage(
                                                      group: dataState
                                                          .groups[index])));
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.add_box,
                                        color: Colors.white),
                                    onPressed: () {
                                      BlocProvider.of<TechniqueTreaningCubit>(
                                              context)
                                          .addTechniqueGroup(
                                        group: dataState.groups[index],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                        separatorBuilder: (_, __) => const SizedBox(
                              width: 8,
                            ),
                        itemCount: dataState.groups.length),
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ),
          ),
        ]);
      },
    );
  }
}

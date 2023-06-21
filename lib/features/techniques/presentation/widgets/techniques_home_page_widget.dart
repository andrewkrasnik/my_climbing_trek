import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/techniques/techniques_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/pages/technique_group_page.dart';
import 'package:my_climbing_trek/features/techniques/presentation/pages/technique_groups_page.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/technique_group_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TechniquesHomePageWidget extends StatelessWidget {
  const TechniquesHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return BlocBuilder<TechniquesCubit, TechniquesState>(
      builder: (context, state) {
        return Column(children: [
          const Text(
            'Технические тернировки',
            style: titleTextStyle,
          ),
          const SizedBox(height: 16),
          // if (state.currentAttempt != null) ...[
          //   const Text(
          //     'Текущая попытка',
          //     style: titleTextStyle,
          //   ),
          //   const SizedBox(height: 8),
          //   RockAttemptWidget(
          //     attempt: state.currentAttempt!,
          //     isCurrent: true,
          //     cubit: cubit,
          //     statistic: state.currentRouteStatistic,
          //   )
          // ],
          // if (state.lastAttempt != null) ...[
          //   const Text(
          //     'Предудущая попытка',
          //     style: titleTextStyle,
          //   ),
          //   const SizedBox(height: 8),
          //   RockAttemptWidget(
          //     attempt: state.lastAttempt!,
          //     cubit: cubit,
          //     statistic: state.lastRouteStatistic,
          //   )
          // ],
          // if (state.currentTreaning != null) ...[
          //   const Text(
          //     'Текущая тренировка',
          //     style: titleTextStyle,
          //   ),
          //   const SizedBox(height: 8),
          //   RockTreaningWidget(
          //     treaning: state.currentTreaning!,
          //     isCurrent: true,
          //   )
          // ],
          // if (state.lastTreaning != null) ...[
          //   const Text(
          //     'Предыдущая тренировка',
          //     style: titleTextStyle,
          //   ),
          //   const SizedBox(height: 8),
          //   RockTreaningWidget(
          //     treaning: state.lastTreaning!,
          //   )
          // ],
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

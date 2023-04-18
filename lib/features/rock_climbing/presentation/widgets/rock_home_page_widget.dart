import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/pages/rock_district_page.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/pages/rock_districts_page.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_attempt_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_district_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_treaning_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class RockHomePageWidget extends StatelessWidget {
  const RockHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return BlocBuilder<RockTreaningCubit, RockTreaningState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<RockTreaningCubit>(context);
        return Column(children: [
          const Text(
            'Тренировки на скалах',
            style: titleTextStyle,
          ),
          const SizedBox(height: 16),
          if (state.currentAttempt != null) ...[
            const Text(
              'Текущая попытка',
              style: titleTextStyle,
            ),
            const SizedBox(height: 8),
            RockAttemptWidget(
              attempt: state.currentAttempt!,
              isCurrent: true,
              cubit: cubit,
              statistic: state.currentRouteStatistic,
            )
          ],
          if (state.lastAttempt != null) ...[
            const Text(
              'Предудущая попытка',
              style: titleTextStyle,
            ),
            const SizedBox(height: 8),
            RockAttemptWidget(
              attempt: state.lastAttempt!,
              cubit: cubit,
              statistic: state.lastRouteStatistic,
            )
          ],
          if (state.currentTreaning != null) ...[
            const Text(
              'Текущая тренировка',
              style: titleTextStyle,
            ),
            const SizedBox(height: 8),
            RockTreaningWidget(
              treaning: state.currentTreaning!,
              isCurrent: true,
            )
          ],
          if (state.lastTreaning != null) ...[
            const Text(
              'Предыдущая тренировка',
              style: titleTextStyle,
            ),
            const SizedBox(height: 8),
            RockTreaningWidget(
              treaning: state.lastTreaning!,
            )
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Скалолазные районы:'),
              TextButton(
                child: const Text('Смотреть все'),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RockDistrictsPage())),
              ),
            ],
          ),
          BlocProvider(
            create: (context) => getIt<RockDistrictsCubit>()..loadData(),
            child: SizedBox(
              height: 120,
              child: BlocBuilder<RockDistrictsCubit, RockDistrictsState>(
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
                                  tag: 'rock${dataState.districts[index].id}',
                                  child: RockDistrictWidget(
                                    district: dataState.districts[index],
                                    onTap: () {
                                      final district =
                                          dataState.districts[index];
                                      final bool showAddButton =
                                          cubit.state.currentTreaning == null ||
                                              cubit.state.currentTreaning
                                                      ?.district ==
                                                  district;
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RockDistrictPage(
                                                      addSector: showAddButton
                                                          ? (sector) {
                                                              cubit.addRockSectorToTreaning(
                                                                  sector:
                                                                      sector,
                                                                  district:
                                                                      district);
                                                            }
                                                          : null,
                                                      district: dataState
                                                          .districts[index])));
                                    },
                                  ),
                                ),
                              ],
                            ),
                        separatorBuilder: (_, __) => const SizedBox(
                              width: 16,
                            ),
                        itemCount: dataState.districts.length),
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

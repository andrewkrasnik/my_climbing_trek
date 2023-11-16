import 'package:my_climbing_trek/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:my_climbing_trek/features/treanings/presentation/cubit/treanings_cubit.dart';
import 'package:my_climbing_trek/features/treanings/presentation/widgets/treaning_widget_factory.dart';
import 'package:flutter/material.dart';

import 'package:my_climbing_trek/service_locator.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TreaningsPage extends StatelessWidget {
  const TreaningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: (previous, current) =>
          previous.treaningsSettings != current.treaningsSettings,
      builder: (context, settingsState) {
        return BlocProvider(
          create: (context) => getIt<TreaningsCubit>()
            ..loadData(
              cardio: settingsState.treaningsSettings.useCardioTreanings,
              gym: settingsState.treaningsSettings.useGymTreanings,
              ice: settingsState.treaningsSettings.useIceTreanings,
              rock: settingsState.treaningsSettings.useRockTraining,
              strength: settingsState.treaningsSettings.useStrengthTraining,
              travel: settingsState.treaningsSettings.useTraveling,
              trekking: settingsState.treaningsSettings.useTrekking,
              techniques: settingsState.treaningsSettings.useTechniques,
              mountaneering: settingsState.treaningsSettings.useMountaineering,
            ),
          child: BlocBuilder<TreaningsCubit, TreaningsState>(
            builder: (context, state) {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: state.maybeMap(
                    loading: (_) => const CircularProgressIndicator(),
                    data: (dataState) {
                      return dataState.treanings.isEmpty
                          ? Center(
                              child: Text(
                              'Выбрете\nактивность и начните тренироваться сегодня',
                              style: Theme.of(context).textTheme.headlineLarge,
                              textAlign: TextAlign.center,
                            ))
                          : ListView.separated(
                              itemBuilder: (context, index) => Slidable(
                                    endActionPane: ActionPane(
                                      motion: const ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          flex: 1,
                                          onPressed: (context) async {
                                            final cubit =
                                                BlocProvider.of<TreaningsCubit>(
                                                    context);

                                            final deletePermission =
                                                await showDialog<bool>(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text(
                                                    'Подтверждение удаления'),
                                                content: const Text(
                                                    'После удаления данные о тренировке станут недоступны. Продолжить?'),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(false);
                                                    },
                                                    child:
                                                        const Text('Отменить'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(true);
                                                    },
                                                    child: const Text(
                                                        'Продолжить'),
                                                  ),
                                                ],
                                              ),
                                            );

                                            if (deletePermission == true) {
                                              cubit.delete(
                                                treaning:
                                                    dataState.treanings[index],
                                                cardio: settingsState
                                                    .treaningsSettings
                                                    .useCardioTreanings,
                                                gym: settingsState
                                                    .treaningsSettings
                                                    .useGymTreanings,
                                                ice: settingsState
                                                    .treaningsSettings
                                                    .useIceTreanings,
                                                rock: settingsState
                                                    .treaningsSettings
                                                    .useRockTraining,
                                                strength: settingsState
                                                    .treaningsSettings
                                                    .useStrengthTraining,
                                                travel: settingsState
                                                    .treaningsSettings
                                                    .useTraveling,
                                                trekking: settingsState
                                                    .treaningsSettings
                                                    .useTrekking,
                                                techniques: settingsState
                                                    .treaningsSettings
                                                    .useTechniques,
                                                mountaneering: settingsState
                                                    .treaningsSettings
                                                    .useMountaineering,
                                              );
                                            }
                                          },
                                          backgroundColor: Colors.red.shade400,
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'delete',
                                        ),
                                      ],
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.of(context).push(MaterialPageRoute(
                                        //     builder: (context) => TreaningPageFactory(
                                        //           treaning: dataState.treanings[index],
                                        //         )));
                                      },
                                      child: TreaningWidgetFactory(
                                          treaning: dataState.treanings[index]),
                                    ),
                                  ),
                              separatorBuilder: (_, index) {
                                // if (index < dataState.treanings.length) {
                                //   final month = dataState
                                //       .treanings[index + 1].date
                                //       .monthStart();

                                //   if (cuttentMonth != month) {
                                //     cuttentMonth = month;
                                //     return Padding(
                                //       padding: const EdgeInsets.symmetric(
                                //           vertical: 24),
                                //       child: Center(
                                //           child: Text(
                                //         cuttentMonth.monthString(),
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .headlineSmall,
                                //       )),
                                //     );
                                //   } else {
                                //     return const SizedBox(
                                //       height: 32,
                                //     );
                                //   }
                                // }
                                return const SizedBox(
                                  height: 32,
                                );
                              },
                              itemCount: dataState.treanings.length);
                    },
                    orElse: () => const SizedBox(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

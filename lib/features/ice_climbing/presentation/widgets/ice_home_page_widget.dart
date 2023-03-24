import 'package:climbing_diary/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/pages/ice_district_page.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/pages/ice_districts_page.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/widgets/ice_attempt_widget.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/widgets/ice_district_widget.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/widgets/ice_treaning_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IceHomePageWidget extends StatelessWidget {
  const IceHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return BlocProvider(
      create: (context) => getIt<CurrentIceTreaningCubit>(),
      child: Column(
        children: [
          const Text(
            'Ледолазные тренировки',
            style: titleTextStyle,
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<CurrentIceTreaningCubit, CurrentIceTreaningState>(
            builder: (context, state) {
              return Column(
                children: [
                  if (state.currentAttempt != null) ...[
                    const Text('Текущая попытка'),
                    IceAttemptWidget(
                      attempt: state.currentAttempt!,
                      isCurrent: true,
                    )
                  ],
                  if (state.lastAttempt != null) ...[
                    const Text('Предудущая попытка'),
                    IceAttemptWidget(
                      attempt: state.lastAttempt!,
                    )
                  ],
                  if (state.currentTreaning != null) ...[
                    const Text('Текущая тренировка'),
                    IceTreaningWidget(
                      treaning: state.currentTreaning!,
                      isCurrent: true,
                    )
                  ],
                  if (state.lastTreaning != null) ...[
                    const Text('Предыдущая тренировка'),
                    IceTreaningWidget(
                      treaning: state.currentTreaning!,
                    )
                  ],
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Ледолазные районы:'),
              TextButton(
                child: const Text('Смотреть все'),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const IceDistrictsPage())),
              ),
            ],
          ),
          BlocProvider(
            create: (context) => getIt<IceDistrictsCubit>()..loadData(),
            child: SizedBox(
              height: 120,
              child: BlocBuilder<IceDistrictsCubit, IceDistrictsState>(
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
                                IceDistrictWidget(
                                  district: dataState.districts[index],
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) => IceDistrictPage(
                                              district:
                                                  dataState.districts[index]))),
                                ),
                                BlocBuilder<CurrentIceTreaningCubit,
                                    CurrentIceTreaningState>(
                                  builder: (context, state) {
                                    return state.currentTreaning == null
                                        ? Align(
                                            alignment: Alignment.bottomRight,
                                            child: IconButton(
                                              icon: const Icon(Icons.add_box,
                                                  color: Colors.white),
                                              onPressed: () {
                                                BlocProvider.of<
                                                            CurrentIceTreaningCubit>(
                                                        context)
                                                    .addNewTreaning(
                                                  district: dataState
                                                      .districts[index],
                                                );
                                              },
                                            ),
                                          )
                                        : const SizedBox();
                                  },
                                )
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
        ],
      ),
    );
  }
}
import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/pages/hall_treaning_page.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_treaning_widget.dart';
import 'package:flutter/material.dart';

import 'package:my_climbing_trek/service_locator.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HallTreaningsPage extends StatelessWidget {
  const HallTreaningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HallTreaningsCubit>()..loadData(),
      child: BlocBuilder<HallTreaningsCubit, HallTreaningsState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state.maybeMap(
                loading: (_) => const CircularProgressIndicator(),
                data: (dataState) => ListView.separated(
                    itemBuilder: (context, index) => Slidable(
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                flex: 1,
                                onPressed: (context) async {
                                  final cubit =
                                      BlocProvider.of<HallTreaningsCubit>(
                                          context);

                                  final currentTreaningCubit =
                                      BlocProvider.of<CurrentHallTreaningCubit>(
                                          context);

                                  final deletePermission =
                                      await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title:
                                          const Text('Подтверждение удаления'),
                                      content: const Text(
                                          'После удаления данные о тренировке станут недоступны. Продолжить?'),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          child: const Text('Отменить'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                          },
                                          child: const Text('Продолжить'),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (deletePermission == true) {
                                    cubit.deleteTreaning(
                                        treaning: dataState.treanings[index]);

                                    currentTreaningCubit.loadData();
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HallTreaningPage(
                                        treaning: dataState.treanings[index],
                                      )));
                            },
                            child: HallTreaningWidget(
                                treaning: dataState.treanings[index]),
                          ),
                        ),
                    separatorBuilder: (_, __) => const SizedBox(
                          height: 32,
                        ),
                    itemCount: dataState.treanings.length),
                orElse: () => const SizedBox(),
              ),
            ),
          );
        },
      ),
    );
  }
}

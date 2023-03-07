import 'package:climbing_diary/core/extentions/date_time_extention.dart';
import 'package:climbing_diary/features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart';
import 'package:climbing_diary/features/cardio_workout/presentation/widgets/cardio_parameters_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CardioHomePageWidget extends StatelessWidget {
  const CardioHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<CardioTreaningsCubit>()..loadData(),
        child: BlocBuilder<CardioTreaningsCubit, CardioTreaningsState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                OutlinedButton(
                  onPressed: () {
                    final cubit =
                        BlocProvider.of<CardioTreaningsCubit>(context);

                    showModalBottomSheet<void>(
                      context: context,
                      builder: (context) {
                        return CardioParametersWidget(cubit: cubit);
                      },
                    );
                  },
                  child: const Text('Кардио тренировка'),
                ),
                SizedBox(
                  height: 240,
                  child:
                      BlocBuilder<CardioTreaningsCubit, CardioTreaningsState>(
                    builder: (context, state) {
                      return state.maybeMap(
                          data: (dataState) => ListView.builder(
                                itemCount: dataState.treanings.length,
                                itemBuilder: (context, index) {
                                  final treaning = dataState.treanings[index];

                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SizedBox(
                                      height: 60,
                                      child: Slidable(
                                        endActionPane: ActionPane(
                                          motion: const ScrollMotion(),
                                          children: [
                                            SlidableAction(
                                              flex: 1,
                                              onPressed: (context) async {
                                                final cubit = BlocProvider.of<
                                                        CardioTreaningsCubit>(
                                                    context);

                                                await showModalBottomSheet<
                                                    void>(
                                                  context: context,
                                                  builder: (context) {
                                                    return CardioParametersWidget(
                                                      treaning: treaning,
                                                      cubit: cubit,
                                                    );
                                                  },
                                                );
                                              },
                                              backgroundColor:
                                                  Colors.orange.shade400,
                                              foregroundColor: Colors.white,
                                              icon: Icons.edit,
                                              label: 'edit',
                                            ),
                                            SlidableAction(
                                              flex: 1,
                                              onPressed: (context) async {
                                                final cubit = BlocProvider.of<
                                                        CardioTreaningsCubit>(
                                                    context);

                                                final deletePermission =
                                                    await showDialog<bool>(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: const Text(
                                                        'Подтверждение удаления'),
                                                    content: const Text(
                                                        'Удалить тренировку?'),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop(false);
                                                        },
                                                        child: const Text(
                                                            'Отменить'),
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
                                                      treaning: treaning);
                                                }
                                              },
                                              backgroundColor:
                                                  Colors.red.shade400,
                                              foregroundColor: Colors.white,
                                              icon: Icons.delete,
                                              label: 'delete',
                                            ),
                                          ],
                                        ),
                                        child: Material(
                                          elevation: 4,
                                          child: ListTile(
                                            leading:
                                                Icon(treaning.exercise.icon),
                                            title: Row(
                                              children: [
                                                Text(
                                                    '${treaning.length.toString()} ${treaning.exercise.lenghtUnit}.'),
                                                const SizedBox(width: 12),
                                                Text(
                                                    '${treaning.duration.toString()} мин.'),
                                                const Spacer(),
                                                Text(treaning.date.dayString()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                          loading: (value) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          orElse: () => const SizedBox());
                    },
                  ),
                ),
              ],
            );
          },
        ));
  }
}

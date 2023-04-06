import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart';
import 'package:my_climbing_trek/features/cardio_workout/presentation/widgets/cardio_parameters_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CardioTreaningsPage extends StatelessWidget {
  const CardioTreaningsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardioTreaningsCubit, CardioTreaningsState>(
      builder: (context, state) {
        return BlocBuilder<CardioTreaningsCubit, CardioTreaningsState>(
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
                                      final cubit =
                                          BlocProvider.of<CardioTreaningsCubit>(
                                              context);

                                      await showModalBottomSheet<void>(
                                        context: context,
                                        builder: (context) {
                                          return CardioParametersWidget(
                                            treaning: treaning,
                                          );
                                        },
                                      );
                                    },
                                    backgroundColor: Colors.orange.shade400,
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'edit',
                                  ),
                                  SlidableAction(
                                    flex: 1,
                                    onPressed: (context) async {
                                      final cubit =
                                          BlocProvider.of<CardioTreaningsCubit>(
                                              context);

                                      final deletePermission =
                                          await showDialog<bool>(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                              'Подтверждение удаления'),
                                          content:
                                              const Text('Удалить тренировку?'),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(false);
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
                                        cubit.delete(treaning: treaning);
                                      }
                                    },
                                    backgroundColor: Colors.red.shade400,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'delete',
                                  ),
                                ],
                              ),
                              child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(8),
                                child: ListTile(
                                  leading: Icon(treaning.exercise.icon),
                                  title: Row(
                                    children: [
                                      Text(
                                          '${treaning.length.toString()} ${treaning.exercise.lengthUnit}.'),
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
        );
      },
    );
  }
}

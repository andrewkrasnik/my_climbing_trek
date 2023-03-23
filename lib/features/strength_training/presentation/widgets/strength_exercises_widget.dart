import 'package:climbing_diary/features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart';
import 'package:climbing_diary/features/strength_training/presentation/widgets/strength_treaning_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StrengthExercisesWidget extends StatelessWidget {
  const StrengthExercisesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StrengthTrainingsCubit>()..loadData(),
      child: SizedBox(
        height: 240,
        child: BlocBuilder<StrengthTrainingsCubit, StrengthTrainingsState>(
          builder: (context, state) {
            return state.maybeMap(
                data: (dataState) => ListView.builder(
                      itemCount: dataState.treanings.length,
                      itemBuilder: (context, index) {
                        final treaning = dataState.treanings[index];

                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SizedBox(
                            height: 80,
                            child: Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    flex: 1,
                                    onPressed: (context) async {
                                      final cubit = BlocProvider.of<
                                          StrengthTrainingsCubit>(context);

                                      // await showModalBottomSheet<
                                      //     void>(
                                      //   context: context,
                                      //   builder: (context) {
                                      //     return CardioParametersWidget(
                                      //       treaning: treaning,
                                      //       cubit: cubit,
                                      //     );
                                      //   },
                                      // );
                                    },
                                    backgroundColor: Colors.orange.shade400,
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'edit',
                                  ),
                                  SlidableAction(
                                    flex: 1,
                                    onPressed: (context) async {
                                      final cubit = BlocProvider.of<
                                          StrengthTrainingsCubit>(context);

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
                              child: StrengthTreaningWidget(treaning: treaning),
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
    );
  }
}

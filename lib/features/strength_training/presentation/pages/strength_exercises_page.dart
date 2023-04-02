import 'package:my_climbing_trek/features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/widgets/strength_exercise_parameters_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class StrengthExercisesPage extends StatelessWidget {
  const StrengthExercisesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StrengthExercisesCubit>()..loadData(),
      child: BlocBuilder<StrengthExercisesCubit, StrengthExercisesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Упражнения'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final cubit = BlocProvider.of<StrengthExercisesCubit>(context);

                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return StrengthExerciseParametersWidget(cubit: cubit);
                  },
                );
              },
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
            body: state.maybeMap(
              data: (dataState) => ListView.builder(
                itemCount: dataState.exercises.length,
                itemBuilder: (context, index) => Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        flex: 1,
                        onPressed: (context) async {
                          final cubit =
                              BlocProvider.of<StrengthExercisesCubit>(context);

                          showModalBottomSheet<void>(
                            context: context,
                            builder: (context) {
                              return StrengthExerciseParametersWidget(
                                cubit: cubit,
                                exercise:
                                    dataState.exercises.keys.elementAt(index),
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
                              BlocProvider.of<StrengthExercisesCubit>(context);

                          final deletePermission = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Подтверждение удаления'),
                              content: const Text('Удалить упражнение?'),
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
                            cubit.deleteExercise(
                                exercise:
                                    dataState.exercises.keys.elementAt(index));
                          }
                        },
                        backgroundColor: Colors.red.shade400,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'delete',
                      ),
                    ],
                  ),
                  child: CheckboxListTile(
                      value: dataState.exercises.values.elementAt(index),
                      onChanged: (value) {
                        BlocProvider.of<StrengthExercisesCubit>(context).select(
                            exercise: dataState.exercises.keys.elementAt(index),
                            select: value ?? false);
                      },
                      title:
                          Text(dataState.exercises.keys.elementAt(index).name)),
                ),
              ),
              loading: (_) => const Center(child: CircularProgressIndicator()),
              orElse: () => const SizedBox(),
            ),
          );
        },
      ),
    );
  }
}

import 'package:climbing_diary/features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart';
import 'package:climbing_diary/features/strength_training/presentation/widgets/strength_exercise_parameters_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                itemBuilder: (context, index) => CheckboxListTile(
                    value: dataState.exercises.values.elementAt(index),
                    onChanged: (value) {
                      BlocProvider.of<StrengthExercisesCubit>(context).select(
                          exercise: dataState.exercises.keys.elementAt(index),
                          select: value ?? false);
                    },
                    title:
                        Text(dataState.exercises.keys.elementAt(index).name)),
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

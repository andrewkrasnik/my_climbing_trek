import 'package:climbing_diary/features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart';
import 'package:climbing_diary/features/cardio_workout/presentation/widgets/cardio_parameters_widget.dart';
import 'package:climbing_diary/features/cardio_workout/presentation/widgets/cardio_treaning_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardioHomePageWidget extends StatelessWidget {
  const CardioHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardioTreaningCubit, CardioTreaningState>(
      builder: (context, state) {
        const titleTextStyle =
            TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
        return Column(
          children: [
            const Text(
              'Кардио тренировки',
              style: titleTextStyle,
            ),
            OutlinedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return const CardioParametersWidget();
                  },
                );
              },
              child: const Text('Добавить тренировку'),
            ),
            if (state.lastTreaning != null)
              CardioTreaningWidget(treaning: state.lastTreaning!),
          ],
        );
      },
    );
  }
}

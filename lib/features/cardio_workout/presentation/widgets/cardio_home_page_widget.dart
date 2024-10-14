import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart';
import 'package:my_climbing_trek/features/cardio_workout/presentation/widgets/cardio_parameters_widget.dart';
import 'package:my_climbing_trek/features/cardio_workout/presentation/widgets/cardio_treaning_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardioHomePageWidget extends StatelessWidget {
  const CardioHomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CardioTreaningCubit>(context).loadData();

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
                showMyModalBottomSheet<void>(
                  context: context,
                  heightPersent: 0.6,
                  child: const CardioParametersWidget(),
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

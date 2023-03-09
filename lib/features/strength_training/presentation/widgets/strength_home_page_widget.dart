import 'package:climbing_diary/features/strength_training/domain/entities/strength_treaning.dart';
import 'package:climbing_diary/features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart';
import 'package:climbing_diary/features/strength_training/presentation/widgets/strength_treaning_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StrengthHomePageWidget extends StatelessWidget {
  const StrengthHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StrengthTrainingCubit>()..loadData(),
      child: BlocBuilder<StrengthTrainingCubit, StrengthTrainingState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (state.currentTreaning == null)
                OutlinedButton(
                  onPressed: () {
                    BlocProvider.of<StrengthTrainingCubit>(context)
                        .addTreaning();
                  },
                  child: const Text('Силовая тренировка'),
                ),
              if (state.currentTreaning != null)
                StrengthTreaningWidget(
                  treaning: state.currentTreaning!,
                  editing: true,
                )
            ],
          );
        },
      ),
    );
  }
}

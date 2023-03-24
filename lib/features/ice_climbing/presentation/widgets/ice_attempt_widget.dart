import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/widgets/ice_attempt_dialog.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/widgets/ice_category_widget.dart';
import 'package:flutter/material.dart';

class IceAttemptWidget extends StatelessWidget {
  final IceTreaningAttempt attempt;
  final bool isCurrent;
  final CurrentIceTreaningCubit cubit;

  const IceAttemptWidget({
    required this.attempt,
    this.isCurrent = false,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Image(
          width: MediaQuery.of(context).size.width / 4,
          image: NetworkImage(
            attempt.sector.image,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${attempt.sector.name}, ${attempt.length} м. ${attempt.style.name}',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('до:'),
                const SizedBox(width: 8),
                IceCategoryWidget(category: attempt.sector.maxCategory),
                const SizedBox(width: 24),
                if (isCurrent)
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => IceAttemptDialog(
                          attempt: attempt,
                          cubit: cubit,
                          editing: true,
                        ),
                      );
                    },
                    child: const Text('Завершить'),
                  ),
              ],
            )
          ],
        )
      ]),
    );
    ;
  }
}

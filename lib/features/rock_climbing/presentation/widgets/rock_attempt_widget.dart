import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_attempt_click_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_attempt_dialog.dart';

class RockAttemptWidget extends StatelessWidget {
  final RockTreaningAttempt attempt;
  final bool isCurrent;
  final RockTreaningCubit cubit;
  final RockRouteAttemptsStatistic? statistic;

  const RockAttemptWidget({
    required this.attempt,
    this.isCurrent = false,
    required this.cubit,
    this.statistic,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final statisticTitle = (statistic == null || statistic!.count == 1)
        ? 'Первая попытка'
        : 'Попыток: ${statistic!.count}';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
          elevation: 0,
          borderRadius: BorderRadius.circular(8),
          child: ListTile(
            leading: RockAttemptClickWidget(
              attempt: attempt,
              cubit: cubit,
            ),
            title: Text(attempt.route?.name ?? 'Безымянная'),
            subtitle: attempt.route == null
                ? null
                : Text(
                    '${attempt.style.name} ${attempt.route?.description ?? ''}'
                    '\n$statisticTitle'),
            trailing: isCurrent
                ? ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => RockAttemptDialog(
                          attempt: attempt,
                          cubit: cubit,
                          editing: true,
                        ),
                      );
                    },
                    child: const Text('Завершить'))
                : cubit.state.currentAttempt == null
                    ? ElevatedButton(
                        onPressed: () {
                          cubit.addAttempt(
                              sector: attempt.sector,
                              style: attempt.style,
                              route: attempt.route!);
                        },
                        child: const Text('Повторить'))
                    : null,
          )),
    );
  }
}

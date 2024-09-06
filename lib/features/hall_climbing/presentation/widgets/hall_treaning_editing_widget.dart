import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/pages/climbing_hall_page.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_treaning_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class HallTreaningEditingWidget extends HookWidget {
  final ClimbingHallTreaning treaning;

  const HallTreaningEditingWidget({required this.treaning, super.key});

  @override
  Widget build(BuildContext context) {
    final date = useState<DateTime>(treaning.date);

    final cubit = getIt<CurrentHallTreaningCubit>()
      ..setTreaning(treaning: treaning);

    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<CurrentHallTreaningCubit, CurrentHallTreaningState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DatePickerWidget(date: date),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ClimbingHallPage(
                                      climbingHall: state.current!.climbingHall,
                                    ))),
                        child: Text(state.current!.climbingHall.name)),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                if (treaning.climbingHall.hasBigWall)
                  AttemptsWithStyle(
                    attempts: state.current!.leadAttempts,
                    treaning: state.current!,
                    isCurrent: true,
                    climbingStyle: ClimbingStyle.lead,
                    cubit: cubit,
                    child: const Text('Нижняя:'),
                  ),
                if (treaning.climbingHall.hasBigWall)
                  AttemptsWithStyle(
                    attempts: state.current!.topRopeAttempts,
                    treaning: state.current!,
                    isCurrent: true,
                    climbingStyle: ClimbingStyle.topRope,
                    cubit: cubit,
                    child: const Text('Верхняя:'),
                  ),
                if (treaning.climbingHall.hasBouldering)
                  AttemptsWithStyle(
                    attempts: treaning.boulderingAttempts,
                    treaning: treaning,
                    isCurrent: true,
                    cubit: cubit,
                    climbingStyle: ClimbingStyle.bouldering,
                    child: const Text('Болдер:'),
                  ),
                if (treaning.climbingHall.hasAutoBelay)
                  AttemptsWithStyle(
                    attempts: treaning.autoBelayAttempts,
                    treaning: treaning,
                    isCurrent: true,
                    cubit: cubit,
                    climbingStyle: ClimbingStyle.autoBelay,
                    child: const Text('Auto belay:'),
                  ),
                TextButton(
                  child: const Text('Завершить'),
                  onPressed: () async {
                    final finishPermission = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title:
                            const Text('Подтверждение завершения тренировки'),
                        content: const Text('Завершить тренировку?'),
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

                    if (finishPermission == true) {
                      cubit.changeDate(
                        date: date.value,
                      );

                      Navigator.of(context).pop(true);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

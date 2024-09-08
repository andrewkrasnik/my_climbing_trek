import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/widgets/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/pages/rock_district_page.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_attempts_with_style.dart';
import 'package:my_climbing_trek/service_locator.dart';

class RockTreaningEditingWidget extends HookWidget {
  final RockTreaning treaning;

  const RockTreaningEditingWidget({required this.treaning, super.key});

  @override
  Widget build(BuildContext context) {
    final date = useState<DateTime>(treaning.date);

    final cubit = getIt<RockTreaningCubit>()..setTreaning(treaning: treaning);

    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<RockTreaningCubit, RockTreaningState>(
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
                                builder: (context) => RockDistrictPage(
                                      district: treaning.district,
                                      addSector: (sector) {
                                        cubit.addRockSectorToTreaning(
                                            sector: sector,
                                            district: state
                                                .currentTreaning!.district);
                                      },
                                    ))),
                        child: Text(state.currentTreaning!.treaninndTitle)),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                if (treaning.sectorsHasTrad)
                  RockAttemptsWithStyle(
                    attempts: state.currentTreaning!.tradAttempts,
                    treaning: state.currentTreaning!,
                    isCurrent: true,
                    climbingStyle: ClimbingStyle.trad,
                    cubit: cubit,
                    child: const Text('Трэд:'),
                  ),
                if (treaning.sectorsHasRope)
                  RockAttemptsWithStyle(
                    attempts: state.currentTreaning!.leadAttempts,
                    treaning: state.currentTreaning!,
                    isCurrent: true,
                    climbingStyle: ClimbingStyle.lead,
                    cubit: cubit,
                    child: const Text('Нижняя:'),
                  ),
                if (treaning.sectorsHasRope)
                  RockAttemptsWithStyle(
                    attempts: state.currentTreaning!.topRopeAttempts,
                    treaning: state.currentTreaning!,
                    isCurrent: true,
                    climbingStyle: ClimbingStyle.topRope,
                    cubit: cubit,
                    child: const Text('Верхняя:'),
                  ),
                if (treaning.sectorsHasBouldering)
                  RockAttemptsWithStyle(
                    attempts: state.currentTreaning!.boulderingAttempts,
                    treaning: state.currentTreaning!,
                    isCurrent: true,
                    climbingStyle: ClimbingStyle.bouldering,
                    cubit: cubit,
                    child: const Text('Болдеринг:'),
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

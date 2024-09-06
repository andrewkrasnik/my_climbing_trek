import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/widgets/date_picker_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/pages/ice_district_page.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_attempts_with_style.dart';
import 'package:my_climbing_trek/service_locator.dart';

class IceTreaningEditingWidget extends HookWidget {
  final IceTreaning treaning;

  const IceTreaningEditingWidget({required this.treaning, super.key});

  @override
  Widget build(BuildContext context) {
    final date = useState<DateTime>(treaning.date);

    final cubit = getIt<CurrentIceTreaningCubit>()
      ..setTreaning(treaning: treaning);

    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<CurrentIceTreaningCubit, CurrentIceTreaningState>(
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
                        onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => IceDistrictPage(
                                  district: state.currentTreaning!.district,
                                  addSector: (sector) {
                                    cubit.addIceSectorToTreaning(
                                        sector: sector,
                                        district:
                                            state.currentTreaning!.district);
                                  },
                                ),
                              ),
                            ),
                        child: Text(state.currentTreaning!.district.name)),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                IceAttemptsWithStyle(
                  attempts: state.currentTreaning!.leadAttempts,
                  treaning: state.currentTreaning!,
                  isCurrent: true,
                  climbingStyle: ClimbingStyle.lead,
                  cubit: cubit,
                  editing: true,
                  child: const Text('Нижняя:'),
                ),
                IceAttemptsWithStyle(
                  attempts: state.currentTreaning!.topRopeAttempts,
                  treaning: state.currentTreaning!,
                  isCurrent: true,
                  climbingStyle: ClimbingStyle.topRope,
                  cubit: cubit,
                  editing: true,
                  child: const Text('Верхняя:'),
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

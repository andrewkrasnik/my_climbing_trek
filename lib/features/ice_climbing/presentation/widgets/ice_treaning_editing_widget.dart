import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/widgets/date_picker_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/pages/ice_district_page.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_attempts_with_style.dart';
import 'package:my_climbing_trek/service_locator.dart';

class IceTreaningEditingWidget extends HookWidget {
  final IceTreaning treaning;

  const IceTreaningEditingWidget({required this.treaning, super.key});

  @override
  Widget build(BuildContext context) {
    final date = useState<DateTime>(treaning.date);

    return BlocProvider(
      create: (context) =>
          getIt<CurrentIceTreaningCubit>()..setTreaning(treaning: treaning),
      child: BlocBuilder<CurrentIceTreaningCubit, CurrentIceTreaningState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                DatePickerWidget(date: date),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => IceDistrictPage(
                                  district: treaning.district,
                                  addSector: (sector) {
                                    BlocProvider.of<CurrentIceTreaningCubit>(
                                            context)
                                        .addIceSectorToTreaning(
                                            sector: sector,
                                            district: treaning.district);
                                  },
                                ),
                              ),
                            ),
                        child: Text(treaning.district.name)),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                if (treaning.hasLead)
                  IceAttemptsWithStyle(
                    attempts: treaning.leadAttempts,
                    treaning: treaning,
                    isCurrent: true,
                    climbingStyle: ClimbingStyle.lead,
                    child: const Text('Нижняя:'),
                  ),
                if (treaning.hasTopRope)
                  IceAttemptsWithStyle(
                    attempts: treaning.topRopeAttempts,
                    treaning: treaning,
                    isCurrent: true,
                    climbingStyle: ClimbingStyle.topRope,
                    child: const Text('Верхняя:'),
                  ),
                TextButton(
                  child: const Text('Завершить'),
                  onPressed: () async {
                    final cubit =
                        BlocProvider.of<CurrentIceTreaningCubit>(context);

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
                        treaning: treaning,
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

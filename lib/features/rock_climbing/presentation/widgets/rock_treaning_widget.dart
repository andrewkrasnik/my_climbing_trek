import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/pages/rock_district_page.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/pages/rock_treaning_page.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_attempts_with_style.dart';

class RockTreaningWidget extends StatelessWidget {
  final RockTreaning treaning;
  final bool isCurrent;

  const RockTreaningWidget(
      {required this.treaning, this.isCurrent = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RockTreaningCubit, RockTreaningState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('dd.MM.yyyy').format(treaning.date)),
                      const Spacer(),
                      InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RockDistrictPage(
                                        district: treaning.district,
                                        addSector: isCurrent
                                            ? (sector) {
                                                BlocProvider.of<
                                                            RockTreaningCubit>(
                                                        context)
                                                    .addRockSectorToTreaning(
                                                        sector: sector,
                                                        district:
                                                            treaning.district);
                                              }
                                            : null,
                                      ))),
                          child: Text(treaning.district.name)),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RockTreaningPage(
                                    treaning: treaning,
                                  )));
                        },
                        icon: const Icon(
                          Icons.share,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  if ((isCurrent && treaning.sectorsHasTrad) ||
                      treaning.hasTrad)
                    RockAttemptsWithStyle(
                      attempts: treaning.tradAttempts,
                      treaning: treaning,
                      isCurrent: isCurrent,
                      climbingStyle: ClimbingStyle.trad,
                      child: const Text('Трэд:'),
                    ),
                  if ((isCurrent && treaning.sectorsHasRope) ||
                      treaning.hasLead)
                    RockAttemptsWithStyle(
                      attempts: treaning.leadAttempts,
                      treaning: treaning,
                      isCurrent: isCurrent,
                      climbingStyle: ClimbingStyle.lead,
                      child: const Text('Нижняя:'),
                    ),
                  if ((isCurrent && treaning.sectorsHasRope) ||
                      treaning.hasTopRope)
                    RockAttemptsWithStyle(
                      attempts: treaning.topRopeAttempts,
                      treaning: treaning,
                      isCurrent: isCurrent,
                      climbingStyle: ClimbingStyle.topRope,
                      child: const Text('Верхняя:'),
                    ),
                  if ((isCurrent && treaning.sectorsHasBouldering) ||
                      treaning.hasBouldering)
                    RockAttemptsWithStyle(
                      attempts: treaning.boulderingAttempts,
                      treaning: treaning,
                      isCurrent: isCurrent,
                      climbingStyle: ClimbingStyle.bouldering,
                      child: const Text('Болдеринг:'),
                    ),
                  if (isCurrent &&
                      BlocProvider.of<RockTreaningCubit>(context)
                              .state
                              .currentAttempt ==
                          null)
                    TextButton(
                      child: const Text('Завершить'),
                      onPressed: () {
                        BlocProvider.of<RockTreaningCubit>(context)
                            .finishTreaning();
                      },
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

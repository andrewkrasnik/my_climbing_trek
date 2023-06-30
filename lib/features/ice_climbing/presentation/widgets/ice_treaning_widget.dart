import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/pages/ice_district_page.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/pages/ice_treaning_page.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_attempts_with_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class IceTreaningWidget extends StatelessWidget {
  final IceTreaning treaning;
  final bool isCurrent;

  const IceTreaningWidget(
      {required this.treaning, this.isCurrent = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => IceDistrictPage(
                                district: treaning.district,
                                addSector: isCurrent
                                    ? (sector) {
                                        BlocProvider.of<
                                                    CurrentIceTreaningCubit>(
                                                context)
                                            .addIceSectorToTreaning(
                                                sector: sector,
                                                district: treaning.district);
                                      }
                                    : null,
                              ))),
                      child: Text(treaning.district.name)),
                  const Spacer(),
                  Text(DateFormat('dd.MM.yyyy').format(treaning.date)),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => IceTreaningPage(
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
              if (isCurrent || treaning.hasLead)
                IceAttemptsWithStyle(
                  attempts: treaning.leadAttempts,
                  treaning: treaning,
                  isCurrent: isCurrent,
                  climbingStyle: ClimbingStyle.lead,
                  child: const Text('Нижняя:'),
                ),
              if (isCurrent || treaning.hasTopRope)
                IceAttemptsWithStyle(
                  attempts: treaning.topRopeAttempts,
                  treaning: treaning,
                  isCurrent: isCurrent,
                  climbingStyle: ClimbingStyle.topRope,
                  child: const Text('Верхняя:'),
                ),
              if (isCurrent &&
                  BlocProvider.of<CurrentIceTreaningCubit>(context)
                          .state
                          .currentAttempt ==
                      null)
                TextButton(
                  child: const Text('Завершить'),
                  onPressed: () {
                    BlocProvider.of<CurrentIceTreaningCubit>(context)
                        .finishTreaning();
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}

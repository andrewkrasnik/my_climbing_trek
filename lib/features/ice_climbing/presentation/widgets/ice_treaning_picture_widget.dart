import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:flutter/material.dart';

import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_attempts_with_style.dart';

class IceTreaningPictureWidget extends StatelessWidget {
  final IceTreaning treaning;

  const IceTreaningPictureWidget({
    super.key,
    required this.treaning,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      shadows: [Shadow(offset: Offset.fromDirection(1, 1))],
    );

    final cubit = BlocProvider.of<CurrentIceTreaningCubit>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (treaning.hasLead)
            IceAttemptsWithStyle(
              attempts: treaning.leadAttempts,
              treaning: treaning,
              isCurrent: false,
              climbingStyle: ClimbingStyle.lead,
              cubit: cubit,
              child: Text(
                'Нижняя:',
                style: textStyle,
              ),
            ),
          if (treaning.hasTopRope)
            IceAttemptsWithStyle(
              attempts: treaning.topRopeAttempts,
              treaning: treaning,
              isCurrent: false,
              climbingStyle: ClimbingStyle.topRope,
              cubit: cubit,
              child: Text(
                'Верхняя:',
                style: textStyle,
              ),
            ),
        ],
      ),
    );
  }
}

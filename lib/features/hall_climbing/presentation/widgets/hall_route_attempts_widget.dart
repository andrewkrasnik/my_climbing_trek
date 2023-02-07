import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HallRouteAttemptsWidget extends StatelessWidget {
  final ClimbingHallRoute route;
  const HallRouteAttemptsWidget({required this.route, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<HallRouteAttemptsCubit>()..loadData(route: route),
      child: BlocBuilder<HallRouteAttemptsCubit, HallRouteAttemptsState>(
        builder: (context, state) {
          return state.maybeMap(
            data: (dataState) => ListView.builder(
              itemCount: dataState.attempts.length,
              itemBuilder: (context, index) {
                final attempt = dataState.attempts[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  height: 24,
                  child: Row(
                    children: [
                      Text(DateFormat('dd.MM.yyyy').format(attempt.startTime!)),
                      const SizedBox(width: 4),
                      Text(
                          '${attempt.style.name} ${attempt.result}, срывов: ${attempt.fallCount}, зависаний: ${attempt.suspensionCount}'),
                    ],
                  ),
                );
              },
            ),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}

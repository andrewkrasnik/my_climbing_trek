import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/climbing_hall_widget.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_roure_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/climbing_hall/climbing_hall_cubit.dart';

class ClimbingHallPage extends StatelessWidget {
  final ClimbingHall climbingHall;
  const ClimbingHallPage({
    Key? key,
    required this.climbingHall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ClimbingHallCubit>()..loadData(climbingHall),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            ClimbingHallWidget(climbingHall: climbingHall),
            const Center(
              child: Text('Маршруты'),
            ),
            BlocBuilder<ClimbingHallCubit, ClimbingHallState>(
              builder: (context, state) {
                if (state.routes != null) {
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            HallRouteWidget(route: state.routes![index]),
                        separatorBuilder: (_, __) => const SizedBox(
                              height: 8,
                            ),
                        itemCount: state.routes!.length),
                  );
                } else {
                  return const Center(
                      child: Text('Пока нет трасс, добавьте новую!'));
                }
              },
            ),
            ElevatedButton(onPressed: () {}, child: Text('Добавить маршрут'))
          ]),
        ),
      ),
    );
  }
}

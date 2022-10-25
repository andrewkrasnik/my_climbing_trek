import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_route_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallTreaningWidget extends StatelessWidget {
  final bool isCurrent;
  final ClimbingHallTreaning treaning;
  const HallTreaningWidget({
    Key? key,
    required this.treaning,
    this.isCurrent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (treaning.hasLead) ...[
          Row(
            children: [
              const Text('Верхняя:'),
              ...treaning.leadAttempts
                  .map((attempt) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: HallRouteCategoryWidget.fromAttempt(
                            attempt: attempt),
                      ))
                  .toList(),
              if (isCurrent)
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
        if (treaning.hasTopRope) ...[
          Row(
            children: [
              const Text('Нижняя:'),
              ...treaning.topRopeAttempts
                  .map((attempt) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: HallRouteCategoryWidget.fromAttempt(
                            attempt: attempt),
                      ))
                  .toList(),
              if (isCurrent)
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
        if (treaning.hasBouldering) ...[
          Row(
            children: [
              const Text('Болдер:'),
              ...treaning.boulderingAttempts
                  .map((attempt) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: HallRouteCategoryWidget.fromAttempt(
                            attempt: attempt),
                      ))
                  .toList()
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
        isCurrent
            ? ElevatedButton(
                child: const Text('Завершить'),
                onPressed: () {
                  BlocProvider.of<CurrentHallTreaningCubit>(context)
                      .finishCurrentTreaning();
                },
              )
            : ElevatedButton(
                child: const Text('Повторить'),
                onPressed: () {
                  BlocProvider.of<CurrentHallTreaningCubit>(context)
                      .repeatTreaning(treaning: treaning);
                },
              ),
      ],
    );
  }
}

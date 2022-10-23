import 'package:climbing_diary/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/pages/climbing_hall_page.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/pages/climbing_halls_page.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/climbing_hall_widget.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_attempt_widget.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_treaning_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const Text('Добавьте новую тренировку'),
          BlocBuilder<CurrentHallTreaningCubit, CurrentHallTreaningState>(
            builder: (context, state) {
              return Column(
                children: [
                  if (state.currentAttempt != null)
                    HallAttemptWidget(attempt: state.currentAttempt!),
                  if (state.lastAttempt != null)
                    HallAttemptWidget(attempt: state.lastAttempt!),
                  if (state.current != null)
                    HallTreaningWidget(treaning: state.current!),
                  if (state.lastAttempt != null)
                    HallTreaningWidget(treaning: state.last!),
                ],
              );
            },
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Скалодромы:'),
              TextButton(
                child: const Text('Смотреть все'),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ClimbingHallsPage())),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                return state.maybeMap(
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  data: (dataState) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => ClimbingHallPage(
                                        climbingHall: dataState.halls[index]))),
                            child: ClimbingHallWidget(
                                climbingHall: dataState.halls[index]),
                          ),
                      separatorBuilder: (_, __) => const SizedBox(
                            width: 16,
                          ),
                      itemCount: dataState.halls.length),
                  orElse: () => const SizedBox(),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

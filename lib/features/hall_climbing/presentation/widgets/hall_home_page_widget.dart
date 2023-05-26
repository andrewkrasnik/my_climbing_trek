import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/pages/climbing_hall_page.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/pages/climbing_halls_page.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/climbing_hall_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_attempt_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_treaning_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HallHomePageWidget extends StatelessWidget {
  const HallHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Column(
      children: [
        BlocBuilder<CurrentHallTreaningCubit, CurrentHallTreaningState>(
          builder: (context, state) {
            return Column(
              children: [
                const Text(
                  'Тренировки на скалодромах',
                  style: titleTextStyle,
                ),
                if (state.currentAttempt != null) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Текущая попытка:',
                      style: titleTextStyle,
                    ),
                  ),
                  HallAttemptWidget(
                    attempt: state.currentAttempt!,
                    isCurrent: true,
                    statistic: state.currentRouteStatistic,
                  )
                ],
                if (state.lastAttempt != null) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Предыдущая попытка:',
                      style: titleTextStyle,
                    ),
                  ),
                  HallAttemptWidget(
                    attempt: state.lastAttempt!,
                    statistic: state.lastRouteStatistic,
                  )
                ],
                if (state.current != null) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Текущая тренировка:',
                      style: titleTextStyle,
                    ),
                  ),
                  HallTreaningWidget(
                    treaning: state.current!,
                    isCurrent: true,
                  )
                ],
                if (state.last != null) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Предыдущая тренировка:',
                      style: titleTextStyle,
                    ),
                  ),
                  HallTreaningWidget(treaning: state.last!)
                ],
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
            const Text('Мои скалодромы:'),
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
                    itemBuilder: (context, index) => Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Hero(
                              tag: 'gym${dataState.halls[index].id}',
                              child: ClimbingHallWidget(
                                climbingHall: dataState.halls[index],
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => ClimbingHallPage(
                                            climbingHall:
                                                dataState.halls[index]))),
                              ),
                            ),
                            BlocBuilder<CurrentHallTreaningCubit,
                                CurrentHallTreaningState>(
                              builder: (context, state) {
                                return state.current == null
                                    ? Align(
                                        alignment: Alignment.bottomRight,
                                        child: IconButton(
                                          icon: const Icon(Icons.add_box,
                                              color: Colors.white),
                                          onPressed: () {
                                            BlocProvider.of<
                                                        CurrentHallTreaningCubit>(
                                                    context)
                                                .newTreaning(
                                              climbingHall:
                                                  dataState.halls[index],
                                            );
                                          },
                                        ),
                                      )
                                    : const SizedBox();
                              },
                            )
                          ],
                        ),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: 8,
                        ),
                    itemCount: dataState.halls.length),
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
      ],
    );
  }
}

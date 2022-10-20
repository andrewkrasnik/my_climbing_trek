import 'package:climbing_diary/features/hall_climbing/presentation/bloc/cubit/home_page_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/climbing_hall_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const Text('Добавьте новую тренировку'),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
          height: 60,
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              return state.maybeMap(
                loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                data: (dataState) => ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ClimbingHallWidget(
                        climbingHall: dataState.halls[index]),
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
    );
  }
}

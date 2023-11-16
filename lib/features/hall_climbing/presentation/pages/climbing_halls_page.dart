import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/pages/climbing_hall_page.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/climbing_hall_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClimbingHallsPage extends StatelessWidget {
  const ClimbingHallsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ClimbingHallsCubit>()..loadData(),
      child: BlocBuilder<ClimbingHallsCubit, ClimbingHallsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Скалодромы'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state.maybeMap(
                loading: (_) =>
                    const Center(child: CircularProgressIndicator()),
                data: (dataState) => ListView.separated(
                    itemBuilder: (context, index) => ClimbingHallWidget(
                          climbingHall: dataState.halls[index],
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ClimbingHallPage(
                                        climbingHall: dataState.halls[index],
                                      ))),
                          height: 220,
                        ),
                    separatorBuilder: (_, __) => const SizedBox(
                          height: 16,
                        ),
                    itemCount: dataState.halls.length),
                orElse: () => const SizedBox(),
              ),
            ),
          );
        },
      ),
    );
  }
}

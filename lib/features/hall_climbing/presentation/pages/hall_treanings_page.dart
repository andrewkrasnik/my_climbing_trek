import 'package:climbing_diary/features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_treaning_widget.dart';
import 'package:flutter/material.dart';

import 'package:climbing_diary/service_locator.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HallTreaningPage extends StatelessWidget {
  const HallTreaningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HallTreaningsCubit>()..loadData(),
      child: BlocBuilder<HallTreaningsCubit, HallTreaningsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state.maybeMap(
                loading: (_) => const CircularProgressIndicator(),
                data: (dataState) => ListView.separated(
                    itemBuilder: (context, index) => Column(
                          children: [
                            Text(dataState.treanings[index].climbingHall.name),
                            Text(dataState.treanings[index].date.toString()),
                            HallTreaningWidget(
                                treaning: dataState.treanings[index]),
                          ],
                        ),
                    separatorBuilder: (_, __) => const SizedBox(
                          height: 32,
                        ),
                    itemCount: dataState.treanings.length),
                orElse: () => const SizedBox(),
              ),
            ),
          );
        },
      ),
    );
  }
}

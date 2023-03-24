import 'package:climbing_diary/features/hall_climbing/domain/usecases/update_halls.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/pages/climbing_hall_page.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/climbing_hall_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClimbingHallsPage extends StatelessWidget {
  const ClimbingHallsPage({Key? key}) : super(key: key);

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
              actions: [
                IconButton(
                    onPressed: () async {
                      await getIt<UpdateHalls>().call();
                      BlocProvider.of<ClimbingHallsCubit>(context).loadData();
                    },
                    icon: const Icon(Icons.update))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: state.maybeMap(
                loading: (_) => const CircularProgressIndicator(),
                data: (dataState) => ListView.separated(
                    itemBuilder: (context, index) => ClimbingHallWidget(
                          climbingHall: dataState.halls[index],
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ClimbingHallPage(
                                        climbingHall: dataState.halls[index],
                                      ))),
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

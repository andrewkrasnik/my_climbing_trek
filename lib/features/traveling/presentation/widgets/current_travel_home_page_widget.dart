import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart';
import 'package:my_climbing_trek/service_locator.dart';

class CurrentTravelHomePageWidget extends StatelessWidget {
  const CurrentTravelHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return BlocProvider(
      create: (context) => getIt<CurrentTravelCubit>()..loadData(),
      child: BlocBuilder<CurrentTravelCubit, CurrentTravelState>(
        builder: (context, state) {
          return state.travel == null
              ? const SizedBox.shrink()
              : Column(children: [
                  Text(
                    state.travel!.name,
                    style: titleTextStyle,
                  ),
                  Text(
                    state.travel!.period,
                    style: titleTextStyle.copyWith(fontSize: 16),
                  ),
                  Text('Применить фильтр'),
                  Text('Добавить расход'),
                  Text('Подробнее'),
                ]);
        },
      ),
    );
  }
}

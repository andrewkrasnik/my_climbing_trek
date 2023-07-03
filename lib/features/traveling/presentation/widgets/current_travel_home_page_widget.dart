import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/pages/travel_page.dart';
import 'package:my_climbing_trek/service_locator.dart';

class CurrentTravelHomePageWidget extends StatelessWidget {
  const CurrentTravelHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    return BlocBuilder<CurrentTravelCubit, CurrentTravelState>(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.outlined(
                      onPressed: () {
                        BlocProvider.of<CurrentTravelCubit>(context)
                            .changeUseFilter();
                      },
                      icon: Icon(
                        Icons.filter_alt,
                        color: state.useFilter
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.5),
                      ),
                    ),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                    IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(Icons.remove),
                    ),
                    IconButton.outlined(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TravelPage(
                                  travel: state.travel!,
                                )));
                      },
                      icon: const Icon(Icons.info),
                    ),
                  ],
                ),
              ]);
      },
    );
  }
}

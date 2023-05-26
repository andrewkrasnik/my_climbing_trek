import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travels/travels_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/pages/travel_page.dart';
import 'package:my_climbing_trek/features/traveling/presentation/pages/travels_page.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TravelHomePageWidget extends StatelessWidget {
  const TravelHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Column(children: [
      const Text(
        'Путешествия',
        style: titleTextStyle,
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Планы:'),
          TextButton(
            child: const Text('Смотреть все'),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TravelsPage())),
          ),
        ],
      ),
      BlocProvider(
        create: (context) => getIt<TravelsCubit>()..loadData(),
        child: SizedBox(
          height: 120,
          child: BlocBuilder<TravelsCubit, TravelsState>(
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
                              tag: 'travel${dataState.travels[index].id}',
                              child: TravelWidget(
                                travel: dataState.travels[index],
                                onTap: () {
                                  final travel = dataState.travels[index];

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          TravelPage(travel: travel)));
                                },
                              ),
                            ),
                          ],
                        ),
                    separatorBuilder: (_, __) => const SizedBox(
                          width: 8,
                        ),
                    itemCount: dataState.travels.length),
                orElse: () => const SizedBox(),
              );
            },
          ),
        ),
      ),
    ]);
  }
}

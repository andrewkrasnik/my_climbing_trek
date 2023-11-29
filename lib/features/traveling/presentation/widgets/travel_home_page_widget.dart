import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travels/travels_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/pages/travel_page.dart';
import 'package:my_climbing_trek/features/traveling/presentation/pages/travels_page.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TravelHomePageWidget extends StatelessWidget {
  const TravelHomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return BlocProvider(
      create: (context) => getIt<TravelsCubit>()..loadPlanedData(),
      child: BlocBuilder<TravelsCubit, TravelsState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<TravelsCubit>(context);

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
                  onPressed: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const TravelsPage()));

                    cubit.loadPlanedData();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: state.maybeMap(
                loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
                data: (dataState) => dataState.travels.isEmpty
                    ? InkWell(
                        onTap: () async {
                          final cubit = BlocProvider.of<TravelsCubit>(context);

                          await showMyModalBottomSheet<void>(
                            context: context,
                            heightPersent: 0.8,
                            child: TravelParametersWidget(cubit: cubit),
                          );

                          cubit.loadPlanedData();
                        },
                        child: const Center(
                            child: Text(
                          'Запланируйте путешествие',
                          style: titleTextStyle,
                        )),
                      )
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Hero(
                                  tag: 'travel${dataState.travels[index].id}',
                                  child: TravelWidget(
                                    travel: dataState.travels[index],
                                    onTap: () async {
                                      final travel = dataState.travels[index];

                                      await Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  TravelPage(travel: travel)));

                                      cubit.loadPlanedData();
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
              ),
            ),
          ]);
        },
      ),
    );
  }
}

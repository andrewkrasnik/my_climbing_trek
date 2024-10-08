import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/data/place_filter.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_region_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_regions_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/ascension_events_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/ascension_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_region_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_route_details_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class MountaineeringHomeWidget extends StatelessWidget {
  final PlaceFilter? filter;
  const MountaineeringHomeWidget({
    super.key,
    this.filter,
  });

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    final cubit = getIt<MountainRegionsCubit>();

    cubit.loadMyData();

    return BlocProvider(
      create: (context) => cubit,
      child: Column(
        children: [
          const Text(
            'Восхождения и мультипитчи',
            style: titleTextStyle,
          ),
          const SizedBox(height: 16),
          // const Text(
          //   'Текущая веревка',
          //   style: titleTextStyle,
          // ),
          // const SizedBox(height: 16),
          // const Text(
          //   'Следующая веревка',
          //   style: titleTextStyle,
          // ),
          // const SizedBox(height: 16),
          // const Text(
          //   'Маршрут',
          //   style: titleTextStyle,
          // ),
          // const SizedBox(height: 16),

          BlocBuilder<AscensionCubit, AscensionState>(
            builder: (context, state) {
              return state.ascension == null
                  ? const SizedBox()
                  : Column(
                      children: [
                        AscensionWidget(ascension: state.ascension!),
                        MountainRouteDetailsWidget(
                            route: state.ascension!.route),
                        AscensionEventsWidget(
                          ascension: state.ascension!,
                          editing: true,
                        ),
                        // if (state.ascension?.started == true)
                        TextButton(
                          child: const Text('Завершить'),
                          onPressed: () {
                            BlocProvider.of<AscensionCubit>(context)
                                .finishAscension(ascension: state.ascension!);
                          },
                        ),
                      ],
                    );
            },
          ),
          if (filter?.region == null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Горы и маршруты:'),
                TextButton(
                  child: const Text('Смотреть все'),
                  onPressed: () async {
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MountainRegionsPage()));

                    cubit.loadMyData();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: BlocBuilder<MountainRegionsCubit, MountainRegionsState>(
                bloc: cubit,
                builder: (context, state) {
                  return state.maybeMap(
                    loading: (_) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    data: (dataState) => ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MountainRegionPage(
                                          region: dataState.regions[index],
                                        )));
                              },
                              child: MountainRegionWidget(
                                region: dataState.regions[index],
                                myData: true,
                              ),
                            ),
                        separatorBuilder: (_, __) => const SizedBox(
                              width: 8,
                            ),
                        itemCount: dataState.regions.length),
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ),
          ],
          if (filter?.region != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Горы и маршруты:'),
                TextButton(
                  child: const Text('Смотреть все'),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MountainRegionPage(
                            region: filter!.region!,
                          ))),
                ),
              ],
            ),
            BlocProvider(
              create: (context) =>
                  getIt<MountainsCubit>()..loadData(region: filter!.region!),
              child: SizedBox(
                height: 120,
                child: BlocBuilder<MountainsCubit, MountainsState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      data: (dataState) => ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MountainPage(
                                            region: filter!.region!,
                                            mountain:
                                                dataState.mountains[index],
                                          )));
                                },
                                child: MountainWidget(
                                    mountain: dataState.mountains[index]),
                              ),
                          separatorBuilder: (_, __) => const SizedBox(
                                width: 8,
                              ),
                          itemCount: dataState.mountains.length),
                      orElse: () => const SizedBox(),
                    );
                  },
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

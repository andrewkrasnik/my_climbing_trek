import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/data/place_filter.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/trekking/trekking_cubit.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/treks/treks_cubit.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trek_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trekking_region_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trekking_regions_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/previos_trekking_path_widget.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trek_widget.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trekking_path_widget.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trekking_region_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TrekkingHomePageWidget extends StatelessWidget {
  final PlaceFilter? filter;
  const TrekkingHomePageWidget({
    this.filter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    final cubit = getIt<TrekkingRegionsCubit>();

    if (filter?.region == null) {
      cubit.loadMyData();
    }

    return BlocProvider(
      create: (context) => cubit,
      child: Column(children: [
        const Text(
          'Треккинг и походы',
          style: titleTextStyle,
        ),
        const SizedBox(height: 8),
        BlocBuilder<TrekkingCubit, TrekkingState>(
          builder: (context, state) {
            return Column(
              children: [
                if (state.currentPath != null) ...[
                  TrekkingPathWidget(
                    path: state.currentPath!,
                    editing: true,
                  ),
                  const SizedBox(height: 8),
                ],
                if (state.currentPath == null && state.previosPath != null) ...[
                  PreviosTrekkingPathWidget(
                    path: state.previosPath!,
                    editing: true,
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            );
          },
        ),
        const SizedBox(height: 8),
        if (filter?.region == null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(filter?.region == null ? 'Регионы:' : 'Маршруты: '),
              TextButton(
                child: const Text('Смотреть все'),
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TrekkingRegionsPage()));

                  cubit.loadMyData();
                },
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: BlocBuilder<TrekkingRegionsCubit, TrekkingRegionsState>(
              bloc: cubit,
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
                              TrekkingRegionWidget(
                                region: dataState.regions[index],
                                myData: true,
                                onTap: () {
                                  final region = dataState.regions[index];

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          TrekkingRegionPage(region: region)));
                                },
                              ),
                            ],
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
              const Text('Маршруты: '),
              TextButton(
                child: const Text('Смотреть все'),
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TrekkingRegionPage(
                          region: filter!.region!,
                        ))),
              ),
            ],
          ),
          BlocProvider(
            create: (context) =>
                getIt<TreksCubit>()..loadData(region: filter!.region!),
            child: SizedBox(
              height: 120,
              child: BlocBuilder<TreksCubit, TreksState>(
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
                                InkWell(
                                  onTap: () {
                                    final trek = dataState.treks[index];

                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => TrekPage(
                                                region: filter!.region!,
                                                trek: trek)));
                                  },
                                  child: TrekWidget(
                                    trek: dataState.treks[index],
                                    region: filter!.region!,
                                  ),
                                ),
                              ],
                            ),
                        separatorBuilder: (_, __) => const SizedBox(
                              width: 8,
                            ),
                        itemCount: dataState.treks.length),
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ),
          ),
        ],
      ]),
    );
  }
}

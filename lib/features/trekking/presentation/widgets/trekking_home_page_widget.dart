import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/trekking/trekking_cubit.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trekking_region_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trekking_regions_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trekking_path_widget.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trekking_region_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TrekkingHomePageWidget extends StatelessWidget {
  const TrekkingHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Column(children: [
      const Text(
        'Треккинг и походы',
        style: titleTextStyle,
      ),
      const SizedBox(height: 8),
      BlocBuilder<TrekkingCubit, TrekkingState>(
        builder: (context, state) {
          return Column(
            children: [
              if (state.currentPath != null)
                TrekkingPathWidget(
                  path: state.currentPath!,
                  editing: true,
                ),
              const SizedBox(height: 8),
            ],
          );
        },
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Регионы:'),
          TextButton(
            child: const Text('Смотреть все'),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TrekkingRegionsPage())),
          ),
        ],
      ),
      BlocProvider(
        create: (context) => getIt<TrekkingRegionsCubit>()..loadData(),
        child: SizedBox(
          height: 120,
          child: BlocBuilder<TrekkingRegionsCubit, TrekkingRegionsState>(
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
      ),
    ]);
  }
}

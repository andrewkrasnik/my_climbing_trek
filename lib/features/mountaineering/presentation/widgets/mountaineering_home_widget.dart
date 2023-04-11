import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_region_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_regions_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_region_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class MountaineeringHomeWidget extends StatelessWidget {
  const MountaineeringHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Column(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Горы и маршруты:'),
            TextButton(
              child: const Text('Смотреть все'),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MountainRegionsPage())),
            ),
          ],
        ),
        BlocProvider(
          create: (context) => getIt<MountainRegionsCubit>()..loadData(),
          child: SizedBox(
            height: 120,
            child: BlocBuilder<MountainRegionsCubit, MountainRegionsState>(
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
                                region: dataState.regions[index]),
                          ),
                      separatorBuilder: (_, __) => const SizedBox(
                            width: 16,
                          ),
                      itemCount: dataState.regions.length),
                  orElse: () => const SizedBox(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

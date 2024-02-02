import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_region_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_region_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MountainRegionsPage extends StatelessWidget {
  const MountainRegionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Горы и маршруты'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => getIt<MountainRegionsCubit>()..loadData(),
          child: BlocBuilder<MountainRegionsCubit, MountainRegionsState>(
            builder: (context, state) {
              return state.maybeMap(
                  loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  data: (dataState) => ListView.separated(
                        itemCount: dataState.regions.length,
                        itemBuilder: (context, index) {
                          final region = dataState.regions[index];
                          return MountainRegionWidget(
                            height: 220,
                            region: region,
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MountainRegionPage(region: region))),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                      ),
                  orElse: () => const SizedBox());
            },
          ),
        ),
      ),
    );
  }
}

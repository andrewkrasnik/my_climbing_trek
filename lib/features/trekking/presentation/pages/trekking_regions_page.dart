import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_region_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trekking_region_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trekking_region_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrekkingRegionsPage extends StatelessWidget {
  const TrekkingRegionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Треккинг и походы'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) => getIt<TrekkingRegionsCubit>()..loadData(),
          child: BlocBuilder<TrekkingRegionsCubit, TrekkingRegionsState>(
            builder: (context, state) {
              return state.maybeMap(
                  loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  data: (dataState) => ListView.separated(
                        itemCount: dataState.regions.length,
                        itemBuilder: (context, index) {
                          final region = dataState.regions[index];
                          return TrekkingRegionWidget(
                            height: 220,
                            region: region,
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TrekkingRegionPage(region: region))),
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

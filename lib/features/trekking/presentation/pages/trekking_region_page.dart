import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/my_sliver_app_bar_widget.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/treks/treks_cubit.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trek_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trek_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrekkingRegionPage extends StatelessWidget {
  final Region region;

  const TrekkingRegionPage({
    required this.region,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            MySliverAppBarWidget(
              heroTag: 'TrekkingRegion${region.id}',
              title: region.name,
              imageUrl: region.image!,
            ),
            BlocProvider(
              create: (context) =>
                  getIt<TreksCubit>()..loadData(region: region),
              child: BlocBuilder<TreksCubit, TreksState>(
                builder: (context, state) {
                  return state.maybeMap(
                    data: (dataState) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: dataState.treks.length,
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TrekPage(
                                        trek: dataState.treks[index],
                                        region: region,
                                      )));
                            },
                            child: TrekWidget(
                              trek: dataState.treks[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                    orElse: () => SliverList(
                      delegate: SliverChildListDelegate(
                          [const Center(child: Text('Нет маршрутов'))]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

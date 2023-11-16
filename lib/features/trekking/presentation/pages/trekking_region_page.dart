import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
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
            SliverAppBar(
              expandedHeight: 160,
              stretch: true,
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'TrekkingRegion${region.id}',
                  child: MyCachedNetworkImage(
                    imageUrl: region.image!,
                    fit: BoxFit.cover,
                  ),
                ),
                centerTitle: true,
                title: Text(
                  region.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(offset: Offset.fromDirection(1))]),
                ),
              ),
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

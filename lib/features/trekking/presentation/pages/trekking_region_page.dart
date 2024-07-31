import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/my_sliver_app_bar_widget.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/treks/treks_cubit.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trek_editing_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trek_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trek_point_editing_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trek_point_widget.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trek_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrekkingRegionPage extends StatefulWidget {
  final Region region;

  const TrekkingRegionPage({
    required this.region,
    super.key,
  });

  @override
  State<TrekkingRegionPage> createState() => _TrekkingRegionPageState();
}

class _TrekkingRegionPageState extends State<TrekkingRegionPage> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'Маршруты',
      'Места',
    ];

    final color = Theme.of(context).colorScheme.surface;

    final cubit = getIt<TreksCubit>()..loadData(region: widget.region);

    return BlocProvider(
      create: (context) => cubit,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: widget.region.hasEditPermission
              ? FloatingActionButton(
                  onPressed: () {
                    if (tabIndex == 0) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TrekEditingPage(
                          region: widget.region,
                          cubit: cubit,
                        ),
                      ));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TrekPointEditingPage(
                          region: widget.region,
                          cubit: cubit,
                        ),
                      ));
                    }
                  },
                  child: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                )
              : null,
          body: CustomScrollView(
            slivers: [
              MySliverAppBarWidget(
                heroTag: 'TrekkingRegion${widget.region.id}',
                title: widget.region.name,
                imageUrl: widget.region.image!,
                cacheKey: widget.region.trekCacheKey,
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 52,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: tabs.length,
                    itemBuilder: (context, index) {
                      final bool selected = index == tabIndex;
                      return InkWell(
                        onTap: () {
                          setState(() {
                            tabIndex = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Chip(
                              label: Text(
                            tabs[index],
                            style: TextStyle(
                                color:
                                    selected ? color : color.withOpacity(0.5)),
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ),
              if (tabIndex == 0)
                BlocBuilder<TreksCubit, TreksState>(
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
                                          region: widget.region,
                                        )));
                              },
                              child: SlidableDataLineWidget(
                                delete: widget.region.hasEditPermission,
                                edit: widget.region.hasEditPermission,
                                onDelete: widget.region.hasEditPermission
                                    ? (_) {}
                                    : null,
                                onEdit: widget.region.hasEditPermission
                                    ? (_) {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => TrekEditingPage(
                                            region: widget.region,
                                            trek: dataState.treks[index],
                                            cubit: cubit,
                                          ),
                                        ));
                                      }
                                    : null,
                                child: TrekWidget(
                                  trek: dataState.treks[index],
                                  region: widget.region,
                                ),
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
              if (tabIndex == 1)
                BlocBuilder<TreksCubit, TreksState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      data: (dataState) => SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: dataState.points.length,
                          (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => TrekPointWidget(
                                //           point: dataState.points[index],
                                //         )));
                              },
                              child: SlidableDataLineWidget(
                                delete: widget.region.hasEditPermission,
                                edit: widget.region.hasEditPermission,
                                onDelete: widget.region.hasEditPermission
                                    ? (_) {}
                                    : null,
                                onEdit: widget.region.hasEditPermission
                                    ? (_) {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              TrekPointEditingPage(
                                            region: widget.region,
                                            point: dataState.points[index],
                                            cubit: cubit,
                                          ),
                                        ));
                                      }
                                    : null,
                                child: TrekPointWidget(
                                  point: dataState.points[index],
                                  region: widget.region,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      orElse: () => SliverList(
                        delegate: SliverChildListDelegate(
                            [const Center(child: Text('Нет мест'))]),
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

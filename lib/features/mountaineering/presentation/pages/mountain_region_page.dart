import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/my_sliver_app_bar_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_editing_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MountainRegionPage extends StatelessWidget {
  final Region region;

  const MountainRegionPage({
    required this.region,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: region.hasEditPermission
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MountainEditingPage(
                        region: region,
                      ),
                    ),
                  );
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
              heroTag: 'MountainRegion${region.id}',
              title: region.name,
              imageUrl: region.image!,
            ),
            BlocProvider(
              create: (context) =>
                  getIt<MountainsCubit>()..loadData(region: region),
              child: BlocBuilder<MountainsCubit, MountainsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    data: (dataState) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: dataState.mountains.length,
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MountainPage(
                                        mountain: dataState.mountains[index],
                                        region: region,
                                      )));
                            },
                            child: MountainWidget(
                              mountain: dataState.mountains[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                    orElse: () => SliverList(
                      delegate: SliverChildListDelegate(
                          [const Center(child: Text('Нет вершин'))]),
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

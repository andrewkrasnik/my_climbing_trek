import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/my_sliver_app_bar_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_editing_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_route_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MountainPage extends StatelessWidget {
  final Mountain mountain;
  final Region region;

  const MountainPage({
    required this.mountain,
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
              heroTag: 'Mountain${mountain.id}',
              title: '${mountain.name}, ${mountain.altitude} м.',
              imageUrl: mountain.image,
              actions: [
                if (region.hasEditPermission)
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MountainEditingPage(
                              region: region,
                              mountain: mountain,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit))
              ],
            ),
            BlocProvider(
              create: (context) => getIt<MountainRoutesCubit>()
                ..loadData(mountain: mountain, region: region),
              child: BlocBuilder<MountainRoutesCubit, MountainRoutesState>(
                builder: (context, state) {
                  return state.maybeMap(
                    data: (dataState) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: dataState.routes.length,
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MountainRouteWidget(
                            route: dataState.routes[index],
                            mountain: mountain,
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

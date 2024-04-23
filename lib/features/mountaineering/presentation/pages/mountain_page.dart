import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/my_sliver_app_bar_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_editing_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_route_editing_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_route_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MountainPage extends StatelessWidget {
  final Mountain mountain;
  final Region region;
  final MountainsCubit? cubit;

  const MountainPage({
    required this.mountain,
    required this.region,
    this.cubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routesCubit = getIt<MountainRoutesCubit>()
      ..loadData(mountain: mountain, region: region);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: region.hasEditPermission
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MountainRouteEditingPage(
                        mountain: mountain,
                        cubit: routesCubit,
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
              heroTag: 'Mountain${mountain.id}',
              title: '${mountain.name}, ${mountain.altitude} м.',
              imageUrl: mountain.image,
              actions: [
                if (region.hasEditPermission && cubit != null)
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MountainEditingPage(
                              cubit: cubit!,
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
              create: (context) => routesCubit,
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
                            cubit: routesCubit,
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

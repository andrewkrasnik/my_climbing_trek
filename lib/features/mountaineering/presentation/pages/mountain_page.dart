import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart';
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
    Key? key,
  }) : super(key: key);

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
                background: MyCachedNetworkImage(
                  imageUrl: mountain.image,
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
                title: Text(
                  '${mountain.name}, ${mountain.altitude} м.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(offset: Offset.fromDirection(1))]),
                ),
              ),
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

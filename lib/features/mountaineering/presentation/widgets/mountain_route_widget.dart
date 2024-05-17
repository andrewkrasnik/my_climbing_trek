import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_route_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_route_category_widget.dart';

class MountainRouteWidget extends StatelessWidget {
  final MountainRoute route;
  final Mountain mountain;
  final void Function(MountainRoute route)? onTapGo;
  final MountainRoutesCubit cubit;

  const MountainRouteWidget({
    required this.route,
    required this.mountain,
    this.onTapGo,
    required this.cubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          leading: MountainRouteCategoryWidget(route: route),
          title: Text(route.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(route.type.name),
              if (route.author.isNotEmpty)
                Text('${route.author}, ${route.firstAscentYear}')
            ],
          ),
          trailing: onTapGo == null
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MountainRoutePage(
                              mountain: mountain,
                              route: route,
                              cubit: cubit,
                            )));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                )
              : ElevatedButton(onPressed: () {}, child: const Text('GO!')),
        ));
  }
}

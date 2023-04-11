import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountaineering_category_widget.dart';

class MountainRouteWidget extends StatelessWidget {
  final MountainRoute route;
  final void Function(MountainRoute route)? onTapGo;
  const MountainRouteWidget({required this.route, this.onTapGo, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: ListTile(
          leading: Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              MountaineeringCategoryWidget(category: route.category),
            ],
          ),
          title: Text(route.name),
          subtitle: Text('${route.type.name}'),
          trailing: onTapGo == null
              ? null
              : ElevatedButton(onPressed: () => null, child: const Text('GO!')),
        ));
  }
}

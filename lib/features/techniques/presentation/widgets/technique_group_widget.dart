import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart';

class TechniqueGroupWidget extends StatelessWidget {
  final TechniqueGroup group;
  final double height;
  final void Function()? onTap;
  final bool myData;

  const TechniqueGroupWidget({
    required this.group,
    this.onTap,
    this.height = 160,
    super.key,
    this.myData = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            MyCachedNetworkImage(
              imageUrl: group.image,
              fit: BoxFit.cover,
              cacheKey: group.cacheKey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    ),
                  ]),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<TechniqueGroupsCubit>(context)
                      .bookmarGroup(group: group, myData: myData);
                },
                icon: group.localData
                    ? const Icon(Icons.bookmark)
                    : const Icon(Icons.bookmark_outline_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

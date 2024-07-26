import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart';

class MountainRegionWidget extends StatelessWidget {
  final Region region;
  final double height;
  final void Function()? onTap;
  final bool myData;

  const MountainRegionWidget({
    required this.region,
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
            Hero(
                tag: 'MountainRegion${region.id}',
                child: MyCachedNetworkImage(
                  imageUrl: region.image!,
                  fit: BoxFit.cover,
                  cacheKey: region.cacheKey,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      region.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    ),
                    Text(
                      region.state,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    )
                  ]),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<MountainRegionsCubit>(context)
                      .bookmarkRegion(region: region, myData: myData);
                },
                icon: region.localData
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

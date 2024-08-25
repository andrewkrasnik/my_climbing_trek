import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart';

class RockDistrictWidget extends StatelessWidget {
  final RockDistrict district;
  final void Function()? onTap;
  final double height;
  final bool myData;

  const RockDistrictWidget({
    required this.district,
    this.onTap,
    this.height = 160,
    this.myData = false,
    super.key,
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
            DecoratedBox(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: MyCachedNetworkImage(
                  imageUrl: district.image,
                  fit: BoxFit.cover,
                  cacheKey: district.cacheKey,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      district.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    ),
                    Text(
                      district.region.name,
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
                  BlocProvider.of<RockDistrictsCubit>(context)
                      .bookmark(district: district, myData: myData);
                },
                icon: district.localData
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

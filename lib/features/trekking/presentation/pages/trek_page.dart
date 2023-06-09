import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/core/widgets/scaled_image.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_route_widget.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trek_point_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrekPage extends StatelessWidget {
  final Trek trek;
  final Region region;

  const TrekPage({
    required this.trek,
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
              expandedHeight: 260,
              stretch: true,
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'Trek${trek.id}',
                  child: MyCachedNetworkImage(
                    imageUrl: trek.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                centerTitle: true,
                title: Text(
                  trek.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(offset: Offset.fromDirection(1))]),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ScaledImageWidget(
                  imageUrl: trek.mapImage!,
                ),
              ),
              TrekPointWidget(point: trek.start),
              ...trek.sections.map((section) => Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '${section.start.name} - ${section.finish.name}: ${section.length} км.${section.climb}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(section.description),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TrekPointWidget(point: section.finish),
                      ),
                    ],
                  ))
            ])),
          ],
        ),
      ),
    );
  }
}

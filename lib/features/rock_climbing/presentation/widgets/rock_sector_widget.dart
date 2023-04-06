import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_route_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class RockSectorWidget extends StatelessWidget {
  final RockSector sector;
  final RockDistrict district;
  final void Function()? onTap;
  const RockSectorWidget({
    required this.sector,
    required this.district,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 160,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                MyCachedNetworkImage(imageUrl: sector.image, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sector.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(offset: Offset.fromDirection(1))
                              ]),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          BlocProvider(
            create: (context) => getIt<RockRoutesCubit>()
              ..loadData(
                district: district,
                sector: sector,
              ),
            child: BlocBuilder<RockRoutesCubit, RockRoutesState>(
              builder: (context, state) {
                return state.maybeMap(
                  data: (dataState) {
                    return Column(
                      children: dataState.routes
                          .map((route) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4),
                                child: RockRouteWidget(route: route),
                              ))
                          .toList(),
                    );
                  },
                  loading: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  orElse: () => const SizedBox(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/scaled_image.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_routes_filter.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_route_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class RockSectorWidget extends StatelessWidget {
  final RockSector sector;
  final RockDistrict district;
  final void Function()? onTap;
  final void Function(RockSector)? addSector;
  final void Function(RockRoute route)? onTapGo;
  final RockRouteFilter? filter;

  const RockSectorWidget({
    required this.sector,
    required this.district,
    this.onTap,
    this.addSector,
    this.onTapGo,
    this.filter,
    super.key,
    required,
  });

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
                ScaledImageWidget(imageUrl: sector.image),
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
                if (addSector != null)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: const Icon(Icons.add_box, color: Colors.white),
                      onPressed: () {
                        addSector!(sector);
                        Navigator.of(context).pop();
                      },
                    ),
                  )
              ],
            ),
          ),
          BlocProvider(
            create: (context) => getIt<RockRoutesCubit>(),
            // ..loadData(
            //   district: district,
            //   sector: sector,
            //   filter: filter,
            // ),
            child: Builder(
              builder: (context) {
                BlocProvider.of<RockRoutesCubit>(context).loadData(
                  district: district,
                  sector: sector,
                  filter: filter,
                );
                return BlocBuilder<RockRoutesCubit, RockRoutesState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      data: (dataState) {
                        return Column(
                          children: dataState.routes
                              .map((route) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: RockRouteWidget(
                                      route: route,
                                      onTapGo: onTapGo,
                                      statistic: dataState.statistic?[route],
                                    ),
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
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

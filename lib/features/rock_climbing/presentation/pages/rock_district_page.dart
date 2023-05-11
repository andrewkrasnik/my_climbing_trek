import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_sector_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RockDistrictPage extends StatelessWidget {
  final RockDistrict district;
  final void Function(RockSector)? addSector;

  const RockDistrictPage({
    required this.district,
    this.addSector,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              stretch: true,
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'rock${district.id}',
                  child: MyCachedNetworkImage(
                      imageUrl: district.image, fit: BoxFit.cover),
                ),
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      district.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          shadows: [Shadow(offset: Offset.fromDirection(1))]),
                    ),
                    if (district.mapPoint != null)
                      IconButton(
                          onPressed: () {
                            launchUrlString(
                              'https://maps.yandex.ru/?ll=${district.mapPoint!.coordinates}&spn=2.124481,0.671008&z=15&l=map&pt=${district.mapPoint!.coordinates},pmrdm1',
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          icon: Icon(
                            Icons.place,
                            color: Colors.white,
                            shadows: [Shadow(offset: Offset.fromDirection(1))],
                            size: 20,
                          )),
                  ],
                ),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  getIt<RockSectorsCubit>()..loadData(district: district),
              child: BlocBuilder<RockSectorsCubit, RockSectorsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    data: (dataState) => SliverList(
                        delegate: SliverChildListDelegate([
                      Column(
                          children: dataState.sectors
                              .map((sector) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RockSectorWidget(
                                      district: district,
                                      sector: sector,
                                      addSector: addSector,
                                    ),
                                  ))
                              .toList()),
                    ])),
                    orElse: () => SliverList(
                      delegate: SliverChildListDelegate(
                          [const Center(child: Text('Нет секторов'))]),
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

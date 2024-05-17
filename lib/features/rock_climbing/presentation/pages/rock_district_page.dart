import 'package:my_climbing_trek/core/widgets/my_sliver_app_bar_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/pages/rock_sector_editing_page.dart';
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<RockSectorsCubit>()..loadData(district: district);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: district.hasEditPermission
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RockSectorEditingPage(
                      district: district,
                      sectorsCubit: cubit,
                    ),
                  ));
                },
                child: const Icon(
                  Icons.add,
                  size: 40,
                ),
              )
            : null,
        body: CustomScrollView(
          slivers: [
            MySliverAppBarWidget(
              heroTag: 'rock${district.id}',
              title: district.name,
              imageUrl: district.image,
              onMapPpoint: district.mapPoint == null
                  ? null
                  : () {
                      launchUrlString(
                        'https://maps.yandex.ru/?ll=${district.mapPoint!.coordinates}&spn=2.124481,0.671008&z=15&l=map&pt=${district.mapPoint!.coordinates},pmrdm1',
                        mode: LaunchMode.externalApplication,
                      );
                    },
            ),
            BlocProvider(
              create: (context) => cubit,
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
                                      sectorsCubit: cubit,
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

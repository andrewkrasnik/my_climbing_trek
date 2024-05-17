import 'package:my_climbing_trek/core/widgets/my_sliver_app_bar_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/pages/ice_sector_editing_page.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/pages/ice_sector_page.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_sector_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IceDistrictPage extends StatelessWidget {
  final IceDistrict district;
  final void Function(IceSector)? addSector;

  const IceDistrictPage({
    required this.district,
    this.addSector,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<IceSectorsCubit>()..loadData(district: district);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: district.hasEditPermission
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => IceSectorEditingPage(
                      district: district,
                      cubit: cubit,
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
              heroTag: 'iceDistrict${district.id}',
              title: district.name,
              imageUrl: district.image,
            ),
            BlocProvider(
              create: (context) => cubit,
              child: BlocBuilder<IceSectorsCubit, IceSectorsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    data: (dataState) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: dataState.sectors.length,
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            fit: StackFit.passthrough,
                            children: [
                              IceSectorWidget(
                                sector: dataState.sectors[index],
                                height: 220,
                                onTap: () => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                        builder: (context) => IceSectorPage(
                                              district: district,
                                              sector: dataState.sectors[index],
                                              cubit: cubit,
                                            ))),
                              ),
                              if (addSector != null)
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.add_box,
                                        color: Colors.white),
                                    onPressed: () {
                                      addSector!(dataState.sectors[index]);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
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

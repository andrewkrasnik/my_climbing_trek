import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/widgets/ice_sector_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IceDistrictPage extends StatelessWidget {
  final IceDistrict district;

  const IceDistrictPage({required this.district, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 160,
              stretch: true,
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  district.image,
                  fit: BoxFit.cover,
                ),
                centerTitle: true,
                title: Text(
                  district.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(offset: Offset.fromDirection(1))]),
                ),
              ),
            ),
            BlocProvider(
              create: (context) =>
                  getIt<IceSectorsCubit>()..loadData(district: district),
              child: BlocBuilder<IceSectorsCubit, IceSectorsState>(
                builder: (context, state) {
                  return state.maybeMap(
                    data: (dataState) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: dataState.sectors.length,
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              IceSectorWidget(sector: dataState.sectors[index]),
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

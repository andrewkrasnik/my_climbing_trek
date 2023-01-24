import 'package:climbing_diary/features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/pages/ice_sector_page.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/widgets/ice_category_widget.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/widgets/ice_sector_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';

import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectIceRouteWidget extends StatelessWidget {
  final IceTreaning treaning;
  final ClimbingStyle style;

  const SelectIceRouteWidget({
    Key? key,
    required this.treaning,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<IceSectorsCubit>()..loadData(district: treaning.district),
      child: BlocBuilder<IceSectorsCubit, IceSectorsState>(
        builder: (context, state) {
          return state.maybeMap(
            data: (dataState) => ListView.builder(
              itemCount: dataState.sectors.length,
              itemBuilder: (context, index) {
                final sector = dataState.sectors[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Image(
                      width: MediaQuery.of(context).size.width / 4,
                      image: NetworkImage(
                        sector.image,
                      ),
                    ),
                    Column(
                      children: [
                        Text(sector.name),
                        Wrap(
                            children: sector.categories
                                .map((category) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4),
                                      child: IceCategoryWidget(
                                          category: category,
                                          prefix: sector.icePrefix),
                                    ))
                                .toList()),
                      ],
                    )
                  ]),
                );
              },
            ),
            orElse: () => SliverList(
              delegate: SliverChildListDelegate(
                  [const Center(child: Text('Нет секторов'))]),
            ),
          );
        },
      ),
    );
  }
}

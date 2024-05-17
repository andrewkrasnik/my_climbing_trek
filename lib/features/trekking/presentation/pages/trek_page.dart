import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/my_sliver_app_bar_widget.dart';
import 'package:my_climbing_trek/core/widgets/scaled_image.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/trekking/trekking_cubit.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trek_point_widget.dart';
import 'package:flutter/material.dart';

class TrekPage extends StatelessWidget {
  final Trek trek;
  final Region region;

  const TrekPage({
    required this.trek,
    required this.region,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: BlocBuilder<TrekkingCubit, TrekkingState>(
          builder: (context, state) {
            if (state.currentPath == null && state.previosPath == null) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<TrekkingCubit>(context)
                          .startTrek(trek: trek);
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text('Туда'),
                  ),
                  const SizedBox(width: 8),
                  FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<TrekkingCubit>(context)
                          .startTrek(trek: trek, turn: true);
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: const Text('Назад'),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
        body: CustomScrollView(
          slivers: [
            MySliverAppBarWidget(
              heroTag: 'Trek${trek.id}',
              title: trek.name,
              imageUrl: trek.imageUrl,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              if (trek.mapImage?.isEmpty == false)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScaledImageWidget(
                    imageUrl: trek.mapImage!,
                  ),
                ),
              if (trek.sections.isNotEmpty) TrekPointWidget(point: trek.start),
              ...trek.sections.map(
                (section) => Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          '${section.start.name} - ${section.finish.name}: ${section.length} км.${section.climb(false)}'),
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
                ),
              ),
              const SizedBox(height: 40),
            ])),
          ],
        ),
      ),
    );
  }
}

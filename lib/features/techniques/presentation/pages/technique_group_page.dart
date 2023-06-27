import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/techniques/techniques_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/technique_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechniqueGroupPage extends StatelessWidget {
  final TechniqueGroup group;

  const TechniqueGroupPage({
    required this.group,
    Key? key,
  }) : super(key: key);

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
                background: Hero(
                  tag: 'TechniqueGroup${group.id}',
                  child: MyCachedNetworkImage(
                    imageUrl: group.image,
                    fit: BoxFit.cover,
                  ),
                ),
                centerTitle: true,
                title: Text(
                  group.name,
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
                  getIt<TechniquesCubit>()..loadData(group: group),
              child: BlocBuilder<TechniquesCubit, TechniquesState>(
                builder: (context, state) {
                  return state.maybeMap(
                    data: (dataState) => SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: dataState.techniques.length,
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TechniqueWidget(
                            technique: dataState.techniques[index],
                            onPressed: () {
                              BlocProvider.of<TechniqueTreaningCubit>(context)
                                  .addTechniqueGroup(
                                group: group,
                                technique: dataState.techniques[index],
                              );
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      ),
                    ),
                    orElse: () => SliverList(
                      delegate: SliverChildListDelegate(
                          [const Center(child: Text('Нет техник'))]),
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

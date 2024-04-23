import 'package:my_climbing_trek/features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/pages/techique_group_editing_page.dart';
import 'package:my_climbing_trek/features/techniques/presentation/pages/technique_group_page.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/technique_group_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TechniqueGroupsPage extends StatelessWidget {
  const TechniqueGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<TechniqueGroupsCubit>()..loadData();
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Технические тренировки'),
        ),
        floatingActionButton:
            BlocBuilder<TechniqueGroupsCubit, TechniqueGroupsState>(
          builder: (context, state) => state.maybeMap(
            data: (dataState) {
              if (dataState.editing) {
                return FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const TechiqueGroupEditingPage()));
                  },
                  child: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
            orElse: () => const SizedBox.shrink(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<TechniqueGroupsCubit, TechniqueGroupsState>(
            builder: (context, state) {
              return state.maybeMap(
                  loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  data: (dataState) => ListView.separated(
                        itemCount: dataState.groups.length,
                        itemBuilder: (context, index) {
                          final group = dataState.groups[index];
                          return TechniqueGroupWidget(
                            height: 220,
                            group: group,
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TechniqueGroupPage(group: group))),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 8,
                        ),
                      ),
                  orElse: () => const SizedBox());
            },
          ),
        ),
      ),
    );
  }
}

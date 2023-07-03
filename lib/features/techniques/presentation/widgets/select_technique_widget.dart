import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/techniques/techniques_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/technique_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class SelectTechniqueWidget extends StatelessWidget {
  final TechniqueGroup group;

  const SelectTechniqueWidget({required this.group, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          group.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      BlocProvider(
        create: (context) => getIt<TechniquesCubit>()..loadData(group: group),
        child: BlocBuilder<TechniquesCubit, TechniquesState>(
          builder: (context, state) {
            return state.maybeMap(
              data: (dataState) => Expanded(
                child: ListView.builder(
                  itemCount: dataState.techniques.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TechniqueWidget(
                      technique: dataState.techniques[index],
                      selectMode: true,
                      onPressed: (options) {
                        BlocProvider.of<TechniqueTreaningCubit>(context)
                            .addTechniqueGroup(
                                group: group,
                                technique: dataState.techniques[index],
                                options: options);
                        // Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              orElse: () => const Center(
                child: Text('Нет техник'),
              ),
            );
          },
        ),
      ),
    ]);
  }
}

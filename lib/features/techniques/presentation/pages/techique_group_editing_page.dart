import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/techniques/techniques_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/technique_parameters_widget.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/technique_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TechiqueGroupEditingPage extends HookWidget {
  final TechniqueGroup? group;

  const TechiqueGroupEditingPage({this.group, super.key});

  @override
  Widget build(BuildContext context) {
    final idController = useTextEditingController(text: group?.id);

    final nameController = useTextEditingController(text: group?.name);

    final descriptionController =
        useTextEditingController(text: group?.description);

    final imageController = useTextEditingController(text: group?.image);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(group?.name ?? 'Новая техника'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showMyModalBottomSheet<void>(
            context: context,
            heightPersent: 0.9,
            child: const TechniqueParametersWidget(),
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              TextFormField(
                controller: idController,
                readOnly: group != null,
                decoration: const InputDecoration(
                    labelText: 'ID', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: 'Название', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: imageController,
                decoration: const InputDecoration(
                    labelText: 'Ссылка на изображение',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                minLines: 1,
                maxLines: 10,
                controller: descriptionController,
                decoration: const InputDecoration(
                    labelText: 'Описание', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              if (group != null)
                BlocProvider(
                  create: (context) =>
                      getIt<TechniquesCubit>()..loadData(group: group!),
                  child: BlocBuilder<TechniquesCubit, TechniquesState>(
                    builder: (context, state) => state.maybeMap(
                      data: (dataState) => Column(
                          children: dataState.techniques
                              .map(
                                (technique) => SlidableDataLineWidget(
                                  delete: true,
                                  edit: true,
                                  onDelete: (_) {},
                                  onEdit: (_) {
                                    showMyModalBottomSheet<void>(
                                      context: context,
                                      heightPersent: 0.9,
                                      child: TechniqueParametersWidget(
                                          technique: technique),
                                    );
                                  },
                                  child: TechniqueWidget(
                                    technique: technique,
                                    selectMode: false,
                                  ),
                                ),
                              )
                              .toList()),
                      loading: (_) => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      orElse: () => const SizedBox.shrink(),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

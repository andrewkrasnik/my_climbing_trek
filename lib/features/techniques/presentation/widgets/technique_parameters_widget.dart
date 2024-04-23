import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/techniques/techniques_cubit.dart';

class TechniqueParametersWidget extends HookWidget {
  final Technique? technique;
  final TechniqueGroup group;
  final TechniquesCubit cubit;

  const TechniqueParametersWidget({
    this.technique,
    required this.cubit,
    required this.group,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final idController = useTextEditingController(text: technique?.id);

    final nameController = useTextEditingController(text: technique?.name);

    final descriptionController =
        useTextEditingController(text: technique?.description);

    final optionController = useTextEditingController();

    final optionsState =
        useState<List<TechniqueOption>>(technique?.options ?? []);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            TextFormField(
              controller: idController,
              readOnly: technique != null,
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
              controller: descriptionController,
              minLines: 3,
              maxLines: 10,
              decoration: const InputDecoration(
                  labelText: 'Описание', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: optionController,
              decoration: const InputDecoration(
                  labelText: 'Добавить опцию', border: OutlineInputBorder()),
              onEditingComplete: () {
                if (optionController.text.isNotEmpty) {
                  final newList = optionsState.value;
                  newList.add(TechniqueOption(name: optionController.text));
                  optionsState.value = newList;
                  optionsState.notifyListeners();
                  optionController.clear();
                }
              },
            ),
            Wrap(
              direction: Axis.horizontal,
              children: optionsState.value
                  .map(
                    (option) => Chip(
                      label: Text(
                        option.name,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      deleteIcon: Icon(
                        Icons.close,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      onDeleted: () {
                        final newList = optionsState.value;
                        newList.remove(option);
                        optionsState.value = newList;
                        optionsState.notifyListeners();
                      },
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  cubit.saveTechnique(
                    group: group,
                    name: nameController.text,
                    id: idController.text,
                    description: descriptionController.text,
                    options: optionsState.value,
                  );

                  Navigator.of(context).pop();
                },
                child: const Text('Сохранить'))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart';

class EditTechniqueItemWidget extends HookWidget {
  final TechniqueTreaningItem item;
  final bool editing;

  const EditTechniqueItemWidget(
      {required this.item, this.editing = true, super.key});

  @override
  Widget build(BuildContext context) {
    final optionsState = useState<List<TechniqueOption>>(item.options);

    final commentController = useTextEditingController(text: item.comment);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          item.technique.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      Wrap(
        children: item.technique.options
            .map((option) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: InkWell(
                      onTap: editing
                          ? () {
                              final options = [...optionsState.value];
                              if (optionsState.value.contains(option)) {
                                options.remove(option);
                              } else {
                                options.add(option);
                              }
                              optionsState.value = options;
                            }
                          : null,
                      child: Chip(
                        label: Text(
                          option.name,
                          style: optionsState.value.contains(option)
                              ? const TextStyle(color: Colors.white)
                              : TextStyle(
                                  color: Theme.of(context).colorScheme.surface),
                        ),
                        backgroundColor: optionsState.value.contains(option)
                            ? Theme.of(context).hintColor
                            : null,
                      )),
                ))
            .toList(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: commentController,
          enabled: editing,
          maxLines: 4,
          decoration: const InputDecoration(
              labelText: 'Комментарий', border: OutlineInputBorder()),
        ),
      ),
      const Spacer(),
      if (editing)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // if (!item.started && !item.finished)
            //   ElevatedButton(
            //       style: ButtonStyle(
            //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(18.0),
            //           ),
            //         ),
            //       ),
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //       child: const Text('Старт')),
            // if (item.started && !item.finished)
            //   ElevatedButton(
            //       style: ButtonStyle(
            //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            //           RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(18.0),
            //           ),
            //         ),
            //       ),
            //       onPressed: () {
            //         Navigator.of(context).pop();
            //       },
            //       child: const Text('Финиш')),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {
                BlocProvider.of<TechniqueTreaningCubit>(context)
                    .editTreaningItem(
                  item: item,
                  options: optionsState.value,
                  comment: commentController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Сохранить'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {
                BlocProvider.of<TechniqueTreaningCubit>(context).deleteItem(
                  item: item,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Удалить'),
            ),
          ],
        ),
      const SizedBox(height: 16),
    ]);
  }
}

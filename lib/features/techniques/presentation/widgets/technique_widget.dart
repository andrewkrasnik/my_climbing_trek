import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';

class TechniqueWidget extends HookWidget {
  final Technique technique;
  final bool selectMode;
  final void Function(List<TechniqueOption>)? onPressed;

  const TechniqueWidget({
    required this.technique,
    this.selectMode = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final optionsState = useState<List<TechniqueOption>>([]);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  technique.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.add_box,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    onPressed: () {
                      if (onPressed != null) {
                        onPressed!(optionsState.value);
                      }
                    },
                  ),
                )
              ],
            ),
            if (technique.options.isNotEmpty)
              if (!selectMode)
                Wrap(
                  children: technique.options
                      .map((option) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Chip(label: Text(option.name)),
                          ))
                      .toList(),
                ),
            if (selectMode)
              Wrap(
                children: technique.options
                    .map((option) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: InkWell(
                              onTap: () {
                                final options = [...optionsState.value];
                                if (optionsState.value.contains(option)) {
                                  options.remove(option);
                                } else {
                                  options.add(option);
                                }
                                optionsState.value = options;
                              },
                              child: Chip(
                                label: Text(
                                  option.name,
                                  style: optionsState.value.contains(option)
                                      ? const TextStyle(color: Colors.white)
                                      : TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface),
                                ),
                                backgroundColor:
                                    optionsState.value.contains(option)
                                        ? Theme.of(context).hintColor
                                        : null,
                              )),
                        ))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';

class TechniqueParametersWidget extends HookWidget {
  final Technique? technique;
  const TechniqueParametersWidget({this.technique, super.key});

  @override
  Widget build(BuildContext context) {
    final idController = useTextEditingController(text: technique?.id);

    final nameController = useTextEditingController(text: technique?.name);

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
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Сохранить'))
          ],
        ),
      ),
    );
  }
}

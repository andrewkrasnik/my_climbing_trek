import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}

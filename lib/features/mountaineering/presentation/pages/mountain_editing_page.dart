import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart';

class MountainEditingPage extends HookWidget {
  final MountainsCubit cubit;
  final Region region;
  final Mountain? mountain;

  const MountainEditingPage({
    required this.cubit,
    required this.region,
    this.mountain,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final idController = useTextEditingController(text: mountain?.id);

    final nameController = useTextEditingController(text: mountain?.name);

    final altitudeController =
        useTextEditingController(text: mountain?.altitude.toString());

    final imageController = useTextEditingController(text: mountain?.image);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(mountain?.name ?? 'Новая гора'),
        actions: [
          IconButton(
            onPressed: () {
              cubit.saveMountain(
                  region: region,
                  id: idController.text,
                  name: nameController.text,
                  image: imageController.text,
                  altitude: int.parse(altitudeController.text));
            },
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
                readOnly: mountain != null,
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
                    labelText: 'Ссылка на изображение маршрута',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: altitudeController,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                decoration: const InputDecoration(
                    labelText: 'Высота, м.', border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/chip_selected_widget.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_poin_feature.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point_type.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/treks/treks_cubit.dart';

class TrekPointEditingPage extends HookWidget {
  final Region region;
  final TrekPoint? point;
  final TreksCubit cubit;

  const TrekPointEditingPage({
    required this.region,
    this.point,
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final idController = useTextEditingController(text: point?.id);

    final nameController = useTextEditingController(text: point?.name);

    final descriptionController =
        useTextEditingController(text: point?.description);

    final imageController = useTextEditingController(text: point?.image);

    final altitudeController =
        useTextEditingController(text: point?.altitude.toString());

    final featuresState =
        useState<List<TrekPointFeature>>(point?.features ?? []);

    final typeState =
        useState<TrekPointType>(point?.type ?? TrekPointType.camp);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(point?.name ?? 'Новое место'),
        actions: [
          IconButton(
            onPressed: () {
              cubit.saveTrekPoint(
                region: region,
                name: nameController.text,
                mapPoint: null,
                altitude: int.tryParse(altitudeController.text) ?? 0,
                type: typeState.value,
                features: featuresState.value,
                description: descriptionController.text,
                id: idController.text,
                image: imageController.text,
              );
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
                readOnly: point != null,
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
                controller: altitudeController,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration: const InputDecoration(
                    labelText: 'Высота над уровнем моря, м.',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              const Text('Вид:'),
              ChipSelectedWidget<TrekPointType>(
                values: TrekPointType.values,
                state: typeState,
              ),
              const SizedBox(height: 16),
              TextFormField(
                minLines: 1,
                maxLines: 20,
                controller: descriptionController,
                decoration: const InputDecoration(
                    labelText: 'Описание', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              Wrap(
                  direction: Axis.horizontal,
                  children: TrekPointFeature.values.map(
                    (feature) {
                      final bool selected =
                          featuresState.value.contains(feature);

                      final double opacity = selected ? 1 : 0.5;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: InkWell(
                          onTap: () {
                            if (selected) {
                              featuresState.value.remove(feature);
                              featuresState.notifyListeners();
                            } else {
                              featuresState.value.add(feature);
                              featuresState.notifyListeners();
                            }
                          },
                          child: Column(
                            children: [
                              Icon(
                                feature.icon,
                                color: Colors.white.withOpacity(opacity),
                                size: 40,
                                shadows: [
                                  Shadow(offset: Offset.fromDirection(1))
                                ],
                              ),
                              Text(
                                feature.name,
                                style: TextStyle(
                                    color: Colors.white.withOpacity(opacity)),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ).toList()),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

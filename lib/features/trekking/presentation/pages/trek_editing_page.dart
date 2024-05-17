import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/core/widgets/chip_selected_widget.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_type.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/treks/treks_cubit.dart';

class TrekEditingPage extends HookWidget {
  final Region region;
  final Trek? trek;
  final TreksCubit cubit;

  const TrekEditingPage({
    required this.region,
    this.trek,
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    final idController = useTextEditingController(text: trek?.id);

    final nameController = useTextEditingController(text: trek?.name);

    final mapImageController = useTextEditingController(text: trek?.mapImage);

    final imageController = useTextEditingController(text: trek?.image);

    final sectionsState = useState<List<TrekSection>>(trek?.sections ?? []);

    final typeState =
        useState<TrekkingType>(trek?.type ?? TrekkingType.walking);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(trek?.name ?? 'Новый маршрут'),
        actions: [
          IconButton(
            onPressed: () {
              cubit.saveTrek(
                region: region,
                name: nameController.text,
                type: typeState.value,
                id: idController.text,
                image: imageController.text,
                sections: sectionsState.value,
                mapImage: mapImageController.text,
                links: [],
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
                readOnly: trek != null,
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
                maxLines: 20,
                controller: mapImageController,
                decoration: const InputDecoration(
                    labelText: 'Ссылка на изображение карты маршрута',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              const Text('Вид:'),
              ChipSelectedWidget<TrekkingType>(
                values: TrekkingType.values,
                state: typeState,
              ),
              const SizedBox(height: 16),
              ...sectionsState.value.map((section) => SlidableDataLineWidget(
                    delete: true,
                    edit: true,
                    onDelete: (_) {
                      sectionsState.value.remove(section);
                      sectionsState.notifyListeners();
                    },
                    onEdit: (_) {
                      showMyModalBottomSheet<void>(
                        context: context,
                        heightPersent: 0.8,
                        child: Material(
                          child: TrekSectionEditingWidget(
                            section: section,
                            cubit: cubit,
                            onSave: (newSection) {
                              final newList = sectionsState.value;
                              newList[newList.indexOf(section)] = newSection;
                              sectionsState.value = newList;
                              sectionsState.notifyListeners();
                            },
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Старт: ${section.start.name}'),
                            Text('Финиш: ${section.finish.name}'),
                            Text(
                                'Расстояние ${section.length} км.${section.climb(false)}'),
                          ],
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    showMyModalBottomSheet<void>(
                      context: context,
                      heightPersent: 0.8,
                      child: Material(
                        child: TrekSectionEditingWidget(
                          cubit: cubit,
                          onSave: (newSection) {
                            sectionsState.value.add(newSection);
                            sectionsState.notifyListeners();
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text('Добавить')),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class TrekSectionEditingWidget extends HookWidget {
  final TrekSection? section;
  final void Function(TrekSection)? onSave;
  final TreksCubit cubit;

  const TrekSectionEditingWidget(
      {this.onSave, this.section, required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    final descriptionController =
        useTextEditingController(text: section?.description);

    final lengthController =
        useTextEditingController(text: section?.length.toString());

    final startState = useState<TrekPoint?>(section?.start);

    final finishState = useState<TrekPoint?>(section?.finish);

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(height: 16),
          const Text(
            'Старт',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          BlocBuilder<TreksCubit, TreksState>(
            bloc: cubit,
            builder: (context, state) {
              return state.maybeMap(
                data: (dataState) => SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataState.points.length,
                    itemBuilder: (context, index) {
                      final point = dataState.points[index];

                      final double opacity =
                          startState.value == point ? 0 : 0.5;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: InkWell(
                          onTap: () {
                            startState.value = point;
                          },
                          child: Stack(
                            children: [
                              MyCachedNetworkImage(
                                  imageUrl: point.image!,
                                  height: 90,
                                  width: 120,
                                  fit: BoxFit.cover),
                              Positioned(
                                left: 4,
                                top: 4,
                                child: SizedBox(
                                  width: 112,
                                  child: Text(
                                    point.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                              offset: Offset.fromDirection(1))
                                        ]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 90,
                                width: 120,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent
                                          .withOpacity(opacity)),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                orElse: () => const SizedBox(height: 80),
              );
            },
          ),
          const SizedBox(height: 16),
          const Text(
            'Финиш',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          BlocBuilder<TreksCubit, TreksState>(
            bloc: cubit,
            builder: (context, state) {
              return state.maybeMap(
                data: (dataState) => SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dataState.points.length,
                    itemBuilder: (context, index) {
                      final point = dataState.points[index];

                      final double opacity =
                          finishState.value == point ? 0 : 0.5;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: InkWell(
                          onTap: () {
                            finishState.value = point;
                          },
                          child: Stack(
                            children: [
                              MyCachedNetworkImage(
                                  imageUrl: point.image!,
                                  height: 90,
                                  width: 120,
                                  fit: BoxFit.cover),
                              Positioned(
                                left: 4,
                                top: 4,
                                child: SizedBox(
                                  width: 112,
                                  child: Text(
                                    point.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                              offset: Offset.fromDirection(1))
                                        ]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 90,
                                width: 120,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent
                                          .withOpacity(opacity)),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                orElse: () => const SizedBox(height: 80),
              );
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: lengthController,
            keyboardType: const TextInputType.numberWithOptions(
                signed: false, decimal: false),
            decoration: const InputDecoration(
                labelText: 'Длина участка, км.', border: OutlineInputBorder()),
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
          ElevatedButton(
              onPressed: () {
                final newSection = TrekSection(
                  finish: finishState.value!,
                  length: double.tryParse(lengthController.text) ?? 0,
                  start: startState.value!,
                  description: descriptionController.text,
                );

                onSave?.call(newSection);

                Navigator.of(context).pop();
              },
              child: const Text('Сохранить')),
          const SizedBox(height: 40),
        ])));
  }
}

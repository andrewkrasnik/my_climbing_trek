import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_type.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_roop_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountaineering_category_widget.dart';

class MountainRouteEditingPage extends HookWidget {
  final Mountain mountain;
  final MountainRoute route;

  const MountainRouteEditingPage(
      {required this.route, required this.mountain, super.key});

  @override
  Widget build(BuildContext context) {
    final typeState = useState<MountainRouteType?>(route.type);

    final categoryState = useState<MountaineeringCategory?>(route.category);

    final nameController = useTextEditingController(text: route.name);

    final descriptionController =
        useTextEditingController(text: route.description);

    final imageController = useTextEditingController(text: route.image);

    final ueaaImageController =
        useTextEditingController(text: route.ueaaSchemaImage);

    final descentController = useTextEditingController(text: route.descent);

    final passageController = useTextEditingController(text: route.passage);

    final authorController = useTextEditingController(text: route.author);

    final firstAscentYearController =
        useTextEditingController(text: route.firstAscentYear);

    final farLinkController = useTextEditingController(text: route.farLink);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(route.name),
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
                controller: ueaaImageController,
                decoration: const InputDecoration(
                    labelText: 'Ссылка на изображение UEAA-схемы',
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
              Wrap(
                children: MountainRouteType.values.map((type) {
                  final bool selected = type == typeState.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: InkWell(
                      onTap: () {
                        typeState.value = type;
                      },
                      child: Chip(
                        backgroundColor: selected
                            ? Theme.of(context).hintColor
                            : Theme.of(context).hintColor.withOpacity(0.1),
                        label: Text(
                          type.name,
                          style: selected
                              ? const TextStyle(color: Colors.white)
                              : TextStyle(
                                  color: Theme.of(context).colorScheme.surface),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              if (typeState.value?.hasCategory ?? false)
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: MountaineeringCategory.values
                        .map((category) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: InkWell(
                                onTap: () {
                                  categoryState.value = category;
                                },
                                child: MountaineeringCategoryWidget(
                                    category: category),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              const SizedBox(height: 16),
              TextFormField(
                controller: authorController,
                decoration: const InputDecoration(
                    labelText: 'Автор маршрута', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: firstAscentYearController,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                decoration: const InputDecoration(
                    labelText: 'Год первопрохождения',
                    border: OutlineInputBorder()),
              ),
              if (typeState.value?.hasCategory ?? false) ...[
                const SizedBox(height: 16),
                TextFormField(
                  controller: farLinkController,
                  decoration: const InputDecoration(
                      labelText: 'Маршрут в каталоге ФАР',
                      border: OutlineInputBorder()),
                ),
              ],
              const SizedBox(height: 16),
              TextFormField(
                minLines: 1,
                maxLines: 10,
                controller: passageController,
                decoration: const InputDecoration(
                    labelText: 'Описание подхода к маршурту',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 16),
              ...route.roops.map(
                (roop) => SlidableDataLineWidget(
                  edit: true,
                  delete: true,
                  onEdit: (context) {
                    showMyModalBottomSheet<void>(
                      context: context,
                      heightPersent: 0.6,
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Описание участка',
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Станция',
                                border: OutlineInputBorder()),
                          ),
                        ],
                      ),
                    );
                  },
                  onDelete: (context) {},
                  child: MountainRoopWidget(roop: roop),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                minLines: 1,
                maxLines: 10,
                controller: descentController,
                decoration: const InputDecoration(
                    labelText: 'Описание спуска с маршрута',
                    border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

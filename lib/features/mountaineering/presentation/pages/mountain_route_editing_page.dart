import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/select_category_widget.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_type.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_roop_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/roop_editing_widget.dart';

class MountainRouteEditingPage extends HookWidget {
  final Mountain mountain;
  final MountainRoute? route;
  final MountainRoutesCubit cubit;

  const MountainRouteEditingPage(
      {this.route, required this.mountain, required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    final typeState = useState<MountainRouteType?>(route?.type);

    final categoryState = useState<MountaineeringCategory?>(route?.category);

    final idController = useTextEditingController(text: route?.id);

    final nameController = useTextEditingController(text: route?.name);

    final descriptionController =
        useTextEditingController(text: route?.description);

    final imageController = useTextEditingController(text: route?.image);

    final ueaaImageController =
        useTextEditingController(text: route?.ueaaSchemaImage);

    final descentController = useTextEditingController(text: route?.descent);

    final passageController = useTextEditingController(text: route?.passage);

    final authorController = useTextEditingController(text: route?.author);

    final firstAscentYearController =
        useTextEditingController(text: route?.firstAscentYear);

    final farLinkController = useTextEditingController(text: route?.farLink);

    final ropesState = useState<List<MountainRouteRoop>>(route?.roops ?? []);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(route?.name ?? 'Новый маршрут'),
        actions: [
          IconButton(
            onPressed: () {
              cubit.saveRoute(
                mountain: mountain,
                id: idController.text,
                name: nameController.text,
                image: imageController.text,
                category: categoryState.value!,
                type: typeState.value!,
                roops: ropesState.value,
                description: descriptionController.text,
                passage: passageController.text,
                descent: descentController.text,
                links: [],
                author: authorController.text,
                firstAscentYear: firstAscentYearController.text,
                length: 0,
                farLink: farLinkController.text,
                ueaaSchemaImage: ueaaImageController.text,
                climbingCategory:
                    MountainRoute.maxClimbingCategory(ropesState.value),
                aidCategory: MountainRoute.maxAidCategory(ropesState.value),
                ussrCategory: MountainRoute.maxUssrCategory(ropesState.value),
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
                readOnly: route != null,
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
              // if (typeState.value?.hasCategory ?? false)
              SelectCategoryWidget<MountaineeringCategory>(
                categoryState: categoryState,
                values: MountaineeringCategory.values,
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
              ...ropesState.value.map(
                (roop) => SlidableDataLineWidget(
                  edit: true,
                  delete: true,
                  onEdit: (context) {
                    showMyModalBottomSheet<void>(
                      context: context,
                      heightPersent: 0.8,
                      child: RoopEditingWidget(
                        roop: roop,
                        number: roop.number,
                        onSave: (newRope) {
                          final newList = ropesState.value;
                          newList[roop.number - 1] = newRope;
                          ropesState.value = newList;
                          ropesState.notifyListeners();
                        },
                      ),
                    );
                  },
                  onDelete: (context) {
                    final newList = ropesState.value;
                    newList.remove(roop);
                    ropesState.value = newList;
                    ropesState.notifyListeners();
                  },
                  child: MountainRoopWidget(roop: roop),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Material(
                        child: RoopEditingWidget(
                          number: ropesState.value.length + 1,
                          onSave: (newRope) {
                            final newList = ropesState.value;
                            newList.add(newRope);
                            ropesState.value = newList;
                            ropesState.notifyListeners();
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text('Добавить')),
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

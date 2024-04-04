import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/difficulty_category.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/core/data/mixed_category.dart';
import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_category_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_type.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_roop_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountaineering_category_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_category_widget.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_aid_category_widget.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_mixed_category_widget.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_ussr_category_widget.dart';

class MountainRouteEditingPage extends HookWidget {
  final Mountain mountain;
  final MountainRoute? route;

  const MountainRouteEditingPage(
      {this.route, required this.mountain, super.key});

  @override
  Widget build(BuildContext context) {
    final typeState = useState<MountainRouteType?>(route?.type);

    final categoryState = useState<MountaineeringCategory?>(route?.category);

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

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(route?.name ?? 'Новый маршрут'),
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
              ...route?.roops.map(
                    (roop) => SlidableDataLineWidget(
                      edit: true,
                      delete: true,
                      onEdit: (context) {
                        showMyModalBottomSheet<void>(
                          context: context,
                          heightPersent: 0.8,
                          child: RoopEditingWidget(roop: roop),
                        );
                      },
                      onDelete: (context) {},
                      child: MountainRoopWidget(roop: roop),
                    ),
                  ) ??
                  [],
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

class RoopEditingWidget extends HookWidget {
  final MountainRouteRoop? roop;

  const RoopEditingWidget({this.roop, super.key});

  @override
  Widget build(BuildContext context) {
    final descriptionController =
        useTextEditingController(text: roop?.description);

    final anchorController = useTextEditingController(text: roop?.anchor);

    final boltCountController =
        useTextEditingController(text: roop?.boltCount.toString());

    final iceCategoryState = useState<IceCategory?>(roop?.iceCategory);

    final icePrefixState = useState<String?>(roop?.icePrefix);

    final climbingCategoryState =
        useState<ClimbingCategory?>(roop?.climbingCategory);

    final piecesState = useState<List<MountainRoutePiece>>(roop?.pieces ?? []);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Text(
              roop?.title ?? '',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            TextFormField(
              controller: descriptionController,
              minLines: 3,
              maxLines: 10,
              decoration: const InputDecoration(
                  labelText: 'Описание участка', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: anchorController,
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                  labelText: 'Станция', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: boltCountController,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              decoration: const InputDecoration(
                  labelText: 'Количество шлямбуров',
                  border: OutlineInputBorder()),
            ),
            ChipSelectedWidget<String>(
              values: ['Нет льда', 'Натечный', 'Ледник'],
              state: icePrefixState,
            ),
            SelectCategoryWidget<IceCategory>(
              categoryState: iceCategoryState,
              values: IceCategory.values,
            ),
            SelectCategoryWidget<ClimbingCategory>(
              categoryState: climbingCategoryState,
              values: ClimbingCategory.rockValues,
            ),
            Wrap(
              children: [
                ...piecesState.value.map((piece) => InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => RoopPieceDialog(
                            piece: piece,
                            onDelete: () {
                              final newList = piecesState.value;
                              newList.remove(piece);
                              piecesState.value = newList;
                              piecesState.notifyListeners();
                            },
                            onSave: (newPiece) {
                              final newList = piecesState.value;
                              newList[newList.indexOf(piece)] = newPiece;
                              piecesState.value = newList;
                              piecesState.notifyListeners();
                            },
                          ),
                        );
                      },
                      child: Chip(label: Text(piece.title)),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => RoopPieceDialog(
                            onSave: (newPiece) {
                              final newList = piecesState.value;
                              newList.add(newPiece);
                              piecesState.value = newList;
                              piecesState.notifyListeners();
                            },
                          ),
                        );
                      },
                      child: const Text('Добавить')),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RoopPieceDialog extends HookWidget {
  final MountainRoutePiece? piece;
  final void Function(MountainRoutePiece)? onSave;
  final void Function()? onDelete;

  const RoopPieceDialog({this.piece, this.onDelete, this.onSave, super.key});

  @override
  Widget build(BuildContext context) {
    final typeState =
        useState<RoutePieceType>(piece?.type ?? RoutePieceType.rock);

    final lengthController =
        useTextEditingController(text: piece?.length.toString());

    final slopeController =
        useTextEditingController(text: piece?.slope.toString());

    final mixedCategoryState = useState<MixedCategory?>(
        piece is MountainRouteMixedPiece
            ? (piece as MountainRouteMixedPiece).category
            : null);

    final iceCategoryState = useState<IceCategory?>(
        piece is MountainRouteIcePiece
            ? (piece as MountainRouteIcePiece).category
            : null);

    final climbingCategoryState = useState<ClimbingCategory?>(
        piece is MountainRouteRockPiece
            ? (piece as MountainRouteRockPiece).climbingCategory
            : null);

    final aidCategoryState = useState<AidCategory?>(
        piece is MountainRouteRockPiece
            ? (piece as MountainRouteRockPiece).aidCategory
            : null);

    final ussrCategoryState = useState<UssrClimbingCategory?>(
        piece is MountainRouteRockPiece
            ? (piece as MountainRouteRockPiece).ussrCategory
            : null);

    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ChipSelectedWidget<RoutePieceType>(
              values: RoutePieceType.values,
              state: typeState,
            ),
            if (typeState.value == RoutePieceType.ice)
              SelectCategoryWidget<IceCategory>(
                categoryState: iceCategoryState,
                values: IceCategory.values,
              ),
            if (typeState.value == RoutePieceType.mixed)
              SelectCategoryWidget<MixedCategory>(
                categoryState: mixedCategoryState,
                values: MixedCategory.values,
              ),
            if (typeState.value == RoutePieceType.rock) ...[
              Text('Скалолазная категория:'),
              SelectCategoryWidget<ClimbingCategory>(
                categoryState: climbingCategoryState,
                values: ClimbingCategory.rockValues,
              ),
              Text('Сложность скал (СССР):'),
              SelectCategoryWidget<UssrClimbingCategory>(
                categoryState: ussrCategoryState,
                values: UssrClimbingCategory.values,
              ),
              Text('Категория ИТО:'),
              SelectCategoryWidget<AidCategory>(
                categoryState: aidCategoryState,
                values: AidCategory.values,
              ),
            ],
            const SizedBox(height: 16),
            TextFormField(
              controller: lengthController,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              decoration: const InputDecoration(
                  labelText: 'Длина участка, м.', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: slopeController,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              decoration: const InputDecoration(
                  labelText: 'Угол наклона участка',
                  border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
      actions: [
        if (onDelete != null)
          ElevatedButton(
            onPressed: () {
              onDelete?.call();

              Navigator.of(context).pop();
            },
            child: const Text('Удалить'),
          ),
        ElevatedButton(
          onPressed: () {
            final newPiece = MountainRoutePiece(
                type: typeState.value,
                length: int.parse(lengthController.text));

            onSave?.call(newPiece);

            Navigator.of(context).pop();
          },
          child: const Text('Сохранить'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Отмена'),
        ),
      ],
    );
  }
}

class SelectCategoryWidget<T extends DifficultyCategory>
    extends StatelessWidget {
  final List<T> values;

  final ValueNotifier<T?> categoryState;

  const SelectCategoryWidget({
    required this.categoryState,
    required this.values,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: values
            .map((category) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    onTap: () {
                      categoryState.value = category;
                    },
                    child: CategoryWidget(
                      category: category,
                      selected: categoryState.value == category,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class CategoryWidget<T extends DifficultyCategory> extends StatelessWidget {
  final T category;
  final bool selected;

  const CategoryWidget(
      {required this.category, this.selected = true, super.key});

  @override
  Widget build(BuildContext context) {
    if (category is MountaineeringCategory) {
      return MountaineeringCategoryWidget(
        category: category as MountaineeringCategory,
        selected: selected,
      );
    } else if (category is IceCategory) {
      return IceCategoryWidget(
        category: category as IceCategory,
        planed: !selected,
      );
    } else if (category is MixedCategory) {
      return SettingsMixedCategoryWidget(
        category: category as MixedCategory,
        selected: selected,
      );
    } else if (category is ClimbingCategory) {
      return RockCategoryWidget(
        category: category as ClimbingCategory,
        planed: !selected,
      );
    } else if (category is UssrClimbingCategory) {
      return SettingsUssrCategoryWidget(
        category: category as UssrClimbingCategory,
        selected: selected,
      );
    } else if (category is AidCategory) {
      return SettingsAidCategoryWidget(
        category: category as AidCategory,
        selected: selected,
      );
    } else {
      return Container();
    }
  }
}

class ChipSelectedWidget<T> extends StatelessWidget {
  final List<T> values;

  final ValueNotifier<T?> state;

  // final void Function()? onTap;

  const ChipSelectedWidget({
    required this.values,
    required this.state,
    super.key,
    // this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: values
          .map((value) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: InkWell(
                    onTap: () {
                      state.value = value;
                    },
                    child: Chip(
                      label: Text(
                        value.toString(),
                        style: state.value == value
                            ? const TextStyle(color: Colors.white)
                            : TextStyle(
                                color: Theme.of(context).colorScheme.surface),
                      ),
                      backgroundColor: state.value == value
                          ? Theme.of(context).hintColor
                          : null,
                    )),
              ))
          .toList(),
    );
  }
}

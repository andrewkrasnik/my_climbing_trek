import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/core/data/mixed_category.dart';
import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';
import 'package:my_climbing_trek/core/widgets/chip_selected_widget.dart';
import 'package:my_climbing_trek/core/widgets/select_category_widget.dart';

import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';

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
            final MountainRoutePiece newPiece;

            if (typeState.value == RoutePieceType.ice) {
              newPiece = MountainRouteIcePiece(
                category: iceCategoryState.value!,
                length: int.parse(lengthController.text),
                slope: int.parse(slopeController.text),
              );
            } else if (typeState.value == RoutePieceType.mixed) {
              newPiece = MountainRouteMixedPiece(
                category: mixedCategoryState.value!,
                length: int.parse(lengthController.text),
                slope: int.parse(slopeController.text),
              );
            } else {
              newPiece = MountainRouteRockPiece(
                climbingCategory: climbingCategoryState.value,
                ussrCategory: ussrCategoryState.value,
                aidCategory: aidCategoryState.value,
                length: int.tryParse(lengthController.text) ?? 0,
                slope: int.tryParse(slopeController.text) ?? 0,
              );
            }

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

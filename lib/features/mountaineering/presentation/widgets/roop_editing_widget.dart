import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/core/data/ice_types.dart';
import 'package:my_climbing_trek/core/widgets/chip_selected_widget.dart';
import 'package:my_climbing_trek/core/widgets/select_category_widget.dart';

import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/roop_piece_dialog.dart';

class RoopEditingWidget extends HookWidget {
  final MountainRouteRoop? roop;
  final int number;

  final void Function(MountainRouteRoop)? onSave;

  const RoopEditingWidget(
      {this.roop, required this.number, this.onSave, super.key});

  @override
  Widget build(BuildContext context) {
    final descriptionController =
        useTextEditingController(text: roop?.description);

    final anchorController = useTextEditingController(text: roop?.anchor);

    final boltCountController =
        useTextEditingController(text: roop?.boltCount.toString());

    final lengthController =
        useTextEditingController(text: roop?.length.toString());

    final iceCategoryState = useState<IceCategory?>(roop?.iceCategory);

    final icePrefixState =
        useState<IceType?>(IceTypes.byPrefix(roop?.icePrefix ?? ''));

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
              controller: lengthController,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              decoration: const InputDecoration(
                  labelText: 'Длина участка, м.', border: OutlineInputBorder()),
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
            ChipSelectedWidget<IceType>(
              values: IceTypes.values,
              state: icePrefixState,
            ),
            if (icePrefixState.value != IceTypes.noIce)
              SelectCategoryWidget<IceCategory>(
                categoryState: iceCategoryState,
                values: IceCategory.values,
              ),
            if (icePrefixState.value == IceTypes.noIce) ...[
              SelectCategoryWidget<ClimbingCategory>(
                categoryState: climbingCategoryState,
                values: ClimbingCategory.rockValues,
              ),
            ],
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Chip(
                          label: Text(
                            piece.title,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.surface),
                          ),
                          backgroundColor: Theme.of(context).hintColor,
                        ),
                      ),
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
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  final newRoop = MountainRouteRoop(
                    length: int.tryParse(lengthController.text) ?? 0,
                    anchor: anchorController.text,
                    boltCount: int.tryParse(boltCountController.text) ?? 0,
                    climbingCategory: climbingCategoryState.value,
                    description: descriptionController.text,
                    iceCategory: iceCategoryState.value,
                    pieces: piecesState.value,
                    // slope: int.parse()
                    icePrefix: icePrefixState.value?.prefix,
                    number: number,
                  );

                  onSave?.call(newRoop);

                  Navigator.of(context).pop();
                },
                child: Text('Сохранить')),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

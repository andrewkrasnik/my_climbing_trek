import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/treaning_picture_page.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/pages/technique_group_page.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/edit_technique_item_widget.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/select_technique_widget.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/technique_treaning_picture_widget.dart';

class TechniqueTreaningWidget extends StatelessWidget {
  final TechniqueTreaning treaning;
  final bool editing;

  const TechniqueTreaningWidget({
    super.key,
    required this.treaning,
    this.editing = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  Text(DateFormat('dd.MM.yyyy').format(treaning.date)),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TreaningPicturePage(
                                treaning: treaning,
                                child: TechniqueTreaningPictureWidget(
                                  treaning: treaning,
                                ),
                              )));
                    },
                    icon: const Icon(
                      Icons.share,
                      size: 16,
                    ),
                  ),
                ],
              ),
              ...treaning.itemsMap
                  .map<TechniqueGroup, Widget>((group, value) => MapEntry(
                      group,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) =>
                                        TechniqueGroupPage(group: group),
                                  )),
                              child: Text('${group.name}:')),
                          Wrap(
                            children: [
                              ...value.map((tech) => InkWell(
                                    onTap: () {
                                      showMyModalBottomSheet<void>(
                                        context: context,
                                        heightPersent: 0.7,
                                        child: EditTechniqueItemWidget(
                                          item: tech,
                                          editing: editing,
                                        ),
                                      );
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        child: Chip(
                                          label: Text(
                                            tech.technique.name,
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface),
                                          ),
                                        )),
                                  )),
                              if (editing)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        showMyModalBottomSheet<void>(
                                          context: context,
                                          heightPersent: 0.7,
                                          child: SelectTechniqueWidget(
                                              group: group),
                                        );
                                      },
                                      child: const Text('Добавить')),
                                )
                            ],
                          ),
                        ],
                      )))
                  .values,
              if (editing)
                TextButton(
                  child: const Text('Завершить'),
                  onPressed: () {
                    BlocProvider.of<TechniqueTreaningCubit>(context)
                        .finishTreaning();
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}

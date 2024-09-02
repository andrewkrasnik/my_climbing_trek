import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_climbing_trek/core/widgets/date_picker_widget.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart';
import 'package:my_climbing_trek/features/techniques/presentation/pages/technique_group_page.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/edit_technique_item_widget.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/select_technique_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TechniqueTreaningEditWidget extends HookWidget {
  final TechniqueTreaning treaning;

  const TechniqueTreaningEditWidget({
    super.key,
    required this.treaning,
  });

  @override
  Widget build(BuildContext context) {
    final date = useState<DateTime>(treaning.date);

    return BlocProvider(
      create: (context) => getIt<TechniqueTreaningCubit>(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DatePickerWidget(date: date),
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
                                        editing: true,
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
                                      child:
                                          SelectTechniqueWidget(group: group),
                                    );
                                  },
                                  child: const Text('Добавить')),
                            ),
                          ],
                        ),
                      ],
                    )))
                .values,
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
    );
  }
}

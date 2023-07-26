import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/stay_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day_line.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/contact_line_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/stay_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/transport_parameters_widget.dart';

class TravelDayLinesWidget extends StatelessWidget {
  final TravelDay travelDay;
  final bool editing;

  const TravelDayLinesWidget(
      {required this.travelDay, this.editing = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TravelDayLine> travelLines = [
      ...travelDay.stayLines,
      ...travelDay.transportLines,
    ];

    travelLines.sort((a, b) => a.date.compareTo(b.date));

    return Column(
      children: travelLines
          .map(
            (line) => Column(
              children: [
                Slidable(
                  endActionPane: editing
                      ? ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              flex: 1,
                              onPressed: (context) async {
                                await showMyModalBottomSheet<void>(
                                  context: context,
                                  heightPersent: 0.6,
                                  child: line is TransportLine
                                      ? TransportParametersWidget(
                                          date: travelDay.date,
                                          line: line,
                                        )
                                      : StayParametersWidget(
                                          date: travelDay.date,
                                          line: line as StayLine,
                                        ),
                                );
                              },
                              backgroundColor: Colors.orange.shade400,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'edit',
                            ),
                            SlidableAction(
                              flex: 1,
                              onPressed: (context) async {
                                final deletePermission = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Подтверждение удаления'),
                                    content: const Text('Удалить?'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: const Text('Отменить'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: const Text('Продолжить'),
                                      ),
                                    ],
                                  ),
                                );

                                if (deletePermission == true) {
                                  // cubit.delete(treaning: treaning);
                                }
                              },
                              backgroundColor: Colors.red.shade400,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'delete',
                            ),
                          ],
                        )
                      : null,
                  child: ListTile(
                    leading: Icon(
                      line.icon,
                      size: 40,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    title: Row(
                      children: [
                        Text(line.date.timeString()),
                        const SizedBox(width: 8),
                        Text(line.name),
                      ],
                    ),
                    subtitle: SelectableText(line.description),
                  ),
                ),
                ...line.contacts.map(
                  (contact) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Slidable(
                        endActionPane: editing
                            ? ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    flex: 1,
                                    onPressed: (context) async {
                                      await showMyModalBottomSheet<void>(
                                        context: context,
                                        heightPersent: 0.6,
                                        child: ContactParametersWidget(
                                          line: contact,
                                        ),
                                      );
                                    },
                                    backgroundColor: Colors.orange.shade400,
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'edit',
                                  ),
                                  SlidableAction(
                                    flex: 1,
                                    onPressed: (context) async {
                                      final deletePermission =
                                          await showDialog<bool>(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          title: const Text(
                                              'Подтверждение удаления'),
                                          content: const Text('Удалить?'),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(false);
                                              },
                                              child: const Text('Отменить'),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(true);
                                              },
                                              child: const Text('Продолжить'),
                                            ),
                                          ],
                                        ),
                                      );

                                      if (deletePermission == true) {
                                        // cubit.delete(treaning: treaning);
                                      }
                                    },
                                    backgroundColor: Colors.red.shade400,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'delete',
                                  ),
                                ],
                              )
                            : null,
                        child: ContactLineWidget(contact: contact)),
                  ),
                ),
                if (editing)
                  OutlinedButton(
                      onPressed: () {
                        showMyModalBottomSheet<void>(
                          context: context,
                          heightPersent: 0.6,
                          child: const ContactParametersWidget(),
                        );
                      },
                      child: const Text('Добавить контакт'))
              ],
            ),
          )
          .toList(),
    );
  }
}

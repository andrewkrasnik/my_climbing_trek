import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart';

class AscensionEventsWidget extends StatelessWidget {
  final Ascension ascension;
  final bool onlyMainEvents;
  final bool editing;
  final TextStyle? textStyle;

  const AscensionEventsWidget({
    required this.ascension,
    this.editing = false,
    this.onlyMainEvents = false,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ascension.events.sort(
      (a, b) => a.type.orderBy.compareTo(b.type.orderBy),
    );
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(3),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1)
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(children: [
          const SizedBox(),
          Text('План', style: textStyle),
          Text('Факт', style: textStyle),
        ]),
        ...ascension.events.map((event) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(event.type.name, style: textStyle),
                ),
                InkWell(
                  onTap: editing
                      ? () async {
                          final newTime = await showTimePicker(
                            context: context,
                            initialTime: event.planedTime == null
                                ? TimeOfDay.now()
                                : TimeOfDay.fromDateTime(event.planedTime!),
                          );

                          if (newTime != null) {
                            BlocProvider.of<AscensionCubit>(context)
                                .setPlanedTime(
                                    event: event,
                                    time: DateTime.now().copyWith(
                                        hour: newTime.hour,
                                        minute: newTime.minute,
                                        second: 0));
                          }
                        }
                      : null,
                  child: Text(
                    event.planedTime?.timeString() ?? '--:--',
                    style: textStyle,
                  ),
                ),
                InkWell(
                  onTap: editing
                      ? () async {
                          final newTime = await showTimePicker(
                            context: context,
                            initialTime: event.time == null
                                ? TimeOfDay.now()
                                : TimeOfDay.fromDateTime(event.time!),
                          );

                          if (newTime != null) {
                            BlocProvider.of<AscensionCubit>(context).setTime(
                                event: event,
                                time: DateTime.now().copyWith(
                                    hour: newTime.hour,
                                    minute: newTime.minute,
                                    second: 0));
                          }
                        }
                      : null,
                  child: Text(
                    event.time?.timeString() ?? '--:--',
                    style: textStyle,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}

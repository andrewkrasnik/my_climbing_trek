import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day_line.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/contact_line_widget.dart';

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
                ListTile(
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
                ...line.contacts.map(
                  (contact) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ContactLineWidget(contact: contact),
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
                      child: const Text('Добавить'))
              ],
            ),
          )
          .toList(),
    );
  }
}

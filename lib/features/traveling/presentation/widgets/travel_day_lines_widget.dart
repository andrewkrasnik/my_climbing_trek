import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/extentions/time_of_day_extention.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/stay_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day_line.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_day/travel_day_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/contact_line_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/stay_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/transport_parameters_widget.dart';

class TravelDayLinesWidget extends StatelessWidget {
  final List<StayLine> stayLines;
  final List<TransportLine> transportLines;
  final bool editing;

  const TravelDayLinesWidget(
      {required this.stayLines,
      required this.transportLines,
      this.editing = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    final List<TravelDayLine> travelLines = [
      ...stayLines,
      ...transportLines,
    ];

    travelLines.sort((a, b) => a.time.compareTo(b.time));
    final TravelDayCubit? cubit;
    if (editing) {
      cubit = BlocProvider.of<TravelDayCubit>(context);
    } else {
      cubit = null;
    }

    return Column(
      children: travelLines
          .map(
            (line) => Column(
              children: [
                SlidableDataLineWidget(
                  edit: editing,
                  delete: editing,
                  onEdit: (context) async {
                    await showMyModalBottomSheet<void>(
                      context: context,
                      heightPersent: 0.6,
                      child: line is TransportLine
                          ? TransportParametersWidget(
                              line: line,
                              cubit: cubit,
                            )
                          : StayParametersWidget(
                              line: line as StayLine,
                              cubit: cubit,
                            ),
                    );
                  },
                  onDelete: (context) {
                    if (editing) {
                      if (line is TransportLine) {
                        cubit!.deleteTransportLine(line: line);
                      } else {
                        cubit!.deleteStayLine(line: line as StayLine);
                      }
                    }
                  },
                  child: ListTile(
                    leading: Icon(
                      line.icon,
                      size: 40,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    title: Row(
                      children: [
                        Text(line.time.timeString()),
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
                    child: editing
                        ? SlidableDataLineWidget(
                            onDelete: (context) {
                              cubit!.deleteContactLine(
                                  line: line, contactLine: contact);
                            },
                            onEdit: (context) async {
                              await showMyModalBottomSheet<void>(
                                context: context,
                                heightPersent: 0.6,
                                child: ContactParametersWidget(
                                  line: contact,
                                  onTap: (
                                      {required data,
                                      required description,
                                      required id,
                                      required type}) {
                                    cubit!.editContactLine(
                                      line: line,
                                      data: data,
                                      type: type,
                                      description: description,
                                      contactLine: contact,
                                    );
                                  },
                                ),
                              );
                            },
                            child: ContactLineWidget(contact: contact),
                          )
                        : ContactLineWidget(contact: contact),
                  ),
                ),
                if (editing)
                  OutlinedButton(
                      onPressed: () {
                        showMyModalBottomSheet<void>(
                          context: context,
                          heightPersent: 0.6,
                          child: ContactParametersWidget(
                            onTap: (
                                {required data,
                                required description,
                                required id,
                                required type}) {
                              cubit!.editContactLine(
                                line: line,
                                data: data,
                                type: type,
                                description: description,
                              );
                            },
                          ),
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

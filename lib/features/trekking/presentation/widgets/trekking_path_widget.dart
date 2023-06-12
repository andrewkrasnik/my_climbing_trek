import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/trekking/trekking_cubit.dart';

class TrekkingPathWidget extends StatelessWidget {
  final TrekkingPath path;
  final bool editing;
  const TrekkingPathWidget({required this.path, this.editing = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrekkingCubit, TrekkingState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 0,
            borderRadius: BorderRadius.circular(8),
            child: Column(
              children: [
                if (path.trek != null) Text(path.trek!.name),
                ...path.events.map(
                  (event) => Row(
                    children: [
                      Text(event.time.timeString()),
                      const SizedBox(width: 4),
                      if (event.point != null) ...[
                        Text(event.point!.name),
                        const SizedBox(width: 4),
                      ],
                      Text(event.type.name),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                if (state.currentPoint != null) ...[
                  const Text('Текущее местоположение:'),
                  Text(state.currentPoint!.name),
                  const SizedBox(height: 4),
                ],
                if (path.currentSection != null) ...[
                  const Text('Пункт назначения:'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          value:
                              state.currentPoint == path.currentSection!.finish,
                          onChanged: (value) {
                            BlocProvider.of<TrekkingCubit>(context)
                                .setCurrentPoint(
                                    point: path.currentSection!.finish);
                          }),
                      const SizedBox(width: 4),
                      Text(path.currentSection!.finish.name),
                      const SizedBox(width: 4),
                      Text(
                          '${path.currentSection!.length} км ${path.currentSection!.climb}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
                Wrap(
                  children: path.actions
                      .map((type) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: InkWell(
                                onTap: () {
                                  BlocProvider.of<TrekkingCubit>(context)
                                      .addEvent(
                                    path: path,
                                    type: type,
                                    point: state.currentPoint,
                                  );
                                },
                                child: Chip(label: Text(type.name))),
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

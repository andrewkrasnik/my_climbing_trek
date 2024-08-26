import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/ascension_events_widget.dart';

class MountaneeringEditingWidget extends StatelessWidget {
  final Ascension ascension;

  const MountaneeringEditingWidget({required this.ascension, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AscensionEventsWidget(
          ascension: ascension,
          editing: true,
        ),
        // if (state.ascension?.started == true)
        TextButton(
          child: const Text('Завершить'),
          onPressed: () {
            BlocProvider.of<AscensionCubit>(context)
                .finishAscension(ascension: ascension);
          },
        ),
      ],
    );
  }
}

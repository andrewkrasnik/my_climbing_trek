import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/presentation/bloc/trekking/trekking_cubit.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trek_page.dart';
import 'package:my_climbing_trek/features/trekking/presentation/pages/trekking_region_page.dart';

class PreviosTrekkingPathWidget extends StatelessWidget {
  final TrekkingPath path;
  final bool editing;
  const PreviosTrekkingPathWidget(
      {required this.path, this.editing = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            Row(
              children: [
                Text(DateTime.now().dayString()),
                const Spacer(),
                InkWell(
                  onTap: () {
                    if (path.trek != null) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TrekPage(
                                region: path.region,
                                trek: path.trek!,
                              )));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TrekkingRegionPage(
                                region: path.region,
                              )));
                    }
                  },
                  child: path.trek != null
                      ? Text(path.trek!.name)
                      : Text(path.region.name),
                ),
                IconButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => IceTreaningPage(
                    //           treaning: treaning,
                    //         )));
                  },
                  icon: const Icon(
                    Icons.share,
                    size: 16,
                  ),
                ),
              ],
            ),
            if (path.events.lastOrNull?.point != null) ...[
              const Text('Текущее местоположение:'),
              const SizedBox(height: 4),
              Text(path.events.lastOrNull!.point!.name),
              const SizedBox(height: 4),
            ],
            const Text('Пункт назначения:'),
            const SizedBox(height: 4),
            if (path.currentSection != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 4),
                  Text(path.currentSection!.finish.name),
                  const SizedBox(width: 4),
                  Text(
                      '${path.currentSection!.length} км ${path.currentSectionClimb}'),
                ],
              ),
            const SizedBox(height: 8),
            if (editing) ...[
              InkWell(
                  onTap: () {
                    BlocProvider.of<TrekkingCubit>(context).continueTrek(
                      path: path,
                    );
                  },
                  child: const Chip(label: Text('Продолжить путь'))),
              const SizedBox(height: 4),
              InkWell(
                  onTap: () {
                    BlocProvider.of<TrekkingCubit>(context).continueTrek(
                      path: path,
                      turn: !path.turn,
                    );
                  },
                  child: const Chip(label: Text('Развернуться'))),
            ],
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

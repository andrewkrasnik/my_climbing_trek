import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route_roop.dart';

class MountainRoopWidget extends StatelessWidget {
  final MountainRouteRoop roop;
  const MountainRoopWidget({required this.roop, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(children: [
            Text(
              roop.text,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (roop.pieces?.isNotEmpty == true) ...[
              const SizedBox(width: 4),
              Text('(${roop.piecesText})',
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ]),
        ),
        if (roop.boltCount > 0)
          Row(children: [
            const Text(
              'Шлямбуров:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(roop.boltCount.toString()),
          ]),
        Text(roop.description),
        const SizedBox(height: 4),
        if (roop.anchor.isNotEmpty) ...[
          const Text(
            'Станция:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(roop.anchor),
        ],
      ],
    );
  }
}

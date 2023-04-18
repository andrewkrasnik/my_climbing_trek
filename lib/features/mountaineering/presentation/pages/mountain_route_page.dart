import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';

class MountainRoutePage extends StatelessWidget {
  final MountainRoute route;

  const MountainRoutePage({required this.route, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(route.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (route.image?.isNotEmpty == true)
                Center(
                  child: MyCachedNetworkImage(
                    imageUrl: route.image!,
                  ),
                ),
              if (route.description.isNotEmpty) ...[
                Text(route.description),
                const SizedBox(height: 4),
              ],
              if (route.passage.isNotEmpty) ...[
                const Text(
                  'Подход:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(route.passage),
                const SizedBox(height: 4),
              ],
              ...route.roops.map((roop) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(children: [
                          Text(
                            '${roop.title}: ${roop.length}м',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(width: 4),
                          Text('(${roop.piecesText})',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ]),
                      ),
                      Text(roop.description),
                      const SizedBox(height: 4),
                      const Text(
                        'Станция:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(roop.anchor),
                    ],
                  )),
              if (route.passage.isNotEmpty) ...[
                const SizedBox(height: 4),
                const Text(
                  'Спуск:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(route.passage),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

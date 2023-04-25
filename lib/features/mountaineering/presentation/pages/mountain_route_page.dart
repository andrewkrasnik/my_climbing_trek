import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/scaled_image.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountain_route.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
                ScaledImageWidget(imageUrl: route.image!),
              if (route.ueaaSchemaImage?.isNotEmpty == true) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: Center(child: Text('Схема UEAA:')),
                ),
                ScaledImageWidget(imageUrl: route.ueaaSchemaImage!),
              ],
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
                            roop.text,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
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
                  )),
              if (route.descent.isNotEmpty) ...[
                const SizedBox(height: 4),
                const Text(
                  'Спуск:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(route.descent),
              ],
              if (route.farLink?.isNotEmpty == true) ...[
                const SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    launchUrlString(route.farLink!,
                        mode: LaunchMode.externalApplication);
                  },
                  child: const Text(
                    'В базе ФАР',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              if (route.links.isNotEmpty) ...[
                const SizedBox(height: 8),
                const Text(
                  'Сслыки по теме:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...route.links.map((link) => InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(link),
                      ),
                      onTap: () {
                        launchUrlString(link,
                            mode: LaunchMode.externalApplication);
                      },
                    )),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

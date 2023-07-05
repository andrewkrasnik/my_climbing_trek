import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountaineering_category_widget.dart';

class AscensionWidget extends StatelessWidget {
  final Ascension ascension;
  const AscensionWidget({required this.ascension, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
        shadows: [Shadow(offset: Offset.fromDirection(1))]);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            MyCachedNetworkImage(
              imageUrl: ascension.mountain.image,
              fit: BoxFit.fitWidth,
            ),
            Positioned(
              left: 8,
              top: 8,
              child: Row(
                children: [
                  MountaineeringCategoryWidget(
                      category: ascension.route.category),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${ascension.mountain.name}, ${ascension.mountain.altitude} м.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [Shadow(offset: Offset.fromDirection(1))]),
                      ),
                      Text(
                        '${ascension.route.name}, ${ascension.route.type.name}',
                        style: textStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              bottom: 16,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(4),
                    1: FlexColumnWidth(1)
                  },
                  children: [
                    TableRow(
                      children: [
                        Text('Выход', style: textStyle),
                        Text('05:00', style: textStyle),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text('Начало маршрута', style: textStyle),
                        Text('08:00', style: textStyle),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text('Вершина', style: textStyle),
                        Text('12:00', style: textStyle),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text('Возвращение', style: textStyle),
                        Text('16:00', style: textStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

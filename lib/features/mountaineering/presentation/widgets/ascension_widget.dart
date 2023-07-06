import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/core/widgets/scaled_image.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/ascension_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_route_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/ascension_title_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountain_route_category_widget.dart';

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
            // if (ascension.finished)
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AscensionPage(
                          ascension: ascension,
                        )));
              },
              child: MyCachedNetworkImage(
                imageUrl: ascension.mountain.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            // if (!ascension.finished)
            //   ScaledImageWidget(
            //     imageUrl: ascension.route.ueaaSchemaImage ??
            //         ascension.route.image ??
            //         ascension.mountain.image,
            //   ),
            Positioned(
              left: 8,
              top: 8,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MountainRoutePage(
                            mountain: ascension.mountain,
                            route: ascension.route,
                          )));
                },
                child: AscensionTitleWidget(ascension: ascension),
              ),
            ),
            // Positioned(
            //   left: 16,
            //   bottom: 16,
            //   child: SizedBox(
            //     width: MediaQuery.of(context).size.width * 0.5,
            //     child: Table(
            //       columnWidths: const {
            //         0: FlexColumnWidth(4),
            //         1: FlexColumnWidth(1)
            //       },
            //       children: [
            //         TableRow(
            //           children: [
            //             Text('Выход', style: textStyle),
            //             Text('05:00', style: textStyle),
            //           ],
            //         ),
            //         TableRow(
            //           children: [
            //             Text('Начало маршрута', style: textStyle),
            //             Text('08:00', style: textStyle),
            //           ],
            //         ),
            //         TableRow(
            //           children: [
            //             Text('Вершина', style: textStyle),
            //             Text('12:00', style: textStyle),
            //           ],
            //         ),
            //         TableRow(
            //           children: [
            //             Text('Возвращение', style: textStyle),
            //             Text('16:00', style: textStyle),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

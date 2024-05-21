import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/core/widgets/scaled_image.dart';
import 'package:my_climbing_trek/core/widgets/treaning_picture_page.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/pages/ascension_page.dart';

import 'package:my_climbing_trek/features/mountaineering/presentation/pages/mountain_route_page.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/ascension_events_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/ascension_title_widget.dart';

class AscensionWidget extends StatelessWidget {
  final Ascension ascension;
  const AscensionWidget({required this.ascension, super.key});

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
            if (ascension.finished)
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AscensionPage(
                            ascension: ascension,
                          )));
                },
                child: MyCachedNetworkImage(
                  imageUrl: ascension.mountain.image,
                  height: 240,
                  width: double.maxFinite,
                  fit: BoxFit.fitWidth,
                ),
              ),
            if (!ascension.finished) ...[
              if (ascension.route.ueaaSchemaImage != null &&
                  ascension.route.ueaaSchemaImage!.isNotEmpty)
                ScaledImageWidget(
                  imageUrl: ascension.route.ueaaSchemaImage!,
                ),
              if (ascension.route.ueaaSchemaImage == null ||
                  ascension.route.ueaaSchemaImage?.isEmpty == true)
                ScaledImageWidget(
                  imageUrl: ascension.mountain.image,
                ),
            ],
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
            if (ascension.finished) ...[
              Positioned(
                left: 16,
                bottom: 16,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: AscensionEventsWidget(
                    ascension: ascension,
                    textStyle: textStyle,
                    onlyMainEvents: true,
                  ),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => TreaningPicturePage(
                              treaning: ascension,
                              titleWidget: Row(
                                children: [
                                  AscensionTitleWidget(ascension: ascension),
                                ],
                              ),
                              child: SizedBox(
                                width: 250,
                                child: AscensionEventsWidget(
                                  ascension: ascension,
                                  textStyle: textStyle,
                                  onlyMainEvents: true,
                                ),
                              ),
                            )));
                  },
                  icon: const Icon(
                    Icons.share,
                    size: 16,
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}

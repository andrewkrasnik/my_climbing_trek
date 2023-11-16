import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/treaning_picture_widget.dart';
import 'package:screenshot/screenshot.dart';

import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_treaning_picture_widget.dart';

class HallTreaningPage extends StatelessWidget {
  final ClimbingHallTreaning treaning;
  final ScreenshotController screenshotController = ScreenshotController();
  HallTreaningPage({
    super.key,
    required this.treaning,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(treaning.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TreaningPictureWidget(
              screenshotController: ScreenshotController(),
              treaning: treaning,
              child: HallTreaningPictureWidget(
                treaning: treaning,
              ),
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/treaning_picture_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_treaning_picture_widget.dart';

class HallTreaningPage extends StatelessWidget {
  final ClimbingHallTreaning treaning;
  final ScreenshotController screenshotController = ScreenshotController();
  HallTreaningPage({
    Key? key,
    required this.treaning,
  }) : super(key: key);

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
              treaning: treaning,
              child: HallTreaningPictureWidget(
                treaning: treaning,
              ),
            )),
      ),
    );
  }
}

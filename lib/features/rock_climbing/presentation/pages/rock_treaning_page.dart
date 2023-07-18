import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/treaning_picture_widget.dart';

import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_treaning_picture_widget.dart';
import 'package:screenshot/screenshot.dart';

class RockTreaningPage extends StatelessWidget {
  final RockTreaning treaning;

  const RockTreaningPage({
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
            screenshotController: ScreenshotController(),
            treaning: treaning,
            child: RockTreaningPictureWidget(
              treaning: treaning,
            ),
          ),
        ),
      ),
    );
  }
}

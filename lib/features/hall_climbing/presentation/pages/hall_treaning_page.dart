import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/hall_treaning_picture_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Screenshot(
            controller: screenshotController,
            child: HallTreaningPictureWidget(
              treaning: treaning,
              imageSource: treaning.climbingHall.image,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () async {
              final directory = (await getApplicationDocumentsDirectory())
                  .path; //from path_provide package
              String fileName =
                  '${DateTime.now().microsecondsSinceEpoch.toString()}.png';

              final res = await screenshotController.captureAndSave(
                  directory, //set path where screenshot will be saved
                  fileName: fileName);

              Share.shareXFiles([XFile(res!)], text: 'Новая тренировка!');
            },
            icon: const Icon(Icons.share),
            label: const Text('Поделиться'),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/widgets/treaning_picture_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class TreaningPicturePage extends StatelessWidget {
  final Treaning treaning;
  final Widget child;
  final Widget? titleWidget;

  const TreaningPicturePage({
    required this.treaning,
    required this.child,
    this.titleWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ScreenshotController screenshotController = ScreenshotController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(treaning.title),
      ),
      floatingActionButton: FloatingActionButton(
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
        child: const Icon(Icons.share),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TreaningPictureWidget(
            treaning: treaning,
            screenshotController: screenshotController,
            titleWidget: titleWidget,
            child: child,
          ),
        ),
      ),
    );
  }
}

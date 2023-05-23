import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/treaning_picture_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_treaning_picture_widget.dart';
import 'package:screenshot/screenshot.dart';

class IceTreaningPage extends StatelessWidget {
  final IceTreaning treaning;
  final ScreenshotController screenshotController = ScreenshotController();
  IceTreaningPage({
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
            child: IceTreaningPictureWidget(
              treaning: treaning,
            ),
          ),
        ),
      ),
    );
  }
}

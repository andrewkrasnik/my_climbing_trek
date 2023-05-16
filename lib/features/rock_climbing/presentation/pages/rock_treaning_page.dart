import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_treaning_picture_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class RockTreaningPage extends StatefulWidget {
  final RockTreaning treaning;

  const RockTreaningPage({
    Key? key,
    required this.treaning,
  }) : super(key: key);

  @override
  State<RockTreaningPage> createState() => _RockTreaningPageState();
}

class _RockTreaningPageState extends State<RockTreaningPage> {
  final ScreenshotController screenshotController = ScreenshotController();

  final ImagePicker _picker = ImagePicker();
  final List<String> _imageFileList = [];

  int _currentImageIndex = 0;

  @override
  void initState() {
    _imageFileList.add(widget.treaning.image);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.treaning.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Screenshot(
              controller: screenshotController,
              child: SizedBox(
                height: 500,
                width: 500,
                child: RockTreaningPictureWidget(
                  treaning: widget.treaning,
                  imageProvider:
                      _myImageProvider(_imageFileList[_currentImageIndex]),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      try {
                        final List<XFile> pickedFileList =
                            await _picker.pickMultiImage();
                        setState(() {
                          _imageFileList
                              .addAll(pickedFileList.map((e) => e.path));
                        });
                      } catch (e) {}
                    },
                    child: const Text('Выбрать фото ')),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        final XFile? pickedFile =
                            await _picker.pickImage(source: ImageSource.camera);

                        if (pickedFile != null) {
                          setState(() {
                            _imageFileList.add(pickedFile.path);
                          });
                        }
                      } catch (e) {}
                    },
                    child: const Text('Сделать фото')),
              ],
            ),
            if (_imageFileList.length > 1)
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _imageFileList.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Stack(
                        children: [
                          Image(
                            image: _myImageProvider(_imageFileList[index]),
                            fit: BoxFit.cover,
                          ),
                          if (_currentImageIndex == index) ...[
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.3,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: ColoredBox(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            Center(
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.white.withOpacity(0.5),
                                size: 60,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 8,
                  ),
                ),
              ),
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
      ),
    );
  }
}

ImageProvider _myImageProvider(String imageSource) {
  if (imageSource.toLowerCase().startsWith('http')) {
    return NetworkImage(imageSource);
  } else {
    return FileImage(File(imageSource));
  }
}

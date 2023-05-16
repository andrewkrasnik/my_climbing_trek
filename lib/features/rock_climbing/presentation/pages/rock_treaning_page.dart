import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_climbing_trek/core/data/system_enums.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_treaning_picture_widget.dart';

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

  MyPictureSize _currentSize = MyPictureSize.o_3_2;

  ContentVerticalAligment _contentVerticalAligment =
      ContentVerticalAligment.top;

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
            SizedBox(
              height: 80,
              child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  scrollDirection: Axis.horizontal,
                  children: MyPictureSize.values
                      .map(
                        (size) => IconButton(
                          onPressed: () {
                            setState(() {
                              _currentSize = size;
                            });
                          },
                          icon: Icon(
                            size.icon,
                            size: 60,
                            color: _currentSize == size
                                ? Colors.black
                                : Colors.black38,
                          ),
                        ),
                      )
                      .toList()),
            ),
            Row(
              children: [
                ...ContentVerticalAligment.values.map((aligment) => IconButton(
                    onPressed: () {
                      setState(() {
                        _contentVerticalAligment = aligment;
                      });
                    },
                    icon: Icon(
                      aligment.icon,
                      color: _contentVerticalAligment == aligment
                          ? Colors.black
                          : Colors.black38,
                    )))
              ],
            ),
            Screenshot(
              controller: screenshotController,
              child: AspectRatio(
                aspectRatio: _currentSize.aspectRatio,
                child: SizedBox(
                  // height:
                  //     _currentSize.formWidth(MediaQuery.of(context).size.width),
                  width: MediaQuery.of(context).size.width,
                  child: RockTreaningPictureWidget(
                    treaning: widget.treaning,
                    contentVerticalAligment: _contentVerticalAligment,
                    imageProvider:
                        _myImageProvider(_imageFileList[_currentImageIndex]),
                  ),
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

class MyPictureSize {
  final IconData icon;
  final String name;
  final double heightPart;
  final double widthPart;

  const MyPictureSize({
    required this.icon,
    required this.name,
    required this.heightPart,
    required this.widthPart,
  });

  static const MyPictureSize o_16_9 = MyPictureSize(
    icon: Icons.crop_16_9,
    name: '16 на 9',
    heightPart: 9,
    widthPart: 16,
  );

  static const MyPictureSize o_3_2 = MyPictureSize(
    icon: Icons.crop_3_2,
    name: '3 на 2',
    heightPart: 2,
    widthPart: 3,
  );

  static const MyPictureSize landscape = MyPictureSize(
    icon: Icons.crop_landscape,
    name: 'Альбом',
    heightPart: 3,
    widthPart: 4,
  );

  static const MyPictureSize square = MyPictureSize(
    icon: Icons.crop_square,
    name: 'Kвадрат',
    heightPart: 1,
    widthPart: 1,
  );

  static const MyPictureSize din = MyPictureSize(
    icon: Icons.crop_din,
    name: 'Instagram',
    heightPart: 5,
    widthPart: 4,
  );

  static const MyPictureSize portrait = MyPictureSize(
    icon: Icons.crop_portrait,
    name: 'Портрет',
    heightPart: 3,
    widthPart: 2,
  );

  static List<MyPictureSize> get values =>
      [o_16_9, o_3_2, landscape, square, din, portrait];

  get aspectRatio => widthPart / heightPart;
}

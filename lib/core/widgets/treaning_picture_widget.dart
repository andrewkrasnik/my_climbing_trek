import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_climbing_trek/core/data/system_enums.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:screenshot/screenshot.dart';

class TreaningPictureWidget extends StatefulWidget {
  final Treaning treaning;
  final Widget child;
  final Widget? titleWidget;
  final ScreenshotController screenshotController;

  const TreaningPictureWidget({
    Key? key,
    required this.treaning,
    required this.child,
    required this.screenshotController,
    this.titleWidget,
  }) : super(key: key);

  @override
  State<TreaningPictureWidget> createState() => _TreaningPictureWidgetState();
}

class _TreaningPictureWidgetState extends State<TreaningPictureWidget> {
  final ImagePicker _picker = ImagePicker();
  final List<String> _imageFileList = [];

  MyPictureSize _currentSize = MyPictureSize.o_3_2;

  ContentVerticalAligment _contentVerticalAligment =
      ContentVerticalAligment.bottom;

  ContentHorisontalAligment _contentHorisontalAligment =
      ContentHorisontalAligment.left;

  int _currentImageIndex = 0;

  @override
  void initState() {
    _imageFileList.add(widget.treaning.image);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      shadows: [Shadow(offset: Offset.fromDirection(1, 1))],
    );

    final color = Theme.of(context).colorScheme.surface;

    return Column(children: [
      SizedBox(
        height: 60,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: MyPictureSize.values
                .map(
                  (size) => IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      setState(() {
                        _currentSize = size;
                      });
                    },
                    icon: Icon(
                      size.icon,
                      size: 60,
                      color:
                          _currentSize == size ? color : color.withOpacity(0.4),
                    ),
                  ),
                )
                .toList()),
      ),
      const SizedBox(height: 8),
      Wrap(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
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
                        ? color
                        : color.withOpacity(0.3),
                  ))),
            ],
          ),
          const SizedBox(width: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...ContentHorisontalAligment.values.map((aligment) => IconButton(
                  onPressed: () {
                    setState(() {
                      _contentHorisontalAligment = aligment;
                    });
                  },
                  icon: Icon(
                    aligment.icon,
                    color: _contentHorisontalAligment == aligment
                        ? color
                        : color.withOpacity(0.3),
                  ))),
            ],
          ),
        ],
      ),
      Screenshot(
        controller: widget.screenshotController,
        child: AspectRatio(
          aspectRatio: _currentSize.aspectRatio,
          child: SizedBox(
              // height:
              //     _currentSize.formWidth(MediaQuery.of(context).size.width),
              width: MediaQuery.of(context).size.width,
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      opacity: 0.6,
                      image:
                          _myImageProvider(_imageFileList[_currentImageIndex]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(children: [
                    if (widget.titleWidget == null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.treaning.place,
                            style: textStyle,
                          ),
                          Text(
                            widget.treaning.dateString,
                            style: textStyle,
                          ),
                        ],
                      ),
                    if (widget.titleWidget != null) widget.titleWidget!,
                    const SizedBox(
                      height: 24,
                    ),
                    if (_contentVerticalAligment.showFirstSpaicer)
                      const Spacer(),
                    Row(children: [
                      if (_contentHorisontalAligment.showFirstSpaicer)
                        const Spacer(),
                      widget.child,
                      if (_contentHorisontalAligment.showSecondSpaicer)
                        const Spacer(),
                      const SizedBox(
                        height: 12,
                      ),
                    ]),
                    if (_contentVerticalAligment.showSecondSpaicer)
                      const Spacer(),
                  ]))),
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
                    _imageFileList.addAll(pickedFileList.map((e) => e.path));
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
                      height: double.infinity,
                      width: double.infinity,
                      image: _myImageProvider(_imageFileList[index]),
                      fit: BoxFit.cover,
                    ),
                    if (_currentImageIndex == index) ...[
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.3,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ColoredBox(color: Colors.black.withOpacity(0.5)),
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
    ]);
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

import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';

class ScaledImage extends StatelessWidget {
  final String imageUrl;
  ScaledImage({required this.imageUrl, Key? key}) : super(key: key);

  OverlayEntry? _entry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        showOverlay(context);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MyCachedNetworkImage(imageUrl: imageUrl),
      ),
    );
  }

  void showOverlay(BuildContext context) {
    _entry = OverlayEntry(
        builder: (context) => GestureDetector(
              onDoubleTap: () {
                removeOverlay();
              },
              child: Scaffold(
                body: InteractiveViewer(
                  clipBehavior: Clip.none,
                  constrained: false,
                  maxScale: 10,
                  child: MyCachedNetworkImage(
                    imageUrl: imageUrl,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ));
    final overlay = Overlay.of(context);

    overlay.insert(_entry!);
  }

  void removeOverlay() {
    _entry?.remove();
    _entry = null;
  }
}

import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';

class ScaledImageWidget extends StatelessWidget {
  final String imageUrl;
  final String? cacheKey;
  const ScaledImageWidget({
    required this.imageUrl,
    this.cacheKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ScaledImageViewWidget(imageUrl: imageUrl),
        ));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MyCachedNetworkImage(
          imageUrl: imageUrl,
          cacheKey: cacheKey,
        ),
      ),
    );
  }
}

class ScaledImageViewWidget extends StatelessWidget {
  final String imageUrl;

  const ScaledImageViewWidget({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: InteractiveViewer(
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
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:my_climbing_trek/core/widgets/cache_key_inherited_widget.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? cacheKey;

  const MyCachedNetworkImage({
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
    super.key,
    this.cacheKey,
  });

  @override
  Widget build(BuildContext context) {
    final localCacheKey =
        cacheKey ?? CacheKeyInheritedWidget.maybeOf(context)?.cacheKey;
    final manager =
        localCacheKey == null ? null : CacheManager(Config(localCacheKey));

    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit ?? BoxFit.fitWidth,
      cacheManager: manager,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';

class MySliverAppBarWidget extends StatelessWidget {
  final String heroTag;
  final String title;
  final String imageUrl;
  final void Function()? onMapPpoint;
  final List<Widget>? actions;
  final String? cacheKey;

  const MySliverAppBarWidget({
    super.key,
    required this.heroTag,
    required this.title,
    required this.imageUrl,
    this.onMapPpoint,
    this.actions,
    this.cacheKey,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      stretch: true,
      floating: true,
      pinned: true,
      snap: false,
      centerTitle: true,
      actions: actions,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        centerTitle: true,
        background: Hero(
          tag: heroTag,
          child: MyCachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            cacheKey: cacheKey,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(offset: Offset.fromDirection(1))]),
              ),
            ),
            if (onMapPpoint != null)
              IconButton(
                  onPressed: onMapPpoint,
                  icon: Icon(
                    Icons.place,
                    color: Colors.white,
                    shadows: [Shadow(offset: Offset.fromDirection(1))],
                    size: 20,
                  )),
          ],
        ),
      ),
    );
  }
}

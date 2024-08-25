import 'package:flutter/material.dart';

class CacheKeyInheritedWidget extends InheritedWidget {
  final String? cacheKey;

  const CacheKeyInheritedWidget(
      {super.key, required super.child, required this.cacheKey});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  static CacheKeyInheritedWidget? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CacheKeyInheritedWidget>();
  }

  static CacheKeyInheritedWidget of(BuildContext context) {
    final CacheKeyInheritedWidget? result = maybeOf(context);

    return result!;
  }
}

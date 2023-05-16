import 'package:flutter/material.dart';

enum ContentVerticalAligment { top, center, bottom }

extension ContentVerticalAligmentExtension on ContentVerticalAligment {
  IconData get icon {
    switch (this) {
      case ContentVerticalAligment.top:
        return Icons.vertical_align_top;
      case ContentVerticalAligment.center:
        return Icons.vertical_align_center;
      case ContentVerticalAligment.bottom:
        return Icons.vertical_align_bottom;
    }
  }

  bool get showFirstSpaicer =>
      this == ContentVerticalAligment.center ||
      this == ContentVerticalAligment.bottom;

  bool get showSecondSpaicer =>
      this == ContentVerticalAligment.center ||
      this == ContentVerticalAligment.top;
}

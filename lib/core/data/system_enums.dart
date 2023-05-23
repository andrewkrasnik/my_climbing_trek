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

enum ContentHorisontalAligment { left, center, right }

extension ContentHorisontalAligmentExtention on ContentHorisontalAligment {
  IconData get icon {
    switch (this) {
      case ContentHorisontalAligment.left:
        return Icons.format_align_left;
      case ContentHorisontalAligment.center:
        return Icons.format_align_center;
      case ContentHorisontalAligment.right:
        return Icons.format_align_right;
    }
  }

  bool get showFirstSpaicer =>
      this == ContentHorisontalAligment.center ||
      this == ContentHorisontalAligment.right;

  bool get showSecondSpaicer =>
      this == ContentHorisontalAligment.center ||
      this == ContentHorisontalAligment.left;
}

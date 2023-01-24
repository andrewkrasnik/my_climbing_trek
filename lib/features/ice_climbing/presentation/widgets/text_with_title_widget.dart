import 'package:flutter/material.dart';

class TextWithTitleWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const TextWithTitleWidget({
    required this.title,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          child,
        ],
      ),
    );
  }
}

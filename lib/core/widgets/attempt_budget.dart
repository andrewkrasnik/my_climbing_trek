import 'package:flutter/material.dart';

class AttemptBudget extends StatelessWidget {
  final Color color;
  final Widget child;
  const AttemptBudget({required this.color, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: 16,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }
}

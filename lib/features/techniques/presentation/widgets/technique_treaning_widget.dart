import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';

class TechniqueTreaningWidget extends StatelessWidget {
  final TechniqueTreaning treaning;
  final bool isCurrent;

  const TechniqueTreaningWidget({
    Key? key,
    required this.treaning,
    this.isCurrent = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

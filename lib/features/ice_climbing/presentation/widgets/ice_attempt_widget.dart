import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:flutter/material.dart';

class IceAttemptWidget extends StatelessWidget {
  final IceTreaningAttempt attempt;
  final bool isCurrent;
  const IceAttemptWidget(
      {required this.attempt, this.isCurrent = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Попытка');
  }
}

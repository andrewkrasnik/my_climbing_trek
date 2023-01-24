import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/core/data/treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';

import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:collection/collection.dart';

class IceTreaning extends Treaning {
  final IceDistrict district;

  final List<IceTreaningAttempt> _attempts;

  List<IceTreaningAttempt> get attempts => _attempts;

  bool get hasLead => leadAttempts.isNotEmpty;

  IceTreaningAttempt? get currentAttempt =>
      attempts.firstWhereOrNull((element) => element.started);

  IceTreaningAttempt? get lastAttempt =>
      attempts.firstWhereOrNull((element) => element.finished);

  List<IceTreaningAttempt> get leadAttempts =>
      attempts.where((element) => element.style == ClimbingStyle.lead).toList();

  bool get hasTopRope => topRopeAttempts.isNotEmpty;

  List<IceTreaningAttempt> get topRopeAttempts => attempts
      .where((element) => element.style == ClimbingStyle.topRope)
      .toList();

  IceTreaning({
    required this.district,
    required super.date,
    super.finish,
    super.id,
    List<IceTreaningAttempt>? attempts,
  }) : _attempts = attempts ?? [];
}

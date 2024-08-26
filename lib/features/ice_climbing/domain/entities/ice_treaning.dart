import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';

import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:collection/collection.dart';

class IceTreaning extends Treaning {
  final IceDistrict district;
  final List<IceSector> sectors;

  final List<IceTreaningAttempt> _attempts;

  List<IceTreaningAttempt> get attempts => _attempts;

  bool get hasLead => leadAttempts.isNotEmpty;

  IceTreaningAttempt? get currentAttempt =>
      attempts.firstWhereOrNull((element) => element.started);

  IceTreaningAttempt? get lastAttempt =>
      attempts.lastWhereOrNull((element) => element.finished);

  List<IceTreaningAttempt> get leadAttempts =>
      attempts.where((element) => element.style == ClimbingStyle.lead).toList();

  bool get hasTopRope => topRopeAttempts.isNotEmpty;

  List<IceTreaningAttempt> get topRopeAttempts => attempts
      .where((element) => element.style == ClimbingStyle.topRope)
      .toList();

  @override
  bool get hasEditing => true;

  IceTreaning({
    required this.district,
    required super.date,
    super.finish,
    super.id,
    List<IceTreaningAttempt>? attempts,
    required this.sectors,
    super.start,
  }) : _attempts = attempts ?? [];

  @override
  String get title => '${district.name} ${date.dayString()}';

  @override
  String get image =>
      sectors.length == 1 ? sectors.first.image : district.image;

  @override
  String get place => district.name;
}

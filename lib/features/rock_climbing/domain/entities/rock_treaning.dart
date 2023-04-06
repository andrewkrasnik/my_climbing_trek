import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';

class RockTreaning extends Treaning {
  final RockDistrict district;
  final List<RockSector> sectors;

  final List<RockTreaningAttempt> _attempts;

  List<RockTreaningAttempt> get attempts => _attempts;

  bool get hasLead => leadAttempts.isNotEmpty;

  List<RockTreaningAttempt> get leadAttempts =>
      attempts.where((element) => element.style == ClimbingStyle.lead).toList();

  bool get hasTopRope => topRopeAttempts.isNotEmpty;

  List<RockTreaningAttempt> get topRopeAttempts => attempts
      .where((element) => element.style == ClimbingStyle.topRope)
      .toList();

  bool get hasBouldering => boulderingAttempts.isNotEmpty;

  List<RockTreaningAttempt> get boulderingAttempts => attempts
      .where((element) => element.style == ClimbingStyle.bouldering)
      .toList();

  bool get hasTrad => tradAttempts.isNotEmpty;

  List<RockTreaningAttempt> get tradAttempts =>
      attempts.where((element) => element.style == ClimbingStyle.trad).toList();

  RockTreaning({
    required super.date,
    required this.district,
    List<RockTreaningAttempt>? attempts,
    required this.sectors,
    super.finish,
    super.id,
    super.start,
  }) : _attempts = attempts ?? [];

  String get title => '${district.name} ${date.dayString()}';

  String get image =>
      sectors.length == 1 ? sectors.first.image : district.image;
}

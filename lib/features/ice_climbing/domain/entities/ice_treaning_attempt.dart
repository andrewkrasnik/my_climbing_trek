import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/core/data/ice_category.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';

class IceTreaningAttempt {
  final IceSector sector;
  final IceCategory category;
  final ClimbingStyle style;

  DateTime? _startTime;
  DateTime? _finishTime;

  int suspensionCount = 0;

  int fallCount = 0;

  bool downClimbing = false;

  bool fail = false;

  int toolsCount = 2;

  int iceScrewsCount = 0;

  bool installedIceScrews = false;

  int length;

  bool get planed => _startTime == null;
  bool get finished => _finishTime != null;
  bool get started => _startTime != null && _finishTime == null;

  IceTreaningAttempt({
    required this.sector,
    required this.category,
    required this.style,
    DateTime? startTime,
    DateTime? finishTime,
    int? wayLength,
  })  : _startTime = startTime,
        _finishTime = finishTime,
        length = wayLength ?? sector.lenght;
}

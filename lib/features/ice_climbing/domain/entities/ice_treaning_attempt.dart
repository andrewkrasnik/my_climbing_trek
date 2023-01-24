import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/core/data/ice_category.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';

class IceTreaningAttempt {
  final IceSector sector;
  final IceCategory category;
  final ClimbingStyle style;

  DateTime? _startTime;
  DateTime? _finishTime;

  bool get planed => _startTime == null;
  bool get finished => _finishTime != null;
  bool get started => _startTime != null && _finishTime == null;

  IceTreaningAttempt({
    required this.sector,
    required this.category,
    required this.style,
    DateTime? startTime,
    DateTime? finishTime,
  })  : _startTime = startTime,
        _finishTime = finishTime;
}

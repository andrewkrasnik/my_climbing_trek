import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';

class RockTreaningAttempt extends DataWithUUID {
  final RockSector sector;
  final ClimbingCategory category;
  final ClimbingStyle style;
  final RockRoute? route;
  final String treaningId;

  DateTime? _startTime;
  DateTime? _finishTime;

  int suspensionCount;

  int fallCount;

  bool downClimbing;

  bool fail;

  DateTime? get startTime => _startTime;
  DateTime? get finishTime => _finishTime;

  bool get planed => _startTime == null;
  bool get finished => _finishTime != null;
  bool get started => _startTime != null && _finishTime == null;

  RockTreaningAttempt({
    required this.sector,
    required this.category,
    required this.style,
    required this.treaningId,
    DateTime? startTime,
    DateTime? finishTime,
    super.id,
    this.route,
    this.downClimbing = false,
    this.fallCount = 0,
    this.fail = false,
    this.suspensionCount = 0,
  })  : _startTime = startTime,
        _finishTime = finishTime;

  void start() {
    _startTime = DateTime.now();
  }

  void finish({
    int suspensionCount = 0,
    int fallCount = 0,
    bool downClimbing = false,
    bool fail = false,
  }) {
    _finishTime = DateTime.now();
    this.suspensionCount = suspensionCount;
    this.fallCount = fallCount;
    this.downClimbing = downClimbing;
    this.fail = fail;
  }
}
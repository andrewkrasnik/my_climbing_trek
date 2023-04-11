import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';

class IceTreaningAttempt extends DataWithUUID {
  final IceSector sector;
  final IceCategory category;
  final ClimbingStyle style;
  final String treaningId;

  DateTime? _startTime;
  DateTime? _finishTime;

  int suspensionCount;

  int fallCount;

  bool downClimbing;

  bool fail;

  int toolsCount;

  int iceScrewsCount;

  bool installedIceScrews;

  int wayLength;

  DateTime? get startTime => _startTime;
  DateTime? get finishTime => _finishTime;

  bool get planed => _startTime == null;
  bool get finished => _finishTime != null;
  bool get started => _startTime != null && _finishTime == null;

  IceTreaningAttempt({
    required this.treaningId,
    required this.sector,
    required this.category,
    required this.style,
    DateTime? startTime,
    DateTime? finishTime,
    int? wayLength,
    super.id,
    this.downClimbing = false,
    this.fallCount = 0,
    this.iceScrewsCount = 0,
    this.fail = false,
    this.installedIceScrews = false,
    this.suspensionCount = 0,
    this.toolsCount = 2,
  })  : _startTime = startTime,
        _finishTime = finishTime,
        wayLength = wayLength ?? sector.length;

  void start() {
    _startTime = DateTime.now();
  }

  void finish({
    int suspensionCount = 0,
    int fallCount = 0,
    bool downClimbing = false,
    bool fail = false,
    int toolsCount = 2,
    int iceScrewsCount = 0,
    bool installedIceScrews = false,
    required int length,
  }) {
    _finishTime = DateTime.now();
    this.suspensionCount = suspensionCount;
    this.fallCount = fallCount;
    this.downClimbing = downClimbing;
    this.fail = fail;
    this.iceScrewsCount = iceScrewsCount;
    this.installedIceScrews = installedIceScrews;
    this.toolsCount = toolsCount;
    wayLength = length;
  }
}

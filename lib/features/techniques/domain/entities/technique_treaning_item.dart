import 'package:my_climbing_trek/core/data/data_with_uuid.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';

class TechniqueTreaningItem extends DataWithUUID {
  final TechniqueGroup group;
  final Technique technique;
  final String treaningId;
  String comment;
  List<TechniqueOption> options;
  DateTime? startTime;
  DateTime? finishTime;

  bool get finished => finishTime != null && startTime != null;
  bool get started => startTime != null && finishTime == null;

  TechniqueTreaningItem({
    required this.group,
    required this.technique,
    required this.treaningId,
    this.comment = '',
    super.id,
    List<TechniqueOption>? options,
    this.startTime,
    this.finishTime,
  }) : options = options ?? [];

  void start(DateTime? time) {
    startTime = time ?? DateTime.now();
  }

  void finish(DateTime? time) {
    finishTime = time ?? DateTime.now();
  }
}

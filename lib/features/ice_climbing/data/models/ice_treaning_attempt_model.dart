import 'package:climbing_diary/core/data/climbing_style.dart';
import 'package:climbing_diary/core/data/ice_category.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';

class IceTreaningAttemptModel extends IceTreaningAttempt {
  final String treaningId;
  IceTreaningAttemptModel({
    required this.treaningId,
    required super.sector,
    required super.category,
    required super.style,
    super.startTime,
    super.finishTime,
    super.wayLength,
    super.id,
    super.downClimbing = false,
    super.fallCount = 0,
    super.iceScrewsCount = 0,
    super.fail = false,
    super.installedIceScrews = false,
    super.suspensionCount = 0,
    super.toolsCount = 2,
  });

  factory IceTreaningAttemptModel.fromJson(
          Map<String, dynamic> json, Map<String, IceSector> sectors) =>
      IceTreaningAttemptModel(
        id: json['id'] as String? ?? '',
        sector: sectors[json['sector']]!,
        finishTime: json['finishTime'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['finishTime'] as int),
        startTime: json['startTime'] == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(json['startTime'] as int),
        category: IceCategory.getById(json['category']),
        style: ClimbingStyle.getById(json['style']),
        downClimbing: json['downClimbing'],
        fail: json['fail'],
        fallCount: json['fallCount'],
        iceScrewsCount: json['iceScrewsCount'],
        installedIceScrews: json['installedIceScrews'],
        suspensionCount: json['suspensionCount'],
        toolsCount: json['toolsCount'],
        wayLength: json['wayLength'],
        treaningId: json['treaningId'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'sector': sector.id,
        'category': category.id,
        'style': style.id,
        'startTime': startTime,
        'finishTime': finishTime,
        'wayLength': length,
        'downClimbing': downClimbing,
        'fallCount': fallCount,
        'iceScrewsCount': iceScrewsCount,
        'fail': fail,
        'installedIceScrews': installedIceScrews,
        'suspensionCount': suspensionCount,
        'toolsCount': toolsCount,
        'treaningId': treaningId,
      };
}

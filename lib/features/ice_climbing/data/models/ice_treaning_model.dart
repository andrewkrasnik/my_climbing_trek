import 'package:my_climbing_trek/features/ice_climbing/data/models/ice_treaning_attempt_model.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';

class IceTreaningModel extends IceTreaning {
  IceTreaningModel({
    required super.district,
    required super.date,
    super.finish,
    super.id,
    super.attempts,
    required super.sectors,
    super.start,
  });

  factory IceTreaningModel.fromJson(
    Map<String, dynamic> json,
    Map<String, IceDistrict> districts,
    Map<String, IceSector> sectors,
  ) {
    final List<IceTreaningAttempt> attempts = json['attempts'] == null
        ? []
        : (json['attempts'] as List<Map<String, dynamic>>)
            .map((line) => IceTreaningAttemptModel.fromJson(line, sectors))
            .toList();

    return IceTreaningModel(
      id: json['id'] as String? ?? '',
      district: districts[json['districtId']]!,
      sectors: attempts.map((e) => e.sector).toSet().toList(),
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
      finish: json['finish'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['finish'] as int),
      start: json['start'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['start'] as int),
      attempts: attempts,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date,
        'districtId': district.id,
        'id': id,
        'start': start,
        'finish': finish,
        'attempts': attempts
            .map((e) => convertLine(line: e, treaningId: id).toJson())
            .toList()
      };

  IceTreaningAttemptModel convertLine(
      {required IceTreaningAttempt line, required String treaningId}) {
    if (line is IceTreaningAttemptModel) {
      return line;
    } else {
      return IceTreaningAttemptModel(
        sector: line.sector,
        category: line.category,
        style: line.style,
        downClimbing: line.downClimbing,
        fail: line.fail,
        fallCount: line.fallCount,
        finishTime: line.finishTime,
        iceScrewsCount: line.iceScrewsCount,
        id: line.id,
        installedIceScrews: line.installedIceScrews,
        startTime: line.startTime,
        suspensionCount: line.suspensionCount,
        toolsCount: line.toolsCount,
        wayLength: line.length,
        treaningId: treaningId,
      );
    }
  }
}

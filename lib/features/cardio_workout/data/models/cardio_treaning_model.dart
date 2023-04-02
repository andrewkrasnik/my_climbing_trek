import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_exercise.dart';
import 'package:my_climbing_trek/features/cardio_workout/domain/entities/cardio_treaning.dart';

class CardioTreaningModel extends CardioTreaning {
  CardioTreaningModel({
    super.id,
    required super.date,
    required super.duration,
    required super.exercise,
    required super.length,
    super.finish,
    super.start,
  });

  factory CardioTreaningModel.fromJson(Map<String, dynamic> json) =>
      _$CardioTreaningModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardioTreaningModelToJson(this);
}

CardioTreaningModel _$CardioTreaningModelFromJson(Map<String, dynamic> json) =>
    CardioTreaningModel(
      id: json['id'] as String? ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] as int),
      duration: json['duration'] as int,
      exercise: CardioExercise.fromJson(json['exercise']),
      length: (json['length'] as num).toDouble(),
      finish: json['finish'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['finish'] as int),
      start: json['start'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(json['start'] as int),
    );

Map<String, dynamic> _$CardioTreaningModelToJson(
        CardioTreaningModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'id': instance.id,
      'start': instance.start,
      'finish': instance.finish,
      'duration': instance.duration,
      'exercise': instance.exercise.toJson(),
      'length': instance.length,
    };

import 'package:climbing_diary/core/data/unique_id.dart';

class StrengthExercise {
  final UniqueId _id;
  final String name;
  final int repetitions;

  String get id => _id.value;

  StrengthExercise({
    required this.name,
    required this.repetitions,
    String id = '',
  }) : _id = UniqueId.fromUniqueString(id);
}

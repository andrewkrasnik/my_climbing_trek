import 'package:climbing_diary/core/data/unique_id.dart';
import 'package:equatable/equatable.dart';

class StrengthExercise extends Equatable {
  final UniqueId _id;
  final String name;
  final int repetitions;

  String get id => _id.value;

  StrengthExercise({
    required this.name,
    required this.repetitions,
    String id = '',
  }) : _id = UniqueId.fromUniqueString(id);

  @override
  List<Object?> get props => [id];
}

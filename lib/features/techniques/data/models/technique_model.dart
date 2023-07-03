import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/techniques/data/models/converters.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
part 'technique_model.g.dart';

@JsonSerializable(converters: [
  TechniqueOptionConverter(),
])
class TechniqueModel extends Technique {
  TechniqueModel({
    required super.name,
    required super.description,
    super.id,
    super.image,
    super.links,
    super.options,
  });

  factory TechniqueModel.fromJson(Map<String, dynamic> json) =>
      _$TechniqueModelFromJson(json);

  Map<String, dynamic> toJson() => _$TechniqueModelToJson(this);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
part 'technique_group_model.g.dart';

@JsonSerializable()
class TechniqueGroupModel extends TechniqueGroup {
  TechniqueGroupModel({
    required super.name,
    required super.description,
    super.id,
    required super.image,
    super.localData,
  });

  factory TechniqueGroupModel.fromJson(Map<String, dynamic> json) =>
      _$TechniqueGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$TechniqueGroupModelToJson(this);
}

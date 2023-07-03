import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';

part 'technique_option_model.g.dart';

@JsonSerializable()
class TechniqueOptionModel extends TechniqueOption {
  TechniqueOptionModel({
    required super.name,
    super.description,
    super.id,
  });

  factory TechniqueOptionModel.fromJson(Map<String, dynamic> json) =>
      _$TechniqueOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TechniqueOptionModelToJson(this);
}

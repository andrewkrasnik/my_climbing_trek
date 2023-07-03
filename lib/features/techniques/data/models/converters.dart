import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/techniques/data/models/technique_group_model.dart';
import 'package:my_climbing_trek/features/techniques/data/models/technique_model.dart';
import 'package:my_climbing_trek/features/techniques/data/models/technique_option_model.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';

class TechniqueGroupConverter
    implements JsonConverter<TechniqueGroup, Map<String, dynamic>> {
  const TechniqueGroupConverter();
  @override
  TechniqueGroup fromJson(Map<String, dynamic> json) {
    return TechniqueGroupModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TechniqueGroup object) {
    if (object is TechniqueGroupModel) {
      return object.toJson();
    } else {
      return TechniqueGroupModel(
        image: object.image,
        name: object.name,
        id: object.id,
        description: object.description,
      ).toJson();
    }
  }
}

class TechniqueConverter
    implements JsonConverter<Technique, Map<String, dynamic>> {
  const TechniqueConverter();
  @override
  Technique fromJson(Map<String, dynamic> json) {
    return TechniqueModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Technique object) {
    if (object is TechniqueModel) {
      return object.toJson();
    } else {
      return TechniqueModel(
        image: object.image,
        name: object.name,
        id: object.id,
        description: object.description,
        links: object.links,
        options: object.options,
      ).toJson();
    }
  }
}

class TechniqueOptionConverter
    implements JsonConverter<TechniqueOption, Map<String, dynamic>> {
  const TechniqueOptionConverter();
  @override
  TechniqueOption fromJson(Map<String, dynamic> json) {
    return TechniqueOptionModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TechniqueOption object) {
    if (object is TechniqueOptionModel) {
      return object.toJson();
    } else {
      return TechniqueOptionModel(
        name: object.name,
        id: object.id,
        description: object.description,
      ).toJson();
    }
  }
}

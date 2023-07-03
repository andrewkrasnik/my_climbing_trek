import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/features/techniques/data/models/technique_group_model.dart';
import 'package:my_climbing_trek/features/techniques/data/models/technique_model.dart';
import 'package:my_climbing_trek/features/techniques/data/models/technique_option_model.dart';
import 'package:my_climbing_trek/features/techniques/data/models/technique_treaning_item_model.dart';
import 'package:my_climbing_trek/features/techniques/data/models/technique_treaning_model.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';

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

class TechniqueTreaningConverter
    implements JsonConverter<TechniqueTreaning, Map<String, dynamic>> {
  const TechniqueTreaningConverter();
  @override
  TechniqueTreaning fromJson(Map<String, dynamic> json) {
    return TechniqueTreaningModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TechniqueTreaning object) {
    if (object is TechniqueTreaningModel) {
      return object.toJson();
    } else {
      return TechniqueTreaningModel(
        date: object.date,
        id: object.id,
        comment: object.comment,
        finish: object.finish,
        items: object.items,
        start: object.start,
      ).toJson();
    }
  }
}

class TechniqueTreaningItemConverter
    implements JsonConverter<TechniqueTreaningItem, Map<String, dynamic>> {
  const TechniqueTreaningItemConverter();
  @override
  TechniqueTreaningItem fromJson(Map<String, dynamic> json) {
    return TechniqueTreaningItemModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(TechniqueTreaningItem object) {
    if (object is TechniqueTreaningItemModel) {
      return object.toJson();
    } else {
      return TechniqueTreaningItemModel(
        techniqueId: object.technique.id,
        group: object.group,
        groupId: object.group.id,
        technique: object.technique,
        id: object.id,
        treaningId: object.treaningId,
        comment: object.comment,
        finishTime: object.finishTime,
        options: object.options,
        startTime: object.startTime,
      ).toJson();
    }
  }
}

class TechniqueGroupStringConverter
    implements JsonConverter<TechniqueGroup, String> {
  const TechniqueGroupStringConverter();
  @override
  TechniqueGroup fromJson(String json) {
    return TechniqueGroupModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(TechniqueGroup object) {
    return jsonEncode(const TechniqueGroupConverter().toJson(object));
  }
}

class TechniqueStringConverter implements JsonConverter<Technique, String> {
  const TechniqueStringConverter();
  @override
  Technique fromJson(String json) {
    return TechniqueModel.fromJson(jsonDecode(json));
  }

  @override
  String toJson(Technique object) {
    return jsonEncode(const TechniqueConverter().toJson(object));
  }
}

class TechniqueOptionsStringConverter
    implements JsonConverter<List<TechniqueOption>, String> {
  const TechniqueOptionsStringConverter();

  @override
  List<TechniqueOption> fromJson(String json) {
    final data = jsonDecode(json) as List<dynamic>;

    return data.map((json) => TechniqueOptionModel.fromJson(json)).toList();
  }

  @override
  String toJson(List<TechniqueOption> object) {
    return jsonEncode(object
        .map((item) => const TechniqueOptionConverter().toJson(item))
        .toList());
  }
}

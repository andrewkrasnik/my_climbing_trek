import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/techniques/data/models/converters.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_option.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning_item.dart';

part 'technique_treaning_item_model.g.dart';

@JsonSerializable(converters: [
  TechniqueOptionsStringConverter(),
  TechniqueStringConverter(),
  TechniqueGroupStringConverter(),
  EpochDateTimeConverter(),
])
class TechniqueTreaningItemModel extends TechniqueTreaningItem {
  String get techniqueId => technique.id;
  String get groupId => group.id;

  TechniqueTreaningItemModel({
    required super.group,
    required super.technique,
    required super.treaningId,
    super.comment,
    super.id,
    super.options,
    super.startTime,
    super.finishTime,
    required String techniqueId,
    required String groupId,
  });

  factory TechniqueTreaningItemModel.fromJson(Map<String, dynamic> json) =>
      _$TechniqueTreaningItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TechniqueTreaningItemModelToJson(this);
}

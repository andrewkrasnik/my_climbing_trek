import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/techniques/data/models/converters.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_treaning.dart';

part 'technique_treaning_model.g.dart';

@JsonSerializable(converters: [
  TechniqueTreaningItemConverter(),
  EpochDateTimeConverter(),
])
class TechniqueTreaningModel extends TechniqueTreaning {
  TechniqueTreaningModel({
    super.items,
    required super.date,
    super.finish,
    super.id,
    super.start,
    super.comment = '',
  });

  factory TechniqueTreaningModel.fromJson(Map<String, dynamic> json) =>
      _$TechniqueTreaningModelFromJson(json);

  Map<String, dynamic> toJson() => _$TechniqueTreaningModelToJson(this);
}

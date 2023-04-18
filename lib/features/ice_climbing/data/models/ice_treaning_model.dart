import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/ice_climbing/data/models/converters.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ice_treaning_model.g.dart';

@JsonSerializable(converters: [
  IceDistrictStringConverter(),
  IceSectorStringConverter(),
  IceTreaningAttemptConverter(),
  EpochDateTimeConverter(),
  IceSectorsStringConverter(),
])
class IceTreaningModel extends IceTreaning {
  @JsonKey(name: 'districtId')
  String get districtId => district.id;

  IceTreaningModel({
    required super.district,
    required super.date,
    List<IceSector>? sectors,
    super.finish,
    super.id,
    super.attempts,
    super.start,
    String districtId = '',
  }) : super(
            sectors: sectors ??
                attempts?.map((e) => e.sector).toSet().toList() ??
                []);

  factory IceTreaningModel.fromJson(Map<String, dynamic> json) =>
      _$IceTreaningModelFromJson(json);

  Map<String, dynamic> toJson() => _$IceTreaningModelToJson(this);
}

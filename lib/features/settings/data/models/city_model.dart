import 'package:my_climbing_trek/core/data/city.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel extends City {
  CityModel({required super.name, required super.id});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

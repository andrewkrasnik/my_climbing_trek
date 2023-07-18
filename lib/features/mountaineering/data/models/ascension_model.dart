import 'package:my_climbing_trek/core/datasource/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/data/models/converters.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ascension_model.g.dart';

@JsonSerializable(converters: [
  EpochDateTimeConverter(),
  MountainRouteStringConverter(),
  MountainStringConverter(),
  AscensionEventConverter(),
])
class AscensionModel extends Ascension {
  String get routeId => route.id;

  String get mountainId => mountain.id;

  AscensionModel({
    required super.date,
    required super.mountain,
    required super.route,
    super.events,
    super.finish,
    super.start,
    super.id,
    required String mountainId,
    required String routeId,
  });

  factory AscensionModel.fromJson(Map<String, dynamic> json) =>
      _$AscensionModelFromJson(json);

  Map<String, dynamic> toJson() => _$AscensionModelToJson(this);
}

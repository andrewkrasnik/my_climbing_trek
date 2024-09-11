import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'treanings_settings_model.g.dart';

@JsonSerializable()
class TreaningsSettingsModel extends TreaningsSettings {
  const TreaningsSettingsModel({
    required super.useGymTreanings,
    required super.useCardioTreanings,
    required super.useIceTreanings,
    required super.useStrengthTraining,
    required super.useRockTraining,
    super.useTraveling,
    super.useMountaineering,
    super.useTrekking,
    super.useTechniques,
    super.proxy,
  });

  factory TreaningsSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$TreaningsSettingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TreaningsSettingsModelToJson(this);

  factory TreaningsSettingsModel.fromOrign(TreaningsSettings settings) {
    if (settings is TreaningsSettingsModel) {
      return settings;
    } else {
      return TreaningsSettingsModel(
        useGymTreanings: settings.useGymTreanings,
        useCardioTreanings: settings.useCardioTreanings,
        useIceTreanings: settings.useIceTreanings,
        useStrengthTraining: settings.useStrengthTraining,
        useRockTraining: settings.useRockTraining,
        useMountaineering: settings.useMountaineering,
        useTraveling: settings.useTraveling,
        useTrekking: settings.useTrekking,
        useTechniques: settings.useTechniques,
        proxy: settings.proxy,
      );
    }
  }
}

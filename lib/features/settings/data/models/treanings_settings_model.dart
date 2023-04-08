import 'package:my_climbing_trek/features/settings/domain/entities/treanings_settings.dart';

class TreaningsSettingsModel extends TreaningsSettings {
  const TreaningsSettingsModel({
    required super.useGymTreanings,
    required super.useCardioTreanings,
    required super.useIceTreanings,
    required super.useStrengthTraining,
    required super.useRockTraining,
  });

  Map<String, dynamic> toJson() => {
        'useGymTreanings': useGymTreanings,
        'useCardioTreanings': useCardioTreanings,
        'useIceTreanings': useIceTreanings,
        'useStrengthTraining': useStrengthTraining,
        'useRockTraining': useRockTraining,
      };

  factory TreaningsSettingsModel.fromJson(Map<String, dynamic> json) =>
      TreaningsSettingsModel(
        useCardioTreanings: json['useCardioTreanings'],
        useIceTreanings: json['useIceTreanings'],
        useStrengthTraining: json['useStrengthTraining'],
        useGymTreanings: json['useGymTreanings'],
        useRockTraining: json['useRockTraining'] ?? true,
      );

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
      );
    }
  }
}

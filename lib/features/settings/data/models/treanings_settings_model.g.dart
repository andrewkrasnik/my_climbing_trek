// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'treanings_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreaningsSettingsModel _$TreaningsSettingsModelFromJson(
        Map<String, dynamic> json) =>
    TreaningsSettingsModel(
      useGymTreanings: json['useGymTreanings'] as bool,
      useCardioTreanings: json['useCardioTreanings'] as bool,
      useIceTreanings: json['useIceTreanings'] as bool,
      useStrengthTraining: json['useStrengthTraining'] as bool,
      useRockTraining: json['useRockTraining'] as bool,
      useTraveling: json['useTraveling'] as bool?,
      useMountaineering: json['useMountaineering'] as bool?,
      useTrekking: json['useTrekking'] as bool?,
      useTechniques: json['useTechniques'] as bool?,
    );

Map<String, dynamic> _$TreaningsSettingsModelToJson(
        TreaningsSettingsModel instance) =>
    <String, dynamic>{
      'useGymTreanings': instance.useGymTreanings,
      'useCardioTreanings': instance.useCardioTreanings,
      'useIceTreanings': instance.useIceTreanings,
      'useStrengthTraining': instance.useStrengthTraining,
      'useRockTraining': instance.useRockTraining,
      'useMountaineering': instance.useMountaineering,
      'useTraveling': instance.useTraveling,
      'useTrekking': instance.useTrekking,
      'useTechniques': instance.useTechniques,
    };

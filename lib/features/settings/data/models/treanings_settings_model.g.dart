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
      useMountaineering: json['useMountaineering'] as bool?,
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
    };

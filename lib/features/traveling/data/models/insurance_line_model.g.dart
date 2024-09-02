// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceLineModel _$InsuranceLineModelFromJson(Map<String, dynamic> json) =>
    InsuranceLineModel(
      travelId: json['travelId'] as String,
      number: json['number'] as String,
      id: json['id'] as String? ?? '',
      insurer: json['insurer'] as String,
      description: json['description'] as String,
      contacts: _$JsonConverterFromJson<String, List<ContactLine>>(
          json['contacts'], const ContactsConverter().fromJson),
      insurant: json['insurant'] as String? ?? '',
    );

Map<String, dynamic> _$InsuranceLineModelToJson(InsuranceLineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'insurer': instance.insurer,
      'number': instance.number,
      'insurant': instance.insurant,
      'description': instance.description,
      'contacts': const ContactsConverter().toJson(instance.contacts),
      'travelId': instance.travelId,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

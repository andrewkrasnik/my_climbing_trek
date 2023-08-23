// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactLineModel _$ContactLineModelFromJson(Map<String, dynamic> json) =>
    ContactLineModel(
      type: const ContactTypeConverter().fromJson(json['type'] as String),
      data: json['data'] as String,
      description: json['description'] as String? ?? '',
      id: json['id'] as String? ?? '',
    );

Map<String, dynamic> _$ContactLineModelToJson(ContactLineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': const ContactTypeConverter().toJson(instance.type),
      'data': instance.data,
      'description': instance.description,
    };

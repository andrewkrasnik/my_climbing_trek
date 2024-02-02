// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicationModel _$PublicationModelFromJson(Map<String, dynamic> json) =>
    PublicationModel(
      title: json['title'] as String,
      content: json['content'] as String,
      date: DateTime.parse(json['date'] as String),
      titleImage: json['titleImage'] as String,
    );

Map<String, dynamic> _$PublicationModelToJson(PublicationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'titleImage': instance.titleImage,
      'content': instance.content,
      'date': instance.date.toIso8601String(),
    };

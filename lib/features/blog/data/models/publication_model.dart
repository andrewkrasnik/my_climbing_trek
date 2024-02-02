import 'package:my_climbing_trek/features/blog/domain/entities/publication.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'publication_model.g.dart';

@JsonSerializable()
class PublicationModel extends Publication {
  PublicationModel({
    required super.title,
    required super.content,
    required super.date,
    required super.titleImage,
  });
}

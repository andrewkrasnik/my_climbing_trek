import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/blog/data/datasources/publications_remote_datasource.dart';
import 'package:my_climbing_trek/features/blog/domain/entities/publication.dart';
import 'package:my_climbing_trek/features/blog/domain/entities/publications_filter.dart';

@LazySingleton(as: PublicationRemoteDataSource)
class MockPublicationRemoteDataSource implements PublicationRemoteDataSource {
  final _publications = [
    Publication(
      title: 'Test1',
      content: 'Test1',
      date: DateTime(2024, 1, 29),
      titleImage:
          'https://alpfederation.ru/media/cache/news_avatar/uploads/images/32/55/65b1ca1c97e89.jpg',
    ),
    Publication(
      title: 'Test3',
      content: 'Test3',
      date: DateTime(2024, 1, 29),
      titleImage:
          'https://alpfederation.ru/media/cache/news_avatar/uploads/images/32/55/65b1ca1c97e89.jpg',
    ),
    Publication(
      title: 'Test2',
      content: 'Test2',
      date: DateTime(2024, 1, 29),
      titleImage:
          'https://alpfederation.ru/media/cache/news_avatar/uploads/images/32/55/65b1ca1c97e89.jpg',
    ),
    Publication(
      title: 'Test4',
      content: 'Test4',
      date: DateTime(2024, 1, 29),
      titleImage:
          'https://alpfederation.ru/media/cache/news_avatar/uploads/images/32/55/65b1ca1c97e89.jpg',
    ),
  ];

  final _streamController =
      StreamController<Either<Failure, List<Publication>>>();

  @override
  Future<Either<Failure, Stream<Either<Failure, List<Publication>>>>>
      getPublications({PublicationFilter? filter}) async {
    Future.delayed(const Duration(seconds: 1)).then(
      (_) {
        _streamController.sink.add(Right(_publications));
      },
    );
    return Right(_streamController.stream);
  }
}

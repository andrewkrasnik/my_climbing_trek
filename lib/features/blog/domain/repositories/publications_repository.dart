import 'package:dartz/dartz.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/blog/domain/entities/publication.dart';
import 'package:my_climbing_trek/features/blog/domain/entities/publications_filter.dart';

abstract class PublicationReporitory {
  Future<Either<Failure, Stream<Either<Failure, List<Publication>>>>>
      getPublications({PublicationFilter? filter});
}

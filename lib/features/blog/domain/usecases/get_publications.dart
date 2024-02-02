import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/blog/domain/entities/publication.dart';
import 'package:my_climbing_trek/features/blog/domain/repositories/publications_repository.dart';

@LazySingleton()
class GetPublications {
  final PublicationReporitory _publicationReporitory;

  GetPublications(this._publicationReporitory);

  Future<Either<Failure, Stream<Either<Failure, List<Publication>>>>>
      call() async {
    return await _publicationReporitory.getPublications();
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/blog/data/datasources/publications_remote_datasource.dart';
import 'package:my_climbing_trek/features/blog/domain/entities/publication.dart';
import 'package:my_climbing_trek/features/blog/domain/entities/publications_filter.dart';
import 'package:my_climbing_trek/features/blog/domain/repositories/publications_repository.dart';

@LazySingleton(as: PublicationReporitory)
class PublicationReporitoryImpl implements PublicationReporitory {
  final PublicationRemoteDataSource _publicationRemoteDataSource;

  PublicationReporitoryImpl(this._publicationRemoteDataSource);

  @override
  Future<Either<Failure, Stream<Either<Failure, List<Publication>>>>>
      getPublications({PublicationFilter? filter}) async {
    return _publicationRemoteDataSource.getPublications(filter: filter);
  }
}

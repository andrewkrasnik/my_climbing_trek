import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_path_repository.dart';

@LazySingleton()
class ContinueTrekUsecase {
  final TrekkingPathRepository _trekkingPathRepository;

  ContinueTrekUsecase(this._trekkingPathRepository);

  Future<Either<Failure, TrekkingPath>> call(
      {required TrekkingPath path}) async {
    final TrekkingPath newPath = TrekkingPath(
      date: DateTime.now(),
      region: path.region,
      type: path.type,
      trek: path.trek,
      currentSection: path.currentSection,
    );

    newPath.startTreaning();

    final failureOrUnit = await _trekkingPathRepository.savePath(path: newPath);

    return failureOrUnit.fold(
        (failure) => Left(failure), (_) => Right(newPath));
  }
}

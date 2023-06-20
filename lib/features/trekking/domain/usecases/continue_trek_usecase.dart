import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_section.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_path_repository.dart';

@LazySingleton()
class ContinueTrekUsecase {
  final TrekkingPathRepository _trekkingPathRepository;

  ContinueTrekUsecase(this._trekkingPathRepository);

  Future<Either<Failure, TrekkingPath>> call(
      {required TrekkingPath path, required bool turn}) async {
    final TrekSection? currentSection;
    if (path.trek != null && path.currentSection != null && path.turn != turn) {
      currentSection = turn
          ? path.trek!.previosSection(path.currentSectionStart)
          : path.trek!.nextSection(path.currentSectionStart);
    } else {
      currentSection = path.currentSection;
    }
    final TrekkingPath newPath = TrekkingPath(
      date: DateTime.now(),
      region: path.region,
      type: path.type,
      trek: path.trek,
      currentSection: currentSection,
      turn: turn,
    );

    newPath.startTreaning();

    final failureOrUnit = await _trekkingPathRepository.savePath(path: newPath);

    return failureOrUnit.fold(
        (failure) => Left(failure), (_) => Right(newPath));
  }
}

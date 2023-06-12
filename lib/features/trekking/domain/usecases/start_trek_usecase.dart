import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_path_repository.dart';

@LazySingleton()
class StartTrekUsecase {
  final TrekkingPathRepository _trekkingPathRepository;

  StartTrekUsecase(this._trekkingPathRepository);

  Future<Either<Failure, TrekkingPath>> call(
      {required Trek trek, TrekkingType? type}) async {
    final TrekkingPath path = TrekkingPath(
      date: DateTime.now(),
      region: trek.region,
      type: type ?? trek.type,
      trek: trek,
      currentSection: trek.sections.firstOrNull,
    );

    path.startTreaning();

    final failureOrUnit = await _trekkingPathRepository.savePath(path: path);

    return failureOrUnit.fold((failure) => Left(failure), (_) => Right(path));
  }
}

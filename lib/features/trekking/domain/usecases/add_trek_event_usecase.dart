import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek_point.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_event_type.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_path_repository.dart';

@LazySingleton()
class AddTrekEventUsecase {
  final TrekkingPathRepository _trekkingPathRepository;

  AddTrekEventUsecase(this._trekkingPathRepository);

  Future<Either<Failure, TrekkingPathEvent>> call({
    required TrekkingPath path,
    required TrekkingEventType type,
    DateTime? time,
    TrekPoint? point,
  }) async {
    final TrekkingPathEvent event = TrekkingPathEvent(
      path: path,
      time: time ?? DateTime.now(),
      type: type,
      point: point,
    );

    final failureOrUnit =
        await _trekkingPathRepository.savePathEvent(event: event);

    return failureOrUnit.fold((failure) => Left(failure), (_) => Right(event));
  }
}

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trekking_path_event.dart';
import 'package:my_climbing_trek/features/trekking/domain/repositories/trekking_path_repository.dart';

@LazySingleton()
class SaveTrekEventUsecase {
  final TrekkingPathRepository _trekkingPathRepository;

  SaveTrekEventUsecase(this._trekkingPathRepository);

  Future<Either<Failure, Unit>> call({required TrekkingPathEvent event}) async {
    return await _trekkingPathRepository.savePathEvent(event: event);
  }
}
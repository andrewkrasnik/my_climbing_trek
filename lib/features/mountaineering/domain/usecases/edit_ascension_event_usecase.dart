import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/entities/ascension_event.dart';
import 'package:my_climbing_trek/features/mountaineering/domain/repositories/ascension_repository.dart';

@LazySingleton()
class EditAscensionEventUsecase {
  final AscensionRepository _ascensionRepository;

  EditAscensionEventUsecase(this._ascensionRepository);

  Future<Either<Failure, Unit>> call({
    required AscensionEvent event,
    DateTime? time,
    DateTime? planedTime,
  }) async {
    if (time != null) {
      event.time = time;
    }

    if (planedTime != null) {
      event.planedTime = planedTime;
    }

    return _ascensionRepository.saveAscentionEvent(event: event);
  }
}

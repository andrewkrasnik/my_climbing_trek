import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/stay_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class EditDayLineUsecase {
  final TravelRepository _travelRepository;

  EditDayLineUsecase(this._travelRepository);

  Future<Either<Failure, Unit>> call({
    required String travelId,
    required DateTime date,
    required int number,
    String description = '',
    String id = '',
    DateTime? start,
    List<TransportLine>? transportLines,
    List<FeedingLine>? feedingsLines,
    List<StayLine>? stayLines,
  }) async {
    final line = TravelDay(
      date: date,
      number: number,
      feedingsLines: feedingsLines,
      start: start,
      stayLines: stayLines,
      transportLines: transportLines,
      travelId: travelId,
      description: description,
      id: id,
    );

    return await _travelRepository.editTravelDay(line: line);
  }
}

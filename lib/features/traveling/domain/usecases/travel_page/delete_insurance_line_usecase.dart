import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class DeleteInsuranceLineUsecase {
  final TravelRepository _travelRepository;

  DeleteInsuranceLineUsecase(this._travelRepository);

  Future<Either<Failure, Unit>> call({
    required InsuranceLine line,
  }) async {
    return await _travelRepository.deleteInsuranceLine(line: line);
  }
}

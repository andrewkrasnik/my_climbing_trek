import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class GetInsuranceLineUsecase {
  final TravelRepository _travelRepository;

  GetInsuranceLineUsecase(this._travelRepository);

  Future<Either<Failure, List<InsuranceLine>>> call(
      {required Travel travel}) async {
    return await _travelRepository.getInsuranceLines(travel: travel);
  }
}

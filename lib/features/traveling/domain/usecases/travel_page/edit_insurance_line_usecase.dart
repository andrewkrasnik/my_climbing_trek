import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/contact_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/repositories/travel_repository.dart';

@LazySingleton()
class EditInsuranceLineUsecase {
  final TravelRepository _travelRepository;

  EditInsuranceLineUsecase(this._travelRepository);

  Future<Either<Failure, Unit>> call({
    required String insurer,
    required String number,
    required String insurant,
    required Travel travel,
    required String description,
    List<ContactLine>? contacts,
    String id = '',
  }) async {
    final line = InsuranceLine(
      insurer: insurer,
      contacts: contacts,
      insurant: insurant,
      number: number,
      travelId: travel.id,
      description: description,
      id: id,
    );

    return await _travelRepository.editInsuranceLine(line: line);
  }
}

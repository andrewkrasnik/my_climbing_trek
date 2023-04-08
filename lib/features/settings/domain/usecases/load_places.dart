import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/settings/domain/repositories/places_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoadPlaces {
  final PlacesRepository _placesRepository;

  LoadPlaces(this._placesRepository);

  Future<Either<Failure, Unit>> call() async {
    return await _placesRepository.loadPlaces();
  }
}

import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_regions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class LoadDistrictsUseCase {
  final IceRegionsRepository iceRegionsRepository;

  LoadDistrictsUseCase({
    required this.iceRegionsRepository,
  });

  Future<Either<Failure, List<IceDistrict>>> call() async {
    return await iceRegionsRepository.getDistricts();
  }
}

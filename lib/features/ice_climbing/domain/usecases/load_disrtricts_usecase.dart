import 'package:climbing_diary/core/failures/failure.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/repositories/ice_regions_repository.dart';
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

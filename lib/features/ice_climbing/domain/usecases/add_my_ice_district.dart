import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/repositories/ice_regions_repository.dart';

@LazySingleton()
class AddMyIceDistrict {
  final IceRegionsRepository _iceRegionsRepository;

  AddMyIceDistrict(this._iceRegionsRepository);

  Future<Either<Failure, Unit>> call({required IceDistrict district}) async {
    return await _iceRegionsRepository.addMyDistrict(district: district);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/delete_rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/load_rock_sectors.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/save_rock_sector.dart';

part 'rock_sectors_state.dart';
part 'rock_sectors_cubit.freezed.dart';

@Injectable()
class RockSectorsCubit extends Cubit<RockSectorsState> {
  final LoadRockSectors _loadRockSectors;
  final DeleteRockSector _deleteRockSector;
  final SaveRockSector _saveRockSector;

  RockSectorsCubit(
    this._loadRockSectors,
    this._deleteRockSector,
    this._saveRockSector,
  ) : super(const RockSectorsState.initial());

  Future<void> loadData({required RockDistrict district}) async {
    emit(const RockSectorsState.loading());
    final failureOrSectors = await _loadRockSectors(district: district);

    failureOrSectors.fold(
        (failure) =>
            emit(RockSectorsState.error(description: failure.toString())),
        (sectors) => emit(RockSectorsState.data(sectors: sectors)));
  }

  Future<void> save({
    required RockDistrict district,
    required String name,
    required String id,
    required String image,
    required bool hasBouldering,
    required bool hasRope,
    required bool hasTrad,
    required bool hasDryTooling,
    required bool hasAid,
  }) async {
    emit(const RockSectorsState.loading());

    final failureOrUnit = await _saveRockSector(
      district: district,
      name: name,
      hasAid: hasAid,
      hasBouldering: hasBouldering,
      hasDryTooling: hasDryTooling,
      hasRope: hasRope,
      hasTrad: hasTrad,
      id: id,
      image: image,
    );

    failureOrUnit.fold(
      (failure) =>
          emit(RockSectorsState.error(description: failure.toString())),
      (statistic) => loadData(
        district: district,
      ),
    );
  }

  Future<void> delete({
    required RockDistrict district,
    required RockSector sector,
  }) async {
    emit(const RockSectorsState.loading());

    final failureOrUnit = await _deleteRockSector(
      district: district,
      sector: sector,
    );

    failureOrUnit.fold(
      (failure) =>
          emit(RockSectorsState.error(description: failure.toString())),
      (statistic) => loadData(
        district: district,
      ),
    );
  }
}

import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/delete_sector_usecase.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/load_sectors_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/ice_climbing/domain/usecases/save_sector_usecase.dart';

part 'ice_sectors_state.dart';
part 'ice_sectors_cubit.freezed.dart';

@Injectable()
class IceSectorsCubit extends Cubit<IceSectorsState> {
  final LoadSectorsUseCase _loadSectorsUseCase;
  final SaveSectorUseCase _saveSectorUseCase;
  final DeleteSectorUseCase _deleteSectorUseCase;

  IceSectorsCubit(
    this._loadSectorsUseCase,
    this._saveSectorUseCase,
    this._deleteSectorUseCase,
  ) : super(const IceSectorsState.initial());

  Future<void> loadData({required IceDistrict district}) async {
    emit(const IceSectorsState.loading());

    final failureOrSectors = await _loadSectorsUseCase(district: district);

    failureOrSectors.fold(
        (failure) =>
            emit(IceSectorsState.error(description: failure.toString())),
        (sectors) => emit(IceSectorsState.data(sectors: sectors)));
  }

  Future<void> saveSector({
    required IceDistrict district,
    required String name,
    required String image,
    required String id,
    required bool waterfallIce,
    required bool glacierIce,
    required bool artificialIce,
    required String description,
    required int length,
    required IceCategory maxCategory,
  }) async {
    emit(const IceSectorsState.loading());

    final failureOrUnit = await _saveSectorUseCase(
      district: district,
      name: name,
      length: length,
      maxCategory: maxCategory,
      artificialIce: artificialIce,
      description: description,
      glacierIce: glacierIce,
      id: id,
      image: image,
      waterfallIce: waterfallIce,
    );

    failureOrUnit.fold(
      (failure) => emit(IceSectorsState.error(description: failure.toString())),
      (_) => loadData(district: district),
    );
  }

  Future<void> deleteSector({
    required IceDistrict district,
    required IceSector sector,
  }) async {
    emit(const IceSectorsState.loading());

    final failureOrUnit = await _deleteSectorUseCase(
      district: district,
      sector: sector,
    );

    failureOrUnit.fold(
      (failure) => emit(IceSectorsState.error(description: failure.toString())),
      (_) => loadData(district: district),
    );
  }
}

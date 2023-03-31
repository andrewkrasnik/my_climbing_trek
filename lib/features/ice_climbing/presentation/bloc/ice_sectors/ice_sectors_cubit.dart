import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_sector.dart';
import 'package:climbing_diary/features/ice_climbing/domain/usecases/load_sectors_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'ice_sectors_state.dart';
part 'ice_sectors_cubit.freezed.dart';

@Injectable()
class IceSectorsCubit extends Cubit<IceSectorsState> {
  final LoadSectorsUseCase loadSectorsUseCase;
  IceSectorsCubit({required this.loadSectorsUseCase})
      : super(const IceSectorsState.initial());

  Future<void> loadData({required IceDistrict district}) async {
    emit(const IceSectorsState.loading());
    final failureOrSectors = await loadSectorsUseCase(district: district);
    failureOrSectors.fold(
        (failure) =>
            emit(IceSectorsState.error(description: failure.toString())),
        (sectors) => emit(IceSectorsState.data(sectors: sectors)));
  }
}

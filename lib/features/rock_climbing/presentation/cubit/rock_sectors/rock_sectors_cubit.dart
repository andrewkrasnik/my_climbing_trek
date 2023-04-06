import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/load_rock_sectors.dart';

part 'rock_sectors_state.dart';
part 'rock_sectors_cubit.freezed.dart';

@Injectable()
class RockSectorsCubit extends Cubit<RockSectorsState> {
  final LoadRockSectors _loadRockSectors;

  RockSectorsCubit(this._loadRockSectors)
      : super(const RockSectorsState.initial());

  Future<void> loadData({required RockDistrict district}) async {
    emit(const RockSectorsState.loading());
    final failureOrSectors = await _loadRockSectors(district: district);

    failureOrSectors.fold(
        (failure) =>
            emit(RockSectorsState.error(description: failure.toString())),
        (sectors) => emit(RockSectorsState.data(sectors: sectors)));
  }
}

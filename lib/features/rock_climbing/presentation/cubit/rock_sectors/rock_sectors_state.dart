part of 'rock_sectors_cubit.dart';

@freezed
class RockSectorsState with _$RockSectorsState {
  const factory RockSectorsState.initial() = _Initial;
  const factory RockSectorsState.loading() = _Loading;
  const factory RockSectorsState.data({required List<RockSector> sectors}) =
      _Data;
  const factory RockSectorsState.error({required String description}) = _Error;
}

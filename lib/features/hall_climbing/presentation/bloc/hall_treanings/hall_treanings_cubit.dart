import 'package:my_climbing_trek/core/data/treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_treaning.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'hall_treanings_state.dart';
part 'hall_treanings_cubit.freezed.dart';

@Injectable()
class HallTreaningsCubit extends Cubit<HallTreaningsState> {
  final AllHallTreanings allHallTreanings;
  final DeleteHallTreaning deleteHallTreaning;
  HallTreaningsCubit({
    required this.allHallTreanings,
    required this.deleteHallTreaning,
  }) : super(const HallTreaningsState.initial());

  Future<void> loadData() async {
    emit(const HallTreaningsState.loading());
    final failureOrTreanings = await allHallTreanings();
    failureOrTreanings.fold((failure) => null,
        (treanings) => emit(HallTreaningsState.data(treanings: treanings)));
  }

  Future<void> deleteTreaning({required Treaning treaning}) async {
    // final failureOrUnit = await deleteHallTreaning(treaning: treaning);
    // failureOrUnit.fold((failure) => null, (_) => loadData());
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/region.dart';
import 'package:my_climbing_trek/features/trekking/domain/entities/trek.dart';
import 'package:my_climbing_trek/features/trekking/domain/usecases/get_treks.dart';

part 'treks_state.dart';
part 'treks_cubit.freezed.dart';

@Injectable()
class TreksCubit extends Cubit<TreksState> {
  final GetTreks _getTreks;
  TreksCubit(this._getTreks) : super(const TreksState.initial());

  Future<void> loadData({required Region region}) async {
    emit(const TreksState.loading());
    final failureOrTreks = await _getTreks(region: region);
    failureOrTreks.fold(
        (failure) => emit(TreksState.error(description: failure.toString())),
        (treks) => emit(TreksState.data(treks: treks)));
  }
}

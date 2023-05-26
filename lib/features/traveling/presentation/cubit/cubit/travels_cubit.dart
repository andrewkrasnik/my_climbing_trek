import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/get_travels_usecase.dart';

part 'travels_state.dart';
part 'travels_cubit.freezed.dart';

@Injectable()
class TravelsCubit extends Cubit<TravelsState> {
  final GetTravelsUsecase _getTravelsUsecase;

  TravelsCubit(this._getTravelsUsecase) : super(const TravelsState.initial());

  Future<void> loadData() async {
    emit(const TravelsState.loading());
    final failureOrTravels = await _getTravelsUsecase();
    failureOrTravels.fold(
        (failure) => emit(TravelsState.error(description: failure.toString())),
        (travels) => emit(TravelsState.data(travels: travels)));
  }
}

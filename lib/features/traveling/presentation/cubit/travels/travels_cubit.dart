import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/add_travel_usecase.dart';
import 'package:my_climbing_trek/features/traveling/domain/usecases/get_travels_usecase.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/add_travel_interface.dart';

part 'travels_state.dart';
part 'travels_cubit.freezed.dart';

@Injectable()
class TravelsCubit extends Cubit<TravelsState> implements AddTravelInterface {
  final GetTravelsUsecase _getTravelsUsecase;
  final AddTravelUsecase _addTravelUsecase;

  TravelsCubit(
    this._getTravelsUsecase,
    this._addTravelUsecase,
  ) : super(const TravelsState.initial());

  Future<void> loadData() async {
    emit(const TravelsState.loading());

    final failureOrTravels = await _getTravelsUsecase();
    failureOrTravels.fold(
        (failure) => emit(TravelsState.error(description: failure.toString())),
        (travels) => emit(TravelsState.data(travels: travels)));
  }

  Future<void> loadPlanedData() async {
    emit(const TravelsState.loading());
    final failureOrTravels =
        await _getTravelsUsecase(status: TravelStatus.planed);

    failureOrTravels.fold(
        (failure) => emit(TravelsState.error(description: failure.toString())),
        (travels) => emit(TravelsState.data(travels: travels)));
  }

  @override
  Future<void> addTravel({
    required String name,
    required String description,
    required String image,
    DateTime? date,
    DateTime? start,
    DateTime? finish,
    Travel? travel,
  }) async {
    final failureOrTravel = await _addTravelUsecase(
      name: name,
      description: description,
      image: image,
      date: date,
      finish: finish,
      start: start,
    );

    failureOrTravel.fold(
        (failure) => emit(TravelsState.error(description: failure.toString())),
        (_) => loadData());
  }
}

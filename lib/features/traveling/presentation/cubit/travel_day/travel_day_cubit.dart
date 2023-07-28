import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/stay_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/transport_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';

part 'travel_day_state.dart';
part 'travel_day_cubit.freezed.dart';

@Injectable()
class TravelDayCubit extends Cubit<TravelDayState> {
  TravelDayCubit() : super(TravelDayState.initial());

  void loadData({required TravelDay day}) {
    emit(
      TravelDayState(
        description: day.description,
        transportLines: day.transportLines,
        feedingsLines: day.feedingsLines,
        stayLines: day.stayLines,
        loading: false,
        errorMessage: '',
      ),
    );
  }

  void clearErrorMessage() {
    emit(state.copyWith(errorMessage: ''));
  }
}

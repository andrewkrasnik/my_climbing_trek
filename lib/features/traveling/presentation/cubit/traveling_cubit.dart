import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'traveling_state.dart';

class TravelingCubit extends Cubit<TravelingState> {
  TravelingCubit() : super(TravelingInitial());
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'cardio_workout_state.dart';

class CardioWorkoutCubit extends Cubit<CardioWorkoutState> {
  CardioWorkoutCubit() : super(CardioWorkoutInitial());
}

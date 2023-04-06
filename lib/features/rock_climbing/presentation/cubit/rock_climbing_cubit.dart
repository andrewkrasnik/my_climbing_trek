import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'rock_climbing_state.dart';

class RockClimbingCubit extends Cubit<RockClimbingState> {
  RockClimbingCubit() : super(RockClimbingInitial());
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ice_climbing_state.dart';

class IceClimbingCubit extends Cubit<IceClimbingState> {
  IceClimbingCubit() : super(IceClimbingInitial());
}

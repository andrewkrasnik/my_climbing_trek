import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mountaineering_event.dart';
part 'mountaineering_state.dart';

class MountaineeringBloc extends Bloc<MountaineeringEvent, MountaineeringState> {
  MountaineeringBloc() : super(MountaineeringInitial()) {
    on<MountaineeringEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

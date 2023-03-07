import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'strength_training_state.dart';

class StrengthTrainingCubit extends Cubit<StrengthTrainingState> {
  StrengthTrainingCubit() : super(StrengthTrainingInitial());
}

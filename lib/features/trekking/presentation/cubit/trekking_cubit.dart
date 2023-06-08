import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trekking_state.dart';

class TrekkingCubit extends Cubit<TrekkingState> {
  TrekkingCubit() : super(TrekkingInitial());
}

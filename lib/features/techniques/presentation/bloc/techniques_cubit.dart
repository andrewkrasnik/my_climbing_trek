import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'techniques_state.dart';

class TechniquesCubit extends Cubit<TechniquesState> {
  TechniquesCubit() : super(TechniquesInitial());
}

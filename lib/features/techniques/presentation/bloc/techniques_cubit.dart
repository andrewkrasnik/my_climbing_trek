import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'techniques_state.dart';

@Injectable()
class TechniquesCubit extends Cubit<TechniquesState> {
  TechniquesCubit() : super(TechniquesInitial());
}

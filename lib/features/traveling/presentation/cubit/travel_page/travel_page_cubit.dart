import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'travel_page_state.dart';
part 'travel_page_cubit.freezed.dart';

@Injectable()
class TravelPageCubit extends Cubit<TravelPageState> {
  TravelPageCubit() : super(TravelPageState.initial());

  void selectTab({required int tabIndex}) {
    emit(state.copyWith(tabIndex: tabIndex));
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/insurance_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_budget_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel_day.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/add_travel_interface.dart';

part 'travel_page_state.dart';
part 'travel_page_cubit.freezed.dart';

@Injectable()
class TravelPageCubit extends Cubit<TravelPageState>
    implements AddTravelInterface {
  TravelPageCubit() : super(TravelPageState.initial());

  void selectTab({required int tabIndex}) {
    emit(state.copyWith(tabIndex: tabIndex));
  }

  @override
  Future<void> addTravel(
      {required String name,
      required String description,
      required String image,
      DateTime? date,
      DateTime? start,
      DateTime? finish}) {
    // TODO: implement addTravel
    throw UnimplementedError();
  }
}

import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_district.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning.dart';
import 'package:climbing_diary/features/ice_climbing/domain/entities/ice_treaning_attempt.dart';
import 'package:climbing_diary/features/ice_climbing/domain/usecases/new_ice_treaning.dart';

part 'current_ice_treaning_cubit.freezed.dart';
part 'current_ice_treaning_state.dart';

@Injectable()
class CurrentIceTreaningCubit extends Cubit<CurrentIceTreaningState> {
  final NewIceTreaning newIceTreaning;

  CurrentIceTreaningCubit(
    this.newIceTreaning,
  ) : super(CurrentIceTreaningState.initial());

  Future<void> addNewTreaning({required IceDistrict district}) async {
    final failureOrTreaning = await newIceTreaning(district: district);

    failureOrTreaning.fold((failure) => null,
        (treaning) => emit(state.copyWith(currentTreaning: treaning)));
  }
}

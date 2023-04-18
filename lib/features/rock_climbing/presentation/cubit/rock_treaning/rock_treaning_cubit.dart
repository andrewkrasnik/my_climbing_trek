import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/data/climbing_style.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_district.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_route_attempts_statistic.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_sector.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/entities/rock_treaning_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/finish_rock_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/finish_rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/get_current_rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/get_last_rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/get_rock_route_statistic.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/new_rock_attempt.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/new_rock_treaning.dart';
import 'package:my_climbing_trek/features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart';

part 'rock_treaning_state.dart';
part 'rock_treaning_cubit.freezed.dart';

@Injectable()
class RockTreaningCubit extends Cubit<RockTreaningState> {
  final NewRockTreaning _newTreaning;
  final NewRockAttempt _newAttempt;
  final RockSectorToTreaning _sectorToTreaning;
  final FinishRockAttempt _finishAttempt;
  final FinishRockTreaning _finishTreaning;
  final GetLastRockTreaning _getLastTreaning;
  final GetCurrentRockTreaning _getCurrentTreaning;
  final GetRockRouteStatistic _getRockRouteStatistic;

  RockTreaningCubit(
    this._newTreaning,
    this._sectorToTreaning,
    this._newAttempt,
    this._finishAttempt,
    this._finishTreaning,
    this._getLastTreaning,
    this._getCurrentTreaning,
    this._getRockRouteStatistic,
  ) : super(RockTreaningState.initial());

  Future<void> loadData() async {
    emit(RockTreaningState.initial());

    final failureOrCurrent = await _getCurrentTreaning();

    if (failureOrCurrent.isLeft()) {
      // emit(state)
    }

    final failureOrPrevios = await _getLastTreaning();

    if (failureOrPrevios.isLeft()) {
      // emit(state)
    }

    final currentTreaning =
        failureOrCurrent.fold((_) => null, (treaning) => treaning);

    final lastTreaning =
        failureOrPrevios.fold((_) => null, (treaning) => treaning);

    emit(state.copyWith(
      currentAttempt: currentTreaning?.currentAttempt,
      lastAttempt: currentTreaning?.lastAttempt,
      currentTreaning: currentTreaning,
      lastTreaning: lastTreaning,
    ));

    if (currentTreaning?.currentAttempt != null &&
        currentTreaning?.currentAttempt?.route != null) {
      final route = currentTreaning!.currentAttempt!.route!;
      final failureOrStatistic = await _getRockRouteStatistic(routes: [route]);

      failureOrStatistic.fold(
          (l) => null,
          (statistic) =>
              emit(state.copyWith(currentRouteStatistic: statistic[route])));
    }

    if (currentTreaning?.lastAttempt != null &&
        currentTreaning?.lastAttempt?.route != null) {
      final route = currentTreaning!.lastAttempt!.route!;
      final failureOrStatistic = await _getRockRouteStatistic(routes: [route]);

      failureOrStatistic.fold(
          (l) => null,
          (statistic) =>
              emit(state.copyWith(lastRouteStatistic: statistic[route])));
    }
  }

  Future<void> addNewTreaning({
    required RockDistrict district,
    required RockSector sector,
  }) async {
    final failureOrTreaning = await _newTreaning(
      district: district,
      sector: sector,
    );

    failureOrTreaning.fold((failure) => null,
        (treaning) => emit(state.copyWith(currentTreaning: treaning)));
  }

  Future<void> addRockSectorToTreaning({
    required RockSector sector,
    required RockDistrict district,
  }) async {
    final failureOrTreaning = await _sectorToTreaning(
      district: district,
      sector: sector,
      treaning: state.currentTreaning,
    );

    failureOrTreaning.fold((failure) => null,
        (treaning) => emit(state.copyWith(currentTreaning: treaning)));
  }

  Future<void> addAttempt({
    required RockSector sector,
    required ClimbingStyle style,
    required RockRoute route,
  }) async {
    if (state.currentTreaning != null) {
      final failureOrAttempt = await _newAttempt(
          treaning: state.currentTreaning!,
          sector: sector,
          category: route.category,
          route: route,
          style: style);

      failureOrAttempt.fold((failure) => null, (attempt) async {
        emit(state.copyWith(currentAttempt: attempt));
        if (attempt.route != null) {
          final route = attempt.route!;
          final failureOrStatistic =
              await _getRockRouteStatistic(routes: [route]);

          failureOrStatistic.fold(
              (l) => null,
              (statistic) => emit(
                  state.copyWith(currentRouteStatistic: statistic[route])));
        }
      });
    }
  }

  Future<void> startAttempt({required RockTreaningAttempt attempt}) async {}

  Future<void> finishCurrentAttempt({
    required bool fail,
    required bool downClimbing,
    required int fallCount,
    required int suspensionCount,
  }) async {
    final route = state.currentAttempt?.route;

    final failureOrAttempt = await _finishAttempt(
      attempt: state.currentAttempt!,
      treaning: state.currentTreaning!,
      fail: fail,
      downClimbing: downClimbing,
      fallCount: fallCount,
      suspensionCount: suspensionCount,
    );

    failureOrAttempt.fold(
        (failure) => null,
        (attempt) =>
            emit(state.copyWith(currentAttempt: null, lastAttempt: attempt)));

    if (route != null) {
      final failureOrStatistic = await _getRockRouteStatistic(routes: [route]);
      failureOrStatistic.fold(
        (l) => null,
        (statistic) {
          if (statistic.isNotEmpty) {
            emit(
              state.copyWith(
                lastRouteStatistic: statistic[route],
              ),
            );
          }
        },
      );
    }
  }

  Future<void> deleteAttempt({required RockTreaningAttempt attempt}) async {}

  Future<void> finishTreaning() async {
    if (state.currentAttempt == null) {
      final failureOrTreaning =
          await _finishTreaning(treaning: state.currentTreaning!);

      failureOrTreaning.fold(
        (failure) => null,
        (treaning) => emit(state.copyWith(
          currentTreaning: null,
          lastTreaning: treaning,
          lastAttempt: null,
          currentRouteStatistic: null,
          lastRouteStatistic: null,
        )),
      );
    }
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/datasource/drift_db_local_datasource.dart' as _i7;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i44;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i45;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i47;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i46;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i51;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i64;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i67;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i78;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i85;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i86;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i10;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i11;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i6;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i13;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i5;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i42;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i8;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i66;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i9;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i25;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i43;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i50;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i52;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i53;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i58;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i59;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i20;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i23;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i24;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i26;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i38;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i48;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i49;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i87;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i72;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i71;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i73;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i74;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i14;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i17;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i16;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i19;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i15;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i18;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i60;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i61;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i76;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i21;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i22;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i27;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i28;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i88;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i75;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i77;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i29;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i31;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i35;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i30;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i34;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i33;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i37;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i32;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i36;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i40;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i41;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i54;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i55;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i56;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i62;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i65;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i68;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i69;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i70;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i79;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i80;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i39;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i81;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i82;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i83;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i57;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i63;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i84; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.ClimbingHallDataSource>(
      () => _i4.LocalClimbingHallDataSource());
  gh.lazySingleton<_i5.ClimbingHallRepository>(() =>
      _i6.ClimbingHallRepositoryImpl(
          climbingHallDataSource: get<_i3.ClimbingHallDataSource>()));
  gh.lazySingleton<_i7.DriftDBLocalDataSource>(
      () => _i7.DriftDBLocalDataSource());
  gh.lazySingleton<_i8.GetClimbingHallRoures>(
      () => _i8.GetClimbingHallRoures(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i9.HallRouteToArchive>(() =>
      _i9.HallRouteToArchive(repository: get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i10.HallTreaningDataSource>(() =>
      _i11.LocalHallTreaningDataSource(
          localDatabase: get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i12.HallTreaningRepository>(
      () => _i13.HallTreaningRepositoryImpl(
            dataSource: get<_i10.HallTreaningDataSource>(),
            hallDataSource: get<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i14.IceRegionsDataSource>(
      () => _i14.MockIceRegionsDataSource());
  gh.lazySingleton<_i15.IceRegionsRepository>(() =>
      _i16.IceRegionsRepositoryImpl(
          iceRegionsDataSource: get<_i14.IceRegionsDataSource>()));
  gh.lazySingleton<_i17.IceTreaningsDataSource>(
      () => _i17.MockIceTreaningsDataSource());
  gh.lazySingleton<_i18.IceTreaningsRepository>(() =>
      _i19.IceTreaningsRepositoryImpl(get<_i17.IceTreaningsDataSource>()));
  gh.lazySingleton<_i20.LastHallTreaning>(
      () => _i20.LastHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i21.LoadDistrictsUseCase>(() => _i21.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i15.IceRegionsRepository>()));
  gh.lazySingleton<_i22.LoadSectorsUseCase>(() => _i22.LoadSectorsUseCase(
      iceRegionsRepository: get<_i15.IceRegionsRepository>()));
  gh.lazySingleton<_i23.NewHallAttempt>(() => _i23.NewHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i24.NewHallAttemptFromRoute>(() =>
      _i24.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i25.NewHallRoute>(() => _i25.NewHallRoute(
      climbingHallRepository: get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i26.NewHallTreaning>(() => _i26.NewHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i27.NewIceAttempt>(
      () => _i27.NewIceAttempt(get<_i18.IceTreaningsRepository>()));
  gh.lazySingleton<_i28.NewIceTreaning>(() => _i28.NewIceTreaning(
        iceTreaningsRepository: get<_i18.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i15.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i29.SettingsCubit>(() => _i29.SettingsCubit());
  gh.lazySingleton<_i30.StrengthExerciseDataSource>(() =>
      _i31.LocalStrengthExerciseDataSource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i32.StrengthExerciseRepository>(() =>
      _i33.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i30.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i34.StrengthTreaningsDataSource>(() =>
      _i35.LocalStrengthTreaningsDataSource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i36.StrengthTreaningsRepository>(() =>
      _i37.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i34.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i38.UpdateHalls>(
      () => _i38.UpdateHalls(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i39.UpdateStrengthTreaningExercises>(() =>
      _i39.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i36.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i32.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i40.AddRepetitionForStrengthTreaning>(() =>
      _i40.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i36.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i41.AddStrengthTreaning>(() => _i41.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i36.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i32.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i42.AllClimbingHalls>(
      () => _i42.AllClimbingHalls(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i43.AllHallTreanings>(
      () => _i43.AllHallTreanings(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i44.CardioTreaningsDatasource>(() =>
      _i45.LocalCardioTreaningsDatasource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i46.CardioTreaningsRepository>(() =>
      _i47.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i44.CardioTreaningsDatasource>()));
  gh.factory<_i48.ClimbingHallCubit>(() => _i48.ClimbingHallCubit(
        getClimbingHallRoures: get<_i8.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i9.HallRouteToArchive>(),
      ));
  gh.factory<_i49.ClimbingHallsCubit>(() =>
      _i49.ClimbingHallsCubit(allClimbingHalls: get<_i42.AllClimbingHalls>()));
  gh.lazySingleton<_i50.CurrentHallTreaning>(
      () => _i50.CurrentHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i51.DeleteCardioTreaning>(() => _i51.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i46.CardioTreaningsRepository>()));
  gh.lazySingleton<_i52.DeleteHallAttempt>(() => _i52.DeleteHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i53.DeleteHallTreaning>(() => _i53.DeleteHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i54.DeleteRepetitionForStrengthTreaning>(() =>
      _i54.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i36.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i55.DeleteStrengthExercise>(() =>
      _i55.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i32.StrengthExerciseRepository>()));
  gh.lazySingleton<_i56.DeleteStrengthTreaning>(() =>
      _i56.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i36.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i57.DeleteTreaning>(() => _i57.DeleteTreaning(
        get<_i12.HallTreaningRepository>(),
        get<_i18.IceTreaningsRepository>(),
        get<_i36.StrengthTreaningsRepository>(),
        get<_i46.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i58.FinishHallAttempt>(() => _i58.FinishHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i59.FinishHallTreaning>(() => _i59.FinishHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i60.FinishIceAttempt>(
      () => _i60.FinishIceAttempt(get<_i18.IceTreaningsRepository>()));
  gh.lazySingleton<_i61.FinishIceTreaning>(() => _i61.FinishIceTreaning(
      iceTreaningsRepository: get<_i18.IceTreaningsRepository>()));
  gh.lazySingleton<_i62.FinishStrengthTreaning>(() =>
      _i62.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i36.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i63.GetAllTreanings>(() => _i63.GetAllTreanings(
        get<_i12.HallTreaningRepository>(),
        get<_i18.IceTreaningsRepository>(),
        get<_i36.StrengthTreaningsRepository>(),
        get<_i46.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i64.GetCardioTreanings>(() => _i64.GetCardioTreanings(
      cardioTreaningsRepository: get<_i46.CardioTreaningsRepository>()));
  gh.lazySingleton<_i65.GetCurrentStrengthTreaning>(() =>
      _i65.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i36.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i66.GetHallRouteAttempts>(() => _i66.GetHallRouteAttempts(
      repository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i67.GetLastCardioTreaning>(() => _i67.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i46.CardioTreaningsRepository>()));
  gh.lazySingleton<_i68.GetPreviosStrengthTreaning>(() =>
      _i68.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i36.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i69.GetStrengthExercises>(() => _i69.GetStrengthExercises(
      strengthExerciseRepository: get<_i32.StrengthExerciseRepository>()));
  gh.lazySingleton<_i70.GetStrengthTreanings>(() => _i70.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i36.StrengthTreaningsRepository>()));
  gh.factory<_i71.HallRouteAttemptsCubit>(() => _i71.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i66.GetHallRouteAttempts>()));
  gh.factory<_i72.HallRouteCubit>(
      () => _i72.HallRouteCubit(get<_i25.NewHallRoute>()));
  gh.factory<_i73.HallTreaningsCubit>(() => _i73.HallTreaningsCubit(
        allHallTreanings: get<_i43.AllHallTreanings>(),
        deleteHallTreaning: get<_i53.DeleteHallTreaning>(),
      ));
  gh.factory<_i74.HomePageCubit>(
      () => _i74.HomePageCubit(allClimbingHalls: get<_i42.AllClimbingHalls>()));
  gh.factory<_i75.IceDistrictsCubit>(() => _i75.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i21.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i76.IceSectorToTreaning>(() => _i76.IceSectorToTreaning(
      iceTreaningsRepository: get<_i18.IceTreaningsRepository>()));
  gh.factory<_i77.IceSectorsCubit>(() =>
      _i77.IceSectorsCubit(loadSectorsUseCase: get<_i22.LoadSectorsUseCase>()));
  gh.lazySingleton<_i78.SaveCardioTreaning>(() => _i78.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i46.CardioTreaningsRepository>()));
  gh.lazySingleton<_i79.SaveStrengthExercise>(() => _i79.SaveStrengthExercise(
      strengthExerciseRepository: get<_i32.StrengthExerciseRepository>()));
  gh.lazySingleton<_i80.SelectToUseStrengthExercise>(() =>
      _i80.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i32.StrengthExerciseRepository>()));
  gh.factory<_i81.StrengthExercisesCubit>(() => _i81.StrengthExercisesCubit(
        get<_i69.GetStrengthExercises>(),
        get<_i79.SaveStrengthExercise>(),
        get<_i80.SelectToUseStrengthExercise>(),
        get<_i55.DeleteStrengthExercise>(),
      ));
  gh.factory<_i82.StrengthTrainingCubit>(() => _i82.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i65.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i68.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i41.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i39.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i40.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i62.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i54.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i83.StrengthTrainingsCubit>(() => _i83.StrengthTrainingsCubit(
        get<_i70.GetStrengthTreanings>(),
        get<_i56.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i84.TreaningsCubit>(() => _i84.TreaningsCubit(
        get<_i63.GetAllTreanings>(),
        get<_i57.DeleteTreaning>(),
      ));
  gh.factory<_i85.CardioTreaningCubit>(() => _i85.CardioTreaningCubit(
        get<_i67.GetLastCardioTreaning>(),
        get<_i78.SaveCardioTreaning>(),
      ));
  gh.factory<_i86.CardioTreaningsCubit>(() => _i86.CardioTreaningsCubit(
        get<_i64.GetCardioTreanings>(),
        get<_i51.DeleteCardioTreaning>(),
        get<_i78.SaveCardioTreaning>(),
      ));
  gh.factory<_i87.CurrentHallTreaningCubit>(() => _i87.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i24.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i26.NewHallTreaning>(),
        newHallAttempt: get<_i23.NewHallAttempt>(),
        currentHallTreaning: get<_i50.CurrentHallTreaning>(),
        finishHallAttempt: get<_i58.FinishHallAttempt>(),
        finishHallTreaning: get<_i59.FinishHallTreaning>(),
        lastHallTreaning: get<_i20.LastHallTreaning>(),
        deleteHallAttempt: get<_i52.DeleteHallAttempt>(),
      ));
  gh.factory<_i88.CurrentIceTreaningCubit>(() => _i88.CurrentIceTreaningCubit(
        get<_i28.NewIceTreaning>(),
        get<_i76.IceSectorToTreaning>(),
        get<_i27.NewIceAttempt>(),
        get<_i60.FinishIceAttempt>(),
        get<_i61.FinishIceTreaning>(),
      ));
  return get;
}

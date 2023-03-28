// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/datasource/drift_db_local_datasource.dart' as _i17;
import 'core/datasource/local_db_datasource.dart' as _i29;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i3;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i5;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i4;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i10;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i11;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i13;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i36;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i50;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i51;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i6;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i15;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i7;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i16;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i9;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i19;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i8;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i18;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i48;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i68;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i14;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i32;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i49;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i54;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i55;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i56;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i61;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i62;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i26;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i30;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i31;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i33;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i44;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i52;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i53;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i85;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i73;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i72;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i74;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i75;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i20;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i23;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i22;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i25;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i21;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i24;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i63;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i64;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i77;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i27;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i28;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i34;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i35;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i86;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i76;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i78;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i37;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i38;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i41;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i40;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i43;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i39;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i42;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i46;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i47;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i57;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i58;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i59;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i65;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i67;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i69;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i70;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i71;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i79;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i80;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i45;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i81;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i82;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i83;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i60;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i66;
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
  gh.lazySingleton<_i3.CardioTreaningsDatasource>(
      () => _i3.MockCardioTreaningsDatasource());
  gh.lazySingleton<_i4.CardioTreaningsRepository>(() =>
      _i5.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i3.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i6.ClimbingHallDataSource>(
      () => _i7.LocalClimbingHallDataSource());
  gh.lazySingleton<_i8.ClimbingHallRepository>(() =>
      _i9.ClimbingHallRepositoryImpl(
          climbingHallDataSource: get<_i6.ClimbingHallDataSource>()));
  gh.lazySingleton<_i10.DeleteCardioTreaning>(() => _i10.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i4.CardioTreaningsRepository>()));
  gh.lazySingleton<_i11.GetCardioTreanings>(() => _i11.GetCardioTreanings(
      cardioTreaningsRepository: get<_i4.CardioTreaningsRepository>()));
  gh.lazySingleton<_i12.GetClimbingHallRoures>(
      () => _i12.GetClimbingHallRoures(get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i13.GetLastCardioTreaning>(() => _i13.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i4.CardioTreaningsRepository>()));
  gh.lazySingleton<_i14.HallRouteToArchive>(() =>
      _i14.HallRouteToArchive(repository: get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i15.HallTreaningDataSource>(() =>
      _i16.LocalHallTreaningDataSource(
          localDatabase: get<_i17.DriftBDLocalDataSource>()));
  gh.lazySingleton<_i18.HallTreaningRepository>(
      () => _i19.HallTreaningRepositoryImpl(
            dataSource: get<_i15.HallTreaningDataSource>(),
            hallDataSource: get<_i6.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i20.IceRegionsDataSource>(
      () => _i20.MockIceRegionsDataSource());
  gh.lazySingleton<_i21.IceRegionsRepository>(() =>
      _i22.IceRegionsRepositoryImpl(
          iceRegionsDataSource: get<_i20.IceRegionsDataSource>()));
  gh.lazySingleton<_i23.IceTreaningsDataSource>(
      () => _i23.MockIceTreaningsDataSource());
  gh.lazySingleton<_i24.IceTreaningsRepository>(() =>
      _i25.IceTreaningsRepositoryImpl(get<_i23.IceTreaningsDataSource>()));
  gh.lazySingleton<_i26.LastHallTreaning>(
      () => _i26.LastHallTreaning(get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i27.LoadDistrictsUseCase>(() => _i27.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i21.IceRegionsRepository>()));
  gh.lazySingleton<_i28.LoadSectorsUseCase>(() => _i28.LoadSectorsUseCase(
      iceRegionsRepository: get<_i21.IceRegionsRepository>()));
  gh.lazySingleton<_i29.LocalDBDatasource>(() => _i17.DriftBDLocalDataSource());
  gh.lazySingleton<_i30.NewHallAttempt>(() => _i30.NewHallAttempt(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i31.NewHallAttemptFromRoute>(() =>
      _i31.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i32.NewHallRoute>(() => _i32.NewHallRoute(
      climbingHallRepository: get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i33.NewHallTreaning>(() => _i33.NewHallTreaning(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i34.NewIceAttempt>(
      () => _i34.NewIceAttempt(get<_i24.IceTreaningsRepository>()));
  gh.lazySingleton<_i35.NewIceTreaning>(() => _i35.NewIceTreaning(
        iceTreaningsRepository: get<_i24.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i21.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i36.SaveCardioTreaning>(() => _i36.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i4.CardioTreaningsRepository>()));
  gh.lazySingleton<_i37.SettingsCubit>(() => _i37.SettingsCubit());
  gh.lazySingleton<_i38.StrengthExerciseDataSource>(
      () => _i38.MockStrengthExerciseDataSource());
  gh.lazySingleton<_i39.StrengthExerciseRepository>(() =>
      _i40.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i38.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i41.StrengthTreaningsDataSource>(
      () => _i41.MockStrengthTreaningsDataSource());
  gh.lazySingleton<_i42.StrengthTreaningsRepository>(() =>
      _i43.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i41.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i44.UpdateHalls>(
      () => _i44.UpdateHalls(get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i45.UpdateStrengthTreaningExercises>(() =>
      _i45.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i42.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i39.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i46.AddRepetitionForStrengthTreaning>(() =>
      _i46.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i42.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i47.AddStrengthTreaning>(() => _i47.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i42.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i39.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i48.AllClimbingHalls>(
      () => _i48.AllClimbingHalls(get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i49.AllHallTreanings>(
      () => _i49.AllHallTreanings(get<_i18.HallTreaningRepository>()));
  gh.factory<_i50.CardioTreaningCubit>(() => _i50.CardioTreaningCubit(
        get<_i13.GetLastCardioTreaning>(),
        get<_i36.SaveCardioTreaning>(),
      ));
  gh.factory<_i51.CardioTreaningsCubit>(() => _i51.CardioTreaningsCubit(
        get<_i11.GetCardioTreanings>(),
        get<_i10.DeleteCardioTreaning>(),
        get<_i36.SaveCardioTreaning>(),
      ));
  gh.factory<_i52.ClimbingHallCubit>(() => _i52.ClimbingHallCubit(
        getClimbingHallRoures: get<_i12.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i14.HallRouteToArchive>(),
      ));
  gh.factory<_i53.ClimbingHallsCubit>(() =>
      _i53.ClimbingHallsCubit(allClimbingHalls: get<_i48.AllClimbingHalls>()));
  gh.lazySingleton<_i54.CurrentHallTreaning>(
      () => _i54.CurrentHallTreaning(get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i55.DeleteHallAttempt>(() => _i55.DeleteHallAttempt(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i56.DeleteHallTreaning>(() => _i56.DeleteHallTreaning(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i57.DeleteRepetitionForStrengthTreaning>(() =>
      _i57.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i42.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i58.DeleteStrengthExercise>(() =>
      _i58.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i39.StrengthExerciseRepository>()));
  gh.lazySingleton<_i59.DeleteStrengthTreaning>(() =>
      _i59.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i42.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i60.DeleteTreaning>(() => _i60.DeleteTreaning(
        get<_i18.HallTreaningRepository>(),
        get<_i24.IceTreaningsRepository>(),
        get<_i42.StrengthTreaningsRepository>(),
        get<_i4.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i61.FinishHallAttempt>(() => _i61.FinishHallAttempt(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i62.FinishHallTreaning>(() => _i62.FinishHallTreaning(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i63.FinishIceAttempt>(
      () => _i63.FinishIceAttempt(get<_i24.IceTreaningsRepository>()));
  gh.lazySingleton<_i64.FinishIceTreaning>(() => _i64.FinishIceTreaning(
      iceTreaningsRepository: get<_i24.IceTreaningsRepository>()));
  gh.lazySingleton<_i65.FinishStrengthTreaning>(() =>
      _i65.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i42.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i66.GetAllTreanings>(() => _i66.GetAllTreanings(
        get<_i18.HallTreaningRepository>(),
        get<_i24.IceTreaningsRepository>(),
        get<_i42.StrengthTreaningsRepository>(),
        get<_i4.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i67.GetCurrentStrengthTreaning>(() =>
      _i67.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i42.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i68.GetHallRouteAttempts>(() => _i68.GetHallRouteAttempts(
      repository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i69.GetPreviosStrengthTreaning>(() =>
      _i69.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i42.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i70.GetStrengthExercises>(() => _i70.GetStrengthExercises(
      strengthExerciseRepository: get<_i39.StrengthExerciseRepository>()));
  gh.lazySingleton<_i71.GetStrengthTreanings>(() => _i71.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i42.StrengthTreaningsRepository>()));
  gh.factory<_i72.HallRouteAttemptsCubit>(() => _i72.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i68.GetHallRouteAttempts>()));
  gh.factory<_i73.HallRouteCubit>(
      () => _i73.HallRouteCubit(get<_i32.NewHallRoute>()));
  gh.factory<_i74.HallTreaningsCubit>(() => _i74.HallTreaningsCubit(
        allHallTreanings: get<_i49.AllHallTreanings>(),
        deleteHallTreaning: get<_i56.DeleteHallTreaning>(),
      ));
  gh.factory<_i75.HomePageCubit>(
      () => _i75.HomePageCubit(allClimbingHalls: get<_i48.AllClimbingHalls>()));
  gh.factory<_i76.IceDistrictsCubit>(() => _i76.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i27.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i77.IceSectorToTreaning>(() => _i77.IceSectorToTreaning(
      iceTreaningsRepository: get<_i24.IceTreaningsRepository>()));
  gh.factory<_i78.IceSectorsCubit>(() =>
      _i78.IceSectorsCubit(loadSectorsUseCase: get<_i28.LoadSectorsUseCase>()));
  gh.lazySingleton<_i79.SaveStrengthExercise>(() => _i79.SaveStrengthExercise(
      strengthExerciseRepository: get<_i39.StrengthExerciseRepository>()));
  gh.lazySingleton<_i80.SelectToUseStrengthExercise>(() =>
      _i80.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i39.StrengthExerciseRepository>()));
  gh.factory<_i81.StrengthExercisesCubit>(() => _i81.StrengthExercisesCubit(
        get<_i70.GetStrengthExercises>(),
        get<_i79.SaveStrengthExercise>(),
        get<_i80.SelectToUseStrengthExercise>(),
        get<_i58.DeleteStrengthExercise>(),
      ));
  gh.factory<_i82.StrengthTrainingCubit>(() => _i82.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i67.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i69.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i47.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i45.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i46.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i65.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i57.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i83.StrengthTrainingsCubit>(() => _i83.StrengthTrainingsCubit(
        get<_i71.GetStrengthTreanings>(),
        get<_i59.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i84.TreaningsCubit>(() => _i84.TreaningsCubit(
        get<_i66.GetAllTreanings>(),
        get<_i60.DeleteTreaning>(),
      ));
  gh.factory<_i85.CurrentHallTreaningCubit>(() => _i85.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i31.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i33.NewHallTreaning>(),
        newHallAttempt: get<_i30.NewHallAttempt>(),
        currentHallTreaning: get<_i54.CurrentHallTreaning>(),
        finishHallAttempt: get<_i61.FinishHallAttempt>(),
        finishHallTreaning: get<_i62.FinishHallTreaning>(),
        lastHallTreaning: get<_i26.LastHallTreaning>(),
        deleteHallAttempt: get<_i55.DeleteHallAttempt>(),
      ));
  gh.factory<_i86.CurrentIceTreaningCubit>(() => _i86.CurrentIceTreaningCubit(
        get<_i35.NewIceTreaning>(),
        get<_i77.IceSectorToTreaning>(),
        get<_i34.NewIceAttempt>(),
        get<_i63.FinishIceAttempt>(),
        get<_i64.FinishIceTreaning>(),
      ));
  return get;
}

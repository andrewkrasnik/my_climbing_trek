// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/datasource/drift_db_local_datasource.dart' as _i7;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i45;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i46;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i48;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i47;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i52;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i65;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i68;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i79;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i86;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i87;
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
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i43;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i8;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i67;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i9;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i26;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i44;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i51;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i53;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i54;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i59;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i60;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i21;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i24;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i25;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i27;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i39;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i49;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i50;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i88;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i73;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i72;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i74;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i75;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i14;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i18;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i15;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i17;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i20;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i16;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i19;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i61;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i62;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i77;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i22;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i23;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i28;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i29;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i89;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i76;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i78;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i30;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i32;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i36;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i31;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i35;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i34;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i38;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i33;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i37;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i41;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i42;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i55;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i56;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i57;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i63;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i66;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i69;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i70;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i71;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i80;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i81;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i40;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i82;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i83;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i84;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i58;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i64;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i85; // ignore_for_file: unnecessary_lambdas

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
      () => _i15.LocalIceRegionsDataSource());
  gh.lazySingleton<_i16.IceRegionsRepository>(() =>
      _i17.IceRegionsRepositoryImpl(
          iceRegionsDataSource: get<_i14.IceRegionsDataSource>()));
  gh.lazySingleton<_i18.IceTreaningsDataSource>(
      () => _i18.MockIceTreaningsDataSource());
  gh.lazySingleton<_i19.IceTreaningsRepository>(() =>
      _i20.IceTreaningsRepositoryImpl(get<_i18.IceTreaningsDataSource>()));
  gh.lazySingleton<_i21.LastHallTreaning>(
      () => _i21.LastHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i22.LoadDistrictsUseCase>(() => _i22.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i16.IceRegionsRepository>()));
  gh.lazySingleton<_i23.LoadSectorsUseCase>(() => _i23.LoadSectorsUseCase(
      iceRegionsRepository: get<_i16.IceRegionsRepository>()));
  gh.lazySingleton<_i24.NewHallAttempt>(() => _i24.NewHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i25.NewHallAttemptFromRoute>(() =>
      _i25.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i26.NewHallRoute>(() => _i26.NewHallRoute(
      climbingHallRepository: get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i27.NewHallTreaning>(() => _i27.NewHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i28.NewIceAttempt>(
      () => _i28.NewIceAttempt(get<_i19.IceTreaningsRepository>()));
  gh.lazySingleton<_i29.NewIceTreaning>(() => _i29.NewIceTreaning(
        iceTreaningsRepository: get<_i19.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i16.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i30.SettingsCubit>(() => _i30.SettingsCubit());
  gh.lazySingleton<_i31.StrengthExerciseDataSource>(() =>
      _i32.LocalStrengthExerciseDataSource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i33.StrengthExerciseRepository>(() =>
      _i34.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i31.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i35.StrengthTreaningsDataSource>(() =>
      _i36.LocalStrengthTreaningsDataSource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i37.StrengthTreaningsRepository>(() =>
      _i38.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i35.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i39.UpdateHalls>(
      () => _i39.UpdateHalls(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i40.UpdateStrengthTreaningExercises>(() =>
      _i40.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i37.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i33.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i41.AddRepetitionForStrengthTreaning>(() =>
      _i41.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i37.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i42.AddStrengthTreaning>(() => _i42.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i37.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i33.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i43.AllClimbingHalls>(
      () => _i43.AllClimbingHalls(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i44.AllHallTreanings>(
      () => _i44.AllHallTreanings(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i45.CardioTreaningsDatasource>(() =>
      _i46.LocalCardioTreaningsDatasource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i47.CardioTreaningsRepository>(() =>
      _i48.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i45.CardioTreaningsDatasource>()));
  gh.factory<_i49.ClimbingHallCubit>(() => _i49.ClimbingHallCubit(
        getClimbingHallRoures: get<_i8.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i9.HallRouteToArchive>(),
      ));
  gh.factory<_i50.ClimbingHallsCubit>(() =>
      _i50.ClimbingHallsCubit(allClimbingHalls: get<_i43.AllClimbingHalls>()));
  gh.lazySingleton<_i51.CurrentHallTreaning>(
      () => _i51.CurrentHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i52.DeleteCardioTreaning>(() => _i52.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i47.CardioTreaningsRepository>()));
  gh.lazySingleton<_i53.DeleteHallAttempt>(() => _i53.DeleteHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i54.DeleteHallTreaning>(() => _i54.DeleteHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i55.DeleteRepetitionForStrengthTreaning>(() =>
      _i55.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i37.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i56.DeleteStrengthExercise>(() =>
      _i56.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i33.StrengthExerciseRepository>()));
  gh.lazySingleton<_i57.DeleteStrengthTreaning>(() =>
      _i57.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i37.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i58.DeleteTreaning>(() => _i58.DeleteTreaning(
        get<_i12.HallTreaningRepository>(),
        get<_i19.IceTreaningsRepository>(),
        get<_i37.StrengthTreaningsRepository>(),
        get<_i47.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i59.FinishHallAttempt>(() => _i59.FinishHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i60.FinishHallTreaning>(() => _i60.FinishHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i61.FinishIceAttempt>(
      () => _i61.FinishIceAttempt(get<_i19.IceTreaningsRepository>()));
  gh.lazySingleton<_i62.FinishIceTreaning>(() => _i62.FinishIceTreaning(
      iceTreaningsRepository: get<_i19.IceTreaningsRepository>()));
  gh.lazySingleton<_i63.FinishStrengthTreaning>(() =>
      _i63.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i37.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i64.GetAllTreanings>(() => _i64.GetAllTreanings(
        get<_i12.HallTreaningRepository>(),
        get<_i19.IceTreaningsRepository>(),
        get<_i37.StrengthTreaningsRepository>(),
        get<_i47.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i65.GetCardioTreanings>(() => _i65.GetCardioTreanings(
      cardioTreaningsRepository: get<_i47.CardioTreaningsRepository>()));
  gh.lazySingleton<_i66.GetCurrentStrengthTreaning>(() =>
      _i66.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i37.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i67.GetHallRouteAttempts>(() => _i67.GetHallRouteAttempts(
      repository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i68.GetLastCardioTreaning>(() => _i68.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i47.CardioTreaningsRepository>()));
  gh.lazySingleton<_i69.GetPreviosStrengthTreaning>(() =>
      _i69.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i37.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i70.GetStrengthExercises>(() => _i70.GetStrengthExercises(
      strengthExerciseRepository: get<_i33.StrengthExerciseRepository>()));
  gh.lazySingleton<_i71.GetStrengthTreanings>(() => _i71.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i37.StrengthTreaningsRepository>()));
  gh.factory<_i72.HallRouteAttemptsCubit>(() => _i72.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i67.GetHallRouteAttempts>()));
  gh.factory<_i73.HallRouteCubit>(
      () => _i73.HallRouteCubit(get<_i26.NewHallRoute>()));
  gh.factory<_i74.HallTreaningsCubit>(() => _i74.HallTreaningsCubit(
        allHallTreanings: get<_i44.AllHallTreanings>(),
        deleteHallTreaning: get<_i54.DeleteHallTreaning>(),
      ));
  gh.factory<_i75.HomePageCubit>(
      () => _i75.HomePageCubit(allClimbingHalls: get<_i43.AllClimbingHalls>()));
  gh.factory<_i76.IceDistrictsCubit>(() => _i76.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i22.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i77.IceSectorToTreaning>(() => _i77.IceSectorToTreaning(
      iceTreaningsRepository: get<_i19.IceTreaningsRepository>()));
  gh.factory<_i78.IceSectorsCubit>(() =>
      _i78.IceSectorsCubit(loadSectorsUseCase: get<_i23.LoadSectorsUseCase>()));
  gh.lazySingleton<_i79.SaveCardioTreaning>(() => _i79.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i47.CardioTreaningsRepository>()));
  gh.lazySingleton<_i80.SaveStrengthExercise>(() => _i80.SaveStrengthExercise(
      strengthExerciseRepository: get<_i33.StrengthExerciseRepository>()));
  gh.lazySingleton<_i81.SelectToUseStrengthExercise>(() =>
      _i81.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i33.StrengthExerciseRepository>()));
  gh.factory<_i82.StrengthExercisesCubit>(() => _i82.StrengthExercisesCubit(
        get<_i70.GetStrengthExercises>(),
        get<_i80.SaveStrengthExercise>(),
        get<_i81.SelectToUseStrengthExercise>(),
        get<_i56.DeleteStrengthExercise>(),
      ));
  gh.factory<_i83.StrengthTrainingCubit>(() => _i83.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i66.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i69.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i42.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i40.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i41.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i63.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i55.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i84.StrengthTrainingsCubit>(() => _i84.StrengthTrainingsCubit(
        get<_i71.GetStrengthTreanings>(),
        get<_i57.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i85.TreaningsCubit>(() => _i85.TreaningsCubit(
        get<_i64.GetAllTreanings>(),
        get<_i58.DeleteTreaning>(),
      ));
  gh.factory<_i86.CardioTreaningCubit>(() => _i86.CardioTreaningCubit(
        get<_i68.GetLastCardioTreaning>(),
        get<_i79.SaveCardioTreaning>(),
      ));
  gh.factory<_i87.CardioTreaningsCubit>(() => _i87.CardioTreaningsCubit(
        get<_i65.GetCardioTreanings>(),
        get<_i52.DeleteCardioTreaning>(),
        get<_i79.SaveCardioTreaning>(),
      ));
  gh.factory<_i88.CurrentHallTreaningCubit>(() => _i88.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i25.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i27.NewHallTreaning>(),
        newHallAttempt: get<_i24.NewHallAttempt>(),
        currentHallTreaning: get<_i51.CurrentHallTreaning>(),
        finishHallAttempt: get<_i59.FinishHallAttempt>(),
        finishHallTreaning: get<_i60.FinishHallTreaning>(),
        lastHallTreaning: get<_i21.LastHallTreaning>(),
        deleteHallAttempt: get<_i53.DeleteHallAttempt>(),
      ));
  gh.factory<_i89.CurrentIceTreaningCubit>(() => _i89.CurrentIceTreaningCubit(
        get<_i29.NewIceTreaning>(),
        get<_i77.IceSectorToTreaning>(),
        get<_i28.NewIceAttempt>(),
        get<_i61.FinishIceAttempt>(),
        get<_i62.FinishIceTreaning>(),
      ));
  return get;
}

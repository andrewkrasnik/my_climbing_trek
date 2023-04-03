// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_analytics/firebase_analytics.dart' as _i8;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/datasource/drift_db_local_datasource.dart' as _i7;
import 'core/injectable_module.dart' as _i99;
import 'core/services/analitics/analitics_service.dart' as _i48;
import 'core/services/analitics/firebase_analitics_service.dart' as _i49;
import 'core/services/crash_log_service/crash_log_service.dart' as _i56;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i57;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i50;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i51;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i53;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i52;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i59;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i72;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i76;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i88;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i95;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i96;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i12;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i13;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i6;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i15;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i5;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i14;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i46;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i10;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i75;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i11;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i29;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i47;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i58;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i60;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i61;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i66;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i67;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i24;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i27;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i28;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i30;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i42;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i54;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i55;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i97;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i82;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i81;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i83;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i84;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i16;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i20;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i17;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i21;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i19;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i23;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i18;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i22;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i68;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i69;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i73;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i77;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i86;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i25;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i26;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i31;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i32;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i98;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i85;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i87;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i33;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i35;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i39;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i34;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i38;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i37;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i41;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i36;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i40;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i44;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i45;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i62;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i63;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i64;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i70;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i74;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i78;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i79;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i80;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i89;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i90;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i43;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i91;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i92;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i93;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i65;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i71;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i94; // ignore_for_file: unnecessary_lambdas

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
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.ClimbingHallDataSource>(
      () => _i4.LocalClimbingHallDataSource());
  gh.lazySingleton<_i5.ClimbingHallRepository>(() =>
      _i6.ClimbingHallRepositoryImpl(
          climbingHallDataSource: get<_i3.ClimbingHallDataSource>()));
  gh.lazySingleton<_i7.DriftDBLocalDataSource>(
      () => _i7.DriftDBLocalDataSource());
  gh.lazySingletonAsync<_i8.FirebaseAnalytics>(
      () => injectableModule.firebaseAnalytics);
  gh.lazySingletonAsync<_i9.FirebaseCrashlytics>(
      () => injectableModule.firebaseCrashlytics);
  gh.lazySingleton<_i10.GetClimbingHallRoures>(
      () => _i10.GetClimbingHallRoures(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i11.HallRouteToArchive>(() =>
      _i11.HallRouteToArchive(repository: get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i12.HallTreaningDataSource>(() =>
      _i13.LocalHallTreaningDataSource(
          localDatabase: get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i14.HallTreaningRepository>(
      () => _i15.HallTreaningRepositoryImpl(
            dataSource: get<_i12.HallTreaningDataSource>(),
            hallDataSource: get<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i16.IceRegionsDataSource>(
      () => _i17.LocalIceRegionsDataSource());
  gh.lazySingleton<_i18.IceRegionsRepository>(() =>
      _i19.IceRegionsRepositoryImpl(
          iceRegionsDataSource: get<_i16.IceRegionsDataSource>()));
  gh.lazySingleton<_i20.IceTreaningsDataSource>(() =>
      _i21.LocalIceTreaningsDataSource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i22.IceTreaningsRepository>(() =>
      _i23.IceTreaningsRepositoryImpl(get<_i20.IceTreaningsDataSource>()));
  gh.lazySingleton<_i24.LastHallTreaning>(
      () => _i24.LastHallTreaning(get<_i14.HallTreaningRepository>()));
  gh.lazySingleton<_i25.LoadDistrictsUseCase>(() => _i25.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i18.IceRegionsRepository>()));
  gh.lazySingleton<_i26.LoadSectorsUseCase>(() => _i26.LoadSectorsUseCase(
      iceRegionsRepository: get<_i18.IceRegionsRepository>()));
  gh.lazySingleton<_i27.NewHallAttempt>(() => _i27.NewHallAttempt(
      treaningRepository: get<_i14.HallTreaningRepository>()));
  gh.lazySingleton<_i28.NewHallAttemptFromRoute>(() =>
      _i28.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i14.HallTreaningRepository>()));
  gh.lazySingleton<_i29.NewHallRoute>(() => _i29.NewHallRoute(
      climbingHallRepository: get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i30.NewHallTreaning>(() => _i30.NewHallTreaning(
      treaningRepository: get<_i14.HallTreaningRepository>()));
  gh.lazySingleton<_i31.NewIceAttempt>(
      () => _i31.NewIceAttempt(get<_i22.IceTreaningsRepository>()));
  gh.lazySingleton<_i32.NewIceTreaning>(() => _i32.NewIceTreaning(
        iceTreaningsRepository: get<_i22.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i18.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i33.SettingsCubit>(() => _i33.SettingsCubit());
  gh.lazySingleton<_i34.StrengthExerciseDataSource>(() =>
      _i35.LocalStrengthExerciseDataSource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i36.StrengthExerciseRepository>(() =>
      _i37.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i34.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i38.StrengthTreaningsDataSource>(() =>
      _i39.LocalStrengthTreaningsDataSource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i40.StrengthTreaningsRepository>(() =>
      _i41.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i38.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i42.UpdateHalls>(
      () => _i42.UpdateHalls(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i43.UpdateStrengthTreaningExercises>(() =>
      _i43.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i40.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i36.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i44.AddRepetitionForStrengthTreaning>(() =>
      _i44.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i45.AddStrengthTreaning>(() => _i45.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i40.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i36.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i46.AllClimbingHalls>(
      () => _i46.AllClimbingHalls(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i47.AllHallTreanings>(
      () => _i47.AllHallTreanings(get<_i14.HallTreaningRepository>()));
  gh.lazySingletonAsync<_i48.AnaliticsService>(() async =>
      _i49.FirebaseAnaliticsService(
          await get.getAsync<_i8.FirebaseAnalytics>()));
  gh.lazySingleton<_i50.CardioTreaningsDatasource>(() =>
      _i51.LocalCardioTreaningsDatasource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i52.CardioTreaningsRepository>(() =>
      _i53.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i50.CardioTreaningsDatasource>()));
  gh.factory<_i54.ClimbingHallCubit>(() => _i54.ClimbingHallCubit(
        getClimbingHallRoures: get<_i10.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i11.HallRouteToArchive>(),
      ));
  gh.factory<_i55.ClimbingHallsCubit>(() =>
      _i55.ClimbingHallsCubit(allClimbingHalls: get<_i46.AllClimbingHalls>()));
  gh.lazySingletonAsync<_i56.CrashLogService>(() async =>
      _i57.GoogleCrashLogService(
          await get.getAsync<_i9.FirebaseCrashlytics>()));
  gh.lazySingleton<_i58.CurrentHallTreaning>(
      () => _i58.CurrentHallTreaning(get<_i14.HallTreaningRepository>()));
  gh.lazySingleton<_i59.DeleteCardioTreaning>(() => _i59.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i52.CardioTreaningsRepository>()));
  gh.lazySingleton<_i60.DeleteHallAttempt>(() => _i60.DeleteHallAttempt(
      treaningRepository: get<_i14.HallTreaningRepository>()));
  gh.lazySingleton<_i61.DeleteHallTreaning>(() => _i61.DeleteHallTreaning(
      treaningRepository: get<_i14.HallTreaningRepository>()));
  gh.lazySingleton<_i62.DeleteRepetitionForStrengthTreaning>(() =>
      _i62.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i63.DeleteStrengthExercise>(() =>
      _i63.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i36.StrengthExerciseRepository>()));
  gh.lazySingleton<_i64.DeleteStrengthTreaning>(() =>
      _i64.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i65.DeleteTreaning>(() => _i65.DeleteTreaning(
        get<_i14.HallTreaningRepository>(),
        get<_i22.IceTreaningsRepository>(),
        get<_i40.StrengthTreaningsRepository>(),
        get<_i52.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i66.FinishHallAttempt>(() => _i66.FinishHallAttempt(
      treaningRepository: get<_i14.HallTreaningRepository>()));
  gh.lazySingleton<_i67.FinishHallTreaning>(() => _i67.FinishHallTreaning(
      treaningRepository: get<_i14.HallTreaningRepository>()));
  gh.lazySingleton<_i68.FinishIceAttempt>(
      () => _i68.FinishIceAttempt(get<_i22.IceTreaningsRepository>()));
  gh.lazySingleton<_i69.FinishIceTreaning>(() => _i69.FinishIceTreaning(
      iceTreaningsRepository: get<_i22.IceTreaningsRepository>()));
  gh.lazySingleton<_i70.FinishStrengthTreaning>(() =>
      _i70.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i71.GetAllTreanings>(() => _i71.GetAllTreanings(
        get<_i14.HallTreaningRepository>(),
        get<_i22.IceTreaningsRepository>(),
        get<_i40.StrengthTreaningsRepository>(),
        get<_i52.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i72.GetCardioTreanings>(() => _i72.GetCardioTreanings(
      cardioTreaningsRepository: get<_i52.CardioTreaningsRepository>()));
  gh.lazySingleton<_i73.GetCurrentIceTreaning>(() => _i73.GetCurrentIceTreaning(
      iceTreaningsRepository: get<_i22.IceTreaningsRepository>()));
  gh.lazySingleton<_i74.GetCurrentStrengthTreaning>(() =>
      _i74.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i75.GetHallRouteAttempts>(() => _i75.GetHallRouteAttempts(
      repository: get<_i14.HallTreaningRepository>()));
  gh.lazySingleton<_i76.GetLastCardioTreaning>(() => _i76.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i52.CardioTreaningsRepository>()));
  gh.lazySingleton<_i77.GetLastIceTreaning>(() => _i77.GetLastIceTreaning(
      iceTreaningsRepository: get<_i22.IceTreaningsRepository>()));
  gh.lazySingleton<_i78.GetPreviosStrengthTreaning>(() =>
      _i78.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i79.GetStrengthExercises>(() => _i79.GetStrengthExercises(
      strengthExerciseRepository: get<_i36.StrengthExerciseRepository>()));
  gh.lazySingleton<_i80.GetStrengthTreanings>(() => _i80.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i40.StrengthTreaningsRepository>()));
  gh.factory<_i81.HallRouteAttemptsCubit>(() => _i81.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i75.GetHallRouteAttempts>()));
  gh.factory<_i82.HallRouteCubit>(
      () => _i82.HallRouteCubit(get<_i29.NewHallRoute>()));
  gh.factory<_i83.HallTreaningsCubit>(() => _i83.HallTreaningsCubit(
        allHallTreanings: get<_i47.AllHallTreanings>(),
        deleteHallTreaning: get<_i61.DeleteHallTreaning>(),
      ));
  gh.factory<_i84.HomePageCubit>(
      () => _i84.HomePageCubit(allClimbingHalls: get<_i46.AllClimbingHalls>()));
  gh.factory<_i85.IceDistrictsCubit>(() => _i85.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i25.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i86.IceSectorToTreaning>(() => _i86.IceSectorToTreaning(
      iceTreaningsRepository: get<_i22.IceTreaningsRepository>()));
  gh.factory<_i87.IceSectorsCubit>(() =>
      _i87.IceSectorsCubit(loadSectorsUseCase: get<_i26.LoadSectorsUseCase>()));
  gh.lazySingleton<_i88.SaveCardioTreaning>(() => _i88.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i52.CardioTreaningsRepository>()));
  gh.lazySingleton<_i89.SaveStrengthExercise>(() => _i89.SaveStrengthExercise(
      strengthExerciseRepository: get<_i36.StrengthExerciseRepository>()));
  gh.lazySingleton<_i90.SelectToUseStrengthExercise>(() =>
      _i90.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i36.StrengthExerciseRepository>()));
  gh.factory<_i91.StrengthExercisesCubit>(() => _i91.StrengthExercisesCubit(
        get<_i79.GetStrengthExercises>(),
        get<_i89.SaveStrengthExercise>(),
        get<_i90.SelectToUseStrengthExercise>(),
        get<_i63.DeleteStrengthExercise>(),
      ));
  gh.factory<_i92.StrengthTrainingCubit>(() => _i92.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i74.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i78.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i45.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i43.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i44.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i70.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i62.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i93.StrengthTrainingsCubit>(() => _i93.StrengthTrainingsCubit(
        get<_i80.GetStrengthTreanings>(),
        get<_i64.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i94.TreaningsCubit>(() => _i94.TreaningsCubit(
        get<_i71.GetAllTreanings>(),
        get<_i65.DeleteTreaning>(),
      ));
  gh.factory<_i95.CardioTreaningCubit>(() => _i95.CardioTreaningCubit(
        get<_i76.GetLastCardioTreaning>(),
        get<_i88.SaveCardioTreaning>(),
      ));
  gh.factory<_i96.CardioTreaningsCubit>(() => _i96.CardioTreaningsCubit(
        get<_i72.GetCardioTreanings>(),
        get<_i59.DeleteCardioTreaning>(),
        get<_i88.SaveCardioTreaning>(),
      ));
  gh.factory<_i97.CurrentHallTreaningCubit>(() => _i97.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i28.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i30.NewHallTreaning>(),
        newHallAttempt: get<_i27.NewHallAttempt>(),
        currentHallTreaning: get<_i58.CurrentHallTreaning>(),
        finishHallAttempt: get<_i66.FinishHallAttempt>(),
        finishHallTreaning: get<_i67.FinishHallTreaning>(),
        lastHallTreaning: get<_i24.LastHallTreaning>(),
        deleteHallAttempt: get<_i60.DeleteHallAttempt>(),
      ));
  gh.factory<_i98.CurrentIceTreaningCubit>(() => _i98.CurrentIceTreaningCubit(
        get<_i32.NewIceTreaning>(),
        get<_i86.IceSectorToTreaning>(),
        get<_i31.NewIceAttempt>(),
        get<_i68.FinishIceAttempt>(),
        get<_i69.FinishIceTreaning>(),
        get<_i73.GetCurrentIceTreaning>(),
        get<_i77.GetLastIceTreaning>(),
      ));
  return get;
}

class _$InjectableModule extends _i99.InjectableModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:firebase_analytics/firebase_analytics.dart' as _i6;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i21;

import 'core/datasource/drift_db_local_datasource.dart' as _i5;
import 'core/injectable_module.dart' as _i104;
import 'core/services/analitics/analitics_service.dart' as _i46;
import 'core/services/analitics/firebase_analitics_service.dart' as _i47;
import 'core/services/crash_log_service/crash_log_service.dart' as _i54;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i55;
import 'core/services/network/network_info.dart' as _i25;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i48;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i49;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i51;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i50;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i57;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i70;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i75;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i87;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i96;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i97;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i9;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i10;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i31;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i32;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i53;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i12;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i52;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i11;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i95;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i71;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i74;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i81;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i86;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i45;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i56;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i58;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i59;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i64;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i65;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i22;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i26;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i27;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i28;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i94;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i98;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i99;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i100;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i102;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i80;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i82;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i103;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i13;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i17;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i14;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i18;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i16;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i20;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i15;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i19;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i66;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i67;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i72;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i76;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i84;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i23;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i24;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i29;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i30;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i101;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i83;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i85;
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
    as _i43;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i44;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i60;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i61;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i62;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i68;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i73;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i77;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i78;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i79;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i88;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i89;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i42;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i90;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i91;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i92;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i63;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i69;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i93; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i5.DriftDBLocalDataSource>(
      () => _i5.DriftDBLocalDataSource());
  gh.lazySingletonAsync<_i6.FirebaseAnalytics>(
      () => injectableModule.firebaseAnalytics);
  gh.lazySingletonAsync<_i7.FirebaseCrashlytics>(
      () => injectableModule.firebaseCrashlytics);
  gh.lazySingleton<_i8.FirebaseFirestore>(
      () => injectableModule.firebaseFirestore);
  gh.lazySingleton<_i9.HallTreaningDataSource>(() =>
      _i10.LocalHallTreaningDataSource(
          localDatabase: get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i11.HallTreaningRepository>(
      () => _i12.HallTreaningRepositoryImpl(
            dataSource: get<_i9.HallTreaningDataSource>(),
            hallDataSource: get<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i13.IceRegionsDataSource>(
      () => _i14.LocalIceRegionsDataSource());
  gh.lazySingleton<_i15.IceRegionsRepository>(() =>
      _i16.IceRegionsRepositoryImpl(
          iceRegionsDataSource: get<_i13.IceRegionsDataSource>()));
  gh.lazySingleton<_i17.IceTreaningsDataSource>(() =>
      _i18.LocalIceTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i19.IceTreaningsRepository>(() =>
      _i20.IceTreaningsRepositoryImpl(get<_i17.IceTreaningsDataSource>()));
  gh.lazySingleton<_i21.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker);
  gh.lazySingleton<_i22.LastHallTreaning>(
      () => _i22.LastHallTreaning(get<_i11.HallTreaningRepository>()));
  gh.lazySingleton<_i23.LoadDistrictsUseCase>(() => _i23.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i15.IceRegionsRepository>()));
  gh.lazySingleton<_i24.LoadSectorsUseCase>(() => _i24.LoadSectorsUseCase(
      iceRegionsRepository: get<_i15.IceRegionsRepository>()));
  gh.lazySingleton<_i25.NetworkInfo>(
      () => _i25.NetworkInfoImpl(get<_i21.InternetConnectionChecker>()));
  gh.lazySingleton<_i26.NewHallAttempt>(() => _i26.NewHallAttempt(
      treaningRepository: get<_i11.HallTreaningRepository>()));
  gh.lazySingleton<_i27.NewHallAttemptFromRoute>(() =>
      _i27.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i11.HallTreaningRepository>()));
  gh.lazySingleton<_i28.NewHallTreaning>(() => _i28.NewHallTreaning(
      treaningRepository: get<_i11.HallTreaningRepository>()));
  gh.lazySingleton<_i29.NewIceAttempt>(
      () => _i29.NewIceAttempt(get<_i19.IceTreaningsRepository>()));
  gh.lazySingleton<_i30.NewIceTreaning>(() => _i30.NewIceTreaning(
        iceTreaningsRepository: get<_i19.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i15.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i31.RemoteGymDataSource>(
      () => _i32.RemoteGymDataSourceImpl(get<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i33.SettingsCubit>(() => _i33.SettingsCubit());
  gh.lazySingleton<_i34.StrengthExerciseDataSource>(() =>
      _i35.LocalStrengthExerciseDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i36.StrengthExerciseRepository>(() =>
      _i37.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i34.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i38.StrengthTreaningsDataSource>(() =>
      _i39.LocalStrengthTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i40.StrengthTreaningsRepository>(() =>
      _i41.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i38.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i42.UpdateStrengthTreaningExercises>(() =>
      _i42.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i40.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i36.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i43.AddRepetitionForStrengthTreaning>(() =>
      _i43.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i44.AddStrengthTreaning>(() => _i44.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i40.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i36.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i45.AllHallTreanings>(
      () => _i45.AllHallTreanings(get<_i11.HallTreaningRepository>()));
  gh.lazySingletonAsync<_i46.AnaliticsService>(() async =>
      _i47.FirebaseAnaliticsService(
          await get.getAsync<_i6.FirebaseAnalytics>()));
  gh.lazySingleton<_i48.CardioTreaningsDatasource>(() =>
      _i49.LocalCardioTreaningsDatasource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i50.CardioTreaningsRepository>(() =>
      _i51.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i48.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i52.ClimbingHallRepository>(
      () => _i53.ClimbingHallRepositoryImpl(
            get<_i3.ClimbingHallDataSource>(),
            get<_i31.RemoteGymDataSource>(),
            get<_i25.NetworkInfo>(),
          ));
  gh.lazySingletonAsync<_i54.CrashLogService>(() async =>
      _i55.GoogleCrashLogService(
          await get.getAsync<_i7.FirebaseCrashlytics>()));
  gh.lazySingleton<_i56.CurrentHallTreaning>(
      () => _i56.CurrentHallTreaning(get<_i11.HallTreaningRepository>()));
  gh.lazySingleton<_i57.DeleteCardioTreaning>(() => _i57.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i50.CardioTreaningsRepository>()));
  gh.lazySingleton<_i58.DeleteHallAttempt>(() => _i58.DeleteHallAttempt(
      treaningRepository: get<_i11.HallTreaningRepository>()));
  gh.lazySingleton<_i59.DeleteHallTreaning>(() => _i59.DeleteHallTreaning(
      treaningRepository: get<_i11.HallTreaningRepository>()));
  gh.lazySingleton<_i60.DeleteRepetitionForStrengthTreaning>(() =>
      _i60.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i61.DeleteStrengthExercise>(() =>
      _i61.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i36.StrengthExerciseRepository>()));
  gh.lazySingleton<_i62.DeleteStrengthTreaning>(() =>
      _i62.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i63.DeleteTreaning>(() => _i63.DeleteTreaning(
        get<_i11.HallTreaningRepository>(),
        get<_i19.IceTreaningsRepository>(),
        get<_i40.StrengthTreaningsRepository>(),
        get<_i50.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i64.FinishHallAttempt>(() => _i64.FinishHallAttempt(
      treaningRepository: get<_i11.HallTreaningRepository>()));
  gh.lazySingleton<_i65.FinishHallTreaning>(() => _i65.FinishHallTreaning(
      treaningRepository: get<_i11.HallTreaningRepository>()));
  gh.lazySingleton<_i66.FinishIceAttempt>(
      () => _i66.FinishIceAttempt(get<_i19.IceTreaningsRepository>()));
  gh.lazySingleton<_i67.FinishIceTreaning>(() => _i67.FinishIceTreaning(
      iceTreaningsRepository: get<_i19.IceTreaningsRepository>()));
  gh.lazySingleton<_i68.FinishStrengthTreaning>(() =>
      _i68.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i69.GetAllTreanings>(() => _i69.GetAllTreanings(
        get<_i11.HallTreaningRepository>(),
        get<_i19.IceTreaningsRepository>(),
        get<_i40.StrengthTreaningsRepository>(),
        get<_i50.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i70.GetCardioTreanings>(() => _i70.GetCardioTreanings(
      cardioTreaningsRepository: get<_i50.CardioTreaningsRepository>()));
  gh.lazySingleton<_i71.GetClimbingHallRoures>(
      () => _i71.GetClimbingHallRoures(get<_i52.ClimbingHallRepository>()));
  gh.lazySingleton<_i72.GetCurrentIceTreaning>(() => _i72.GetCurrentIceTreaning(
      iceTreaningsRepository: get<_i19.IceTreaningsRepository>()));
  gh.lazySingleton<_i73.GetCurrentStrengthTreaning>(() =>
      _i73.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i74.GetHallRouteAttempts>(() => _i74.GetHallRouteAttempts(
      repository: get<_i11.HallTreaningRepository>()));
  gh.lazySingleton<_i75.GetLastCardioTreaning>(() => _i75.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i50.CardioTreaningsRepository>()));
  gh.lazySingleton<_i76.GetLastIceTreaning>(() => _i76.GetLastIceTreaning(
      iceTreaningsRepository: get<_i19.IceTreaningsRepository>()));
  gh.lazySingleton<_i77.GetPreviosStrengthTreaning>(() =>
      _i77.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i40.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i78.GetStrengthExercises>(() => _i78.GetStrengthExercises(
      strengthExerciseRepository: get<_i36.StrengthExerciseRepository>()));
  gh.lazySingleton<_i79.GetStrengthTreanings>(() => _i79.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i40.StrengthTreaningsRepository>()));
  gh.factory<_i80.HallRouteAttemptsCubit>(() => _i80.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i74.GetHallRouteAttempts>()));
  gh.lazySingleton<_i81.HallRouteToArchive>(() =>
      _i81.HallRouteToArchive(repository: get<_i52.ClimbingHallRepository>()));
  gh.factory<_i82.HallTreaningsCubit>(() => _i82.HallTreaningsCubit(
        allHallTreanings: get<_i45.AllHallTreanings>(),
        deleteHallTreaning: get<_i59.DeleteHallTreaning>(),
      ));
  gh.factory<_i83.IceDistrictsCubit>(() => _i83.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i23.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i84.IceSectorToTreaning>(() => _i84.IceSectorToTreaning(
      iceTreaningsRepository: get<_i19.IceTreaningsRepository>()));
  gh.factory<_i85.IceSectorsCubit>(() =>
      _i85.IceSectorsCubit(loadSectorsUseCase: get<_i24.LoadSectorsUseCase>()));
  gh.lazySingleton<_i86.NewHallRoute>(() => _i86.NewHallRoute(
      climbingHallRepository: get<_i52.ClimbingHallRepository>()));
  gh.lazySingleton<_i87.SaveCardioTreaning>(() => _i87.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i50.CardioTreaningsRepository>()));
  gh.lazySingleton<_i88.SaveStrengthExercise>(() => _i88.SaveStrengthExercise(
      strengthExerciseRepository: get<_i36.StrengthExerciseRepository>()));
  gh.lazySingleton<_i89.SelectToUseStrengthExercise>(() =>
      _i89.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i36.StrengthExerciseRepository>()));
  gh.factory<_i90.StrengthExercisesCubit>(() => _i90.StrengthExercisesCubit(
        get<_i78.GetStrengthExercises>(),
        get<_i88.SaveStrengthExercise>(),
        get<_i89.SelectToUseStrengthExercise>(),
        get<_i61.DeleteStrengthExercise>(),
      ));
  gh.factory<_i91.StrengthTrainingCubit>(() => _i91.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i73.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i77.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i44.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i42.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i43.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i68.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i60.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i92.StrengthTrainingsCubit>(() => _i92.StrengthTrainingsCubit(
        get<_i79.GetStrengthTreanings>(),
        get<_i62.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i93.TreaningsCubit>(() => _i93.TreaningsCubit(
        get<_i69.GetAllTreanings>(),
        get<_i63.DeleteTreaning>(),
      ));
  gh.lazySingleton<_i94.UpdateHalls>(
      () => _i94.UpdateHalls(get<_i52.ClimbingHallRepository>()));
  gh.lazySingleton<_i95.AllClimbingHalls>(
      () => _i95.AllClimbingHalls(get<_i52.ClimbingHallRepository>()));
  gh.factory<_i96.CardioTreaningCubit>(() => _i96.CardioTreaningCubit(
        get<_i75.GetLastCardioTreaning>(),
        get<_i87.SaveCardioTreaning>(),
      ));
  gh.factory<_i97.CardioTreaningsCubit>(() => _i97.CardioTreaningsCubit(
        get<_i70.GetCardioTreanings>(),
        get<_i57.DeleteCardioTreaning>(),
        get<_i87.SaveCardioTreaning>(),
      ));
  gh.factory<_i98.ClimbingHallCubit>(() => _i98.ClimbingHallCubit(
        getClimbingHallRoures: get<_i71.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i81.HallRouteToArchive>(),
      ));
  gh.factory<_i99.ClimbingHallsCubit>(() =>
      _i99.ClimbingHallsCubit(allClimbingHalls: get<_i95.AllClimbingHalls>()));
  gh.factory<_i100.CurrentHallTreaningCubit>(
      () => _i100.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: get<_i27.NewHallAttemptFromRoute>(),
            newHallTreaning: get<_i28.NewHallTreaning>(),
            newHallAttempt: get<_i26.NewHallAttempt>(),
            currentHallTreaning: get<_i56.CurrentHallTreaning>(),
            finishHallAttempt: get<_i64.FinishHallAttempt>(),
            finishHallTreaning: get<_i65.FinishHallTreaning>(),
            lastHallTreaning: get<_i22.LastHallTreaning>(),
            deleteHallAttempt: get<_i58.DeleteHallAttempt>(),
          ));
  gh.factory<_i101.CurrentIceTreaningCubit>(() => _i101.CurrentIceTreaningCubit(
        get<_i30.NewIceTreaning>(),
        get<_i84.IceSectorToTreaning>(),
        get<_i29.NewIceAttempt>(),
        get<_i66.FinishIceAttempt>(),
        get<_i67.FinishIceTreaning>(),
        get<_i72.GetCurrentIceTreaning>(),
        get<_i76.GetLastIceTreaning>(),
      ));
  gh.factory<_i102.HallRouteCubit>(
      () => _i102.HallRouteCubit(get<_i86.NewHallRoute>()));
  gh.factory<_i103.HomePageCubit>(() =>
      _i103.HomePageCubit(allClimbingHalls: get<_i95.AllClimbingHalls>()));
  return get;
}

class _$InjectableModule extends _i104.InjectableModule {}

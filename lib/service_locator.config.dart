// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:firebase_analytics/firebase_analytics.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i22;

import 'core/datasource/drift_db_local_datasource.dart' as _i5;
import 'core/injectable_module.dart' as _i119;
import 'core/services/analitics/analitics_service.dart' as _i50;
import 'core/services/analitics/firebase_analitics_service.dart' as _i51;
import 'core/services/crash_log_service/crash_log_service.dart' as _i62;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i63;
import 'core/services/network/network_info.dart' as _i26;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i52;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i53;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i55;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i54;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i107;
import 'features/authentication/domain/usecases/auth_login.dart' as _i108;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i109;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i110;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i56;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i57;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i59;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i58;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i65;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i78;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i83;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i96;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i111;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i112;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i10;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i11;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i32;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i33;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i61;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i13;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i60;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i106;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i79;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i82;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i89;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i95;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i49;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i64;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i66;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i67;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i72;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i73;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i23;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i27;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i28;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i29;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i105;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i113;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i114;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i115;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i117;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i88;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i90;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i118;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i14;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i18;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i15;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i19;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i17;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i21;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i16;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i20;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i74;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i75;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i80;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i84;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i92;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i24;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i25;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i30;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i31;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i116;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i91;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i93;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i35;
import 'features/settings/data/datasources/settings_datasource.dart' as _i34;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i37;
import 'features/settings/domain/repositories/settings_repository.dart' as _i36;
import 'features/settings/domain/usecases/load_treanings_settings.dart' as _i94;
import 'features/settings/domain/usecases/save_treanings_settings.dart' as _i98;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i100;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i39;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i43;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i38;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i42;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i41;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i45;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i40;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i44;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i47;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i48;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i68;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i69;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i70;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i76;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i81;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i85;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i86;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i87;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i97;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i99;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i46;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i101;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i102;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i103;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i71;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i77;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i104; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingletonAsync<_i8.FirebaseCrashlytics>(
      () => injectableModule.firebaseCrashlytics);
  gh.lazySingleton<_i9.FirebaseFirestore>(
      () => injectableModule.firebaseFirestore);
  gh.lazySingleton<_i10.HallTreaningDataSource>(() =>
      _i11.LocalHallTreaningDataSource(
          localDatabase: get<_i5.DriftDBLocalDataSource>()));
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
  gh.lazySingleton<_i18.IceTreaningsDataSource>(() =>
      _i19.LocalIceTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i20.IceTreaningsRepository>(() =>
      _i21.IceTreaningsRepositoryImpl(get<_i18.IceTreaningsDataSource>()));
  gh.lazySingleton<_i22.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker);
  gh.lazySingleton<_i23.LastHallTreaning>(
      () => _i23.LastHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i24.LoadDistrictsUseCase>(() => _i24.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i16.IceRegionsRepository>()));
  gh.lazySingleton<_i25.LoadSectorsUseCase>(() => _i25.LoadSectorsUseCase(
      iceRegionsRepository: get<_i16.IceRegionsRepository>()));
  gh.lazySingleton<_i26.NetworkInfo>(
      () => _i26.NetworkInfoImpl(get<_i22.InternetConnectionChecker>()));
  gh.lazySingleton<_i27.NewHallAttempt>(() => _i27.NewHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i28.NewHallAttemptFromRoute>(() =>
      _i28.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i29.NewHallTreaning>(() => _i29.NewHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i30.NewIceAttempt>(
      () => _i30.NewIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i31.NewIceTreaning>(() => _i31.NewIceTreaning(
        iceTreaningsRepository: get<_i20.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i16.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i32.RemoteGymDataSource>(() => _i33.RemoteGymDataSourceImpl(
        get<_i9.FirebaseFirestore>(),
        get<_i7.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i34.SettingsDataSource>(
      () => _i35.SettingsDataSourceImpl());
  gh.lazySingleton<_i36.SettingsRepository>(
      () => _i37.SettingsRepositoryImpl(get<_i34.SettingsDataSource>()));
  gh.lazySingleton<_i38.StrengthExerciseDataSource>(() =>
      _i39.LocalStrengthExerciseDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i40.StrengthExerciseRepository>(() =>
      _i41.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i38.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i42.StrengthTreaningsDataSource>(() =>
      _i43.LocalStrengthTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i44.StrengthTreaningsRepository>(() =>
      _i45.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i42.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i46.UpdateStrengthTreaningExercises>(() =>
      _i46.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i44.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i40.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i47.AddRepetitionForStrengthTreaning>(() =>
      _i47.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i44.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i48.AddStrengthTreaning>(() => _i48.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i44.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i40.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i49.AllHallTreanings>(
      () => _i49.AllHallTreanings(get<_i12.HallTreaningRepository>()));
  gh.lazySingletonAsync<_i50.AnaliticsService>(() async =>
      _i51.FirebaseAnaliticsService(
          await get.getAsync<_i6.FirebaseAnalytics>()));
  gh.lazySingleton<_i52.AuthDataSource>(
      () => _i53.FirebaseAuthDataSource(firebaseAuth: get<_i7.FirebaseAuth>()));
  gh.lazySingleton<_i54.AuthRepository>(() =>
      _i55.AuthRepositoryImpl(authDataSource: get<_i52.AuthDataSource>()));
  gh.lazySingleton<_i56.CardioTreaningsDatasource>(() =>
      _i57.LocalCardioTreaningsDatasource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i58.CardioTreaningsRepository>(() =>
      _i59.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i56.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i60.ClimbingHallRepository>(
      () => _i61.ClimbingHallRepositoryImpl(
            get<_i3.ClimbingHallDataSource>(),
            get<_i32.RemoteGymDataSource>(),
            get<_i26.NetworkInfo>(),
          ));
  gh.lazySingletonAsync<_i62.CrashLogService>(() async =>
      _i63.GoogleCrashLogService(
          await get.getAsync<_i8.FirebaseCrashlytics>()));
  gh.lazySingleton<_i64.CurrentHallTreaning>(
      () => _i64.CurrentHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i65.DeleteCardioTreaning>(() => _i65.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i58.CardioTreaningsRepository>()));
  gh.lazySingleton<_i66.DeleteHallAttempt>(() => _i66.DeleteHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i67.DeleteHallTreaning>(() => _i67.DeleteHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i68.DeleteRepetitionForStrengthTreaning>(() =>
      _i68.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i44.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i69.DeleteStrengthExercise>(() =>
      _i69.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i40.StrengthExerciseRepository>()));
  gh.lazySingleton<_i70.DeleteStrengthTreaning>(() =>
      _i70.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i44.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i71.DeleteTreaning>(() => _i71.DeleteTreaning(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i44.StrengthTreaningsRepository>(),
        get<_i58.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i72.FinishHallAttempt>(() => _i72.FinishHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i73.FinishHallTreaning>(() => _i73.FinishHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i74.FinishIceAttempt>(
      () => _i74.FinishIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i75.FinishIceTreaning>(() => _i75.FinishIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i76.FinishStrengthTreaning>(() =>
      _i76.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i44.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i77.GetAllTreanings>(() => _i77.GetAllTreanings(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i44.StrengthTreaningsRepository>(),
        get<_i58.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i78.GetCardioTreanings>(() => _i78.GetCardioTreanings(
      cardioTreaningsRepository: get<_i58.CardioTreaningsRepository>()));
  gh.lazySingleton<_i79.GetClimbingHallRoures>(
      () => _i79.GetClimbingHallRoures(get<_i60.ClimbingHallRepository>()));
  gh.lazySingleton<_i80.GetCurrentIceTreaning>(() => _i80.GetCurrentIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i81.GetCurrentStrengthTreaning>(() =>
      _i81.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i44.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i82.GetHallRouteAttempts>(() => _i82.GetHallRouteAttempts(
      repository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i83.GetLastCardioTreaning>(() => _i83.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i58.CardioTreaningsRepository>()));
  gh.lazySingleton<_i84.GetLastIceTreaning>(() => _i84.GetLastIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i85.GetPreviosStrengthTreaning>(() =>
      _i85.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i44.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i86.GetStrengthExercises>(() => _i86.GetStrengthExercises(
      strengthExerciseRepository: get<_i40.StrengthExerciseRepository>()));
  gh.lazySingleton<_i87.GetStrengthTreanings>(() => _i87.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i44.StrengthTreaningsRepository>()));
  gh.factory<_i88.HallRouteAttemptsCubit>(() => _i88.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i82.GetHallRouteAttempts>()));
  gh.lazySingleton<_i89.HallRouteToArchive>(() =>
      _i89.HallRouteToArchive(repository: get<_i60.ClimbingHallRepository>()));
  gh.factory<_i90.HallTreaningsCubit>(() => _i90.HallTreaningsCubit(
        allHallTreanings: get<_i49.AllHallTreanings>(),
        deleteHallTreaning: get<_i67.DeleteHallTreaning>(),
      ));
  gh.factory<_i91.IceDistrictsCubit>(() => _i91.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i24.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i92.IceSectorToTreaning>(() => _i92.IceSectorToTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.factory<_i93.IceSectorsCubit>(() =>
      _i93.IceSectorsCubit(loadSectorsUseCase: get<_i25.LoadSectorsUseCase>()));
  gh.lazySingleton<_i94.LoadTreaningsSettings>(
      () => _i94.LoadTreaningsSettings(get<_i36.SettingsRepository>()));
  gh.lazySingleton<_i95.NewHallRoute>(() => _i95.NewHallRoute(
      climbingHallRepository: get<_i60.ClimbingHallRepository>()));
  gh.lazySingleton<_i96.SaveCardioTreaning>(() => _i96.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i58.CardioTreaningsRepository>()));
  gh.lazySingleton<_i97.SaveStrengthExercise>(() => _i97.SaveStrengthExercise(
      strengthExerciseRepository: get<_i40.StrengthExerciseRepository>()));
  gh.lazySingleton<_i98.SaveTreaningsSettings>(
      () => _i98.SaveTreaningsSettings(get<_i36.SettingsRepository>()));
  gh.lazySingleton<_i99.SelectToUseStrengthExercise>(() =>
      _i99.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i40.StrengthExerciseRepository>()));
  gh.lazySingleton<_i100.SettingsCubit>(() => _i100.SettingsCubit(
        get<_i94.LoadTreaningsSettings>(),
        get<_i98.SaveTreaningsSettings>(),
      ));
  gh.factory<_i101.StrengthExercisesCubit>(() => _i101.StrengthExercisesCubit(
        get<_i86.GetStrengthExercises>(),
        get<_i97.SaveStrengthExercise>(),
        get<_i99.SelectToUseStrengthExercise>(),
        get<_i69.DeleteStrengthExercise>(),
      ));
  gh.factory<_i102.StrengthTrainingCubit>(() => _i102.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i81.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i85.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i48.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i46.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i47.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i76.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i68.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i103.StrengthTrainingsCubit>(() => _i103.StrengthTrainingsCubit(
        get<_i87.GetStrengthTreanings>(),
        get<_i70.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i104.TreaningsCubit>(() => _i104.TreaningsCubit(
        get<_i77.GetAllTreanings>(),
        get<_i71.DeleteTreaning>(),
      ));
  gh.lazySingleton<_i105.UpdateHalls>(
      () => _i105.UpdateHalls(get<_i60.ClimbingHallRepository>()));
  gh.lazySingleton<_i106.AllClimbingHalls>(
      () => _i106.AllClimbingHalls(get<_i60.ClimbingHallRepository>()));
  gh.factory<_i107.AuthGetUser>(
      () => _i107.AuthGetUser(authRepository: get<_i54.AuthRepository>()));
  gh.factory<_i108.AuthLogin>(
      () => _i108.AuthLogin(authRepository: get<_i54.AuthRepository>()));
  gh.factory<_i109.AuthLogout>(
      () => _i109.AuthLogout(authRepository: get<_i54.AuthRepository>()));
  gh.factory<_i110.AuthenticationCubit>(() => _i110.AuthenticationCubit(
        get<_i108.AuthLogin>(),
        get<_i109.AuthLogout>(),
        get<_i107.AuthGetUser>(),
      ));
  gh.factory<_i111.CardioTreaningCubit>(() => _i111.CardioTreaningCubit(
        get<_i83.GetLastCardioTreaning>(),
        get<_i96.SaveCardioTreaning>(),
      ));
  gh.factory<_i112.CardioTreaningsCubit>(() => _i112.CardioTreaningsCubit(
        get<_i78.GetCardioTreanings>(),
        get<_i65.DeleteCardioTreaning>(),
        get<_i96.SaveCardioTreaning>(),
      ));
  gh.factory<_i113.ClimbingHallCubit>(() => _i113.ClimbingHallCubit(
        getClimbingHallRoures: get<_i79.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i89.HallRouteToArchive>(),
      ));
  gh.factory<_i114.ClimbingHallsCubit>(() => _i114.ClimbingHallsCubit(
      allClimbingHalls: get<_i106.AllClimbingHalls>()));
  gh.factory<_i115.CurrentHallTreaningCubit>(
      () => _i115.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: get<_i28.NewHallAttemptFromRoute>(),
            newHallTreaning: get<_i29.NewHallTreaning>(),
            newHallAttempt: get<_i27.NewHallAttempt>(),
            currentHallTreaning: get<_i64.CurrentHallTreaning>(),
            finishHallAttempt: get<_i72.FinishHallAttempt>(),
            finishHallTreaning: get<_i73.FinishHallTreaning>(),
            lastHallTreaning: get<_i23.LastHallTreaning>(),
            deleteHallAttempt: get<_i66.DeleteHallAttempt>(),
          ));
  gh.factory<_i116.CurrentIceTreaningCubit>(() => _i116.CurrentIceTreaningCubit(
        get<_i31.NewIceTreaning>(),
        get<_i92.IceSectorToTreaning>(),
        get<_i30.NewIceAttempt>(),
        get<_i74.FinishIceAttempt>(),
        get<_i75.FinishIceTreaning>(),
        get<_i80.GetCurrentIceTreaning>(),
        get<_i84.GetLastIceTreaning>(),
      ));
  gh.factory<_i117.HallRouteCubit>(
      () => _i117.HallRouteCubit(get<_i95.NewHallRoute>()));
  gh.factory<_i118.HomePageCubit>(() =>
      _i118.HomePageCubit(allClimbingHalls: get<_i106.AllClimbingHalls>()));
  return get;
}

class _$InjectableModule extends _i119.InjectableModule {}

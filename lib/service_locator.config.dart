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
import 'core/injectable_module.dart' as _i144;
import 'core/services/analitics/analitics_service.dart' as _i57;
import 'core/services/analitics/firebase_analitics_service.dart' as _i58;
import 'core/services/crash_log_service/crash_log_service.dart' as _i69;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i70;
import 'core/services/network/network_info.dart' as _i24;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i59;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i60;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i62;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i61;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i130;
import 'features/authentication/domain/usecases/auth_login.dart' as _i131;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i132;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i133;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i63;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i64;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i66;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i65;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i72;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i87;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i93;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i120;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i134;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i135;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i10;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i11;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i29;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i30;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i68;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i13;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i67;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i129;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i88;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i92;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i100;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i111;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i56;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i71;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i73;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i74;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i79;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i80;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i23;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i25;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i26;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i27;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i136;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i137;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i138;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i140;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i99;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i101;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i141;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i17;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i14;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i16;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i18;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i15;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i19;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i103;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i21;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i102;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i20;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i81;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i82;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i89;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i94;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i104;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i105;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i109;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i28;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i112;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i139;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i142;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i143;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i38;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i34;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i32;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i31;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i33;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i37;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i36;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i40;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i35;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i39;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i83;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i84;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i90;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i95;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i106;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i107;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i108;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i113;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i114;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i117;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i115;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i116;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i118;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i119;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i42;
import 'features/settings/data/datasources/settings_datasource.dart' as _i41;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i44;
import 'features/settings/domain/repositories/settings_repository.dart' as _i43;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i110;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i122;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i124;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i46;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i50;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i45;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i49;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i48;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i52;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i47;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i51;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i54;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i55;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i75;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i76;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i77;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i85;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i91;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i96;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i97;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i98;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i121;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i123;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i53;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i125;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i126;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i127;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i78;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i86;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i128; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i16.IceRegionsRemoteDataSource>(() =>
      _i17.FirebaseIceRegionsRemoteDataSource(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i18.IceTreaningsDataSource>(() =>
      _i19.LocalIceTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i20.IceTreaningsRepository>(() =>
      _i21.IceTreaningsRepositoryImpl(get<_i18.IceTreaningsDataSource>()));
  gh.lazySingleton<_i22.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker);
  gh.lazySingleton<_i23.LastHallTreaning>(
      () => _i23.LastHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i24.NetworkInfo>(
      () => _i24.NetworkInfoImpl(get<_i22.InternetConnectionChecker>()));
  gh.lazySingleton<_i25.NewHallAttempt>(() => _i25.NewHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i26.NewHallAttemptFromRoute>(() =>
      _i26.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i27.NewHallTreaning>(() => _i27.NewHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i28.NewIceAttempt>(
      () => _i28.NewIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i29.RemoteGymDataSource>(() => _i30.RemoteGymDataSourceImpl(
        get<_i9.FirebaseFirestore>(),
        get<_i7.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i31.RockRegionsLocalDataSource>(
      () => _i32.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i33.RockRegionsRemoteDataSource>(() =>
      _i34.FirebaseRockRegionsRemoteDataSource(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i35.RockRegionsRepository>(
      () => _i36.RockRegionsRepositoryImpl(
            get<_i31.RockRegionsLocalDataSource>(),
            get<_i33.RockRegionsRemoteDataSource>(),
            get<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i37.RockTreaningsLocalDataSource>(() =>
      _i38.DriftRockTreaningsLocalDataSource(
          get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i39.RockTreaningsRepository>(() =>
      _i40.RockTreaningsRepositoryImpl(
          get<_i37.RockTreaningsLocalDataSource>()));
  gh.lazySingleton<_i41.SettingsDataSource>(
      () => _i42.SettingsDataSourceImpl());
  gh.lazySingleton<_i43.SettingsRepository>(
      () => _i44.SettingsRepositoryImpl(get<_i41.SettingsDataSource>()));
  gh.lazySingleton<_i45.StrengthExerciseDataSource>(() =>
      _i46.LocalStrengthExerciseDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i47.StrengthExerciseRepository>(() =>
      _i48.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i45.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i49.StrengthTreaningsDataSource>(() =>
      _i50.LocalStrengthTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i51.StrengthTreaningsRepository>(() =>
      _i52.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i49.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i53.UpdateStrengthTreaningExercises>(() =>
      _i53.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i51.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i47.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i54.AddRepetitionForStrengthTreaning>(() =>
      _i54.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i55.AddStrengthTreaning>(() => _i55.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i51.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i47.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i56.AllHallTreanings>(
      () => _i56.AllHallTreanings(get<_i12.HallTreaningRepository>()));
  gh.lazySingletonAsync<_i57.AnaliticsService>(() async =>
      _i58.FirebaseAnaliticsService(
          await get.getAsync<_i6.FirebaseAnalytics>()));
  gh.lazySingleton<_i59.AuthDataSource>(
      () => _i60.FirebaseAuthDataSource(firebaseAuth: get<_i7.FirebaseAuth>()));
  gh.lazySingleton<_i61.AuthRepository>(() =>
      _i62.AuthRepositoryImpl(authDataSource: get<_i59.AuthDataSource>()));
  gh.lazySingleton<_i63.CardioTreaningsDatasource>(() =>
      _i64.LocalCardioTreaningsDatasource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i65.CardioTreaningsRepository>(() =>
      _i66.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i63.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i67.ClimbingHallRepository>(
      () => _i68.ClimbingHallRepositoryImpl(
            get<_i3.ClimbingHallDataSource>(),
            get<_i29.RemoteGymDataSource>(),
            get<_i24.NetworkInfo>(),
          ));
  gh.lazySingletonAsync<_i69.CrashLogService>(() async =>
      _i70.GoogleCrashLogService(
          await get.getAsync<_i8.FirebaseCrashlytics>()));
  gh.lazySingleton<_i71.CurrentHallTreaning>(
      () => _i71.CurrentHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i72.DeleteCardioTreaning>(() => _i72.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i65.CardioTreaningsRepository>()));
  gh.lazySingleton<_i73.DeleteHallAttempt>(() => _i73.DeleteHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i74.DeleteHallTreaning>(() => _i74.DeleteHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i75.DeleteRepetitionForStrengthTreaning>(() =>
      _i75.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i76.DeleteStrengthExercise>(() =>
      _i76.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i77.DeleteStrengthTreaning>(() =>
      _i77.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i78.DeleteTreaning>(() => _i78.DeleteTreaning(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i51.StrengthTreaningsRepository>(),
        get<_i65.CardioTreaningsRepository>(),
        get<_i39.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i79.FinishHallAttempt>(() => _i79.FinishHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i80.FinishHallTreaning>(() => _i80.FinishHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i81.FinishIceAttempt>(
      () => _i81.FinishIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i82.FinishIceTreaning>(() => _i82.FinishIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i83.FinishRockAttempt>(
      () => _i83.FinishRockAttempt(get<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i84.FinishRockTreaning>(
      () => _i84.FinishRockTreaning(get<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i85.FinishStrengthTreaning>(() =>
      _i85.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i86.GetAllTreanings>(() => _i86.GetAllTreanings(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i51.StrengthTreaningsRepository>(),
        get<_i65.CardioTreaningsRepository>(),
        get<_i39.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i87.GetCardioTreanings>(() => _i87.GetCardioTreanings(
      cardioTreaningsRepository: get<_i65.CardioTreaningsRepository>()));
  gh.lazySingleton<_i88.GetClimbingHallRoures>(
      () => _i88.GetClimbingHallRoures(get<_i67.ClimbingHallRepository>()));
  gh.lazySingleton<_i89.GetCurrentIceTreaning>(() => _i89.GetCurrentIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i90.GetCurrentRockTreaning>(
      () => _i90.GetCurrentRockTreaning(get<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i91.GetCurrentStrengthTreaning>(() =>
      _i91.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i92.GetHallRouteAttempts>(() => _i92.GetHallRouteAttempts(
      repository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i93.GetLastCardioTreaning>(() => _i93.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i65.CardioTreaningsRepository>()));
  gh.lazySingleton<_i94.GetLastIceTreaning>(() => _i94.GetLastIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i95.GetLastRockTreaning>(
      () => _i95.GetLastRockTreaning(get<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i96.GetPreviosStrengthTreaning>(() =>
      _i96.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i97.GetStrengthExercises>(() => _i97.GetStrengthExercises(
      strengthExerciseRepository: get<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i98.GetStrengthTreanings>(() => _i98.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i51.StrengthTreaningsRepository>()));
  gh.factory<_i99.HallRouteAttemptsCubit>(() => _i99.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i92.GetHallRouteAttempts>()));
  gh.lazySingleton<_i100.HallRouteToArchive>(() =>
      _i100.HallRouteToArchive(repository: get<_i67.ClimbingHallRepository>()));
  gh.factory<_i101.HallTreaningsCubit>(() => _i101.HallTreaningsCubit(
        allHallTreanings: get<_i56.AllHallTreanings>(),
        deleteHallTreaning: get<_i74.DeleteHallTreaning>(),
      ));
  gh.lazySingleton<_i102.IceRegionsRepository>(
      () => _i103.IceRegionsRepositoryImpl(
            get<_i14.IceRegionsDataSource>(),
            get<_i16.IceRegionsRemoteDataSource>(),
            get<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i104.IceSectorToTreaning>(() => _i104.IceSectorToTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i105.LoadDistrictsUseCase>(() => _i105.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i102.IceRegionsRepository>()));
  gh.lazySingleton<_i106.LoadRockDistricts>(
      () => _i106.LoadRockDistricts(get<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i107.LoadRockRoutes>(
      () => _i107.LoadRockRoutes(get<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i108.LoadRockSectors>(
      () => _i108.LoadRockSectors(get<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i109.LoadSectorsUseCase>(() => _i109.LoadSectorsUseCase(
      iceRegionsRepository: get<_i102.IceRegionsRepository>()));
  gh.lazySingleton<_i110.LoadTreaningsSettings>(
      () => _i110.LoadTreaningsSettings(get<_i43.SettingsRepository>()));
  gh.lazySingleton<_i111.NewHallRoute>(() => _i111.NewHallRoute(
      climbingHallRepository: get<_i67.ClimbingHallRepository>()));
  gh.lazySingleton<_i112.NewIceTreaning>(() => _i112.NewIceTreaning(
        iceTreaningsRepository: get<_i20.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i102.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i113.NewRockAttempt>(
      () => _i113.NewRockAttempt(get<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i114.NewRockTreaning>(
      () => _i114.NewRockTreaning(get<_i39.RockTreaningsRepository>()));
  gh.factory<_i115.RockDistrictsCubit>(
      () => _i115.RockDistrictsCubit(get<_i106.LoadRockDistricts>()));
  gh.factory<_i116.RockRoutesCubit>(
      () => _i116.RockRoutesCubit(get<_i107.LoadRockRoutes>()));
  gh.lazySingleton<_i117.RockSectorToTreaning>(
      () => _i117.RockSectorToTreaning(get<_i39.RockTreaningsRepository>()));
  gh.factory<_i118.RockSectorsCubit>(
      () => _i118.RockSectorsCubit(get<_i108.LoadRockSectors>()));
  gh.factory<_i119.RockTreaningCubit>(() => _i119.RockTreaningCubit(
        get<_i114.NewRockTreaning>(),
        get<_i117.RockSectorToTreaning>(),
        get<_i113.NewRockAttempt>(),
        get<_i83.FinishRockAttempt>(),
        get<_i84.FinishRockTreaning>(),
        get<_i95.GetLastRockTreaning>(),
        get<_i90.GetCurrentRockTreaning>(),
      ));
  gh.lazySingleton<_i120.SaveCardioTreaning>(() => _i120.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i65.CardioTreaningsRepository>()));
  gh.lazySingleton<_i121.SaveStrengthExercise>(() => _i121.SaveStrengthExercise(
      strengthExerciseRepository: get<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i122.SaveTreaningsSettings>(
      () => _i122.SaveTreaningsSettings(get<_i43.SettingsRepository>()));
  gh.lazySingleton<_i123.SelectToUseStrengthExercise>(() =>
      _i123.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i124.SettingsCubit>(() => _i124.SettingsCubit(
        get<_i110.LoadTreaningsSettings>(),
        get<_i122.SaveTreaningsSettings>(),
      ));
  gh.factory<_i125.StrengthExercisesCubit>(() => _i125.StrengthExercisesCubit(
        get<_i97.GetStrengthExercises>(),
        get<_i121.SaveStrengthExercise>(),
        get<_i123.SelectToUseStrengthExercise>(),
        get<_i76.DeleteStrengthExercise>(),
      ));
  gh.factory<_i126.StrengthTrainingCubit>(() => _i126.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i91.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i96.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i55.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i53.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i54.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i85.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i75.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i127.StrengthTrainingsCubit>(() => _i127.StrengthTrainingsCubit(
        get<_i98.GetStrengthTreanings>(),
        get<_i77.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i128.TreaningsCubit>(() => _i128.TreaningsCubit(
        get<_i86.GetAllTreanings>(),
        get<_i78.DeleteTreaning>(),
      ));
  gh.lazySingleton<_i129.AllClimbingHalls>(
      () => _i129.AllClimbingHalls(get<_i67.ClimbingHallRepository>()));
  gh.factory<_i130.AuthGetUser>(
      () => _i130.AuthGetUser(authRepository: get<_i61.AuthRepository>()));
  gh.factory<_i131.AuthLogin>(
      () => _i131.AuthLogin(authRepository: get<_i61.AuthRepository>()));
  gh.factory<_i132.AuthLogout>(
      () => _i132.AuthLogout(authRepository: get<_i61.AuthRepository>()));
  gh.factory<_i133.AuthenticationCubit>(() => _i133.AuthenticationCubit(
        get<_i131.AuthLogin>(),
        get<_i132.AuthLogout>(),
        get<_i130.AuthGetUser>(),
      ));
  gh.factory<_i134.CardioTreaningCubit>(() => _i134.CardioTreaningCubit(
        get<_i93.GetLastCardioTreaning>(),
        get<_i120.SaveCardioTreaning>(),
      ));
  gh.factory<_i135.CardioTreaningsCubit>(() => _i135.CardioTreaningsCubit(
        get<_i87.GetCardioTreanings>(),
        get<_i72.DeleteCardioTreaning>(),
        get<_i120.SaveCardioTreaning>(),
      ));
  gh.factory<_i136.ClimbingHallCubit>(() => _i136.ClimbingHallCubit(
        getClimbingHallRoures: get<_i88.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i100.HallRouteToArchive>(),
      ));
  gh.factory<_i137.ClimbingHallsCubit>(() => _i137.ClimbingHallsCubit(
      allClimbingHalls: get<_i129.AllClimbingHalls>()));
  gh.factory<_i138.CurrentHallTreaningCubit>(
      () => _i138.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: get<_i26.NewHallAttemptFromRoute>(),
            newHallTreaning: get<_i27.NewHallTreaning>(),
            newHallAttempt: get<_i25.NewHallAttempt>(),
            currentHallTreaning: get<_i71.CurrentHallTreaning>(),
            finishHallAttempt: get<_i79.FinishHallAttempt>(),
            finishHallTreaning: get<_i80.FinishHallTreaning>(),
            lastHallTreaning: get<_i23.LastHallTreaning>(),
            deleteHallAttempt: get<_i73.DeleteHallAttempt>(),
          ));
  gh.factory<_i139.CurrentIceTreaningCubit>(() => _i139.CurrentIceTreaningCubit(
        get<_i112.NewIceTreaning>(),
        get<_i104.IceSectorToTreaning>(),
        get<_i28.NewIceAttempt>(),
        get<_i81.FinishIceAttempt>(),
        get<_i82.FinishIceTreaning>(),
        get<_i89.GetCurrentIceTreaning>(),
        get<_i94.GetLastIceTreaning>(),
      ));
  gh.factory<_i140.HallRouteCubit>(
      () => _i140.HallRouteCubit(get<_i111.NewHallRoute>()));
  gh.factory<_i141.HomePageCubit>(() =>
      _i141.HomePageCubit(allClimbingHalls: get<_i129.AllClimbingHalls>()));
  gh.factory<_i142.IceDistrictsCubit>(() => _i142.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i105.LoadDistrictsUseCase>()));
  gh.factory<_i143.IceSectorsCubit>(() => _i143.IceSectorsCubit(
      loadSectorsUseCase: get<_i109.LoadSectorsUseCase>()));
  return get;
}

class _$InjectableModule extends _i144.InjectableModule {}

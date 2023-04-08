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
import 'core/injectable_module.dart' as _i142;
import 'core/services/analitics/analitics_service.dart' as _i60;
import 'core/services/analitics/firebase_analitics_service.dart' as _i61;
import 'core/services/crash_log_service/crash_log_service.dart' as _i72;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i73;
import 'core/services/network/network_info.dart' as _i26;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i62;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i63;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i65;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i64;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i130;
import 'features/authentication/domain/usecases/auth_login.dart' as _i131;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i132;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i133;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i66;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i67;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i69;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i68;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i75;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i90;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i96;
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
    as _i32;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i33;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i71;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i13;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i70;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i129;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i91;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i95;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i103;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i112;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i59;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i74;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i76;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i77;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i82;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i83;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i23;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i27;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i28;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i29;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i136;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i137;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i138;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i140;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i102;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i104;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i141;
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
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i84;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i85;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i92;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i97;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i106;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i24;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i25;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i30;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i31;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i139;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i105;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i107;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i41;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i37;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i35;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i34;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i36;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i40;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i39;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i43;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i38;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i42;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i86;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i87;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i93;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i98;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i108;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i109;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i110;
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
    as _i45;
import 'features/settings/data/datasources/settings_datasource.dart' as _i44;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i47;
import 'features/settings/domain/repositories/settings_repository.dart' as _i46;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i111;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i122;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i124;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i49;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i53;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i48;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i52;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i51;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i55;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i50;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i54;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i57;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i58;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i78;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i79;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i80;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i88;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i94;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i99;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i100;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i101;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i121;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i123;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i56;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i125;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i126;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i127;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i81;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i89;
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
  gh.lazySingleton<_i34.RockRegionsLocalDataSource>(
      () => _i35.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i36.RockRegionsRemoteDataSource>(() =>
      _i37.FirebaseRockRegionsRemoteDataSource(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i38.RockRegionsRepository>(
      () => _i39.RockRegionsRepositoryImpl(
            get<_i34.RockRegionsLocalDataSource>(),
            get<_i36.RockRegionsRemoteDataSource>(),
          ));
  gh.lazySingleton<_i40.RockTreaningsLocalDataSource>(() =>
      _i41.DriftRockTreaningsLocalDataSource(
          get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i42.RockTreaningsRepository>(() =>
      _i43.RockTreaningsRepositoryImpl(
          get<_i40.RockTreaningsLocalDataSource>()));
  gh.lazySingleton<_i44.SettingsDataSource>(
      () => _i45.SettingsDataSourceImpl());
  gh.lazySingleton<_i46.SettingsRepository>(
      () => _i47.SettingsRepositoryImpl(get<_i44.SettingsDataSource>()));
  gh.lazySingleton<_i48.StrengthExerciseDataSource>(() =>
      _i49.LocalStrengthExerciseDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i50.StrengthExerciseRepository>(() =>
      _i51.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i48.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i52.StrengthTreaningsDataSource>(() =>
      _i53.LocalStrengthTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i54.StrengthTreaningsRepository>(() =>
      _i55.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i52.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i56.UpdateStrengthTreaningExercises>(() =>
      _i56.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i54.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i50.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i57.AddRepetitionForStrengthTreaning>(() =>
      _i57.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i54.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i58.AddStrengthTreaning>(() => _i58.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i54.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i50.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i59.AllHallTreanings>(
      () => _i59.AllHallTreanings(get<_i12.HallTreaningRepository>()));
  gh.lazySingletonAsync<_i60.AnaliticsService>(() async =>
      _i61.FirebaseAnaliticsService(
          await get.getAsync<_i6.FirebaseAnalytics>()));
  gh.lazySingleton<_i62.AuthDataSource>(
      () => _i63.FirebaseAuthDataSource(firebaseAuth: get<_i7.FirebaseAuth>()));
  gh.lazySingleton<_i64.AuthRepository>(() =>
      _i65.AuthRepositoryImpl(authDataSource: get<_i62.AuthDataSource>()));
  gh.lazySingleton<_i66.CardioTreaningsDatasource>(() =>
      _i67.LocalCardioTreaningsDatasource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i68.CardioTreaningsRepository>(() =>
      _i69.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i66.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i70.ClimbingHallRepository>(
      () => _i71.ClimbingHallRepositoryImpl(
            get<_i3.ClimbingHallDataSource>(),
            get<_i32.RemoteGymDataSource>(),
            get<_i26.NetworkInfo>(),
          ));
  gh.lazySingletonAsync<_i72.CrashLogService>(() async =>
      _i73.GoogleCrashLogService(
          await get.getAsync<_i8.FirebaseCrashlytics>()));
  gh.lazySingleton<_i74.CurrentHallTreaning>(
      () => _i74.CurrentHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i75.DeleteCardioTreaning>(() => _i75.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i68.CardioTreaningsRepository>()));
  gh.lazySingleton<_i76.DeleteHallAttempt>(() => _i76.DeleteHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i77.DeleteHallTreaning>(() => _i77.DeleteHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i78.DeleteRepetitionForStrengthTreaning>(() =>
      _i78.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i54.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i79.DeleteStrengthExercise>(() =>
      _i79.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i50.StrengthExerciseRepository>()));
  gh.lazySingleton<_i80.DeleteStrengthTreaning>(() =>
      _i80.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i54.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i81.DeleteTreaning>(() => _i81.DeleteTreaning(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i54.StrengthTreaningsRepository>(),
        get<_i68.CardioTreaningsRepository>(),
        get<_i42.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i82.FinishHallAttempt>(() => _i82.FinishHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i83.FinishHallTreaning>(() => _i83.FinishHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i84.FinishIceAttempt>(
      () => _i84.FinishIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i85.FinishIceTreaning>(() => _i85.FinishIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i86.FinishRockAttempt>(
      () => _i86.FinishRockAttempt(get<_i42.RockTreaningsRepository>()));
  gh.lazySingleton<_i87.FinishRockTreaning>(
      () => _i87.FinishRockTreaning(get<_i42.RockTreaningsRepository>()));
  gh.lazySingleton<_i88.FinishStrengthTreaning>(() =>
      _i88.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i54.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i89.GetAllTreanings>(() => _i89.GetAllTreanings(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i54.StrengthTreaningsRepository>(),
        get<_i68.CardioTreaningsRepository>(),
        get<_i42.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i90.GetCardioTreanings>(() => _i90.GetCardioTreanings(
      cardioTreaningsRepository: get<_i68.CardioTreaningsRepository>()));
  gh.lazySingleton<_i91.GetClimbingHallRoures>(
      () => _i91.GetClimbingHallRoures(get<_i70.ClimbingHallRepository>()));
  gh.lazySingleton<_i92.GetCurrentIceTreaning>(() => _i92.GetCurrentIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i93.GetCurrentRockTreaning>(
      () => _i93.GetCurrentRockTreaning(get<_i42.RockTreaningsRepository>()));
  gh.lazySingleton<_i94.GetCurrentStrengthTreaning>(() =>
      _i94.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i54.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i95.GetHallRouteAttempts>(() => _i95.GetHallRouteAttempts(
      repository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i96.GetLastCardioTreaning>(() => _i96.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i68.CardioTreaningsRepository>()));
  gh.lazySingleton<_i97.GetLastIceTreaning>(() => _i97.GetLastIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i98.GetLastRockTreaning>(
      () => _i98.GetLastRockTreaning(get<_i42.RockTreaningsRepository>()));
  gh.lazySingleton<_i99.GetPreviosStrengthTreaning>(() =>
      _i99.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i54.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i100.GetStrengthExercises>(() => _i100.GetStrengthExercises(
      strengthExerciseRepository: get<_i50.StrengthExerciseRepository>()));
  gh.lazySingleton<_i101.GetStrengthTreanings>(() => _i101.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i54.StrengthTreaningsRepository>()));
  gh.factory<_i102.HallRouteAttemptsCubit>(() => _i102.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i95.GetHallRouteAttempts>()));
  gh.lazySingleton<_i103.HallRouteToArchive>(() =>
      _i103.HallRouteToArchive(repository: get<_i70.ClimbingHallRepository>()));
  gh.factory<_i104.HallTreaningsCubit>(() => _i104.HallTreaningsCubit(
        allHallTreanings: get<_i59.AllHallTreanings>(),
        deleteHallTreaning: get<_i77.DeleteHallTreaning>(),
      ));
  gh.factory<_i105.IceDistrictsCubit>(() => _i105.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i24.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i106.IceSectorToTreaning>(() => _i106.IceSectorToTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.factory<_i107.IceSectorsCubit>(() => _i107.IceSectorsCubit(
      loadSectorsUseCase: get<_i25.LoadSectorsUseCase>()));
  gh.lazySingleton<_i108.LoadRockDistricts>(
      () => _i108.LoadRockDistricts(get<_i38.RockRegionsRepository>()));
  gh.lazySingleton<_i109.LoadRockRoutes>(
      () => _i109.LoadRockRoutes(get<_i38.RockRegionsRepository>()));
  gh.lazySingleton<_i110.LoadRockSectors>(
      () => _i110.LoadRockSectors(get<_i38.RockRegionsRepository>()));
  gh.lazySingleton<_i111.LoadTreaningsSettings>(
      () => _i111.LoadTreaningsSettings(get<_i46.SettingsRepository>()));
  gh.lazySingleton<_i112.NewHallRoute>(() => _i112.NewHallRoute(
      climbingHallRepository: get<_i70.ClimbingHallRepository>()));
  gh.lazySingleton<_i113.NewRockAttempt>(
      () => _i113.NewRockAttempt(get<_i42.RockTreaningsRepository>()));
  gh.lazySingleton<_i114.NewRockTreaning>(
      () => _i114.NewRockTreaning(get<_i42.RockTreaningsRepository>()));
  gh.factory<_i115.RockDistrictsCubit>(
      () => _i115.RockDistrictsCubit(get<_i108.LoadRockDistricts>()));
  gh.factory<_i116.RockRoutesCubit>(
      () => _i116.RockRoutesCubit(get<_i109.LoadRockRoutes>()));
  gh.lazySingleton<_i117.RockSectorToTreaning>(
      () => _i117.RockSectorToTreaning(get<_i42.RockTreaningsRepository>()));
  gh.factory<_i118.RockSectorsCubit>(
      () => _i118.RockSectorsCubit(get<_i110.LoadRockSectors>()));
  gh.factory<_i119.RockTreaningCubit>(() => _i119.RockTreaningCubit(
        get<_i114.NewRockTreaning>(),
        get<_i117.RockSectorToTreaning>(),
        get<_i113.NewRockAttempt>(),
        get<_i86.FinishRockAttempt>(),
        get<_i87.FinishRockTreaning>(),
        get<_i98.GetLastRockTreaning>(),
        get<_i93.GetCurrentRockTreaning>(),
      ));
  gh.lazySingleton<_i120.SaveCardioTreaning>(() => _i120.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i68.CardioTreaningsRepository>()));
  gh.lazySingleton<_i121.SaveStrengthExercise>(() => _i121.SaveStrengthExercise(
      strengthExerciseRepository: get<_i50.StrengthExerciseRepository>()));
  gh.lazySingleton<_i122.SaveTreaningsSettings>(
      () => _i122.SaveTreaningsSettings(get<_i46.SettingsRepository>()));
  gh.lazySingleton<_i123.SelectToUseStrengthExercise>(() =>
      _i123.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i50.StrengthExerciseRepository>()));
  gh.lazySingleton<_i124.SettingsCubit>(() => _i124.SettingsCubit(
        get<_i111.LoadTreaningsSettings>(),
        get<_i122.SaveTreaningsSettings>(),
      ));
  gh.factory<_i125.StrengthExercisesCubit>(() => _i125.StrengthExercisesCubit(
        get<_i100.GetStrengthExercises>(),
        get<_i121.SaveStrengthExercise>(),
        get<_i123.SelectToUseStrengthExercise>(),
        get<_i79.DeleteStrengthExercise>(),
      ));
  gh.factory<_i126.StrengthTrainingCubit>(() => _i126.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i94.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i99.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i58.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i56.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i57.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i88.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i78.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i127.StrengthTrainingsCubit>(() => _i127.StrengthTrainingsCubit(
        get<_i101.GetStrengthTreanings>(),
        get<_i80.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i128.TreaningsCubit>(() => _i128.TreaningsCubit(
        get<_i89.GetAllTreanings>(),
        get<_i81.DeleteTreaning>(),
      ));
  gh.lazySingleton<_i129.AllClimbingHalls>(
      () => _i129.AllClimbingHalls(get<_i70.ClimbingHallRepository>()));
  gh.factory<_i130.AuthGetUser>(
      () => _i130.AuthGetUser(authRepository: get<_i64.AuthRepository>()));
  gh.factory<_i131.AuthLogin>(
      () => _i131.AuthLogin(authRepository: get<_i64.AuthRepository>()));
  gh.factory<_i132.AuthLogout>(
      () => _i132.AuthLogout(authRepository: get<_i64.AuthRepository>()));
  gh.factory<_i133.AuthenticationCubit>(() => _i133.AuthenticationCubit(
        get<_i131.AuthLogin>(),
        get<_i132.AuthLogout>(),
        get<_i130.AuthGetUser>(),
      ));
  gh.factory<_i134.CardioTreaningCubit>(() => _i134.CardioTreaningCubit(
        get<_i96.GetLastCardioTreaning>(),
        get<_i120.SaveCardioTreaning>(),
      ));
  gh.factory<_i135.CardioTreaningsCubit>(() => _i135.CardioTreaningsCubit(
        get<_i90.GetCardioTreanings>(),
        get<_i75.DeleteCardioTreaning>(),
        get<_i120.SaveCardioTreaning>(),
      ));
  gh.factory<_i136.ClimbingHallCubit>(() => _i136.ClimbingHallCubit(
        getClimbingHallRoures: get<_i91.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i103.HallRouteToArchive>(),
      ));
  gh.factory<_i137.ClimbingHallsCubit>(() => _i137.ClimbingHallsCubit(
      allClimbingHalls: get<_i129.AllClimbingHalls>()));
  gh.factory<_i138.CurrentHallTreaningCubit>(
      () => _i138.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: get<_i28.NewHallAttemptFromRoute>(),
            newHallTreaning: get<_i29.NewHallTreaning>(),
            newHallAttempt: get<_i27.NewHallAttempt>(),
            currentHallTreaning: get<_i74.CurrentHallTreaning>(),
            finishHallAttempt: get<_i82.FinishHallAttempt>(),
            finishHallTreaning: get<_i83.FinishHallTreaning>(),
            lastHallTreaning: get<_i23.LastHallTreaning>(),
            deleteHallAttempt: get<_i76.DeleteHallAttempt>(),
          ));
  gh.factory<_i139.CurrentIceTreaningCubit>(() => _i139.CurrentIceTreaningCubit(
        get<_i31.NewIceTreaning>(),
        get<_i106.IceSectorToTreaning>(),
        get<_i30.NewIceAttempt>(),
        get<_i84.FinishIceAttempt>(),
        get<_i85.FinishIceTreaning>(),
        get<_i92.GetCurrentIceTreaning>(),
        get<_i97.GetLastIceTreaning>(),
      ));
  gh.factory<_i140.HallRouteCubit>(
      () => _i140.HallRouteCubit(get<_i112.NewHallRoute>()));
  gh.factory<_i141.HomePageCubit>(() =>
      _i141.HomePageCubit(allClimbingHalls: get<_i129.AllClimbingHalls>()));
  return get;
}

class _$InjectableModule extends _i142.InjectableModule {}

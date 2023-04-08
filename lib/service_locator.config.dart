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
import 'core/injectable_module.dart' as _i151;
import 'core/services/analitics/analitics_service.dart' as _i63;
import 'core/services/analitics/firebase_analitics_service.dart' as _i64;
import 'core/services/crash_log_service/crash_log_service.dart' as _i75;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i76;
import 'core/services/network/network_info.dart' as _i24;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i65;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i66;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i68;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i67;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i137;
import 'features/authentication/domain/usecases/auth_login.dart' as _i138;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i139;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i140;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i69;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i70;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i72;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i71;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i78;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i93;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i99;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i127;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i141;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i142;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i10;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i11;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i35;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i36;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i74;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i13;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i73;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i136;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i94;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i98;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i106;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i118;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i62;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i77;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i79;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i80;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i85;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i86;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i23;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i25;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i26;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i27;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i143;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i144;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i145;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i147;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i105;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i107;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i148;
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
    as _i109;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i21;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i108;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i20;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i87;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i88;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i95;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i100;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i110;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i111;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i116;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i28;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i119;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i146;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i149;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i150;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i44;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i40;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i38;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i37;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i39;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i43;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i42;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i46;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i41;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i45;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i89;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i90;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i96;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i101;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i113;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i114;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i115;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i120;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i121;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i124;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i122;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i123;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i125;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i126;
import 'features/settings/data/datasources/firebase_places_remote_datasource.dart'
    as _i32;
import 'features/settings/data/datasources/hive_places_local_datasource.dart'
    as _i30;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i48;
import 'features/settings/data/datasources/places_local_datasource.dart'
    as _i29;
import 'features/settings/data/datasources/places_remote_datasource.dart'
    as _i31;
import 'features/settings/data/datasources/settings_datasource.dart' as _i47;
import 'features/settings/data/repositories/places_repository_impl.dart'
    as _i34;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i50;
import 'features/settings/domain/repositories/places_repository.dart' as _i33;
import 'features/settings/domain/repositories/settings_repository.dart' as _i49;
import 'features/settings/domain/usecases/load_places.dart' as _i112;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i117;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i129;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i131;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i52;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i56;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i51;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i55;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i54;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i58;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i53;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i57;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i60;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i61;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i81;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i82;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i83;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i91;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i97;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i102;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i103;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i104;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i128;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i130;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i59;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i132;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i133;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i134;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i84;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i92;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i135; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i29.PlacesLocalDataSource>(
      () => _i30.HivePlacesLocalDataSource());
  gh.lazySingleton<_i31.PlacesRemoteDataSource>(
      () => _i32.FirebasePlacesRemoteDataSource(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i33.PlacesRepository>(() => _i34.PlacesRepositoryImpl(
        get<_i29.PlacesLocalDataSource>(),
        get<_i31.PlacesRemoteDataSource>(),
        get<_i24.NetworkInfo>(),
      ));
  gh.lazySingleton<_i35.RemoteGymDataSource>(() => _i36.RemoteGymDataSourceImpl(
        get<_i9.FirebaseFirestore>(),
        get<_i7.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i37.RockRegionsLocalDataSource>(
      () => _i38.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i39.RockRegionsRemoteDataSource>(() =>
      _i40.FirebaseRockRegionsRemoteDataSource(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i41.RockRegionsRepository>(
      () => _i42.RockRegionsRepositoryImpl(
            get<_i37.RockRegionsLocalDataSource>(),
            get<_i39.RockRegionsRemoteDataSource>(),
            get<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i43.RockTreaningsLocalDataSource>(() =>
      _i44.DriftRockTreaningsLocalDataSource(
          get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i45.RockTreaningsRepository>(() =>
      _i46.RockTreaningsRepositoryImpl(
          get<_i43.RockTreaningsLocalDataSource>()));
  gh.lazySingleton<_i47.SettingsDataSource>(
      () => _i48.SettingsDataSourceImpl());
  gh.lazySingleton<_i49.SettingsRepository>(
      () => _i50.SettingsRepositoryImpl(get<_i47.SettingsDataSource>()));
  gh.lazySingleton<_i51.StrengthExerciseDataSource>(() =>
      _i52.LocalStrengthExerciseDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i53.StrengthExerciseRepository>(() =>
      _i54.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i51.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i55.StrengthTreaningsDataSource>(() =>
      _i56.LocalStrengthTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i57.StrengthTreaningsRepository>(() =>
      _i58.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i55.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i59.UpdateStrengthTreaningExercises>(() =>
      _i59.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i57.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i53.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i60.AddRepetitionForStrengthTreaning>(() =>
      _i60.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i61.AddStrengthTreaning>(() => _i61.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i57.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i53.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i62.AllHallTreanings>(
      () => _i62.AllHallTreanings(get<_i12.HallTreaningRepository>()));
  gh.lazySingletonAsync<_i63.AnaliticsService>(() async =>
      _i64.FirebaseAnaliticsService(
          await get.getAsync<_i6.FirebaseAnalytics>()));
  gh.lazySingleton<_i65.AuthDataSource>(
      () => _i66.FirebaseAuthDataSource(firebaseAuth: get<_i7.FirebaseAuth>()));
  gh.lazySingleton<_i67.AuthRepository>(() =>
      _i68.AuthRepositoryImpl(authDataSource: get<_i65.AuthDataSource>()));
  gh.lazySingleton<_i69.CardioTreaningsDatasource>(() =>
      _i70.LocalCardioTreaningsDatasource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i71.CardioTreaningsRepository>(() =>
      _i72.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i69.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i73.ClimbingHallRepository>(
      () => _i74.ClimbingHallRepositoryImpl(
            get<_i3.ClimbingHallDataSource>(),
            get<_i35.RemoteGymDataSource>(),
            get<_i24.NetworkInfo>(),
          ));
  gh.lazySingletonAsync<_i75.CrashLogService>(() async =>
      _i76.GoogleCrashLogService(
          await get.getAsync<_i8.FirebaseCrashlytics>()));
  gh.lazySingleton<_i77.CurrentHallTreaning>(
      () => _i77.CurrentHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i78.DeleteCardioTreaning>(() => _i78.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i71.CardioTreaningsRepository>()));
  gh.lazySingleton<_i79.DeleteHallAttempt>(() => _i79.DeleteHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i80.DeleteHallTreaning>(() => _i80.DeleteHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i81.DeleteRepetitionForStrengthTreaning>(() =>
      _i81.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i82.DeleteStrengthExercise>(() =>
      _i82.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i53.StrengthExerciseRepository>()));
  gh.lazySingleton<_i83.DeleteStrengthTreaning>(() =>
      _i83.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i84.DeleteTreaning>(() => _i84.DeleteTreaning(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i57.StrengthTreaningsRepository>(),
        get<_i71.CardioTreaningsRepository>(),
        get<_i45.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i85.FinishHallAttempt>(() => _i85.FinishHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i86.FinishHallTreaning>(() => _i86.FinishHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i87.FinishIceAttempt>(
      () => _i87.FinishIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i88.FinishIceTreaning>(() => _i88.FinishIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i89.FinishRockAttempt>(
      () => _i89.FinishRockAttempt(get<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i90.FinishRockTreaning>(
      () => _i90.FinishRockTreaning(get<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i91.FinishStrengthTreaning>(() =>
      _i91.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i92.GetAllTreanings>(() => _i92.GetAllTreanings(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i57.StrengthTreaningsRepository>(),
        get<_i71.CardioTreaningsRepository>(),
        get<_i45.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i93.GetCardioTreanings>(() => _i93.GetCardioTreanings(
      cardioTreaningsRepository: get<_i71.CardioTreaningsRepository>()));
  gh.lazySingleton<_i94.GetClimbingHallRoures>(
      () => _i94.GetClimbingHallRoures(get<_i73.ClimbingHallRepository>()));
  gh.lazySingleton<_i95.GetCurrentIceTreaning>(() => _i95.GetCurrentIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i96.GetCurrentRockTreaning>(
      () => _i96.GetCurrentRockTreaning(get<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i97.GetCurrentStrengthTreaning>(() =>
      _i97.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i98.GetHallRouteAttempts>(() => _i98.GetHallRouteAttempts(
      repository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i99.GetLastCardioTreaning>(() => _i99.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i71.CardioTreaningsRepository>()));
  gh.lazySingleton<_i100.GetLastIceTreaning>(() => _i100.GetLastIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i101.GetLastRockTreaning>(
      () => _i101.GetLastRockTreaning(get<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i102.GetPreviosStrengthTreaning>(() =>
      _i102.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i103.GetStrengthExercises>(() => _i103.GetStrengthExercises(
      strengthExerciseRepository: get<_i53.StrengthExerciseRepository>()));
  gh.lazySingleton<_i104.GetStrengthTreanings>(() => _i104.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i57.StrengthTreaningsRepository>()));
  gh.factory<_i105.HallRouteAttemptsCubit>(() => _i105.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i98.GetHallRouteAttempts>()));
  gh.lazySingleton<_i106.HallRouteToArchive>(() =>
      _i106.HallRouteToArchive(repository: get<_i73.ClimbingHallRepository>()));
  gh.factory<_i107.HallTreaningsCubit>(() => _i107.HallTreaningsCubit(
        allHallTreanings: get<_i62.AllHallTreanings>(),
        deleteHallTreaning: get<_i80.DeleteHallTreaning>(),
      ));
  gh.lazySingleton<_i108.IceRegionsRepository>(
      () => _i109.IceRegionsRepositoryImpl(
            get<_i14.IceRegionsDataSource>(),
            get<_i16.IceRegionsRemoteDataSource>(),
            get<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i110.IceSectorToTreaning>(() => _i110.IceSectorToTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i111.LoadDistrictsUseCase>(() => _i111.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i108.IceRegionsRepository>()));
  gh.lazySingleton<_i112.LoadPlaces>(
      () => _i112.LoadPlaces(get<_i33.PlacesRepository>()));
  gh.lazySingleton<_i113.LoadRockDistricts>(
      () => _i113.LoadRockDistricts(get<_i41.RockRegionsRepository>()));
  gh.lazySingleton<_i114.LoadRockRoutes>(
      () => _i114.LoadRockRoutes(get<_i41.RockRegionsRepository>()));
  gh.lazySingleton<_i115.LoadRockSectors>(
      () => _i115.LoadRockSectors(get<_i41.RockRegionsRepository>()));
  gh.lazySingleton<_i116.LoadSectorsUseCase>(() => _i116.LoadSectorsUseCase(
      iceRegionsRepository: get<_i108.IceRegionsRepository>()));
  gh.lazySingleton<_i117.LoadTreaningsSettings>(
      () => _i117.LoadTreaningsSettings(get<_i49.SettingsRepository>()));
  gh.lazySingleton<_i118.NewHallRoute>(() => _i118.NewHallRoute(
      climbingHallRepository: get<_i73.ClimbingHallRepository>()));
  gh.lazySingleton<_i119.NewIceTreaning>(() => _i119.NewIceTreaning(
        iceTreaningsRepository: get<_i20.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i108.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i120.NewRockAttempt>(
      () => _i120.NewRockAttempt(get<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i121.NewRockTreaning>(
      () => _i121.NewRockTreaning(get<_i45.RockTreaningsRepository>()));
  gh.factory<_i122.RockDistrictsCubit>(
      () => _i122.RockDistrictsCubit(get<_i113.LoadRockDistricts>()));
  gh.factory<_i123.RockRoutesCubit>(
      () => _i123.RockRoutesCubit(get<_i114.LoadRockRoutes>()));
  gh.lazySingleton<_i124.RockSectorToTreaning>(
      () => _i124.RockSectorToTreaning(get<_i45.RockTreaningsRepository>()));
  gh.factory<_i125.RockSectorsCubit>(
      () => _i125.RockSectorsCubit(get<_i115.LoadRockSectors>()));
  gh.factory<_i126.RockTreaningCubit>(() => _i126.RockTreaningCubit(
        get<_i121.NewRockTreaning>(),
        get<_i124.RockSectorToTreaning>(),
        get<_i120.NewRockAttempt>(),
        get<_i89.FinishRockAttempt>(),
        get<_i90.FinishRockTreaning>(),
        get<_i101.GetLastRockTreaning>(),
        get<_i96.GetCurrentRockTreaning>(),
      ));
  gh.lazySingleton<_i127.SaveCardioTreaning>(() => _i127.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i71.CardioTreaningsRepository>()));
  gh.lazySingleton<_i128.SaveStrengthExercise>(() => _i128.SaveStrengthExercise(
      strengthExerciseRepository: get<_i53.StrengthExerciseRepository>()));
  gh.lazySingleton<_i129.SaveTreaningsSettings>(
      () => _i129.SaveTreaningsSettings(get<_i49.SettingsRepository>()));
  gh.lazySingleton<_i130.SelectToUseStrengthExercise>(() =>
      _i130.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i53.StrengthExerciseRepository>()));
  gh.lazySingleton<_i131.SettingsCubit>(() => _i131.SettingsCubit(
        get<_i117.LoadTreaningsSettings>(),
        get<_i129.SaveTreaningsSettings>(),
        get<_i112.LoadPlaces>(),
      ));
  gh.factory<_i132.StrengthExercisesCubit>(() => _i132.StrengthExercisesCubit(
        get<_i103.GetStrengthExercises>(),
        get<_i128.SaveStrengthExercise>(),
        get<_i130.SelectToUseStrengthExercise>(),
        get<_i82.DeleteStrengthExercise>(),
      ));
  gh.factory<_i133.StrengthTrainingCubit>(() => _i133.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i97.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i102.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i61.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i59.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i60.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i91.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i81.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i134.StrengthTrainingsCubit>(() => _i134.StrengthTrainingsCubit(
        get<_i104.GetStrengthTreanings>(),
        get<_i83.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i135.TreaningsCubit>(() => _i135.TreaningsCubit(
        get<_i92.GetAllTreanings>(),
        get<_i84.DeleteTreaning>(),
      ));
  gh.lazySingleton<_i136.AllClimbingHalls>(
      () => _i136.AllClimbingHalls(get<_i73.ClimbingHallRepository>()));
  gh.factory<_i137.AuthGetUser>(
      () => _i137.AuthGetUser(authRepository: get<_i67.AuthRepository>()));
  gh.factory<_i138.AuthLogin>(
      () => _i138.AuthLogin(authRepository: get<_i67.AuthRepository>()));
  gh.factory<_i139.AuthLogout>(
      () => _i139.AuthLogout(authRepository: get<_i67.AuthRepository>()));
  gh.factory<_i140.AuthenticationCubit>(() => _i140.AuthenticationCubit(
        get<_i138.AuthLogin>(),
        get<_i139.AuthLogout>(),
        get<_i137.AuthGetUser>(),
      ));
  gh.factory<_i141.CardioTreaningCubit>(() => _i141.CardioTreaningCubit(
        get<_i99.GetLastCardioTreaning>(),
        get<_i127.SaveCardioTreaning>(),
      ));
  gh.factory<_i142.CardioTreaningsCubit>(() => _i142.CardioTreaningsCubit(
        get<_i93.GetCardioTreanings>(),
        get<_i78.DeleteCardioTreaning>(),
        get<_i127.SaveCardioTreaning>(),
      ));
  gh.factory<_i143.ClimbingHallCubit>(() => _i143.ClimbingHallCubit(
        getClimbingHallRoures: get<_i94.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i106.HallRouteToArchive>(),
      ));
  gh.factory<_i144.ClimbingHallsCubit>(() => _i144.ClimbingHallsCubit(
      allClimbingHalls: get<_i136.AllClimbingHalls>()));
  gh.factory<_i145.CurrentHallTreaningCubit>(
      () => _i145.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: get<_i26.NewHallAttemptFromRoute>(),
            newHallTreaning: get<_i27.NewHallTreaning>(),
            newHallAttempt: get<_i25.NewHallAttempt>(),
            currentHallTreaning: get<_i77.CurrentHallTreaning>(),
            finishHallAttempt: get<_i85.FinishHallAttempt>(),
            finishHallTreaning: get<_i86.FinishHallTreaning>(),
            lastHallTreaning: get<_i23.LastHallTreaning>(),
            deleteHallAttempt: get<_i79.DeleteHallAttempt>(),
          ));
  gh.factory<_i146.CurrentIceTreaningCubit>(() => _i146.CurrentIceTreaningCubit(
        get<_i119.NewIceTreaning>(),
        get<_i110.IceSectorToTreaning>(),
        get<_i28.NewIceAttempt>(),
        get<_i87.FinishIceAttempt>(),
        get<_i88.FinishIceTreaning>(),
        get<_i95.GetCurrentIceTreaning>(),
        get<_i100.GetLastIceTreaning>(),
      ));
  gh.factory<_i147.HallRouteCubit>(
      () => _i147.HallRouteCubit(get<_i118.NewHallRoute>()));
  gh.factory<_i148.HomePageCubit>(() =>
      _i148.HomePageCubit(allClimbingHalls: get<_i136.AllClimbingHalls>()));
  gh.factory<_i149.IceDistrictsCubit>(() => _i149.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i111.LoadDistrictsUseCase>()));
  gh.factory<_i150.IceSectorsCubit>(() => _i150.IceSectorsCubit(
      loadSectorsUseCase: get<_i116.LoadSectorsUseCase>()));
  return get;
}

class _$InjectableModule extends _i151.InjectableModule {}

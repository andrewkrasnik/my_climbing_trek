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
import 'core/injectable_module.dart' as _i161;
import 'core/services/analitics/analitics_service.dart' as _i67;
import 'core/services/analitics/firebase_analitics_service.dart' as _i68;
import 'core/services/crash_log_service/crash_log_service.dart' as _i79;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i80;
import 'core/services/network/network_info.dart' as _i28;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i69;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i70;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i72;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i71;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i147;
import 'features/authentication/domain/usecases/auth_login.dart' as _i148;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i149;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i150;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i73;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i74;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i76;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i75;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i82;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i97;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i103;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i137;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i151;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i152;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i10;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i11;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i39;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i40;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i78;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i13;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i77;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i146;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i98;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i102;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i113;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i128;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i66;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i81;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i83;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i84;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i89;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i90;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i23;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i29;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i30;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i31;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i153;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i154;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i155;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i157;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i112;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i114;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i158;
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
    as _i116;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i21;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i115;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i20;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i91;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i92;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i99;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i104;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i117;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i118;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i123;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i32;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i129;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i156;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i159;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i160;
import 'features/mountaineering/data/datasources/mock_mountain_regions_local_datasource.dart'
    as _i25;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i24;
import 'features/mountaineering/data/repositories/mountain_regions_repository_impl.dart'
    as _i27;
import 'features/mountaineering/domain/repositories/mountain_regions_repository.dart'
    as _i26;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i106;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i107;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i108;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i125;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i126;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i127;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i48;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i44;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i42;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i41;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i43;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i47;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i46;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i50;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i45;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i49;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i93;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i94;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i100;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i105;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i120;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i121;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i122;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i130;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i131;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i134;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i132;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i133;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i135;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i136;
import 'features/settings/data/datasources/firebase_places_remote_datasource.dart'
    as _i36;
import 'features/settings/data/datasources/hive_places_local_datasource.dart'
    as _i34;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i52;
import 'features/settings/data/datasources/places_local_datasource.dart'
    as _i33;
import 'features/settings/data/datasources/places_remote_datasource.dart'
    as _i35;
import 'features/settings/data/datasources/settings_datasource.dart' as _i51;
import 'features/settings/data/repositories/places_repository_impl.dart'
    as _i38;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i54;
import 'features/settings/domain/repositories/places_repository.dart' as _i37;
import 'features/settings/domain/repositories/settings_repository.dart' as _i53;
import 'features/settings/domain/usecases/load_places.dart' as _i119;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i124;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i139;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i141;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i56;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i60;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i55;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i59;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i58;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i62;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i57;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i61;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i64;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i65;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i85;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i86;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i87;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i95;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i101;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i109;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i110;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i111;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i138;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i140;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i63;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i142;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i143;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i144;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i88;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i96;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i145; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i24.MountainRegionsLocalDataSource>(
      () => _i25.MountainRegionsLocalDataSourceImpl());
  gh.lazySingleton<_i26.MountainRegionsRepository>(() =>
      _i27.MountainRegionsRepositoryImpl(
          get<_i24.MountainRegionsLocalDataSource>()));
  gh.lazySingleton<_i28.NetworkInfo>(
      () => _i28.NetworkInfoImpl(get<_i22.InternetConnectionChecker>()));
  gh.lazySingleton<_i29.NewHallAttempt>(() => _i29.NewHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i30.NewHallAttemptFromRoute>(() =>
      _i30.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i31.NewHallTreaning>(() => _i31.NewHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i32.NewIceAttempt>(
      () => _i32.NewIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i33.PlacesLocalDataSource>(
      () => _i34.HivePlacesLocalDataSource());
  gh.lazySingleton<_i35.PlacesRemoteDataSource>(
      () => _i36.FirebasePlacesRemoteDataSource(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i37.PlacesRepository>(() => _i38.PlacesRepositoryImpl(
        get<_i33.PlacesLocalDataSource>(),
        get<_i35.PlacesRemoteDataSource>(),
        get<_i28.NetworkInfo>(),
      ));
  gh.lazySingleton<_i39.RemoteGymDataSource>(() => _i40.RemoteGymDataSourceImpl(
        get<_i9.FirebaseFirestore>(),
        get<_i7.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i41.RockRegionsLocalDataSource>(
      () => _i42.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i43.RockRegionsRemoteDataSource>(() =>
      _i44.FirebaseRockRegionsRemoteDataSource(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i45.RockRegionsRepository>(
      () => _i46.RockRegionsRepositoryImpl(
            get<_i41.RockRegionsLocalDataSource>(),
            get<_i43.RockRegionsRemoteDataSource>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.lazySingleton<_i47.RockTreaningsLocalDataSource>(() =>
      _i48.DriftRockTreaningsLocalDataSource(
          get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i49.RockTreaningsRepository>(() =>
      _i50.RockTreaningsRepositoryImpl(
          get<_i47.RockTreaningsLocalDataSource>()));
  gh.lazySingleton<_i51.SettingsDataSource>(
      () => _i52.SettingsDataSourceImpl());
  gh.lazySingleton<_i53.SettingsRepository>(
      () => _i54.SettingsRepositoryImpl(get<_i51.SettingsDataSource>()));
  gh.lazySingleton<_i55.StrengthExerciseDataSource>(() =>
      _i56.LocalStrengthExerciseDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i57.StrengthExerciseRepository>(() =>
      _i58.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i55.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i59.StrengthTreaningsDataSource>(() =>
      _i60.LocalStrengthTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i61.StrengthTreaningsRepository>(() =>
      _i62.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i59.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i63.UpdateStrengthTreaningExercises>(() =>
      _i63.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i61.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i57.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i64.AddRepetitionForStrengthTreaning>(() =>
      _i64.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i61.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i65.AddStrengthTreaning>(() => _i65.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i61.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i57.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i66.AllHallTreanings>(
      () => _i66.AllHallTreanings(get<_i12.HallTreaningRepository>()));
  gh.lazySingletonAsync<_i67.AnaliticsService>(() async =>
      _i68.FirebaseAnaliticsService(
          await get.getAsync<_i6.FirebaseAnalytics>()));
  gh.lazySingleton<_i69.AuthDataSource>(
      () => _i70.FirebaseAuthDataSource(firebaseAuth: get<_i7.FirebaseAuth>()));
  gh.lazySingleton<_i71.AuthRepository>(() =>
      _i72.AuthRepositoryImpl(authDataSource: get<_i69.AuthDataSource>()));
  gh.lazySingleton<_i73.CardioTreaningsDatasource>(() =>
      _i74.LocalCardioTreaningsDatasource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i75.CardioTreaningsRepository>(() =>
      _i76.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i73.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i77.ClimbingHallRepository>(
      () => _i78.ClimbingHallRepositoryImpl(
            get<_i3.ClimbingHallDataSource>(),
            get<_i39.RemoteGymDataSource>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.lazySingletonAsync<_i79.CrashLogService>(() async =>
      _i80.GoogleCrashLogService(
          await get.getAsync<_i8.FirebaseCrashlytics>()));
  gh.lazySingleton<_i81.CurrentHallTreaning>(
      () => _i81.CurrentHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i82.DeleteCardioTreaning>(() => _i82.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i75.CardioTreaningsRepository>()));
  gh.lazySingleton<_i83.DeleteHallAttempt>(() => _i83.DeleteHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i84.DeleteHallTreaning>(() => _i84.DeleteHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i85.DeleteRepetitionForStrengthTreaning>(() =>
      _i85.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i61.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i86.DeleteStrengthExercise>(() =>
      _i86.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i57.StrengthExerciseRepository>()));
  gh.lazySingleton<_i87.DeleteStrengthTreaning>(() =>
      _i87.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i61.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i88.DeleteTreaning>(() => _i88.DeleteTreaning(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i61.StrengthTreaningsRepository>(),
        get<_i75.CardioTreaningsRepository>(),
        get<_i49.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i89.FinishHallAttempt>(() => _i89.FinishHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i90.FinishHallTreaning>(() => _i90.FinishHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i91.FinishIceAttempt>(
      () => _i91.FinishIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i92.FinishIceTreaning>(() => _i92.FinishIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i93.FinishRockAttempt>(
      () => _i93.FinishRockAttempt(get<_i49.RockTreaningsRepository>()));
  gh.lazySingleton<_i94.FinishRockTreaning>(
      () => _i94.FinishRockTreaning(get<_i49.RockTreaningsRepository>()));
  gh.lazySingleton<_i95.FinishStrengthTreaning>(() =>
      _i95.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i61.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i96.GetAllTreanings>(() => _i96.GetAllTreanings(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i61.StrengthTreaningsRepository>(),
        get<_i75.CardioTreaningsRepository>(),
        get<_i49.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i97.GetCardioTreanings>(() => _i97.GetCardioTreanings(
      cardioTreaningsRepository: get<_i75.CardioTreaningsRepository>()));
  gh.lazySingleton<_i98.GetClimbingHallRoures>(
      () => _i98.GetClimbingHallRoures(get<_i77.ClimbingHallRepository>()));
  gh.lazySingleton<_i99.GetCurrentIceTreaning>(() => _i99.GetCurrentIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i100.GetCurrentRockTreaning>(
      () => _i100.GetCurrentRockTreaning(get<_i49.RockTreaningsRepository>()));
  gh.lazySingleton<_i101.GetCurrentStrengthTreaning>(() =>
      _i101.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i61.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i102.GetHallRouteAttempts>(() => _i102.GetHallRouteAttempts(
      repository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i103.GetLastCardioTreaning>(() =>
      _i103.GetLastCardioTreaning(
          cardioTreaningsRepository: get<_i75.CardioTreaningsRepository>()));
  gh.lazySingleton<_i104.GetLastIceTreaning>(() => _i104.GetLastIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i105.GetLastRockTreaning>(
      () => _i105.GetLastRockTreaning(get<_i49.RockTreaningsRepository>()));
  gh.lazySingleton<_i106.GetMountainRegions>(
      () => _i106.GetMountainRegions(get<_i26.MountainRegionsRepository>()));
  gh.lazySingleton<_i107.GetMountainRoutes>(
      () => _i107.GetMountainRoutes(get<_i26.MountainRegionsRepository>()));
  gh.lazySingleton<_i108.GetMountains>(
      () => _i108.GetMountains(get<_i26.MountainRegionsRepository>()));
  gh.lazySingleton<_i109.GetPreviosStrengthTreaning>(() =>
      _i109.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i61.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i110.GetStrengthExercises>(() => _i110.GetStrengthExercises(
      strengthExerciseRepository: get<_i57.StrengthExerciseRepository>()));
  gh.lazySingleton<_i111.GetStrengthTreanings>(() => _i111.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i61.StrengthTreaningsRepository>()));
  gh.factory<_i112.HallRouteAttemptsCubit>(() => _i112.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i102.GetHallRouteAttempts>()));
  gh.lazySingleton<_i113.HallRouteToArchive>(() =>
      _i113.HallRouteToArchive(repository: get<_i77.ClimbingHallRepository>()));
  gh.factory<_i114.HallTreaningsCubit>(() => _i114.HallTreaningsCubit(
        allHallTreanings: get<_i66.AllHallTreanings>(),
        deleteHallTreaning: get<_i84.DeleteHallTreaning>(),
      ));
  gh.lazySingleton<_i115.IceRegionsRepository>(
      () => _i116.IceRegionsRepositoryImpl(
            get<_i14.IceRegionsDataSource>(),
            get<_i16.IceRegionsRemoteDataSource>(),
            get<_i28.NetworkInfo>(),
          ));
  gh.lazySingleton<_i117.IceSectorToTreaning>(() => _i117.IceSectorToTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i118.LoadDistrictsUseCase>(() => _i118.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i115.IceRegionsRepository>()));
  gh.lazySingleton<_i119.LoadPlaces>(
      () => _i119.LoadPlaces(get<_i37.PlacesRepository>()));
  gh.lazySingleton<_i120.LoadRockDistricts>(
      () => _i120.LoadRockDistricts(get<_i45.RockRegionsRepository>()));
  gh.lazySingleton<_i121.LoadRockRoutes>(
      () => _i121.LoadRockRoutes(get<_i45.RockRegionsRepository>()));
  gh.lazySingleton<_i122.LoadRockSectors>(
      () => _i122.LoadRockSectors(get<_i45.RockRegionsRepository>()));
  gh.lazySingleton<_i123.LoadSectorsUseCase>(() => _i123.LoadSectorsUseCase(
      iceRegionsRepository: get<_i115.IceRegionsRepository>()));
  gh.lazySingleton<_i124.LoadTreaningsSettings>(
      () => _i124.LoadTreaningsSettings(get<_i53.SettingsRepository>()));
  gh.factory<_i125.MountainRegionsCubit>(
      () => _i125.MountainRegionsCubit(get<_i106.GetMountainRegions>()));
  gh.factory<_i126.MountainRoutesCubit>(
      () => _i126.MountainRoutesCubit(get<_i107.GetMountainRoutes>()));
  gh.factory<_i127.MountainsCubit>(
      () => _i127.MountainsCubit(get<_i108.GetMountains>()));
  gh.lazySingleton<_i128.NewHallRoute>(() => _i128.NewHallRoute(
      climbingHallRepository: get<_i77.ClimbingHallRepository>()));
  gh.lazySingleton<_i129.NewIceTreaning>(() => _i129.NewIceTreaning(
        iceTreaningsRepository: get<_i20.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i115.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i130.NewRockAttempt>(
      () => _i130.NewRockAttempt(get<_i49.RockTreaningsRepository>()));
  gh.lazySingleton<_i131.NewRockTreaning>(
      () => _i131.NewRockTreaning(get<_i49.RockTreaningsRepository>()));
  gh.factory<_i132.RockDistrictsCubit>(
      () => _i132.RockDistrictsCubit(get<_i120.LoadRockDistricts>()));
  gh.factory<_i133.RockRoutesCubit>(
      () => _i133.RockRoutesCubit(get<_i121.LoadRockRoutes>()));
  gh.lazySingleton<_i134.RockSectorToTreaning>(
      () => _i134.RockSectorToTreaning(get<_i49.RockTreaningsRepository>()));
  gh.factory<_i135.RockSectorsCubit>(
      () => _i135.RockSectorsCubit(get<_i122.LoadRockSectors>()));
  gh.factory<_i136.RockTreaningCubit>(() => _i136.RockTreaningCubit(
        get<_i131.NewRockTreaning>(),
        get<_i134.RockSectorToTreaning>(),
        get<_i130.NewRockAttempt>(),
        get<_i93.FinishRockAttempt>(),
        get<_i94.FinishRockTreaning>(),
        get<_i105.GetLastRockTreaning>(),
        get<_i100.GetCurrentRockTreaning>(),
      ));
  gh.lazySingleton<_i137.SaveCardioTreaning>(() => _i137.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i75.CardioTreaningsRepository>()));
  gh.lazySingleton<_i138.SaveStrengthExercise>(() => _i138.SaveStrengthExercise(
      strengthExerciseRepository: get<_i57.StrengthExerciseRepository>()));
  gh.lazySingleton<_i139.SaveTreaningsSettings>(
      () => _i139.SaveTreaningsSettings(get<_i53.SettingsRepository>()));
  gh.lazySingleton<_i140.SelectToUseStrengthExercise>(() =>
      _i140.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i57.StrengthExerciseRepository>()));
  gh.lazySingleton<_i141.SettingsCubit>(() => _i141.SettingsCubit(
        get<_i124.LoadTreaningsSettings>(),
        get<_i139.SaveTreaningsSettings>(),
        get<_i119.LoadPlaces>(),
      ));
  gh.factory<_i142.StrengthExercisesCubit>(() => _i142.StrengthExercisesCubit(
        get<_i110.GetStrengthExercises>(),
        get<_i138.SaveStrengthExercise>(),
        get<_i140.SelectToUseStrengthExercise>(),
        get<_i86.DeleteStrengthExercise>(),
      ));
  gh.factory<_i143.StrengthTrainingCubit>(() => _i143.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i101.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i109.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i65.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i63.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i64.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i95.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i85.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i144.StrengthTrainingsCubit>(() => _i144.StrengthTrainingsCubit(
        get<_i111.GetStrengthTreanings>(),
        get<_i87.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i145.TreaningsCubit>(() => _i145.TreaningsCubit(
        get<_i96.GetAllTreanings>(),
        get<_i88.DeleteTreaning>(),
      ));
  gh.lazySingleton<_i146.AllClimbingHalls>(
      () => _i146.AllClimbingHalls(get<_i77.ClimbingHallRepository>()));
  gh.factory<_i147.AuthGetUser>(
      () => _i147.AuthGetUser(authRepository: get<_i71.AuthRepository>()));
  gh.factory<_i148.AuthLogin>(
      () => _i148.AuthLogin(authRepository: get<_i71.AuthRepository>()));
  gh.factory<_i149.AuthLogout>(
      () => _i149.AuthLogout(authRepository: get<_i71.AuthRepository>()));
  gh.factory<_i150.AuthenticationCubit>(() => _i150.AuthenticationCubit(
        get<_i148.AuthLogin>(),
        get<_i149.AuthLogout>(),
        get<_i147.AuthGetUser>(),
      ));
  gh.factory<_i151.CardioTreaningCubit>(() => _i151.CardioTreaningCubit(
        get<_i103.GetLastCardioTreaning>(),
        get<_i137.SaveCardioTreaning>(),
      ));
  gh.factory<_i152.CardioTreaningsCubit>(() => _i152.CardioTreaningsCubit(
        get<_i97.GetCardioTreanings>(),
        get<_i82.DeleteCardioTreaning>(),
        get<_i137.SaveCardioTreaning>(),
      ));
  gh.factory<_i153.ClimbingHallCubit>(() => _i153.ClimbingHallCubit(
        getClimbingHallRoures: get<_i98.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i113.HallRouteToArchive>(),
      ));
  gh.factory<_i154.ClimbingHallsCubit>(() => _i154.ClimbingHallsCubit(
      allClimbingHalls: get<_i146.AllClimbingHalls>()));
  gh.factory<_i155.CurrentHallTreaningCubit>(
      () => _i155.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: get<_i30.NewHallAttemptFromRoute>(),
            newHallTreaning: get<_i31.NewHallTreaning>(),
            newHallAttempt: get<_i29.NewHallAttempt>(),
            currentHallTreaning: get<_i81.CurrentHallTreaning>(),
            finishHallAttempt: get<_i89.FinishHallAttempt>(),
            finishHallTreaning: get<_i90.FinishHallTreaning>(),
            lastHallTreaning: get<_i23.LastHallTreaning>(),
            deleteHallAttempt: get<_i83.DeleteHallAttempt>(),
          ));
  gh.factory<_i156.CurrentIceTreaningCubit>(() => _i156.CurrentIceTreaningCubit(
        get<_i129.NewIceTreaning>(),
        get<_i117.IceSectorToTreaning>(),
        get<_i32.NewIceAttempt>(),
        get<_i91.FinishIceAttempt>(),
        get<_i92.FinishIceTreaning>(),
        get<_i99.GetCurrentIceTreaning>(),
        get<_i104.GetLastIceTreaning>(),
      ));
  gh.factory<_i157.HallRouteCubit>(
      () => _i157.HallRouteCubit(get<_i128.NewHallRoute>()));
  gh.factory<_i158.HomePageCubit>(() =>
      _i158.HomePageCubit(allClimbingHalls: get<_i146.AllClimbingHalls>()));
  gh.factory<_i159.IceDistrictsCubit>(() => _i159.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i118.LoadDistrictsUseCase>()));
  gh.factory<_i160.IceSectorsCubit>(() => _i160.IceSectorsCubit(
      loadSectorsUseCase: get<_i123.LoadSectorsUseCase>()));
  return get;
}

class _$InjectableModule extends _i161.InjectableModule {}

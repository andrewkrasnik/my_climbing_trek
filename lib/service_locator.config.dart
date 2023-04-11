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
import 'core/injectable_module.dart' as _i163;
import 'core/services/analitics/analitics_service.dart' as _i69;
import 'core/services/analitics/firebase_analitics_service.dart' as _i70;
import 'core/services/crash_log_service/crash_log_service.dart' as _i81;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i82;
import 'core/services/network/network_info.dart' as _i30;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i71;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i72;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i74;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i73;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i149;
import 'features/authentication/domain/usecases/auth_login.dart' as _i150;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i151;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i152;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i75;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i76;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i78;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i77;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i84;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i99;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i105;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i139;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i153;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i154;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i10;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i11;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i41;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i42;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i80;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i13;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i79;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i148;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i100;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i104;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i115;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i130;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i68;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i83;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i85;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i86;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i91;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i92;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i23;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i31;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i32;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i33;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i155;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i156;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i157;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i159;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i114;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i116;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i160;
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
    as _i118;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i21;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i117;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i20;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i93;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i94;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i101;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i106;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i119;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i120;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i125;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i34;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i131;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i158;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i161;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i162;
import 'features/mountaineering/data/datasources/firebase_mountain_regions_remote_datasource.dart'
    as _i27;
import 'features/mountaineering/data/datasources/mock_mountain_regions_local_datasource.dart'
    as _i25;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i24;
import 'features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart'
    as _i26;
import 'features/mountaineering/data/repositories/mountain_regions_repository_impl.dart'
    as _i29;
import 'features/mountaineering/domain/repositories/mountain_regions_repository.dart'
    as _i28;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i108;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i109;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i110;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i127;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i128;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i129;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i50;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i46;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i44;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i43;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i45;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i49;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i48;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i52;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i47;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i51;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i95;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i96;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i102;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i107;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i122;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i123;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i124;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i132;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i133;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i136;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i134;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i135;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i137;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i138;
import 'features/settings/data/datasources/firebase_places_remote_datasource.dart'
    as _i38;
import 'features/settings/data/datasources/hive_places_local_datasource.dart'
    as _i36;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i54;
import 'features/settings/data/datasources/places_local_datasource.dart'
    as _i35;
import 'features/settings/data/datasources/places_remote_datasource.dart'
    as _i37;
import 'features/settings/data/datasources/settings_datasource.dart' as _i53;
import 'features/settings/data/repositories/places_repository_impl.dart'
    as _i40;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i56;
import 'features/settings/domain/repositories/places_repository.dart' as _i39;
import 'features/settings/domain/repositories/settings_repository.dart' as _i55;
import 'features/settings/domain/usecases/load_places.dart' as _i121;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i126;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i141;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i143;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i58;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i62;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i57;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i61;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i60;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i64;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i59;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i63;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i66;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i67;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i87;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i88;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i89;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i97;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i103;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i111;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i112;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i113;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i140;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i142;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i65;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i144;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i145;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i146;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i90;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i98;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i147; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i26.MountainRegionsRemoteDataSource>(() =>
      _i27.FirebaseMountainRegionsRemoteDataSource(
          get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i28.MountainRegionsRepository>(
      () => _i29.MountainRegionsRepositoryImpl(
            get<_i24.MountainRegionsLocalDataSource>(),
            get<_i26.MountainRegionsRemoteDataSource>(),
          ));
  gh.lazySingleton<_i30.NetworkInfo>(
      () => _i30.NetworkInfoImpl(get<_i22.InternetConnectionChecker>()));
  gh.lazySingleton<_i31.NewHallAttempt>(() => _i31.NewHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i32.NewHallAttemptFromRoute>(() =>
      _i32.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i33.NewHallTreaning>(() => _i33.NewHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i34.NewIceAttempt>(
      () => _i34.NewIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i35.PlacesLocalDataSource>(
      () => _i36.HivePlacesLocalDataSource());
  gh.lazySingleton<_i37.PlacesRemoteDataSource>(
      () => _i38.FirebasePlacesRemoteDataSource(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i39.PlacesRepository>(() => _i40.PlacesRepositoryImpl(
        get<_i35.PlacesLocalDataSource>(),
        get<_i37.PlacesRemoteDataSource>(),
        get<_i30.NetworkInfo>(),
      ));
  gh.lazySingleton<_i41.RemoteGymDataSource>(() => _i42.RemoteGymDataSourceImpl(
        get<_i9.FirebaseFirestore>(),
        get<_i7.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i43.RockRegionsLocalDataSource>(
      () => _i44.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i45.RockRegionsRemoteDataSource>(() =>
      _i46.FirebaseRockRegionsRemoteDataSource(get<_i9.FirebaseFirestore>()));
  gh.lazySingleton<_i47.RockRegionsRepository>(
      () => _i48.RockRegionsRepositoryImpl(
            get<_i43.RockRegionsLocalDataSource>(),
            get<_i45.RockRegionsRemoteDataSource>(),
            get<_i30.NetworkInfo>(),
          ));
  gh.lazySingleton<_i49.RockTreaningsLocalDataSource>(() =>
      _i50.DriftRockTreaningsLocalDataSource(
          get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i51.RockTreaningsRepository>(() =>
      _i52.RockTreaningsRepositoryImpl(
          get<_i49.RockTreaningsLocalDataSource>()));
  gh.lazySingleton<_i53.SettingsDataSource>(
      () => _i54.SettingsDataSourceImpl());
  gh.lazySingleton<_i55.SettingsRepository>(
      () => _i56.SettingsRepositoryImpl(get<_i53.SettingsDataSource>()));
  gh.lazySingleton<_i57.StrengthExerciseDataSource>(() =>
      _i58.LocalStrengthExerciseDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i59.StrengthExerciseRepository>(() =>
      _i60.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i57.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i61.StrengthTreaningsDataSource>(() =>
      _i62.LocalStrengthTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i63.StrengthTreaningsRepository>(() =>
      _i64.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i61.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i65.UpdateStrengthTreaningExercises>(() =>
      _i65.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i63.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i59.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i66.AddRepetitionForStrengthTreaning>(() =>
      _i66.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i63.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i67.AddStrengthTreaning>(() => _i67.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i63.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i59.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i68.AllHallTreanings>(
      () => _i68.AllHallTreanings(get<_i12.HallTreaningRepository>()));
  gh.lazySingletonAsync<_i69.AnaliticsService>(() async =>
      _i70.FirebaseAnaliticsService(
          await get.getAsync<_i6.FirebaseAnalytics>()));
  gh.lazySingleton<_i71.AuthDataSource>(
      () => _i72.FirebaseAuthDataSource(firebaseAuth: get<_i7.FirebaseAuth>()));
  gh.lazySingleton<_i73.AuthRepository>(() =>
      _i74.AuthRepositoryImpl(authDataSource: get<_i71.AuthDataSource>()));
  gh.lazySingleton<_i75.CardioTreaningsDatasource>(() =>
      _i76.LocalCardioTreaningsDatasource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i77.CardioTreaningsRepository>(() =>
      _i78.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i75.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i79.ClimbingHallRepository>(
      () => _i80.ClimbingHallRepositoryImpl(
            get<_i3.ClimbingHallDataSource>(),
            get<_i41.RemoteGymDataSource>(),
            get<_i30.NetworkInfo>(),
          ));
  gh.lazySingletonAsync<_i81.CrashLogService>(() async =>
      _i82.GoogleCrashLogService(
          await get.getAsync<_i8.FirebaseCrashlytics>()));
  gh.lazySingleton<_i83.CurrentHallTreaning>(
      () => _i83.CurrentHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i84.DeleteCardioTreaning>(() => _i84.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i77.CardioTreaningsRepository>()));
  gh.lazySingleton<_i85.DeleteHallAttempt>(() => _i85.DeleteHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i86.DeleteHallTreaning>(() => _i86.DeleteHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i87.DeleteRepetitionForStrengthTreaning>(() =>
      _i87.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i63.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i88.DeleteStrengthExercise>(() =>
      _i88.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i59.StrengthExerciseRepository>()));
  gh.lazySingleton<_i89.DeleteStrengthTreaning>(() =>
      _i89.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i63.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i90.DeleteTreaning>(() => _i90.DeleteTreaning(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i63.StrengthTreaningsRepository>(),
        get<_i77.CardioTreaningsRepository>(),
        get<_i51.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i91.FinishHallAttempt>(() => _i91.FinishHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i92.FinishHallTreaning>(() => _i92.FinishHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i93.FinishIceAttempt>(
      () => _i93.FinishIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i94.FinishIceTreaning>(() => _i94.FinishIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i95.FinishRockAttempt>(
      () => _i95.FinishRockAttempt(get<_i51.RockTreaningsRepository>()));
  gh.lazySingleton<_i96.FinishRockTreaning>(
      () => _i96.FinishRockTreaning(get<_i51.RockTreaningsRepository>()));
  gh.lazySingleton<_i97.FinishStrengthTreaning>(() =>
      _i97.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i63.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i98.GetAllTreanings>(() => _i98.GetAllTreanings(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i63.StrengthTreaningsRepository>(),
        get<_i77.CardioTreaningsRepository>(),
        get<_i51.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i99.GetCardioTreanings>(() => _i99.GetCardioTreanings(
      cardioTreaningsRepository: get<_i77.CardioTreaningsRepository>()));
  gh.lazySingleton<_i100.GetClimbingHallRoures>(
      () => _i100.GetClimbingHallRoures(get<_i79.ClimbingHallRepository>()));
  gh.lazySingleton<_i101.GetCurrentIceTreaning>(() =>
      _i101.GetCurrentIceTreaning(
          iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i102.GetCurrentRockTreaning>(
      () => _i102.GetCurrentRockTreaning(get<_i51.RockTreaningsRepository>()));
  gh.lazySingleton<_i103.GetCurrentStrengthTreaning>(() =>
      _i103.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i63.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i104.GetHallRouteAttempts>(() => _i104.GetHallRouteAttempts(
      repository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i105.GetLastCardioTreaning>(() =>
      _i105.GetLastCardioTreaning(
          cardioTreaningsRepository: get<_i77.CardioTreaningsRepository>()));
  gh.lazySingleton<_i106.GetLastIceTreaning>(() => _i106.GetLastIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i107.GetLastRockTreaning>(
      () => _i107.GetLastRockTreaning(get<_i51.RockTreaningsRepository>()));
  gh.lazySingleton<_i108.GetMountainRegions>(
      () => _i108.GetMountainRegions(get<_i28.MountainRegionsRepository>()));
  gh.lazySingleton<_i109.GetMountainRoutes>(
      () => _i109.GetMountainRoutes(get<_i28.MountainRegionsRepository>()));
  gh.lazySingleton<_i110.GetMountains>(
      () => _i110.GetMountains(get<_i28.MountainRegionsRepository>()));
  gh.lazySingleton<_i111.GetPreviosStrengthTreaning>(() =>
      _i111.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i63.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i112.GetStrengthExercises>(() => _i112.GetStrengthExercises(
      strengthExerciseRepository: get<_i59.StrengthExerciseRepository>()));
  gh.lazySingleton<_i113.GetStrengthTreanings>(() => _i113.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i63.StrengthTreaningsRepository>()));
  gh.factory<_i114.HallRouteAttemptsCubit>(() => _i114.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i104.GetHallRouteAttempts>()));
  gh.lazySingleton<_i115.HallRouteToArchive>(() =>
      _i115.HallRouteToArchive(repository: get<_i79.ClimbingHallRepository>()));
  gh.factory<_i116.HallTreaningsCubit>(() => _i116.HallTreaningsCubit(
        allHallTreanings: get<_i68.AllHallTreanings>(),
        deleteHallTreaning: get<_i86.DeleteHallTreaning>(),
      ));
  gh.lazySingleton<_i117.IceRegionsRepository>(
      () => _i118.IceRegionsRepositoryImpl(
            get<_i14.IceRegionsDataSource>(),
            get<_i16.IceRegionsRemoteDataSource>(),
            get<_i30.NetworkInfo>(),
          ));
  gh.lazySingleton<_i119.IceSectorToTreaning>(() => _i119.IceSectorToTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i120.LoadDistrictsUseCase>(() => _i120.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i117.IceRegionsRepository>()));
  gh.lazySingleton<_i121.LoadPlaces>(
      () => _i121.LoadPlaces(get<_i39.PlacesRepository>()));
  gh.lazySingleton<_i122.LoadRockDistricts>(
      () => _i122.LoadRockDistricts(get<_i47.RockRegionsRepository>()));
  gh.lazySingleton<_i123.LoadRockRoutes>(
      () => _i123.LoadRockRoutes(get<_i47.RockRegionsRepository>()));
  gh.lazySingleton<_i124.LoadRockSectors>(
      () => _i124.LoadRockSectors(get<_i47.RockRegionsRepository>()));
  gh.lazySingleton<_i125.LoadSectorsUseCase>(() => _i125.LoadSectorsUseCase(
      iceRegionsRepository: get<_i117.IceRegionsRepository>()));
  gh.lazySingleton<_i126.LoadTreaningsSettings>(
      () => _i126.LoadTreaningsSettings(get<_i55.SettingsRepository>()));
  gh.factory<_i127.MountainRegionsCubit>(
      () => _i127.MountainRegionsCubit(get<_i108.GetMountainRegions>()));
  gh.factory<_i128.MountainRoutesCubit>(
      () => _i128.MountainRoutesCubit(get<_i109.GetMountainRoutes>()));
  gh.factory<_i129.MountainsCubit>(
      () => _i129.MountainsCubit(get<_i110.GetMountains>()));
  gh.lazySingleton<_i130.NewHallRoute>(() => _i130.NewHallRoute(
      climbingHallRepository: get<_i79.ClimbingHallRepository>()));
  gh.lazySingleton<_i131.NewIceTreaning>(() => _i131.NewIceTreaning(
        iceTreaningsRepository: get<_i20.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i117.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i132.NewRockAttempt>(
      () => _i132.NewRockAttempt(get<_i51.RockTreaningsRepository>()));
  gh.lazySingleton<_i133.NewRockTreaning>(
      () => _i133.NewRockTreaning(get<_i51.RockTreaningsRepository>()));
  gh.factory<_i134.RockDistrictsCubit>(
      () => _i134.RockDistrictsCubit(get<_i122.LoadRockDistricts>()));
  gh.factory<_i135.RockRoutesCubit>(
      () => _i135.RockRoutesCubit(get<_i123.LoadRockRoutes>()));
  gh.lazySingleton<_i136.RockSectorToTreaning>(
      () => _i136.RockSectorToTreaning(get<_i51.RockTreaningsRepository>()));
  gh.factory<_i137.RockSectorsCubit>(
      () => _i137.RockSectorsCubit(get<_i124.LoadRockSectors>()));
  gh.factory<_i138.RockTreaningCubit>(() => _i138.RockTreaningCubit(
        get<_i133.NewRockTreaning>(),
        get<_i136.RockSectorToTreaning>(),
        get<_i132.NewRockAttempt>(),
        get<_i95.FinishRockAttempt>(),
        get<_i96.FinishRockTreaning>(),
        get<_i107.GetLastRockTreaning>(),
        get<_i102.GetCurrentRockTreaning>(),
      ));
  gh.lazySingleton<_i139.SaveCardioTreaning>(() => _i139.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i77.CardioTreaningsRepository>()));
  gh.lazySingleton<_i140.SaveStrengthExercise>(() => _i140.SaveStrengthExercise(
      strengthExerciseRepository: get<_i59.StrengthExerciseRepository>()));
  gh.lazySingleton<_i141.SaveTreaningsSettings>(
      () => _i141.SaveTreaningsSettings(get<_i55.SettingsRepository>()));
  gh.lazySingleton<_i142.SelectToUseStrengthExercise>(() =>
      _i142.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i59.StrengthExerciseRepository>()));
  gh.lazySingleton<_i143.SettingsCubit>(() => _i143.SettingsCubit(
        get<_i126.LoadTreaningsSettings>(),
        get<_i141.SaveTreaningsSettings>(),
        get<_i121.LoadPlaces>(),
      ));
  gh.factory<_i144.StrengthExercisesCubit>(() => _i144.StrengthExercisesCubit(
        get<_i112.GetStrengthExercises>(),
        get<_i140.SaveStrengthExercise>(),
        get<_i142.SelectToUseStrengthExercise>(),
        get<_i88.DeleteStrengthExercise>(),
      ));
  gh.factory<_i145.StrengthTrainingCubit>(() => _i145.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i103.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i111.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i67.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i65.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i66.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i97.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i87.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i146.StrengthTrainingsCubit>(() => _i146.StrengthTrainingsCubit(
        get<_i113.GetStrengthTreanings>(),
        get<_i89.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i147.TreaningsCubit>(() => _i147.TreaningsCubit(
        get<_i98.GetAllTreanings>(),
        get<_i90.DeleteTreaning>(),
      ));
  gh.lazySingleton<_i148.AllClimbingHalls>(
      () => _i148.AllClimbingHalls(get<_i79.ClimbingHallRepository>()));
  gh.factory<_i149.AuthGetUser>(
      () => _i149.AuthGetUser(authRepository: get<_i73.AuthRepository>()));
  gh.factory<_i150.AuthLogin>(
      () => _i150.AuthLogin(authRepository: get<_i73.AuthRepository>()));
  gh.factory<_i151.AuthLogout>(
      () => _i151.AuthLogout(authRepository: get<_i73.AuthRepository>()));
  gh.factory<_i152.AuthenticationCubit>(() => _i152.AuthenticationCubit(
        get<_i150.AuthLogin>(),
        get<_i151.AuthLogout>(),
        get<_i149.AuthGetUser>(),
      ));
  gh.factory<_i153.CardioTreaningCubit>(() => _i153.CardioTreaningCubit(
        get<_i105.GetLastCardioTreaning>(),
        get<_i139.SaveCardioTreaning>(),
      ));
  gh.factory<_i154.CardioTreaningsCubit>(() => _i154.CardioTreaningsCubit(
        get<_i99.GetCardioTreanings>(),
        get<_i84.DeleteCardioTreaning>(),
        get<_i139.SaveCardioTreaning>(),
      ));
  gh.factory<_i155.ClimbingHallCubit>(() => _i155.ClimbingHallCubit(
        getClimbingHallRoures: get<_i100.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i115.HallRouteToArchive>(),
      ));
  gh.factory<_i156.ClimbingHallsCubit>(() => _i156.ClimbingHallsCubit(
      allClimbingHalls: get<_i148.AllClimbingHalls>()));
  gh.factory<_i157.CurrentHallTreaningCubit>(
      () => _i157.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: get<_i32.NewHallAttemptFromRoute>(),
            newHallTreaning: get<_i33.NewHallTreaning>(),
            newHallAttempt: get<_i31.NewHallAttempt>(),
            currentHallTreaning: get<_i83.CurrentHallTreaning>(),
            finishHallAttempt: get<_i91.FinishHallAttempt>(),
            finishHallTreaning: get<_i92.FinishHallTreaning>(),
            lastHallTreaning: get<_i23.LastHallTreaning>(),
            deleteHallAttempt: get<_i85.DeleteHallAttempt>(),
          ));
  gh.factory<_i158.CurrentIceTreaningCubit>(() => _i158.CurrentIceTreaningCubit(
        get<_i131.NewIceTreaning>(),
        get<_i119.IceSectorToTreaning>(),
        get<_i34.NewIceAttempt>(),
        get<_i93.FinishIceAttempt>(),
        get<_i94.FinishIceTreaning>(),
        get<_i101.GetCurrentIceTreaning>(),
        get<_i106.GetLastIceTreaning>(),
      ));
  gh.factory<_i159.HallRouteCubit>(
      () => _i159.HallRouteCubit(get<_i130.NewHallRoute>()));
  gh.factory<_i160.HomePageCubit>(() =>
      _i160.HomePageCubit(allClimbingHalls: get<_i148.AllClimbingHalls>()));
  gh.factory<_i161.IceDistrictsCubit>(() => _i161.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i120.LoadDistrictsUseCase>()));
  gh.factory<_i162.IceSectorsCubit>(() => _i162.IceSectorsCubit(
      loadSectorsUseCase: get<_i125.LoadSectorsUseCase>()));
  return get;
}

class _$InjectableModule extends _i163.InjectableModule {}

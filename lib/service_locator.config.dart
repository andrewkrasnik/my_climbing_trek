// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:firebase_analytics/firebase_analytics.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i13;

import 'core/datasource/drift_db_local_datasource.dart' as _i15;
import 'core/datasource/local_db_datasource.dart' as _i14;
import 'core/injectable_module.dart' as _i169;
import 'core/services/analitics/analitics_service.dart' as _i56;
import 'core/services/analitics/firebase_analitics_service.dart' as _i57;
import 'core/services/crash_log_service/crash_log_service.dart' as _i68;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i69;
import 'core/services/network/network_info.dart' as _i22;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i58;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i59;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i61;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i60;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i138;
import 'features/authentication/domain/usecases/auth_login.dart' as _i139;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i140;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i141;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i62;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i63;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i65;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i64;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i70;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i77;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i81;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i127;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i142;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i143;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i92;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i93;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i29;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i30;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i67;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i95;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i66;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i94;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i136;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i78;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i155;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i156;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i91;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i116;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i137;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i145;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i146;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i147;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i149;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i150;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i102;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i114;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i115;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i117;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i166;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i144;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i167;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i159;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i158;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i160;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i161;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i12;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i9;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i11;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i98;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i10;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i99;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i97;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i101;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i96;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i100;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i151;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i152;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i154;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i157;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i163;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i103;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i108;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i118;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i119;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i168;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i162;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i164;
import 'features/mountaineering/data/datasources/firebase_mountain_regions_remote_datasource.dart'
    as _i19;
import 'features/mountaineering/data/datasources/mock_mountain_regions_local_datasource.dart'
    as _i17;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i16;
import 'features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart'
    as _i18;
import 'features/mountaineering/data/repositories/mountain_regions_repository_impl.dart'
    as _i21;
import 'features/mountaineering/domain/repositories/mountain_regions_repository.dart'
    as _i20;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i83;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i84;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i85;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i111;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i112;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i113;
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
    as _i74;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i75;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i79;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i82;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i87;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i88;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i105;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i106;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i107;
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
    as _i26;
import 'features/settings/data/datasources/hive_places_local_datasource.dart'
    as _i24;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i42;
import 'features/settings/data/datasources/places_local_datasource.dart'
    as _i23;
import 'features/settings/data/datasources/places_remote_datasource.dart'
    as _i25;
import 'features/settings/data/datasources/settings_datasource.dart' as _i41;
import 'features/settings/data/repositories/places_repository_impl.dart'
    as _i28;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i44;
import 'features/settings/domain/repositories/places_repository.dart' as _i27;
import 'features/settings/domain/repositories/settings_repository.dart' as _i43;
import 'features/settings/domain/usecases/load_places.dart' as _i104;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i109;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i110;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i128;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i130;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i132;
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
    as _i71;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i72;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i73;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i76;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i80;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i86;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i89;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i90;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i129;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i131;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i53;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i133;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i134;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i135;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i148;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i153;
import 'features/treanings/presentation/cubit/treanings_cubit.dart' as _i165;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.ClimbingHallDataSource>(
      () => _i4.LocalClimbingHallDataSource());
  gh.lazySingletonAsync<_i5.FirebaseAnalytics>(
      () => injectableModule.firebaseAnalytics);
  gh.lazySingleton<_i6.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingletonAsync<_i7.FirebaseCrashlytics>(
      () => injectableModule.firebaseCrashlytics);
  gh.lazySingleton<_i8.FirebaseFirestore>(
      () => injectableModule.firebaseFirestore);
  gh.lazySingleton<_i9.IceRegionsDataSource>(
      () => _i10.LocalIceRegionsDataSource());
  gh.lazySingleton<_i11.IceRegionsRemoteDataSource>(() =>
      _i12.FirebaseIceRegionsRemoteDataSource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i13.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker);
  gh.lazySingleton<_i14.LocalDBDatasource>(() => _i15.DriftDBLocalDataSource());
  gh.lazySingleton<_i16.MountainRegionsLocalDataSource>(
      () => _i17.MountainRegionsLocalDataSourceImpl());
  gh.lazySingleton<_i18.MountainRegionsRemoteDataSource>(() =>
      _i19.FirebaseMountainRegionsRemoteDataSource(
          gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i20.MountainRegionsRepository>(
      () => _i21.MountainRegionsRepositoryImpl(
            gh<_i16.MountainRegionsLocalDataSource>(),
            gh<_i18.MountainRegionsRemoteDataSource>(),
          ));
  gh.lazySingleton<_i22.NetworkInfo>(
      () => _i22.NetworkInfoImpl(gh<_i13.InternetConnectionChecker>()));
  gh.lazySingleton<_i23.PlacesLocalDataSource>(
      () => _i24.HivePlacesLocalDataSource());
  gh.lazySingleton<_i25.PlacesRemoteDataSource>(
      () => _i26.FirebasePlacesRemoteDataSource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i27.PlacesRepository>(() => _i28.PlacesRepositoryImpl(
        gh<_i23.PlacesLocalDataSource>(),
        gh<_i25.PlacesRemoteDataSource>(),
        gh<_i22.NetworkInfo>(),
      ));
  gh.lazySingleton<_i29.RemoteGymDataSource>(() => _i30.RemoteGymDataSourceImpl(
        gh<_i8.FirebaseFirestore>(),
        gh<_i6.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i31.RockRegionsLocalDataSource>(
      () => _i32.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i33.RockRegionsRemoteDataSource>(() =>
      _i34.FirebaseRockRegionsRemoteDataSource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i35.RockRegionsRepository>(
      () => _i36.RockRegionsRepositoryImpl(
            gh<_i31.RockRegionsLocalDataSource>(),
            gh<_i33.RockRegionsRemoteDataSource>(),
            gh<_i22.NetworkInfo>(),
          ));
  gh.lazySingleton<_i37.RockTreaningsLocalDataSource>(() =>
      _i38.DriftRockTreaningsLocalDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i39.RockTreaningsRepository>(() =>
      _i40.RockTreaningsRepositoryImpl(
          gh<_i37.RockTreaningsLocalDataSource>()));
  gh.lazySingleton<_i41.SettingsDataSource>(
      () => _i42.SettingsDataSourceImpl());
  gh.lazySingleton<_i43.SettingsRepository>(
      () => _i44.SettingsRepositoryImpl(gh<_i41.SettingsDataSource>()));
  gh.lazySingleton<_i45.StrengthExerciseDataSource>(
      () => _i46.LocalStrengthExerciseDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i47.StrengthExerciseRepository>(() =>
      _i48.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: gh<_i45.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i49.StrengthTreaningsDataSource>(() =>
      _i50.LocalStrengthTreaningsDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i51.StrengthTreaningsRepository>(() =>
      _i52.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource: gh<_i49.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i53.UpdateStrengthTreaningExercises>(
      () => _i53.UpdateStrengthTreaningExercises(
            strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>(),
            strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>(),
          ));
  gh.lazySingleton<_i54.AddRepetitionForStrengthTreaning>(() =>
      _i54.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i55.AddStrengthTreaning>(() => _i55.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>(),
      ));
  gh.lazySingletonAsync<_i56.AnaliticsService>(() async =>
      _i57.FirebaseAnaliticsService(
          await gh.getAsync<_i5.FirebaseAnalytics>()));
  gh.lazySingleton<_i58.AuthDataSource>(
      () => _i59.FirebaseAuthDataSource(firebaseAuth: gh<_i6.FirebaseAuth>()));
  gh.lazySingleton<_i60.AuthRepository>(
      () => _i61.AuthRepositoryImpl(authDataSource: gh<_i58.AuthDataSource>()));
  gh.lazySingleton<_i62.CardioTreaningsDatasource>(
      () => _i63.LocalCardioTreaningsDatasource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i64.CardioTreaningsRepository>(() =>
      _i65.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i62.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i66.ClimbingHallRepository>(
      () => _i67.ClimbingHallRepositoryImpl(
            gh<_i3.ClimbingHallDataSource>(),
            gh<_i29.RemoteGymDataSource>(),
            gh<_i22.NetworkInfo>(),
          ));
  gh.lazySingletonAsync<_i68.CrashLogService>(() async =>
      _i69.GoogleCrashLogService(await gh.getAsync<_i7.FirebaseCrashlytics>()));
  gh.lazySingleton<_i70.DeleteCardioTreaning>(() => _i70.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i64.CardioTreaningsRepository>()));
  gh.lazySingleton<_i71.DeleteRepetitionForStrengthTreaning>(() =>
      _i71.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i72.DeleteStrengthExercise>(() =>
      _i72.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i73.DeleteStrengthTreaning>(() =>
      _i73.DeleteStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i74.FinishRockAttempt>(
      () => _i74.FinishRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i75.FinishRockTreaning>(
      () => _i75.FinishRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i76.FinishStrengthTreaning>(() =>
      _i76.FinishStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i77.GetCardioTreanings>(() => _i77.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i64.CardioTreaningsRepository>()));
  gh.lazySingleton<_i78.GetClimbingHallRoures>(
      () => _i78.GetClimbingHallRoures(gh<_i66.ClimbingHallRepository>()));
  gh.lazySingleton<_i79.GetCurrentRockTreaning>(
      () => _i79.GetCurrentRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i80.GetCurrentStrengthTreaning>(() =>
      _i80.GetCurrentStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i81.GetLastCardioTreaning>(() => _i81.GetLastCardioTreaning(
      cardioTreaningsRepository: gh<_i64.CardioTreaningsRepository>()));
  gh.lazySingleton<_i82.GetLastRockTreaning>(
      () => _i82.GetLastRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i83.GetMountainRegions>(
      () => _i83.GetMountainRegions(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i84.GetMountainRoutes>(
      () => _i84.GetMountainRoutes(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i85.GetMountains>(
      () => _i85.GetMountains(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i86.GetPreviosStrengthTreaning>(() =>
      _i86.GetPreviosStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i87.GetRockRouteAttempts>(
      () => _i87.GetRockRouteAttempts(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i88.GetRockRouteStatistic>(
      () => _i88.GetRockRouteStatistic(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i89.GetStrengthExercises>(() => _i89.GetStrengthExercises(
      strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i90.GetStrengthTreanings>(() => _i90.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i91.HallRouteToArchive>(() =>
      _i91.HallRouteToArchive(repository: gh<_i66.ClimbingHallRepository>()));
  gh.lazySingleton<_i92.HallTreaningDataSource>(
      () => _i93.LocalHallTreaningDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i94.HallTreaningRepository>(
      () => _i95.HallTreaningRepositoryImpl(
            dataSource: gh<_i92.HallTreaningDataSource>(),
            hallDataSource: gh<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i96.IceRegionsRepository>(
      () => _i97.IceRegionsRepositoryImpl(
            gh<_i9.IceRegionsDataSource>(),
            gh<_i11.IceRegionsRemoteDataSource>(),
            gh<_i22.NetworkInfo>(),
          ));
  gh.lazySingleton<_i98.IceTreaningsDataSource>(
      () => _i99.LocalIceTreaningsDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i100.IceTreaningsRepository>(() =>
      _i101.IceTreaningsRepositoryImpl(gh<_i98.IceTreaningsDataSource>()));
  gh.lazySingleton<_i102.LastHallTreaning>(
      () => _i102.LastHallTreaning(gh<_i94.HallTreaningRepository>()));
  gh.lazySingleton<_i103.LoadDistrictsUseCase>(() => _i103.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i96.IceRegionsRepository>()));
  gh.lazySingleton<_i104.LoadPlaces>(
      () => _i104.LoadPlaces(gh<_i27.PlacesRepository>()));
  gh.lazySingleton<_i105.LoadRockDistricts>(
      () => _i105.LoadRockDistricts(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i106.LoadRockRoutes>(
      () => _i106.LoadRockRoutes(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i107.LoadRockSectors>(
      () => _i107.LoadRockSectors(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i108.LoadSectorsUseCase>(() => _i108.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i96.IceRegionsRepository>()));
  gh.lazySingleton<_i109.LoadSimpleSettingsUsecase>(
      () => _i109.LoadSimpleSettingsUsecase(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i110.LoadTreaningsSettings>(
      () => _i110.LoadTreaningsSettings(gh<_i43.SettingsRepository>()));
  gh.factory<_i111.MountainRegionsCubit>(
      () => _i111.MountainRegionsCubit(gh<_i83.GetMountainRegions>()));
  gh.factory<_i112.MountainRoutesCubit>(
      () => _i112.MountainRoutesCubit(gh<_i84.GetMountainRoutes>()));
  gh.factory<_i113.MountainsCubit>(
      () => _i113.MountainsCubit(gh<_i85.GetMountains>()));
  gh.lazySingleton<_i114.NewHallAttempt>(() => _i114.NewHallAttempt(
      treaningRepository: gh<_i94.HallTreaningRepository>()));
  gh.lazySingleton<_i115.NewHallAttemptFromRoute>(() =>
      _i115.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i94.HallTreaningRepository>()));
  gh.lazySingleton<_i116.NewHallRoute>(() => _i116.NewHallRoute(
      climbingHallRepository: gh<_i66.ClimbingHallRepository>()));
  gh.lazySingleton<_i117.NewHallTreaning>(() => _i117.NewHallTreaning(
      treaningRepository: gh<_i94.HallTreaningRepository>()));
  gh.lazySingleton<_i118.NewIceAttempt>(
      () => _i118.NewIceAttempt(gh<_i100.IceTreaningsRepository>()));
  gh.lazySingleton<_i119.NewIceTreaning>(() => _i119.NewIceTreaning(
        iceTreaningsRepository: gh<_i100.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i96.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i120.NewRockAttempt>(
      () => _i120.NewRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i121.NewRockTreaning>(
      () => _i121.NewRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.factory<_i122.RockDistrictsCubit>(
      () => _i122.RockDistrictsCubit(gh<_i105.LoadRockDistricts>()));
  gh.factory<_i123.RockRoutesCubit>(() => _i123.RockRoutesCubit(
        gh<_i106.LoadRockRoutes>(),
        gh<_i88.GetRockRouteStatistic>(),
      ));
  gh.lazySingleton<_i124.RockSectorToTreaning>(
      () => _i124.RockSectorToTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.factory<_i125.RockSectorsCubit>(
      () => _i125.RockSectorsCubit(gh<_i107.LoadRockSectors>()));
  gh.factory<_i126.RockTreaningCubit>(() => _i126.RockTreaningCubit(
        gh<_i121.NewRockTreaning>(),
        gh<_i124.RockSectorToTreaning>(),
        gh<_i120.NewRockAttempt>(),
        gh<_i74.FinishRockAttempt>(),
        gh<_i75.FinishRockTreaning>(),
        gh<_i82.GetLastRockTreaning>(),
        gh<_i79.GetCurrentRockTreaning>(),
        gh<_i88.GetRockRouteStatistic>(),
      ));
  gh.lazySingleton<_i127.SaveCardioTreaning>(() => _i127.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i64.CardioTreaningsRepository>()));
  gh.lazySingleton<_i128.SaveSimpleSettingsUsecase>(
      () => _i128.SaveSimpleSettingsUsecase(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i129.SaveStrengthExercise>(() => _i129.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i130.SaveTreaningsSettings>(
      () => _i130.SaveTreaningsSettings(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i131.SelectToUseStrengthExercise>(() =>
      _i131.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i132.SettingsCubit>(() => _i132.SettingsCubit(
        gh<_i110.LoadTreaningsSettings>(),
        gh<_i130.SaveTreaningsSettings>(),
        gh<_i104.LoadPlaces>(),
        gh<_i109.LoadSimpleSettingsUsecase>(),
        gh<_i128.SaveSimpleSettingsUsecase>(),
      ));
  gh.factory<_i133.StrengthExercisesCubit>(() => _i133.StrengthExercisesCubit(
        gh<_i89.GetStrengthExercises>(),
        gh<_i129.SaveStrengthExercise>(),
        gh<_i131.SelectToUseStrengthExercise>(),
        gh<_i72.DeleteStrengthExercise>(),
      ));
  gh.factory<_i134.StrengthTrainingCubit>(() => _i134.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i80.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i86.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i55.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i53.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i54.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i76.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i71.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i135.StrengthTrainingsCubit>(() => _i135.StrengthTrainingsCubit(
        gh<_i90.GetStrengthTreanings>(),
        gh<_i73.DeleteStrengthTreaning>(),
      ));
  gh.lazySingleton<_i136.AllClimbingHalls>(
      () => _i136.AllClimbingHalls(gh<_i66.ClimbingHallRepository>()));
  gh.lazySingleton<_i137.AllHallTreanings>(
      () => _i137.AllHallTreanings(gh<_i94.HallTreaningRepository>()));
  gh.factory<_i138.AuthGetUser>(
      () => _i138.AuthGetUser(authRepository: gh<_i60.AuthRepository>()));
  gh.factory<_i139.AuthLogin>(
      () => _i139.AuthLogin(authRepository: gh<_i60.AuthRepository>()));
  gh.factory<_i140.AuthLogout>(
      () => _i140.AuthLogout(authRepository: gh<_i60.AuthRepository>()));
  gh.factory<_i141.AuthenticationCubit>(() => _i141.AuthenticationCubit(
        gh<_i139.AuthLogin>(),
        gh<_i140.AuthLogout>(),
        gh<_i138.AuthGetUser>(),
      ));
  gh.factory<_i142.CardioTreaningCubit>(() => _i142.CardioTreaningCubit(
        gh<_i81.GetLastCardioTreaning>(),
        gh<_i127.SaveCardioTreaning>(),
      ));
  gh.factory<_i143.CardioTreaningsCubit>(() => _i143.CardioTreaningsCubit(
        gh<_i77.GetCardioTreanings>(),
        gh<_i70.DeleteCardioTreaning>(),
        gh<_i127.SaveCardioTreaning>(),
      ));
  gh.factory<_i144.ClimbingHallsCubit>(() =>
      _i144.ClimbingHallsCubit(allClimbingHalls: gh<_i136.AllClimbingHalls>()));
  gh.lazySingleton<_i145.CurrentHallTreaning>(
      () => _i145.CurrentHallTreaning(gh<_i94.HallTreaningRepository>()));
  gh.lazySingleton<_i146.DeleteHallAttempt>(() => _i146.DeleteHallAttempt(
      treaningRepository: gh<_i94.HallTreaningRepository>()));
  gh.lazySingleton<_i147.DeleteHallTreaning>(() => _i147.DeleteHallTreaning(
      treaningRepository: gh<_i94.HallTreaningRepository>()));
  gh.lazySingleton<_i148.DeleteTreaning>(() => _i148.DeleteTreaning(
        gh<_i94.HallTreaningRepository>(),
        gh<_i100.IceTreaningsRepository>(),
        gh<_i51.StrengthTreaningsRepository>(),
        gh<_i64.CardioTreaningsRepository>(),
        gh<_i39.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i149.FinishHallAttempt>(() => _i149.FinishHallAttempt(
      treaningRepository: gh<_i94.HallTreaningRepository>()));
  gh.lazySingleton<_i150.FinishHallTreaning>(() => _i150.FinishHallTreaning(
      treaningRepository: gh<_i94.HallTreaningRepository>()));
  gh.lazySingleton<_i151.FinishIceAttempt>(
      () => _i151.FinishIceAttempt(gh<_i100.IceTreaningsRepository>()));
  gh.lazySingleton<_i152.FinishIceTreaning>(() => _i152.FinishIceTreaning(
      iceTreaningsRepository: gh<_i100.IceTreaningsRepository>()));
  gh.lazySingleton<_i153.GetAllTreanings>(() => _i153.GetAllTreanings(
        gh<_i94.HallTreaningRepository>(),
        gh<_i100.IceTreaningsRepository>(),
        gh<_i51.StrengthTreaningsRepository>(),
        gh<_i64.CardioTreaningsRepository>(),
        gh<_i39.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i154.GetCurrentIceTreaning>(() =>
      _i154.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i100.IceTreaningsRepository>()));
  gh.lazySingleton<_i155.GetGymRouteStatistic>(
      () => _i155.GetGymRouteStatistic(gh<_i94.HallTreaningRepository>()));
  gh.lazySingleton<_i156.GetHallRouteAttempts>(() => _i156.GetHallRouteAttempts(
      repository: gh<_i94.HallTreaningRepository>()));
  gh.lazySingleton<_i157.GetLastIceTreaning>(() => _i157.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i100.IceTreaningsRepository>()));
  gh.factory<_i158.HallRouteAttemptsCubit>(() => _i158.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i156.GetHallRouteAttempts>()));
  gh.factory<_i159.HallRouteCubit>(
      () => _i159.HallRouteCubit(gh<_i116.NewHallRoute>()));
  gh.factory<_i160.HallTreaningsCubit>(() => _i160.HallTreaningsCubit(
        allHallTreanings: gh<_i137.AllHallTreanings>(),
        deleteHallTreaning: gh<_i147.DeleteHallTreaning>(),
      ));
  gh.factory<_i161.HomePageCubit>(() =>
      _i161.HomePageCubit(allClimbingHalls: gh<_i136.AllClimbingHalls>()));
  gh.factory<_i162.IceDistrictsCubit>(() => _i162.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i103.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i163.IceSectorToTreaning>(() => _i163.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i100.IceTreaningsRepository>()));
  gh.factory<_i164.IceSectorsCubit>(() => _i164.IceSectorsCubit(
      loadSectorsUseCase: gh<_i108.LoadSectorsUseCase>()));
  gh.factory<_i165.TreaningsCubit>(() => _i165.TreaningsCubit(
        gh<_i153.GetAllTreanings>(),
        gh<_i148.DeleteTreaning>(),
      ));
  gh.factory<_i166.ClimbingHallCubit>(() => _i166.ClimbingHallCubit(
        gh<_i78.GetClimbingHallRoures>(),
        gh<_i91.HallRouteToArchive>(),
        gh<_i155.GetGymRouteStatistic>(),
      ));
  gh.factory<_i167.CurrentHallTreaningCubit>(
      () => _i167.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i115.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i117.NewHallTreaning>(),
            newHallAttempt: gh<_i114.NewHallAttempt>(),
            currentHallTreaning: gh<_i145.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i149.FinishHallAttempt>(),
            finishHallTreaning: gh<_i150.FinishHallTreaning>(),
            lastHallTreaning: gh<_i102.LastHallTreaning>(),
            deleteHallAttempt: gh<_i146.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i155.GetGymRouteStatistic>(),
          ));
  gh.factory<_i168.CurrentIceTreaningCubit>(() => _i168.CurrentIceTreaningCubit(
        gh<_i119.NewIceTreaning>(),
        gh<_i163.IceSectorToTreaning>(),
        gh<_i118.NewIceAttempt>(),
        gh<_i151.FinishIceAttempt>(),
        gh<_i152.FinishIceTreaning>(),
        gh<_i154.GetCurrentIceTreaning>(),
        gh<_i157.GetLastIceTreaning>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i169.InjectableModule {}

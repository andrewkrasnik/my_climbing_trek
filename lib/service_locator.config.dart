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
import 'core/injectable_module.dart' as _i198;
import 'core/services/analitics/analitics_service.dart' as _i69;
import 'core/services/analitics/firebase_analitics_service.dart' as _i70;
import 'core/services/crash_log_service/crash_log_service.dart' as _i82;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i83;
import 'core/services/network/network_info.dart' as _i22;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i71;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i72;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i74;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i73;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i165;
import 'features/authentication/domain/usecases/auth_login.dart' as _i166;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i167;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i168;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i75;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i76;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i78;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i77;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i86;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i94;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i98;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i149;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i169;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i170;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i113;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i114;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i29;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i30;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i80;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i116;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i79;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i115;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i163;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i95;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i184;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i185;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i112;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i137;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i164;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i172;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i174;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i175;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i178;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i179;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i123;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i135;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i136;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i138;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i195;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i171;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i196;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i188;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i187;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i189;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i190;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i12;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i9;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i11;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i119;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i10;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i120;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i118;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i122;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i117;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i121;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i176;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i180;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i181;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i183;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i186;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i192;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i124;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i129;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i139;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i140;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i197;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i191;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i193;
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
    as _i100;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i101;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i102;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i132;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i133;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i134;
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
import 'features/rock_climbing/domain/usecases/delete_rock_attempt.dart'
    as _i88;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i91;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i92;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i96;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i99;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i105;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i106;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i126;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i127;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i128;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i141;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i142;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i146;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i144;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i145;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i147;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i148;
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
import 'features/settings/domain/usecases/load_places.dart' as _i125;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i130;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i131;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i150;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i152;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i154;
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
    as _i66;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i67;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i87;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i89;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i90;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i93;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i97;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i104;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i107;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i108;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i151;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i153;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i65;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i156;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i157;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i158;
import 'features/traveling/data/datasources/mock_travel_local_datasource.dart'
    as _i54;
import 'features/traveling/data/datasources/travel_local_datasource.dart'
    as _i53;
import 'features/traveling/data/repositories/travel_repository.dart' as _i56;
import 'features/traveling/domain/repositories/travel_repository.dart' as _i55;
import 'features/traveling/domain/usecases/current_travel_usecase.dart' as _i84;
import 'features/traveling/domain/usecases/get_planed_travels_usecase.dart'
    as _i103;
import 'features/traveling/domain/usecases/get_travels_usecase.dart' as _i109;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i173;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i159;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i177;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i182;
import 'features/treanings/presentation/cubit/treanings_cubit.dart' as _i194;
import 'features/trekking/data/datasources/drift_trekking_path_local_datasource.dart'
    as _i58;
import 'features/trekking/data/datasources/firebase_trekking_remote_datasource.dart'
    as _i62;
import 'features/trekking/data/datasources/trekking_path_local_datasource.dart'
    as _i57;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i61;
import 'features/trekking/data/repositories/trekking_path_repository_impl.dart'
    as _i60;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i64;
import 'features/trekking/domain/repositories/trekking_path_repository.dart'
    as _i59;
import 'features/trekking/domain/repositories/trekking_repository.dart' as _i63;
import 'features/trekking/domain/usecases/add_trek_event_usecase.dart' as _i68;
import 'features/trekking/domain/usecases/continue_trek_usecase.dart' as _i81;
import 'features/trekking/domain/usecases/current_trekking_path_usecase.dart'
    as _i85;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i110;
import 'features/trekking/domain/usecases/get_treks.dart' as _i111;
import 'features/trekking/domain/usecases/previos_trekking_path_usecase.dart'
    as _i143;
import 'features/trekking/domain/usecases/start_trek_usecase.dart' as _i155;
import 'features/trekking/presentation/bloc/trekking/trekking_cubit.dart'
    as _i160;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i161;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i162;

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
  gh.lazySingleton<_i53.TravelLocalDatasource>(
      () => _i54.MockTravelLocalDatasource());
  gh.lazySingleton<_i55.TravelRepository>(
      () => _i56.TravelRepositoryImpl(gh<_i53.TravelLocalDatasource>()));
  gh.lazySingleton<_i57.TrekkingPathLocalDataSource>(() =>
      _i58.DriftTrekkingPathLocalDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i59.TrekkingPathRepository>(() =>
      _i60.TrekkingPathRepositoryImpl(gh<_i57.TrekkingPathLocalDataSource>()));
  gh.lazySingleton<_i61.TrekkingRemoteDataSource>(
      () => _i62.FirebaseTrekkingRemoteDatasource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i63.TrekkingRepository>(
      () => _i64.TrekkingRepositoryImpl(gh<_i61.TrekkingRemoteDataSource>()));
  gh.lazySingleton<_i65.UpdateStrengthTreaningExercises>(
      () => _i65.UpdateStrengthTreaningExercises(
            strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>(),
            strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>(),
          ));
  gh.lazySingleton<_i66.AddRepetitionForStrengthTreaning>(() =>
      _i66.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i67.AddStrengthTreaning>(() => _i67.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i68.AddTrekEventUsecase>(
      () => _i68.AddTrekEventUsecase(gh<_i59.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i69.AnaliticsService>(() async =>
      _i70.FirebaseAnaliticsService(
          await gh.getAsync<_i5.FirebaseAnalytics>()));
  gh.lazySingleton<_i71.AuthDataSource>(
      () => _i72.FirebaseAuthDataSource(firebaseAuth: gh<_i6.FirebaseAuth>()));
  gh.lazySingleton<_i73.AuthRepository>(
      () => _i74.AuthRepositoryImpl(authDataSource: gh<_i71.AuthDataSource>()));
  gh.lazySingleton<_i75.CardioTreaningsDatasource>(
      () => _i76.LocalCardioTreaningsDatasource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i77.CardioTreaningsRepository>(() =>
      _i78.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i75.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i79.ClimbingHallRepository>(
      () => _i80.ClimbingHallRepositoryImpl(
            gh<_i3.ClimbingHallDataSource>(),
            gh<_i29.RemoteGymDataSource>(),
            gh<_i22.NetworkInfo>(),
          ));
  gh.lazySingleton<_i81.ContinueTrekUsecase>(
      () => _i81.ContinueTrekUsecase(gh<_i59.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i82.CrashLogService>(() async =>
      _i83.GoogleCrashLogService(await gh.getAsync<_i7.FirebaseCrashlytics>()));
  gh.lazySingleton<_i84.CurrentTravelUsecase>(
      () => _i84.CurrentTravelUsecase(gh<_i55.TravelRepository>()));
  gh.lazySingleton<_i85.CurrentTrekkingPathUsecase>(
      () => _i85.CurrentTrekkingPathUsecase(gh<_i59.TrekkingPathRepository>()));
  gh.lazySingleton<_i86.DeleteCardioTreaning>(() => _i86.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i77.CardioTreaningsRepository>()));
  gh.lazySingleton<_i87.DeleteRepetitionForStrengthTreaning>(() =>
      _i87.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i88.DeleteRockAttempt>(
      () => _i88.DeleteRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i89.DeleteStrengthExercise>(() =>
      _i89.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i90.DeleteStrengthTreaning>(() =>
      _i90.DeleteStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i91.FinishRockAttempt>(
      () => _i91.FinishRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i92.FinishRockTreaning>(
      () => _i92.FinishRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i93.FinishStrengthTreaning>(() =>
      _i93.FinishStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i94.GetCardioTreanings>(() => _i94.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i77.CardioTreaningsRepository>()));
  gh.lazySingleton<_i95.GetClimbingHallRoures>(
      () => _i95.GetClimbingHallRoures(gh<_i79.ClimbingHallRepository>()));
  gh.lazySingleton<_i96.GetCurrentRockTreaning>(
      () => _i96.GetCurrentRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i97.GetCurrentStrengthTreaning>(() =>
      _i97.GetCurrentStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i98.GetLastCardioTreaning>(() => _i98.GetLastCardioTreaning(
      cardioTreaningsRepository: gh<_i77.CardioTreaningsRepository>()));
  gh.lazySingleton<_i99.GetLastRockTreaning>(
      () => _i99.GetLastRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i100.GetMountainRegions>(
      () => _i100.GetMountainRegions(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i101.GetMountainRoutes>(
      () => _i101.GetMountainRoutes(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i102.GetMountains>(
      () => _i102.GetMountains(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i103.GetPlanedTravelsUsecase>(
      () => _i103.GetPlanedTravelsUsecase(gh<_i55.TravelRepository>()));
  gh.lazySingleton<_i104.GetPreviosStrengthTreaning>(() =>
      _i104.GetPreviosStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i105.GetRockRouteAttempts>(
      () => _i105.GetRockRouteAttempts(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i106.GetRockRouteStatistic>(
      () => _i106.GetRockRouteStatistic(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i107.GetStrengthExercises>(() => _i107.GetStrengthExercises(
      strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i108.GetStrengthTreanings>(() => _i108.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i109.GetTravelsUsecase>(
      () => _i109.GetTravelsUsecase(gh<_i55.TravelRepository>()));
  gh.lazySingleton<_i110.GetTrekkingRegions>(
      () => _i110.GetTrekkingRegions(gh<_i63.TrekkingRepository>()));
  gh.lazySingleton<_i111.GetTreks>(
      () => _i111.GetTreks(gh<_i63.TrekkingRepository>()));
  gh.lazySingleton<_i112.HallRouteToArchive>(() =>
      _i112.HallRouteToArchive(repository: gh<_i79.ClimbingHallRepository>()));
  gh.lazySingleton<_i113.HallTreaningDataSource>(
      () => _i114.LocalHallTreaningDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i115.HallTreaningRepository>(
      () => _i116.HallTreaningRepositoryImpl(
            dataSource: gh<_i113.HallTreaningDataSource>(),
            hallDataSource: gh<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i117.IceRegionsRepository>(
      () => _i118.IceRegionsRepositoryImpl(
            gh<_i9.IceRegionsDataSource>(),
            gh<_i11.IceRegionsRemoteDataSource>(),
            gh<_i22.NetworkInfo>(),
          ));
  gh.lazySingleton<_i119.IceTreaningsDataSource>(
      () => _i120.LocalIceTreaningsDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i121.IceTreaningsRepository>(() =>
      _i122.IceTreaningsRepositoryImpl(gh<_i119.IceTreaningsDataSource>()));
  gh.lazySingleton<_i123.LastHallTreaning>(
      () => _i123.LastHallTreaning(gh<_i115.HallTreaningRepository>()));
  gh.lazySingleton<_i124.LoadDistrictsUseCase>(() => _i124.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i117.IceRegionsRepository>()));
  gh.lazySingleton<_i125.LoadPlaces>(
      () => _i125.LoadPlaces(gh<_i27.PlacesRepository>()));
  gh.lazySingleton<_i126.LoadRockDistricts>(
      () => _i126.LoadRockDistricts(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i127.LoadRockRoutes>(
      () => _i127.LoadRockRoutes(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i128.LoadRockSectors>(
      () => _i128.LoadRockSectors(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i129.LoadSectorsUseCase>(() => _i129.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i117.IceRegionsRepository>()));
  gh.lazySingleton<_i130.LoadSimpleSettingsUsecase>(
      () => _i130.LoadSimpleSettingsUsecase(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i131.LoadTreaningsSettings>(
      () => _i131.LoadTreaningsSettings(gh<_i43.SettingsRepository>()));
  gh.factory<_i132.MountainRegionsCubit>(
      () => _i132.MountainRegionsCubit(gh<_i100.GetMountainRegions>()));
  gh.factory<_i133.MountainRoutesCubit>(
      () => _i133.MountainRoutesCubit(gh<_i101.GetMountainRoutes>()));
  gh.factory<_i134.MountainsCubit>(
      () => _i134.MountainsCubit(gh<_i102.GetMountains>()));
  gh.lazySingleton<_i135.NewHallAttempt>(() => _i135.NewHallAttempt(
      treaningRepository: gh<_i115.HallTreaningRepository>()));
  gh.lazySingleton<_i136.NewHallAttemptFromRoute>(() =>
      _i136.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i115.HallTreaningRepository>()));
  gh.lazySingleton<_i137.NewHallRoute>(() => _i137.NewHallRoute(
      climbingHallRepository: gh<_i79.ClimbingHallRepository>()));
  gh.lazySingleton<_i138.NewHallTreaning>(() => _i138.NewHallTreaning(
      treaningRepository: gh<_i115.HallTreaningRepository>()));
  gh.lazySingleton<_i139.NewIceAttempt>(
      () => _i139.NewIceAttempt(gh<_i121.IceTreaningsRepository>()));
  gh.lazySingleton<_i140.NewIceTreaning>(() => _i140.NewIceTreaning(
        iceTreaningsRepository: gh<_i121.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i117.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i141.NewRockAttempt>(
      () => _i141.NewRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i142.NewRockTreaning>(
      () => _i142.NewRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i143.PreviosTrekkingPathUsecase>(() =>
      _i143.PreviosTrekkingPathUsecase(gh<_i59.TrekkingPathRepository>()));
  gh.factory<_i144.RockDistrictsCubit>(
      () => _i144.RockDistrictsCubit(gh<_i126.LoadRockDistricts>()));
  gh.factory<_i145.RockRoutesCubit>(() => _i145.RockRoutesCubit(
        gh<_i127.LoadRockRoutes>(),
        gh<_i106.GetRockRouteStatistic>(),
      ));
  gh.lazySingleton<_i146.RockSectorToTreaning>(
      () => _i146.RockSectorToTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.factory<_i147.RockSectorsCubit>(
      () => _i147.RockSectorsCubit(gh<_i128.LoadRockSectors>()));
  gh.factory<_i148.RockTreaningCubit>(() => _i148.RockTreaningCubit(
        gh<_i142.NewRockTreaning>(),
        gh<_i146.RockSectorToTreaning>(),
        gh<_i141.NewRockAttempt>(),
        gh<_i91.FinishRockAttempt>(),
        gh<_i92.FinishRockTreaning>(),
        gh<_i99.GetLastRockTreaning>(),
        gh<_i96.GetCurrentRockTreaning>(),
        gh<_i106.GetRockRouteStatistic>(),
        gh<_i88.DeleteRockAttempt>(),
      ));
  gh.lazySingleton<_i149.SaveCardioTreaning>(() => _i149.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i77.CardioTreaningsRepository>()));
  gh.lazySingleton<_i150.SaveSimpleSettingsUsecase>(
      () => _i150.SaveSimpleSettingsUsecase(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i151.SaveStrengthExercise>(() => _i151.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i152.SaveTreaningsSettings>(
      () => _i152.SaveTreaningsSettings(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i153.SelectToUseStrengthExercise>(() =>
      _i153.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i154.SettingsCubit>(() => _i154.SettingsCubit(
        gh<_i131.LoadTreaningsSettings>(),
        gh<_i152.SaveTreaningsSettings>(),
        gh<_i125.LoadPlaces>(),
        gh<_i130.LoadSimpleSettingsUsecase>(),
        gh<_i150.SaveSimpleSettingsUsecase>(),
      ));
  gh.lazySingleton<_i155.StartTrekUsecase>(
      () => _i155.StartTrekUsecase(gh<_i59.TrekkingPathRepository>()));
  gh.factory<_i156.StrengthExercisesCubit>(() => _i156.StrengthExercisesCubit(
        gh<_i107.GetStrengthExercises>(),
        gh<_i151.SaveStrengthExercise>(),
        gh<_i153.SelectToUseStrengthExercise>(),
        gh<_i89.DeleteStrengthExercise>(),
      ));
  gh.factory<_i157.StrengthTrainingCubit>(() => _i157.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i97.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i104.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i67.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i65.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i66.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i93.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i87.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i158.StrengthTrainingsCubit>(() => _i158.StrengthTrainingsCubit(
        gh<_i108.GetStrengthTreanings>(),
        gh<_i90.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i159.TravelsCubit>(() => _i159.TravelsCubit(
        gh<_i109.GetTravelsUsecase>(),
        gh<_i103.GetPlanedTravelsUsecase>(),
      ));
  gh.factory<_i160.TrekkingCubit>(() => _i160.TrekkingCubit(
        gh<_i85.CurrentTrekkingPathUsecase>(),
        gh<_i143.PreviosTrekkingPathUsecase>(),
        gh<_i155.StartTrekUsecase>(),
        gh<_i68.AddTrekEventUsecase>(),
        gh<_i81.ContinueTrekUsecase>(),
      ));
  gh.factory<_i161.TrekkingRegionsCubit>(
      () => _i161.TrekkingRegionsCubit(gh<_i110.GetTrekkingRegions>()));
  gh.factory<_i162.TreksCubit>(() => _i162.TreksCubit(gh<_i111.GetTreks>()));
  gh.lazySingleton<_i163.AllClimbingHalls>(
      () => _i163.AllClimbingHalls(gh<_i79.ClimbingHallRepository>()));
  gh.lazySingleton<_i164.AllHallTreanings>(
      () => _i164.AllHallTreanings(gh<_i115.HallTreaningRepository>()));
  gh.factory<_i165.AuthGetUser>(
      () => _i165.AuthGetUser(authRepository: gh<_i73.AuthRepository>()));
  gh.factory<_i166.AuthLogin>(
      () => _i166.AuthLogin(authRepository: gh<_i73.AuthRepository>()));
  gh.factory<_i167.AuthLogout>(
      () => _i167.AuthLogout(authRepository: gh<_i73.AuthRepository>()));
  gh.factory<_i168.AuthenticationCubit>(() => _i168.AuthenticationCubit(
        gh<_i166.AuthLogin>(),
        gh<_i167.AuthLogout>(),
        gh<_i165.AuthGetUser>(),
      ));
  gh.factory<_i169.CardioTreaningCubit>(() => _i169.CardioTreaningCubit(
        gh<_i98.GetLastCardioTreaning>(),
        gh<_i149.SaveCardioTreaning>(),
      ));
  gh.factory<_i170.CardioTreaningsCubit>(() => _i170.CardioTreaningsCubit(
        gh<_i94.GetCardioTreanings>(),
        gh<_i86.DeleteCardioTreaning>(),
        gh<_i149.SaveCardioTreaning>(),
      ));
  gh.factory<_i171.ClimbingHallsCubit>(() =>
      _i171.ClimbingHallsCubit(allClimbingHalls: gh<_i163.AllClimbingHalls>()));
  gh.lazySingleton<_i172.CurrentHallTreaning>(
      () => _i172.CurrentHallTreaning(gh<_i115.HallTreaningRepository>()));
  gh.factory<_i173.CurrentTravelCubit>(() => _i173.CurrentTravelCubit(
        gh<_i84.CurrentTravelUsecase>(),
        gh<_i103.GetPlanedTravelsUsecase>(),
      ));
  gh.lazySingleton<_i174.DeleteHallAttempt>(() => _i174.DeleteHallAttempt(
      treaningRepository: gh<_i115.HallTreaningRepository>()));
  gh.lazySingleton<_i175.DeleteHallTreaning>(() => _i175.DeleteHallTreaning(
      treaningRepository: gh<_i115.HallTreaningRepository>()));
  gh.lazySingleton<_i176.DeleteIceAttempt>(
      () => _i176.DeleteIceAttempt(gh<_i121.IceTreaningsRepository>()));
  gh.lazySingleton<_i177.DeleteTreaning>(() => _i177.DeleteTreaning(
        gh<_i115.HallTreaningRepository>(),
        gh<_i121.IceTreaningsRepository>(),
        gh<_i51.StrengthTreaningsRepository>(),
        gh<_i77.CardioTreaningsRepository>(),
        gh<_i39.RockTreaningsRepository>(),
        gh<_i59.TrekkingPathRepository>(),
      ));
  gh.lazySingleton<_i178.FinishHallAttempt>(() => _i178.FinishHallAttempt(
      treaningRepository: gh<_i115.HallTreaningRepository>()));
  gh.lazySingleton<_i179.FinishHallTreaning>(() => _i179.FinishHallTreaning(
      treaningRepository: gh<_i115.HallTreaningRepository>()));
  gh.lazySingleton<_i180.FinishIceAttempt>(
      () => _i180.FinishIceAttempt(gh<_i121.IceTreaningsRepository>()));
  gh.lazySingleton<_i181.FinishIceTreaning>(() => _i181.FinishIceTreaning(
      iceTreaningsRepository: gh<_i121.IceTreaningsRepository>()));
  gh.lazySingleton<_i182.GetAllTreanings>(() => _i182.GetAllTreanings(
        gh<_i115.HallTreaningRepository>(),
        gh<_i121.IceTreaningsRepository>(),
        gh<_i51.StrengthTreaningsRepository>(),
        gh<_i77.CardioTreaningsRepository>(),
        gh<_i39.RockTreaningsRepository>(),
        gh<_i55.TravelRepository>(),
        gh<_i59.TrekkingPathRepository>(),
      ));
  gh.lazySingleton<_i183.GetCurrentIceTreaning>(() =>
      _i183.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i121.IceTreaningsRepository>()));
  gh.lazySingleton<_i184.GetGymRouteStatistic>(
      () => _i184.GetGymRouteStatistic(gh<_i115.HallTreaningRepository>()));
  gh.lazySingleton<_i185.GetHallRouteAttempts>(() => _i185.GetHallRouteAttempts(
      repository: gh<_i115.HallTreaningRepository>()));
  gh.lazySingleton<_i186.GetLastIceTreaning>(() => _i186.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i121.IceTreaningsRepository>()));
  gh.factory<_i187.HallRouteAttemptsCubit>(() => _i187.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i185.GetHallRouteAttempts>()));
  gh.factory<_i188.HallRouteCubit>(
      () => _i188.HallRouteCubit(gh<_i137.NewHallRoute>()));
  gh.factory<_i189.HallTreaningsCubit>(() => _i189.HallTreaningsCubit(
        allHallTreanings: gh<_i164.AllHallTreanings>(),
        deleteHallTreaning: gh<_i175.DeleteHallTreaning>(),
      ));
  gh.factory<_i190.HomePageCubit>(() =>
      _i190.HomePageCubit(allClimbingHalls: gh<_i163.AllClimbingHalls>()));
  gh.factory<_i191.IceDistrictsCubit>(() => _i191.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i124.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i192.IceSectorToTreaning>(() => _i192.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i121.IceTreaningsRepository>()));
  gh.factory<_i193.IceSectorsCubit>(() => _i193.IceSectorsCubit(
      loadSectorsUseCase: gh<_i129.LoadSectorsUseCase>()));
  gh.factory<_i194.TreaningsCubit>(() => _i194.TreaningsCubit(
        gh<_i182.GetAllTreanings>(),
        gh<_i177.DeleteTreaning>(),
      ));
  gh.factory<_i195.ClimbingHallCubit>(() => _i195.ClimbingHallCubit(
        gh<_i95.GetClimbingHallRoures>(),
        gh<_i112.HallRouteToArchive>(),
        gh<_i184.GetGymRouteStatistic>(),
      ));
  gh.factory<_i196.CurrentHallTreaningCubit>(
      () => _i196.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i136.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i138.NewHallTreaning>(),
            newHallAttempt: gh<_i135.NewHallAttempt>(),
            currentHallTreaning: gh<_i172.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i178.FinishHallAttempt>(),
            finishHallTreaning: gh<_i179.FinishHallTreaning>(),
            lastHallTreaning: gh<_i123.LastHallTreaning>(),
            deleteHallAttempt: gh<_i174.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i184.GetGymRouteStatistic>(),
          ));
  gh.factory<_i197.CurrentIceTreaningCubit>(() => _i197.CurrentIceTreaningCubit(
        gh<_i140.NewIceTreaning>(),
        gh<_i192.IceSectorToTreaning>(),
        gh<_i139.NewIceAttempt>(),
        gh<_i180.FinishIceAttempt>(),
        gh<_i181.FinishIceTreaning>(),
        gh<_i183.GetCurrentIceTreaning>(),
        gh<_i186.GetLastIceTreaning>(),
        gh<_i176.DeleteIceAttempt>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i198.InjectableModule {}

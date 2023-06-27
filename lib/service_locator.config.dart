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
import 'core/injectable_module.dart' as _i211;
import 'core/services/analitics/analitics_service.dart' as _i78;
import 'core/services/analitics/firebase_analitics_service.dart' as _i79;
import 'core/services/crash_log_service/crash_log_service.dart' as _i91;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i92;
import 'core/services/network/network_info.dart' as _i22;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i80;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i81;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i83;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i82;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i178;
import 'features/authentication/domain/usecases/auth_login.dart' as _i179;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i180;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i181;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i84;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i85;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i87;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i86;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i95;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i103;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i107;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i160;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i182;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i183;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i124;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i125;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i29;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i30;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i89;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i127;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i88;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i126;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i176;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i104;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i197;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i198;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i123;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i148;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i177;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i185;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i187;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i188;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i191;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i192;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i134;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i146;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i147;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i149;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i208;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i184;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i209;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i201;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i200;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i202;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i203;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i12;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i9;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i11;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i130;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i10;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i131;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i129;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i133;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i128;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i132;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i189;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i193;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i194;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i196;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i199;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i205;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i135;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i140;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i150;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i151;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i210;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i204;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i206;
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
    as _i109;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i110;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i111;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i143;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i144;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i145;
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
    as _i97;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i100;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i101;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i105;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i108;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i114;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i115;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i137;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i138;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i139;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i152;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i153;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i157;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i155;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i156;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i158;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i159;
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
import 'features/settings/domain/usecases/load_places.dart' as _i136;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i141;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i142;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i161;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i163;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i165;
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
    as _i75;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i76;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i96;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i98;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i99;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i102;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i106;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i113;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i116;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i117;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i162;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i164;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i74;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i167;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i168;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i169;
import 'features/techniques/data/datasources/mock_technique_treanings_local_datasource.dart'
    as _i54;
import 'features/techniques/data/datasources/mock_techniques_datasource.dart'
    as _i59;
import 'features/techniques/data/datasources/technique_treanings_local_datasource.dart'
    as _i53;
import 'features/techniques/data/datasources/techniques_remote_datasource.dart'
    as _i58;
import 'features/techniques/data/repositories/technique_treanings_repository_impl.dart'
    as _i56;
import 'features/techniques/data/repositories/techniques_repository_impl.dart'
    as _i61;
import 'features/techniques/domain/repositories/technique_treanings_repository.dart'
    as _i55;
import 'features/techniques/domain/repositories/techniques_repository.dart'
    as _i60;
import 'features/techniques/domain/usecases/get_technique_groups_usecase.dart'
    as _i118;
import 'features/techniques/domain/usecases/get_techniques_usecase.dart'
    as _i119;
import 'features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart'
    as _i170;
import 'features/techniques/presentation/bloc/techniques/techniques_cubit.dart'
    as _i171;
import 'features/techniques/presentation/bloc/techniques_cubit.dart' as _i57;
import 'features/traveling/data/datasources/mock_travel_local_datasource.dart'
    as _i63;
import 'features/traveling/data/datasources/travel_local_datasource.dart'
    as _i62;
import 'features/traveling/data/repositories/travel_repository.dart' as _i65;
import 'features/traveling/domain/repositories/travel_repository.dart' as _i64;
import 'features/traveling/domain/usecases/current_travel_usecase.dart' as _i93;
import 'features/traveling/domain/usecases/get_planed_travels_usecase.dart'
    as _i112;
import 'features/traveling/domain/usecases/get_travels_usecase.dart' as _i120;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i186;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i172;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i190;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i195;
import 'features/treanings/presentation/cubit/treanings_cubit.dart' as _i207;
import 'features/trekking/data/datasources/drift_trekking_path_local_datasource.dart'
    as _i67;
import 'features/trekking/data/datasources/firebase_trekking_remote_datasource.dart'
    as _i71;
import 'features/trekking/data/datasources/trekking_path_local_datasource.dart'
    as _i66;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i70;
import 'features/trekking/data/repositories/trekking_path_repository_impl.dart'
    as _i69;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i73;
import 'features/trekking/domain/repositories/trekking_path_repository.dart'
    as _i68;
import 'features/trekking/domain/repositories/trekking_repository.dart' as _i72;
import 'features/trekking/domain/usecases/add_trek_event_usecase.dart' as _i77;
import 'features/trekking/domain/usecases/continue_trek_usecase.dart' as _i90;
import 'features/trekking/domain/usecases/current_trekking_path_usecase.dart'
    as _i94;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i121;
import 'features/trekking/domain/usecases/get_treks.dart' as _i122;
import 'features/trekking/domain/usecases/previos_trekking_path_usecase.dart'
    as _i154;
import 'features/trekking/domain/usecases/start_trek_usecase.dart' as _i166;
import 'features/trekking/presentation/bloc/trekking/trekking_cubit.dart'
    as _i173;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i174;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i175;

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
  gh.lazySingleton<_i53.TechniqueTreaningsLocalDataSource>(
      () => _i54.MockTechniqueTreaningsLocalDataSource());
  gh.lazySingleton<_i55.TechniqueTreaningsRepository>(() =>
      _i56.TechniqueTreaningsRepositoryImpl(
          gh<_i53.TechniqueTreaningsLocalDataSource>()));
  gh.factory<_i57.TechniquesCubit>(() => _i57.TechniquesCubit());
  gh.lazySingleton<_i58.TechniquesRemoteDataSource>(
      () => _i59.MockTechniquesRemoteDataSource());
  gh.lazySingleton<_i60.TechniquesRepository>(() =>
      _i61.TechniquesRepositoryImpl(gh<_i58.TechniquesRemoteDataSource>()));
  gh.lazySingleton<_i62.TravelLocalDatasource>(
      () => _i63.MockTravelLocalDatasource());
  gh.lazySingleton<_i64.TravelRepository>(
      () => _i65.TravelRepositoryImpl(gh<_i62.TravelLocalDatasource>()));
  gh.lazySingleton<_i66.TrekkingPathLocalDataSource>(() =>
      _i67.DriftTrekkingPathLocalDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i68.TrekkingPathRepository>(() =>
      _i69.TrekkingPathRepositoryImpl(gh<_i66.TrekkingPathLocalDataSource>()));
  gh.lazySingleton<_i70.TrekkingRemoteDataSource>(
      () => _i71.FirebaseTrekkingRemoteDatasource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i72.TrekkingRepository>(
      () => _i73.TrekkingRepositoryImpl(gh<_i70.TrekkingRemoteDataSource>()));
  gh.lazySingleton<_i74.UpdateStrengthTreaningExercises>(
      () => _i74.UpdateStrengthTreaningExercises(
            strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>(),
            strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>(),
          ));
  gh.lazySingleton<_i75.AddRepetitionForStrengthTreaning>(() =>
      _i75.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i76.AddStrengthTreaning>(() => _i76.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i77.AddTrekEventUsecase>(
      () => _i77.AddTrekEventUsecase(gh<_i68.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i78.AnaliticsService>(() async =>
      _i79.FirebaseAnaliticsService(
          await gh.getAsync<_i5.FirebaseAnalytics>()));
  gh.lazySingleton<_i80.AuthDataSource>(
      () => _i81.FirebaseAuthDataSource(firebaseAuth: gh<_i6.FirebaseAuth>()));
  gh.lazySingleton<_i82.AuthRepository>(
      () => _i83.AuthRepositoryImpl(authDataSource: gh<_i80.AuthDataSource>()));
  gh.lazySingleton<_i84.CardioTreaningsDatasource>(
      () => _i85.LocalCardioTreaningsDatasource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i86.CardioTreaningsRepository>(() =>
      _i87.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i84.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i88.ClimbingHallRepository>(
      () => _i89.ClimbingHallRepositoryImpl(
            gh<_i3.ClimbingHallDataSource>(),
            gh<_i29.RemoteGymDataSource>(),
            gh<_i22.NetworkInfo>(),
          ));
  gh.lazySingleton<_i90.ContinueTrekUsecase>(
      () => _i90.ContinueTrekUsecase(gh<_i68.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i91.CrashLogService>(() async =>
      _i92.GoogleCrashLogService(await gh.getAsync<_i7.FirebaseCrashlytics>()));
  gh.lazySingleton<_i93.CurrentTravelUsecase>(
      () => _i93.CurrentTravelUsecase(gh<_i64.TravelRepository>()));
  gh.lazySingleton<_i94.CurrentTrekkingPathUsecase>(
      () => _i94.CurrentTrekkingPathUsecase(gh<_i68.TrekkingPathRepository>()));
  gh.lazySingleton<_i95.DeleteCardioTreaning>(() => _i95.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i86.CardioTreaningsRepository>()));
  gh.lazySingleton<_i96.DeleteRepetitionForStrengthTreaning>(() =>
      _i96.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i97.DeleteRockAttempt>(
      () => _i97.DeleteRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i98.DeleteStrengthExercise>(() =>
      _i98.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i99.DeleteStrengthTreaning>(() =>
      _i99.DeleteStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i100.FinishRockAttempt>(
      () => _i100.FinishRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i101.FinishRockTreaning>(
      () => _i101.FinishRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i102.FinishStrengthTreaning>(() =>
      _i102.FinishStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i103.GetCardioTreanings>(() => _i103.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i86.CardioTreaningsRepository>()));
  gh.lazySingleton<_i104.GetClimbingHallRoures>(
      () => _i104.GetClimbingHallRoures(gh<_i88.ClimbingHallRepository>()));
  gh.lazySingleton<_i105.GetCurrentRockTreaning>(
      () => _i105.GetCurrentRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i106.GetCurrentStrengthTreaning>(() =>
      _i106.GetCurrentStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i107.GetLastCardioTreaning>(() =>
      _i107.GetLastCardioTreaning(
          cardioTreaningsRepository: gh<_i86.CardioTreaningsRepository>()));
  gh.lazySingleton<_i108.GetLastRockTreaning>(
      () => _i108.GetLastRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i109.GetMountainRegions>(
      () => _i109.GetMountainRegions(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i110.GetMountainRoutes>(
      () => _i110.GetMountainRoutes(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i111.GetMountains>(
      () => _i111.GetMountains(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i112.GetPlanedTravelsUsecase>(
      () => _i112.GetPlanedTravelsUsecase(gh<_i64.TravelRepository>()));
  gh.lazySingleton<_i113.GetPreviosStrengthTreaning>(() =>
      _i113.GetPreviosStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i114.GetRockRouteAttempts>(
      () => _i114.GetRockRouteAttempts(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i115.GetRockRouteStatistic>(
      () => _i115.GetRockRouteStatistic(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i116.GetStrengthExercises>(() => _i116.GetStrengthExercises(
      strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i117.GetStrengthTreanings>(() => _i117.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i118.GetTechniqueGroupsUsecase>(
      () => _i118.GetTechniqueGroupsUsecase(gh<_i60.TechniquesRepository>()));
  gh.lazySingleton<_i119.GetTechniquesUsecase>(
      () => _i119.GetTechniquesUsecase(gh<_i60.TechniquesRepository>()));
  gh.lazySingleton<_i120.GetTravelsUsecase>(
      () => _i120.GetTravelsUsecase(gh<_i64.TravelRepository>()));
  gh.lazySingleton<_i121.GetTrekkingRegions>(
      () => _i121.GetTrekkingRegions(gh<_i72.TrekkingRepository>()));
  gh.lazySingleton<_i122.GetTreks>(
      () => _i122.GetTreks(gh<_i72.TrekkingRepository>()));
  gh.lazySingleton<_i123.HallRouteToArchive>(() =>
      _i123.HallRouteToArchive(repository: gh<_i88.ClimbingHallRepository>()));
  gh.lazySingleton<_i124.HallTreaningDataSource>(
      () => _i125.LocalHallTreaningDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i126.HallTreaningRepository>(
      () => _i127.HallTreaningRepositoryImpl(
            dataSource: gh<_i124.HallTreaningDataSource>(),
            hallDataSource: gh<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i128.IceRegionsRepository>(
      () => _i129.IceRegionsRepositoryImpl(
            gh<_i9.IceRegionsDataSource>(),
            gh<_i11.IceRegionsRemoteDataSource>(),
            gh<_i22.NetworkInfo>(),
          ));
  gh.lazySingleton<_i130.IceTreaningsDataSource>(
      () => _i131.LocalIceTreaningsDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i132.IceTreaningsRepository>(() =>
      _i133.IceTreaningsRepositoryImpl(gh<_i130.IceTreaningsDataSource>()));
  gh.lazySingleton<_i134.LastHallTreaning>(
      () => _i134.LastHallTreaning(gh<_i126.HallTreaningRepository>()));
  gh.lazySingleton<_i135.LoadDistrictsUseCase>(() => _i135.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i128.IceRegionsRepository>()));
  gh.lazySingleton<_i136.LoadPlaces>(
      () => _i136.LoadPlaces(gh<_i27.PlacesRepository>()));
  gh.lazySingleton<_i137.LoadRockDistricts>(
      () => _i137.LoadRockDistricts(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i138.LoadRockRoutes>(
      () => _i138.LoadRockRoutes(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i139.LoadRockSectors>(
      () => _i139.LoadRockSectors(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i140.LoadSectorsUseCase>(() => _i140.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i128.IceRegionsRepository>()));
  gh.lazySingleton<_i141.LoadSimpleSettingsUsecase>(
      () => _i141.LoadSimpleSettingsUsecase(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i142.LoadTreaningsSettings>(
      () => _i142.LoadTreaningsSettings(gh<_i43.SettingsRepository>()));
  gh.factory<_i143.MountainRegionsCubit>(
      () => _i143.MountainRegionsCubit(gh<_i109.GetMountainRegions>()));
  gh.factory<_i144.MountainRoutesCubit>(
      () => _i144.MountainRoutesCubit(gh<_i110.GetMountainRoutes>()));
  gh.factory<_i145.MountainsCubit>(
      () => _i145.MountainsCubit(gh<_i111.GetMountains>()));
  gh.lazySingleton<_i146.NewHallAttempt>(() => _i146.NewHallAttempt(
      treaningRepository: gh<_i126.HallTreaningRepository>()));
  gh.lazySingleton<_i147.NewHallAttemptFromRoute>(() =>
      _i147.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i126.HallTreaningRepository>()));
  gh.lazySingleton<_i148.NewHallRoute>(() => _i148.NewHallRoute(
      climbingHallRepository: gh<_i88.ClimbingHallRepository>()));
  gh.lazySingleton<_i149.NewHallTreaning>(() => _i149.NewHallTreaning(
      treaningRepository: gh<_i126.HallTreaningRepository>()));
  gh.lazySingleton<_i150.NewIceAttempt>(
      () => _i150.NewIceAttempt(gh<_i132.IceTreaningsRepository>()));
  gh.lazySingleton<_i151.NewIceTreaning>(() => _i151.NewIceTreaning(
        iceTreaningsRepository: gh<_i132.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i128.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i152.NewRockAttempt>(
      () => _i152.NewRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i153.NewRockTreaning>(
      () => _i153.NewRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i154.PreviosTrekkingPathUsecase>(() =>
      _i154.PreviosTrekkingPathUsecase(gh<_i68.TrekkingPathRepository>()));
  gh.factory<_i155.RockDistrictsCubit>(
      () => _i155.RockDistrictsCubit(gh<_i137.LoadRockDistricts>()));
  gh.factory<_i156.RockRoutesCubit>(() => _i156.RockRoutesCubit(
        gh<_i138.LoadRockRoutes>(),
        gh<_i115.GetRockRouteStatistic>(),
      ));
  gh.lazySingleton<_i157.RockSectorToTreaning>(
      () => _i157.RockSectorToTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.factory<_i158.RockSectorsCubit>(
      () => _i158.RockSectorsCubit(gh<_i139.LoadRockSectors>()));
  gh.factory<_i159.RockTreaningCubit>(() => _i159.RockTreaningCubit(
        gh<_i153.NewRockTreaning>(),
        gh<_i157.RockSectorToTreaning>(),
        gh<_i152.NewRockAttempt>(),
        gh<_i100.FinishRockAttempt>(),
        gh<_i101.FinishRockTreaning>(),
        gh<_i108.GetLastRockTreaning>(),
        gh<_i105.GetCurrentRockTreaning>(),
        gh<_i115.GetRockRouteStatistic>(),
        gh<_i97.DeleteRockAttempt>(),
      ));
  gh.lazySingleton<_i160.SaveCardioTreaning>(() => _i160.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i86.CardioTreaningsRepository>()));
  gh.lazySingleton<_i161.SaveSimpleSettingsUsecase>(
      () => _i161.SaveSimpleSettingsUsecase(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i162.SaveStrengthExercise>(() => _i162.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i163.SaveTreaningsSettings>(
      () => _i163.SaveTreaningsSettings(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i164.SelectToUseStrengthExercise>(() =>
      _i164.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i165.SettingsCubit>(() => _i165.SettingsCubit(
        gh<_i142.LoadTreaningsSettings>(),
        gh<_i163.SaveTreaningsSettings>(),
        gh<_i136.LoadPlaces>(),
        gh<_i141.LoadSimpleSettingsUsecase>(),
        gh<_i161.SaveSimpleSettingsUsecase>(),
      ));
  gh.lazySingleton<_i166.StartTrekUsecase>(
      () => _i166.StartTrekUsecase(gh<_i68.TrekkingPathRepository>()));
  gh.factory<_i167.StrengthExercisesCubit>(() => _i167.StrengthExercisesCubit(
        gh<_i116.GetStrengthExercises>(),
        gh<_i162.SaveStrengthExercise>(),
        gh<_i164.SelectToUseStrengthExercise>(),
        gh<_i98.DeleteStrengthExercise>(),
      ));
  gh.factory<_i168.StrengthTrainingCubit>(() => _i168.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i106.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i113.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i76.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i74.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i75.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i102.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i96.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i169.StrengthTrainingsCubit>(() => _i169.StrengthTrainingsCubit(
        gh<_i117.GetStrengthTreanings>(),
        gh<_i99.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i170.TechniqueGroupsCubit>(
      () => _i170.TechniqueGroupsCubit(gh<_i118.GetTechniqueGroupsUsecase>()));
  gh.factory<_i171.TechniquesCubit>(
      () => _i171.TechniquesCubit(gh<_i119.GetTechniquesUsecase>()));
  gh.factory<_i172.TravelsCubit>(() => _i172.TravelsCubit(
        gh<_i120.GetTravelsUsecase>(),
        gh<_i112.GetPlanedTravelsUsecase>(),
      ));
  gh.factory<_i173.TrekkingCubit>(() => _i173.TrekkingCubit(
        gh<_i94.CurrentTrekkingPathUsecase>(),
        gh<_i154.PreviosTrekkingPathUsecase>(),
        gh<_i166.StartTrekUsecase>(),
        gh<_i77.AddTrekEventUsecase>(),
        gh<_i90.ContinueTrekUsecase>(),
      ));
  gh.factory<_i174.TrekkingRegionsCubit>(
      () => _i174.TrekkingRegionsCubit(gh<_i121.GetTrekkingRegions>()));
  gh.factory<_i175.TreksCubit>(() => _i175.TreksCubit(gh<_i122.GetTreks>()));
  gh.lazySingleton<_i176.AllClimbingHalls>(
      () => _i176.AllClimbingHalls(gh<_i88.ClimbingHallRepository>()));
  gh.lazySingleton<_i177.AllHallTreanings>(
      () => _i177.AllHallTreanings(gh<_i126.HallTreaningRepository>()));
  gh.factory<_i178.AuthGetUser>(
      () => _i178.AuthGetUser(authRepository: gh<_i82.AuthRepository>()));
  gh.factory<_i179.AuthLogin>(
      () => _i179.AuthLogin(authRepository: gh<_i82.AuthRepository>()));
  gh.factory<_i180.AuthLogout>(
      () => _i180.AuthLogout(authRepository: gh<_i82.AuthRepository>()));
  gh.factory<_i181.AuthenticationCubit>(() => _i181.AuthenticationCubit(
        gh<_i179.AuthLogin>(),
        gh<_i180.AuthLogout>(),
        gh<_i178.AuthGetUser>(),
      ));
  gh.factory<_i182.CardioTreaningCubit>(() => _i182.CardioTreaningCubit(
        gh<_i107.GetLastCardioTreaning>(),
        gh<_i160.SaveCardioTreaning>(),
      ));
  gh.factory<_i183.CardioTreaningsCubit>(() => _i183.CardioTreaningsCubit(
        gh<_i103.GetCardioTreanings>(),
        gh<_i95.DeleteCardioTreaning>(),
        gh<_i160.SaveCardioTreaning>(),
      ));
  gh.factory<_i184.ClimbingHallsCubit>(() =>
      _i184.ClimbingHallsCubit(allClimbingHalls: gh<_i176.AllClimbingHalls>()));
  gh.lazySingleton<_i185.CurrentHallTreaning>(
      () => _i185.CurrentHallTreaning(gh<_i126.HallTreaningRepository>()));
  gh.factory<_i186.CurrentTravelCubit>(() => _i186.CurrentTravelCubit(
        gh<_i93.CurrentTravelUsecase>(),
        gh<_i112.GetPlanedTravelsUsecase>(),
      ));
  gh.lazySingleton<_i187.DeleteHallAttempt>(() => _i187.DeleteHallAttempt(
      treaningRepository: gh<_i126.HallTreaningRepository>()));
  gh.lazySingleton<_i188.DeleteHallTreaning>(() => _i188.DeleteHallTreaning(
      treaningRepository: gh<_i126.HallTreaningRepository>()));
  gh.lazySingleton<_i189.DeleteIceAttempt>(
      () => _i189.DeleteIceAttempt(gh<_i132.IceTreaningsRepository>()));
  gh.lazySingleton<_i190.DeleteTreaning>(() => _i190.DeleteTreaning(
        gh<_i126.HallTreaningRepository>(),
        gh<_i132.IceTreaningsRepository>(),
        gh<_i51.StrengthTreaningsRepository>(),
        gh<_i86.CardioTreaningsRepository>(),
        gh<_i39.RockTreaningsRepository>(),
        gh<_i68.TrekkingPathRepository>(),
      ));
  gh.lazySingleton<_i191.FinishHallAttempt>(() => _i191.FinishHallAttempt(
      treaningRepository: gh<_i126.HallTreaningRepository>()));
  gh.lazySingleton<_i192.FinishHallTreaning>(() => _i192.FinishHallTreaning(
      treaningRepository: gh<_i126.HallTreaningRepository>()));
  gh.lazySingleton<_i193.FinishIceAttempt>(
      () => _i193.FinishIceAttempt(gh<_i132.IceTreaningsRepository>()));
  gh.lazySingleton<_i194.FinishIceTreaning>(() => _i194.FinishIceTreaning(
      iceTreaningsRepository: gh<_i132.IceTreaningsRepository>()));
  gh.lazySingleton<_i195.GetAllTreanings>(() => _i195.GetAllTreanings(
        gh<_i126.HallTreaningRepository>(),
        gh<_i132.IceTreaningsRepository>(),
        gh<_i51.StrengthTreaningsRepository>(),
        gh<_i86.CardioTreaningsRepository>(),
        gh<_i39.RockTreaningsRepository>(),
        gh<_i64.TravelRepository>(),
        gh<_i68.TrekkingPathRepository>(),
      ));
  gh.lazySingleton<_i196.GetCurrentIceTreaning>(() =>
      _i196.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i132.IceTreaningsRepository>()));
  gh.lazySingleton<_i197.GetGymRouteStatistic>(
      () => _i197.GetGymRouteStatistic(gh<_i126.HallTreaningRepository>()));
  gh.lazySingleton<_i198.GetHallRouteAttempts>(() => _i198.GetHallRouteAttempts(
      repository: gh<_i126.HallTreaningRepository>()));
  gh.lazySingleton<_i199.GetLastIceTreaning>(() => _i199.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i132.IceTreaningsRepository>()));
  gh.factory<_i200.HallRouteAttemptsCubit>(() => _i200.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i198.GetHallRouteAttempts>()));
  gh.factory<_i201.HallRouteCubit>(
      () => _i201.HallRouteCubit(gh<_i148.NewHallRoute>()));
  gh.factory<_i202.HallTreaningsCubit>(() => _i202.HallTreaningsCubit(
        allHallTreanings: gh<_i177.AllHallTreanings>(),
        deleteHallTreaning: gh<_i188.DeleteHallTreaning>(),
      ));
  gh.factory<_i203.HomePageCubit>(() =>
      _i203.HomePageCubit(allClimbingHalls: gh<_i176.AllClimbingHalls>()));
  gh.factory<_i204.IceDistrictsCubit>(() => _i204.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i135.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i205.IceSectorToTreaning>(() => _i205.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i132.IceTreaningsRepository>()));
  gh.factory<_i206.IceSectorsCubit>(() => _i206.IceSectorsCubit(
      loadSectorsUseCase: gh<_i140.LoadSectorsUseCase>()));
  gh.factory<_i207.TreaningsCubit>(() => _i207.TreaningsCubit(
        gh<_i195.GetAllTreanings>(),
        gh<_i190.DeleteTreaning>(),
      ));
  gh.factory<_i208.ClimbingHallCubit>(() => _i208.ClimbingHallCubit(
        gh<_i104.GetClimbingHallRoures>(),
        gh<_i123.HallRouteToArchive>(),
        gh<_i197.GetGymRouteStatistic>(),
      ));
  gh.factory<_i209.CurrentHallTreaningCubit>(
      () => _i209.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i147.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i149.NewHallTreaning>(),
            newHallAttempt: gh<_i146.NewHallAttempt>(),
            currentHallTreaning: gh<_i185.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i191.FinishHallAttempt>(),
            finishHallTreaning: gh<_i192.FinishHallTreaning>(),
            lastHallTreaning: gh<_i134.LastHallTreaning>(),
            deleteHallAttempt: gh<_i187.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i197.GetGymRouteStatistic>(),
          ));
  gh.factory<_i210.CurrentIceTreaningCubit>(() => _i210.CurrentIceTreaningCubit(
        gh<_i151.NewIceTreaning>(),
        gh<_i205.IceSectorToTreaning>(),
        gh<_i150.NewIceAttempt>(),
        gh<_i193.FinishIceAttempt>(),
        gh<_i194.FinishIceTreaning>(),
        gh<_i196.GetCurrentIceTreaning>(),
        gh<_i199.GetLastIceTreaning>(),
        gh<_i189.DeleteIceAttempt>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i211.InjectableModule {}

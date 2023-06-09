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
import 'core/injectable_module.dart' as _i188;
import 'core/services/analitics/analitics_service.dart' as _i64;
import 'core/services/analitics/firebase_analitics_service.dart' as _i65;
import 'core/services/crash_log_service/crash_log_service.dart' as _i76;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i77;
import 'core/services/network/network_info.dart' as _i22;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i66;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i67;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i69;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i68;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i155;
import 'features/authentication/domain/usecases/auth_login.dart' as _i156;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i157;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i158;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i70;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i71;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i73;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i72;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i79;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i87;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i91;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i141;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i159;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i160;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i106;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i107;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i29;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i30;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i75;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i109;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i74;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i108;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i153;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i88;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i174;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i175;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i105;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i130;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i154;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i162;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i164;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i165;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i168;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i169;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i116;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i128;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i129;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i131;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i185;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i161;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i186;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i178;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i177;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i179;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i180;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i12;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i9;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i11;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i112;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i10;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i113;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i111;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i115;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i110;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i114;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i166;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i170;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i171;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i173;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i176;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i182;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i117;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i122;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i132;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i133;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i187;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i181;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i183;
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
    as _i93;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i94;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i95;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i125;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i126;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i127;
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
    as _i81;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i84;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i85;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i89;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i92;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i98;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i99;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i119;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i120;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i121;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i134;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i135;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i138;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i136;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i137;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i139;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i140;
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
import 'features/settings/domain/usecases/load_places.dart' as _i118;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i123;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i124;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i142;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i144;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i146;
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
    as _i62;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i63;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i80;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i82;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i83;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i86;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i90;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i97;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i100;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i101;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i143;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i145;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i61;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i147;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i148;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i149;
import 'features/traveling/data/datasources/mock_travel_local_datasource.dart'
    as _i54;
import 'features/traveling/data/datasources/travel_local_datasource.dart'
    as _i53;
import 'features/traveling/data/repositories/travel_repository.dart' as _i56;
import 'features/traveling/domain/repositories/travel_repository.dart' as _i55;
import 'features/traveling/domain/usecases/current_travel_usecase.dart' as _i78;
import 'features/traveling/domain/usecases/get_planed_travels_usecase.dart'
    as _i96;
import 'features/traveling/domain/usecases/get_travels_usecase.dart' as _i102;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i163;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i150;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i167;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i172;
import 'features/treanings/presentation/cubit/treanings_cubit.dart' as _i184;
import 'features/trekking/data/datasources/mock_trekking_remote_datasource.dart'
    as _i58;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i57;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i60;
import 'features/trekking/domain/repositories/trekking_repository.dart' as _i59;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i103;
import 'features/trekking/domain/usecases/get_treks.dart' as _i104;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i151;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i152;

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
  gh.lazySingleton<_i57.TrekkingRemoteDataSource>(
      () => _i58.MockTrekkingRemoteDataSource());
  gh.lazySingleton<_i59.TrekkingRepository>(
      () => _i60.TrekkingRepositoryImpl(gh<_i57.TrekkingRemoteDataSource>()));
  gh.lazySingleton<_i61.UpdateStrengthTreaningExercises>(
      () => _i61.UpdateStrengthTreaningExercises(
            strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>(),
            strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>(),
          ));
  gh.lazySingleton<_i62.AddRepetitionForStrengthTreaning>(() =>
      _i62.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i63.AddStrengthTreaning>(() => _i63.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>(),
      ));
  gh.lazySingletonAsync<_i64.AnaliticsService>(() async =>
      _i65.FirebaseAnaliticsService(
          await gh.getAsync<_i5.FirebaseAnalytics>()));
  gh.lazySingleton<_i66.AuthDataSource>(
      () => _i67.FirebaseAuthDataSource(firebaseAuth: gh<_i6.FirebaseAuth>()));
  gh.lazySingleton<_i68.AuthRepository>(
      () => _i69.AuthRepositoryImpl(authDataSource: gh<_i66.AuthDataSource>()));
  gh.lazySingleton<_i70.CardioTreaningsDatasource>(
      () => _i71.LocalCardioTreaningsDatasource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i72.CardioTreaningsRepository>(() =>
      _i73.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i70.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i74.ClimbingHallRepository>(
      () => _i75.ClimbingHallRepositoryImpl(
            gh<_i3.ClimbingHallDataSource>(),
            gh<_i29.RemoteGymDataSource>(),
            gh<_i22.NetworkInfo>(),
          ));
  gh.lazySingletonAsync<_i76.CrashLogService>(() async =>
      _i77.GoogleCrashLogService(await gh.getAsync<_i7.FirebaseCrashlytics>()));
  gh.lazySingleton<_i78.CurrentTravelUsecase>(
      () => _i78.CurrentTravelUsecase(gh<_i55.TravelRepository>()));
  gh.lazySingleton<_i79.DeleteCardioTreaning>(() => _i79.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i72.CardioTreaningsRepository>()));
  gh.lazySingleton<_i80.DeleteRepetitionForStrengthTreaning>(() =>
      _i80.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i81.DeleteRockAttempt>(
      () => _i81.DeleteRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i82.DeleteStrengthExercise>(() =>
      _i82.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i83.DeleteStrengthTreaning>(() =>
      _i83.DeleteStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i84.FinishRockAttempt>(
      () => _i84.FinishRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i85.FinishRockTreaning>(
      () => _i85.FinishRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i86.FinishStrengthTreaning>(() =>
      _i86.FinishStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i87.GetCardioTreanings>(() => _i87.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i72.CardioTreaningsRepository>()));
  gh.lazySingleton<_i88.GetClimbingHallRoures>(
      () => _i88.GetClimbingHallRoures(gh<_i74.ClimbingHallRepository>()));
  gh.lazySingleton<_i89.GetCurrentRockTreaning>(
      () => _i89.GetCurrentRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i90.GetCurrentStrengthTreaning>(() =>
      _i90.GetCurrentStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i91.GetLastCardioTreaning>(() => _i91.GetLastCardioTreaning(
      cardioTreaningsRepository: gh<_i72.CardioTreaningsRepository>()));
  gh.lazySingleton<_i92.GetLastRockTreaning>(
      () => _i92.GetLastRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i93.GetMountainRegions>(
      () => _i93.GetMountainRegions(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i94.GetMountainRoutes>(
      () => _i94.GetMountainRoutes(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i95.GetMountains>(
      () => _i95.GetMountains(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i96.GetPlanedTravelsUsecase>(
      () => _i96.GetPlanedTravelsUsecase(gh<_i55.TravelRepository>()));
  gh.lazySingleton<_i97.GetPreviosStrengthTreaning>(() =>
      _i97.GetPreviosStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i98.GetRockRouteAttempts>(
      () => _i98.GetRockRouteAttempts(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i99.GetRockRouteStatistic>(
      () => _i99.GetRockRouteStatistic(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i100.GetStrengthExercises>(() => _i100.GetStrengthExercises(
      strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i101.GetStrengthTreanings>(() => _i101.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i102.GetTravelsUsecase>(
      () => _i102.GetTravelsUsecase(gh<_i55.TravelRepository>()));
  gh.lazySingleton<_i103.GetTrekkingRegions>(
      () => _i103.GetTrekkingRegions(gh<_i59.TrekkingRepository>()));
  gh.lazySingleton<_i104.GetTreks>(
      () => _i104.GetTreks(gh<_i59.TrekkingRepository>()));
  gh.lazySingleton<_i105.HallRouteToArchive>(() =>
      _i105.HallRouteToArchive(repository: gh<_i74.ClimbingHallRepository>()));
  gh.lazySingleton<_i106.HallTreaningDataSource>(
      () => _i107.LocalHallTreaningDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i108.HallTreaningRepository>(
      () => _i109.HallTreaningRepositoryImpl(
            dataSource: gh<_i106.HallTreaningDataSource>(),
            hallDataSource: gh<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i110.IceRegionsRepository>(
      () => _i111.IceRegionsRepositoryImpl(
            gh<_i9.IceRegionsDataSource>(),
            gh<_i11.IceRegionsRemoteDataSource>(),
            gh<_i22.NetworkInfo>(),
          ));
  gh.lazySingleton<_i112.IceTreaningsDataSource>(
      () => _i113.LocalIceTreaningsDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i114.IceTreaningsRepository>(() =>
      _i115.IceTreaningsRepositoryImpl(gh<_i112.IceTreaningsDataSource>()));
  gh.lazySingleton<_i116.LastHallTreaning>(
      () => _i116.LastHallTreaning(gh<_i108.HallTreaningRepository>()));
  gh.lazySingleton<_i117.LoadDistrictsUseCase>(() => _i117.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i110.IceRegionsRepository>()));
  gh.lazySingleton<_i118.LoadPlaces>(
      () => _i118.LoadPlaces(gh<_i27.PlacesRepository>()));
  gh.lazySingleton<_i119.LoadRockDistricts>(
      () => _i119.LoadRockDistricts(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i120.LoadRockRoutes>(
      () => _i120.LoadRockRoutes(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i121.LoadRockSectors>(
      () => _i121.LoadRockSectors(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i122.LoadSectorsUseCase>(() => _i122.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i110.IceRegionsRepository>()));
  gh.lazySingleton<_i123.LoadSimpleSettingsUsecase>(
      () => _i123.LoadSimpleSettingsUsecase(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i124.LoadTreaningsSettings>(
      () => _i124.LoadTreaningsSettings(gh<_i43.SettingsRepository>()));
  gh.factory<_i125.MountainRegionsCubit>(
      () => _i125.MountainRegionsCubit(gh<_i93.GetMountainRegions>()));
  gh.factory<_i126.MountainRoutesCubit>(
      () => _i126.MountainRoutesCubit(gh<_i94.GetMountainRoutes>()));
  gh.factory<_i127.MountainsCubit>(
      () => _i127.MountainsCubit(gh<_i95.GetMountains>()));
  gh.lazySingleton<_i128.NewHallAttempt>(() => _i128.NewHallAttempt(
      treaningRepository: gh<_i108.HallTreaningRepository>()));
  gh.lazySingleton<_i129.NewHallAttemptFromRoute>(() =>
      _i129.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i108.HallTreaningRepository>()));
  gh.lazySingleton<_i130.NewHallRoute>(() => _i130.NewHallRoute(
      climbingHallRepository: gh<_i74.ClimbingHallRepository>()));
  gh.lazySingleton<_i131.NewHallTreaning>(() => _i131.NewHallTreaning(
      treaningRepository: gh<_i108.HallTreaningRepository>()));
  gh.lazySingleton<_i132.NewIceAttempt>(
      () => _i132.NewIceAttempt(gh<_i114.IceTreaningsRepository>()));
  gh.lazySingleton<_i133.NewIceTreaning>(() => _i133.NewIceTreaning(
        iceTreaningsRepository: gh<_i114.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i110.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i134.NewRockAttempt>(
      () => _i134.NewRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i135.NewRockTreaning>(
      () => _i135.NewRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.factory<_i136.RockDistrictsCubit>(
      () => _i136.RockDistrictsCubit(gh<_i119.LoadRockDistricts>()));
  gh.factory<_i137.RockRoutesCubit>(() => _i137.RockRoutesCubit(
        gh<_i120.LoadRockRoutes>(),
        gh<_i99.GetRockRouteStatistic>(),
      ));
  gh.lazySingleton<_i138.RockSectorToTreaning>(
      () => _i138.RockSectorToTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.factory<_i139.RockSectorsCubit>(
      () => _i139.RockSectorsCubit(gh<_i121.LoadRockSectors>()));
  gh.factory<_i140.RockTreaningCubit>(() => _i140.RockTreaningCubit(
        gh<_i135.NewRockTreaning>(),
        gh<_i138.RockSectorToTreaning>(),
        gh<_i134.NewRockAttempt>(),
        gh<_i84.FinishRockAttempt>(),
        gh<_i85.FinishRockTreaning>(),
        gh<_i92.GetLastRockTreaning>(),
        gh<_i89.GetCurrentRockTreaning>(),
        gh<_i99.GetRockRouteStatistic>(),
        gh<_i81.DeleteRockAttempt>(),
      ));
  gh.lazySingleton<_i141.SaveCardioTreaning>(() => _i141.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i72.CardioTreaningsRepository>()));
  gh.lazySingleton<_i142.SaveSimpleSettingsUsecase>(
      () => _i142.SaveSimpleSettingsUsecase(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i143.SaveStrengthExercise>(() => _i143.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i144.SaveTreaningsSettings>(
      () => _i144.SaveTreaningsSettings(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i145.SelectToUseStrengthExercise>(() =>
      _i145.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i146.SettingsCubit>(() => _i146.SettingsCubit(
        gh<_i124.LoadTreaningsSettings>(),
        gh<_i144.SaveTreaningsSettings>(),
        gh<_i118.LoadPlaces>(),
        gh<_i123.LoadSimpleSettingsUsecase>(),
        gh<_i142.SaveSimpleSettingsUsecase>(),
      ));
  gh.factory<_i147.StrengthExercisesCubit>(() => _i147.StrengthExercisesCubit(
        gh<_i100.GetStrengthExercises>(),
        gh<_i143.SaveStrengthExercise>(),
        gh<_i145.SelectToUseStrengthExercise>(),
        gh<_i82.DeleteStrengthExercise>(),
      ));
  gh.factory<_i148.StrengthTrainingCubit>(() => _i148.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i90.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i97.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i63.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i61.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i62.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i86.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i80.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i149.StrengthTrainingsCubit>(() => _i149.StrengthTrainingsCubit(
        gh<_i101.GetStrengthTreanings>(),
        gh<_i83.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i150.TravelsCubit>(() => _i150.TravelsCubit(
        gh<_i102.GetTravelsUsecase>(),
        gh<_i96.GetPlanedTravelsUsecase>(),
      ));
  gh.factory<_i151.TrekkingRegionsCubit>(
      () => _i151.TrekkingRegionsCubit(gh<_i103.GetTrekkingRegions>()));
  gh.factory<_i152.TreksCubit>(() => _i152.TreksCubit(gh<_i104.GetTreks>()));
  gh.lazySingleton<_i153.AllClimbingHalls>(
      () => _i153.AllClimbingHalls(gh<_i74.ClimbingHallRepository>()));
  gh.lazySingleton<_i154.AllHallTreanings>(
      () => _i154.AllHallTreanings(gh<_i108.HallTreaningRepository>()));
  gh.factory<_i155.AuthGetUser>(
      () => _i155.AuthGetUser(authRepository: gh<_i68.AuthRepository>()));
  gh.factory<_i156.AuthLogin>(
      () => _i156.AuthLogin(authRepository: gh<_i68.AuthRepository>()));
  gh.factory<_i157.AuthLogout>(
      () => _i157.AuthLogout(authRepository: gh<_i68.AuthRepository>()));
  gh.factory<_i158.AuthenticationCubit>(() => _i158.AuthenticationCubit(
        gh<_i156.AuthLogin>(),
        gh<_i157.AuthLogout>(),
        gh<_i155.AuthGetUser>(),
      ));
  gh.factory<_i159.CardioTreaningCubit>(() => _i159.CardioTreaningCubit(
        gh<_i91.GetLastCardioTreaning>(),
        gh<_i141.SaveCardioTreaning>(),
      ));
  gh.factory<_i160.CardioTreaningsCubit>(() => _i160.CardioTreaningsCubit(
        gh<_i87.GetCardioTreanings>(),
        gh<_i79.DeleteCardioTreaning>(),
        gh<_i141.SaveCardioTreaning>(),
      ));
  gh.factory<_i161.ClimbingHallsCubit>(() =>
      _i161.ClimbingHallsCubit(allClimbingHalls: gh<_i153.AllClimbingHalls>()));
  gh.lazySingleton<_i162.CurrentHallTreaning>(
      () => _i162.CurrentHallTreaning(gh<_i108.HallTreaningRepository>()));
  gh.factory<_i163.CurrentTravelCubit>(() => _i163.CurrentTravelCubit(
        gh<_i78.CurrentTravelUsecase>(),
        gh<_i96.GetPlanedTravelsUsecase>(),
      ));
  gh.lazySingleton<_i164.DeleteHallAttempt>(() => _i164.DeleteHallAttempt(
      treaningRepository: gh<_i108.HallTreaningRepository>()));
  gh.lazySingleton<_i165.DeleteHallTreaning>(() => _i165.DeleteHallTreaning(
      treaningRepository: gh<_i108.HallTreaningRepository>()));
  gh.lazySingleton<_i166.DeleteIceAttempt>(
      () => _i166.DeleteIceAttempt(gh<_i114.IceTreaningsRepository>()));
  gh.lazySingleton<_i167.DeleteTreaning>(() => _i167.DeleteTreaning(
        gh<_i108.HallTreaningRepository>(),
        gh<_i114.IceTreaningsRepository>(),
        gh<_i51.StrengthTreaningsRepository>(),
        gh<_i72.CardioTreaningsRepository>(),
        gh<_i39.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i168.FinishHallAttempt>(() => _i168.FinishHallAttempt(
      treaningRepository: gh<_i108.HallTreaningRepository>()));
  gh.lazySingleton<_i169.FinishHallTreaning>(() => _i169.FinishHallTreaning(
      treaningRepository: gh<_i108.HallTreaningRepository>()));
  gh.lazySingleton<_i170.FinishIceAttempt>(
      () => _i170.FinishIceAttempt(gh<_i114.IceTreaningsRepository>()));
  gh.lazySingleton<_i171.FinishIceTreaning>(() => _i171.FinishIceTreaning(
      iceTreaningsRepository: gh<_i114.IceTreaningsRepository>()));
  gh.lazySingleton<_i172.GetAllTreanings>(() => _i172.GetAllTreanings(
        gh<_i108.HallTreaningRepository>(),
        gh<_i114.IceTreaningsRepository>(),
        gh<_i51.StrengthTreaningsRepository>(),
        gh<_i72.CardioTreaningsRepository>(),
        gh<_i39.RockTreaningsRepository>(),
        gh<_i55.TravelRepository>(),
      ));
  gh.lazySingleton<_i173.GetCurrentIceTreaning>(() =>
      _i173.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i114.IceTreaningsRepository>()));
  gh.lazySingleton<_i174.GetGymRouteStatistic>(
      () => _i174.GetGymRouteStatistic(gh<_i108.HallTreaningRepository>()));
  gh.lazySingleton<_i175.GetHallRouteAttempts>(() => _i175.GetHallRouteAttempts(
      repository: gh<_i108.HallTreaningRepository>()));
  gh.lazySingleton<_i176.GetLastIceTreaning>(() => _i176.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i114.IceTreaningsRepository>()));
  gh.factory<_i177.HallRouteAttemptsCubit>(() => _i177.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i175.GetHallRouteAttempts>()));
  gh.factory<_i178.HallRouteCubit>(
      () => _i178.HallRouteCubit(gh<_i130.NewHallRoute>()));
  gh.factory<_i179.HallTreaningsCubit>(() => _i179.HallTreaningsCubit(
        allHallTreanings: gh<_i154.AllHallTreanings>(),
        deleteHallTreaning: gh<_i165.DeleteHallTreaning>(),
      ));
  gh.factory<_i180.HomePageCubit>(() =>
      _i180.HomePageCubit(allClimbingHalls: gh<_i153.AllClimbingHalls>()));
  gh.factory<_i181.IceDistrictsCubit>(() => _i181.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i117.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i182.IceSectorToTreaning>(() => _i182.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i114.IceTreaningsRepository>()));
  gh.factory<_i183.IceSectorsCubit>(() => _i183.IceSectorsCubit(
      loadSectorsUseCase: gh<_i122.LoadSectorsUseCase>()));
  gh.factory<_i184.TreaningsCubit>(() => _i184.TreaningsCubit(
        gh<_i172.GetAllTreanings>(),
        gh<_i167.DeleteTreaning>(),
      ));
  gh.factory<_i185.ClimbingHallCubit>(() => _i185.ClimbingHallCubit(
        gh<_i88.GetClimbingHallRoures>(),
        gh<_i105.HallRouteToArchive>(),
        gh<_i174.GetGymRouteStatistic>(),
      ));
  gh.factory<_i186.CurrentHallTreaningCubit>(
      () => _i186.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i129.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i131.NewHallTreaning>(),
            newHallAttempt: gh<_i128.NewHallAttempt>(),
            currentHallTreaning: gh<_i162.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i168.FinishHallAttempt>(),
            finishHallTreaning: gh<_i169.FinishHallTreaning>(),
            lastHallTreaning: gh<_i116.LastHallTreaning>(),
            deleteHallAttempt: gh<_i164.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i174.GetGymRouteStatistic>(),
          ));
  gh.factory<_i187.CurrentIceTreaningCubit>(() => _i187.CurrentIceTreaningCubit(
        gh<_i133.NewIceTreaning>(),
        gh<_i182.IceSectorToTreaning>(),
        gh<_i132.NewIceAttempt>(),
        gh<_i170.FinishIceAttempt>(),
        gh<_i171.FinishIceTreaning>(),
        gh<_i173.GetCurrentIceTreaning>(),
        gh<_i176.GetLastIceTreaning>(),
        gh<_i166.DeleteIceAttempt>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i188.InjectableModule {}

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

import 'core/datasource/drift_db_local_datasource.dart' as _i17;
import 'core/datasource/local_db_datasource.dart' as _i16;
import 'core/injectable_module.dart' as _i225;
import 'core/services/analitics/analitics_service.dart' as _i81;
import 'core/services/analitics/firebase_analitics_service.dart' as _i82;
import 'core/services/crash_log_service/crash_log_service.dart' as _i96;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i97;
import 'core/services/network/network_info.dart' as _i24;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i85;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i86;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i88;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i87;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i192;
import 'features/authentication/domain/usecases/auth_login.dart' as _i193;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i194;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i195;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i89;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i90;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i92;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i91;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i101;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i113;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i117;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i171;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i196;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i197;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i134;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i135;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i31;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i32;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i94;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i137;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i93;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i136;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i189;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i114;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i211;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i212;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i133;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i158;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i190;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i199;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i201;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i202;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i205;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i206;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i144;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i156;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i157;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i159;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i222;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i198;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i223;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i215;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i214;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i216;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i217;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i12;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i9;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i11;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i140;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i10;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i141;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i139;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i143;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i138;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i142;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i203;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i207;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i208;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i210;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i213;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i219;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i145;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i150;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i160;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i161;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i224;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i218;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i220;
import 'features/mountaineering/data/datasources/firebase_mountain_regions_remote_datasource.dart'
    as _i21;
import 'features/mountaineering/data/datasources/local_ascension_datasource.dart'
    as _i14;
import 'features/mountaineering/data/datasources/mock_local_ascension_datasource.dart'
    as _i15;
import 'features/mountaineering/data/datasources/mock_mountain_regions_local_datasource.dart'
    as _i19;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i18;
import 'features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart'
    as _i20;
import 'features/mountaineering/data/repositories/ascension_repository_impl.dart'
    as _i84;
import 'features/mountaineering/data/repositories/mountain_regions_repository_impl.dart'
    as _i23;
import 'features/mountaineering/domain/repositories/ascension_repository.dart'
    as _i83;
import 'features/mountaineering/domain/repositories/mountain_regions_repository.dart'
    as _i22;
import 'features/mountaineering/domain/usecases/add_ascension_usecase.dart'
    as _i188;
import 'features/mountaineering/domain/usecases/get_ascension_usecase.dart'
    as _i112;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i119;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i120;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i121;
import 'features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart'
    as _i191;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i153;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i154;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i155;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i40;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i36;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i34;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i33;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i35;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i39;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i38;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i42;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i37;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i41;
import 'features/rock_climbing/domain/usecases/delete_rock_attempt.dart'
    as _i103;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i108;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i109;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i115;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i118;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i124;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i125;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i147;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i148;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i149;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i162;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i163;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i168;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i166;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i167;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i169;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i170;
import 'features/settings/data/datasources/firebase_places_remote_datasource.dart'
    as _i28;
import 'features/settings/data/datasources/hive_places_local_datasource.dart'
    as _i26;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i44;
import 'features/settings/data/datasources/places_local_datasource.dart'
    as _i25;
import 'features/settings/data/datasources/places_remote_datasource.dart'
    as _i27;
import 'features/settings/data/datasources/settings_datasource.dart' as _i43;
import 'features/settings/data/repositories/places_repository_impl.dart'
    as _i30;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i46;
import 'features/settings/domain/repositories/places_repository.dart' as _i29;
import 'features/settings/domain/repositories/settings_repository.dart' as _i45;
import 'features/settings/domain/usecases/load_places.dart' as _i146;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i151;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i152;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i172;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i174;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i176;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i48;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i52;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i47;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i51;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i50;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i54;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i49;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i53;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i76;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i77;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i102;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i104;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i105;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i110;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i116;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i123;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i126;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i127;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i173;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i175;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i75;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i178;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i179;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i180;
import 'features/techniques/data/datasources/drift_technique_treanings_local_datasource.dart'
    as _i56;
import 'features/techniques/data/datasources/firebase_techniques_remote_datasource.dart'
    as _i60;
import 'features/techniques/data/datasources/technique_treanings_local_datasource.dart'
    as _i55;
import 'features/techniques/data/datasources/techniques_remote_datasource.dart'
    as _i59;
import 'features/techniques/data/repositories/technique_treanings_repository_impl.dart'
    as _i58;
import 'features/techniques/data/repositories/techniques_repository_impl.dart'
    as _i62;
import 'features/techniques/domain/repositories/technique_treanings_repository.dart'
    as _i57;
import 'features/techniques/domain/repositories/techniques_repository.dart'
    as _i61;
import 'features/techniques/domain/usecases/add_technique_to_treaning_usecase.dart'
    as _i78;
import 'features/techniques/domain/usecases/add_technique_treaning_usecase.dart'
    as _i79;
import 'features/techniques/domain/usecases/current_technique_treaning_usecase.dart'
    as _i98;
import 'features/techniques/domain/usecases/delete_technique_treaning_usecase.dart'
    as _i106;
import 'features/techniques/domain/usecases/edit_technique_item_usecase.dart'
    as _i107;
import 'features/techniques/domain/usecases/finish_technique_treaning_usecase.dart'
    as _i111;
import 'features/techniques/domain/usecases/get_technique_groups_usecase.dart'
    as _i128;
import 'features/techniques/domain/usecases/get_techniques_usecase.dart'
    as _i129;
import 'features/techniques/domain/usecases/previos_technique_treaning_usecase.dart'
    as _i164;
import 'features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart'
    as _i181;
import 'features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart'
    as _i182;
import 'features/techniques/presentation/bloc/techniques/techniques_cubit.dart'
    as _i183;
import 'features/traveling/data/datasources/mock_travel_local_datasource.dart'
    as _i64;
import 'features/traveling/data/datasources/travel_local_datasource.dart'
    as _i63;
import 'features/traveling/data/repositories/travel_repository.dart' as _i66;
import 'features/traveling/domain/repositories/travel_repository.dart' as _i65;
import 'features/traveling/domain/usecases/current_travel_usecase.dart' as _i99;
import 'features/traveling/domain/usecases/get_planed_travels_usecase.dart'
    as _i122;
import 'features/traveling/domain/usecases/get_travels_usecase.dart' as _i130;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i200;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i184;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i204;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i209;
import 'features/treanings/presentation/cubit/treanings_cubit.dart' as _i221;
import 'features/trekking/data/datasources/drift_trekking_path_local_datasource.dart'
    as _i68;
import 'features/trekking/data/datasources/firebase_trekking_remote_datasource.dart'
    as _i72;
import 'features/trekking/data/datasources/trekking_path_local_datasource.dart'
    as _i67;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i71;
import 'features/trekking/data/repositories/trekking_path_repository_impl.dart'
    as _i70;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i74;
import 'features/trekking/domain/repositories/trekking_path_repository.dart'
    as _i69;
import 'features/trekking/domain/repositories/trekking_repository.dart' as _i73;
import 'features/trekking/domain/usecases/add_trek_event_usecase.dart' as _i80;
import 'features/trekking/domain/usecases/continue_trek_usecase.dart' as _i95;
import 'features/trekking/domain/usecases/current_trekking_path_usecase.dart'
    as _i100;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i131;
import 'features/trekking/domain/usecases/get_treks.dart' as _i132;
import 'features/trekking/domain/usecases/previos_trekking_path_usecase.dart'
    as _i165;
import 'features/trekking/domain/usecases/start_trek_usecase.dart' as _i177;
import 'features/trekking/presentation/bloc/trekking/trekking_cubit.dart'
    as _i185;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i186;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i187;

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
  gh.lazySingleton<_i14.LocalAscensionDataSource>(
      () => _i15.MockLocalAscensionDataSource());
  gh.lazySingleton<_i16.LocalDBDatasource>(() => _i17.DriftDBLocalDataSource());
  gh.lazySingleton<_i18.MountainRegionsLocalDataSource>(
      () => _i19.MountainRegionsLocalDataSourceImpl());
  gh.lazySingleton<_i20.MountainRegionsRemoteDataSource>(() =>
      _i21.FirebaseMountainRegionsRemoteDataSource(
          gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i22.MountainRegionsRepository>(
      () => _i23.MountainRegionsRepositoryImpl(
            gh<_i18.MountainRegionsLocalDataSource>(),
            gh<_i20.MountainRegionsRemoteDataSource>(),
          ));
  gh.lazySingleton<_i24.NetworkInfo>(
      () => _i24.NetworkInfoImpl(gh<_i13.InternetConnectionChecker>()));
  gh.lazySingleton<_i25.PlacesLocalDataSource>(
      () => _i26.HivePlacesLocalDataSource());
  gh.lazySingleton<_i27.PlacesRemoteDataSource>(
      () => _i28.FirebasePlacesRemoteDataSource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i29.PlacesRepository>(() => _i30.PlacesRepositoryImpl(
        gh<_i25.PlacesLocalDataSource>(),
        gh<_i27.PlacesRemoteDataSource>(),
        gh<_i24.NetworkInfo>(),
      ));
  gh.lazySingleton<_i31.RemoteGymDataSource>(() => _i32.RemoteGymDataSourceImpl(
        gh<_i8.FirebaseFirestore>(),
        gh<_i6.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i33.RockRegionsLocalDataSource>(
      () => _i34.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i35.RockRegionsRemoteDataSource>(() =>
      _i36.FirebaseRockRegionsRemoteDataSource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i37.RockRegionsRepository>(
      () => _i38.RockRegionsRepositoryImpl(
            gh<_i33.RockRegionsLocalDataSource>(),
            gh<_i35.RockRegionsRemoteDataSource>(),
            gh<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i39.RockTreaningsLocalDataSource>(() =>
      _i40.DriftRockTreaningsLocalDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i41.RockTreaningsRepository>(() =>
      _i42.RockTreaningsRepositoryImpl(
          gh<_i39.RockTreaningsLocalDataSource>()));
  gh.lazySingleton<_i43.SettingsDataSource>(
      () => _i44.SettingsDataSourceImpl());
  gh.lazySingleton<_i45.SettingsRepository>(
      () => _i46.SettingsRepositoryImpl(gh<_i43.SettingsDataSource>()));
  gh.lazySingleton<_i47.StrengthExerciseDataSource>(
      () => _i48.LocalStrengthExerciseDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i49.StrengthExerciseRepository>(() =>
      _i50.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: gh<_i47.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i51.StrengthTreaningsDataSource>(() =>
      _i52.LocalStrengthTreaningsDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i53.StrengthTreaningsRepository>(() =>
      _i54.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource: gh<_i51.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i55.TechniqueTreaningsLocalDataSource>(() =>
      _i56.DriftTechniqueTreaningsLocalDataSource(
          gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i57.TechniqueTreaningsRepository>(() =>
      _i58.TechniqueTreaningsRepositoryImpl(
          gh<_i55.TechniqueTreaningsLocalDataSource>()));
  gh.lazySingleton<_i59.TechniquesRemoteDataSource>(() =>
      _i60.FirebaseTechniquesRemoteDataSource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i61.TechniquesRepository>(() =>
      _i62.TechniquesRepositoryImpl(gh<_i59.TechniquesRemoteDataSource>()));
  gh.lazySingleton<_i63.TravelLocalDatasource>(
      () => _i64.MockTravelLocalDatasource());
  gh.lazySingleton<_i65.TravelRepository>(
      () => _i66.TravelRepositoryImpl(gh<_i63.TravelLocalDatasource>()));
  gh.lazySingleton<_i67.TrekkingPathLocalDataSource>(() =>
      _i68.DriftTrekkingPathLocalDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i69.TrekkingPathRepository>(() =>
      _i70.TrekkingPathRepositoryImpl(gh<_i67.TrekkingPathLocalDataSource>()));
  gh.lazySingleton<_i71.TrekkingRemoteDataSource>(
      () => _i72.FirebaseTrekkingRemoteDatasource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i73.TrekkingRepository>(
      () => _i74.TrekkingRepositoryImpl(gh<_i71.TrekkingRemoteDataSource>()));
  gh.lazySingleton<_i75.UpdateStrengthTreaningExercises>(
      () => _i75.UpdateStrengthTreaningExercises(
            strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>(),
            strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>(),
          ));
  gh.lazySingleton<_i76.AddRepetitionForStrengthTreaning>(() =>
      _i76.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i77.AddStrengthTreaning>(() => _i77.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i78.AddTechniqueToTreaningUseCase>(() =>
      _i78.AddTechniqueToTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i79.AddTechniqueTreaningUseCase>(() =>
      _i79.AddTechniqueTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i80.AddTrekEventUsecase>(
      () => _i80.AddTrekEventUsecase(gh<_i69.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i81.AnaliticsService>(() async =>
      _i82.FirebaseAnaliticsService(
          await gh.getAsync<_i5.FirebaseAnalytics>()));
  gh.lazySingleton<_i83.AscensionRepository>(
      () => _i84.AscensionRepositoryImpl(gh<_i14.LocalAscensionDataSource>()));
  gh.lazySingleton<_i85.AuthDataSource>(
      () => _i86.FirebaseAuthDataSource(firebaseAuth: gh<_i6.FirebaseAuth>()));
  gh.lazySingleton<_i87.AuthRepository>(
      () => _i88.AuthRepositoryImpl(authDataSource: gh<_i85.AuthDataSource>()));
  gh.lazySingleton<_i89.CardioTreaningsDatasource>(
      () => _i90.LocalCardioTreaningsDatasource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i91.CardioTreaningsRepository>(() =>
      _i92.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i89.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i93.ClimbingHallRepository>(
      () => _i94.ClimbingHallRepositoryImpl(
            gh<_i3.ClimbingHallDataSource>(),
            gh<_i31.RemoteGymDataSource>(),
            gh<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i95.ContinueTrekUsecase>(
      () => _i95.ContinueTrekUsecase(gh<_i69.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i96.CrashLogService>(() async =>
      _i97.GoogleCrashLogService(await gh.getAsync<_i7.FirebaseCrashlytics>()));
  gh.lazySingleton<_i98.CurrentTechniqueTreaningUseCase>(() =>
      _i98.CurrentTechniqueTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i99.CurrentTravelUsecase>(
      () => _i99.CurrentTravelUsecase(gh<_i65.TravelRepository>()));
  gh.lazySingleton<_i100.CurrentTrekkingPathUsecase>(() =>
      _i100.CurrentTrekkingPathUsecase(gh<_i69.TrekkingPathRepository>()));
  gh.lazySingleton<_i101.DeleteCardioTreaning>(() => _i101.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i91.CardioTreaningsRepository>()));
  gh.lazySingleton<_i102.DeleteRepetitionForStrengthTreaning>(() =>
      _i102.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i103.DeleteRockAttempt>(
      () => _i103.DeleteRockAttempt(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i104.DeleteStrengthExercise>(() =>
      _i104.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>()));
  gh.lazySingleton<_i105.DeleteStrengthTreaning>(() =>
      _i105.DeleteStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i106.DeleteTechniqueTreaningUseCase>(() =>
      _i106.DeleteTechniqueTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i107.EditTechniqueItemUseCase>(() =>
      _i107.EditTechniqueItemUseCase(gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i108.FinishRockAttempt>(
      () => _i108.FinishRockAttempt(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i109.FinishRockTreaning>(
      () => _i109.FinishRockTreaning(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i110.FinishStrengthTreaning>(() =>
      _i110.FinishStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i111.FinishTechniqueTreaningUseCase>(() =>
      _i111.FinishTechniqueTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i112.GetAscensionUsecase>(
      () => _i112.GetAscensionUsecase(gh<_i83.AscensionRepository>()));
  gh.lazySingleton<_i113.GetCardioTreanings>(() => _i113.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i91.CardioTreaningsRepository>()));
  gh.lazySingleton<_i114.GetClimbingHallRoures>(
      () => _i114.GetClimbingHallRoures(gh<_i93.ClimbingHallRepository>()));
  gh.lazySingleton<_i115.GetCurrentRockTreaning>(
      () => _i115.GetCurrentRockTreaning(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i116.GetCurrentStrengthTreaning>(() =>
      _i116.GetCurrentStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i117.GetLastCardioTreaning>(() =>
      _i117.GetLastCardioTreaning(
          cardioTreaningsRepository: gh<_i91.CardioTreaningsRepository>()));
  gh.lazySingleton<_i118.GetLastRockTreaning>(
      () => _i118.GetLastRockTreaning(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i119.GetMountainRegions>(
      () => _i119.GetMountainRegions(gh<_i22.MountainRegionsRepository>()));
  gh.lazySingleton<_i120.GetMountainRoutes>(
      () => _i120.GetMountainRoutes(gh<_i22.MountainRegionsRepository>()));
  gh.lazySingleton<_i121.GetMountains>(
      () => _i121.GetMountains(gh<_i22.MountainRegionsRepository>()));
  gh.lazySingleton<_i122.GetPlanedTravelsUsecase>(
      () => _i122.GetPlanedTravelsUsecase(gh<_i65.TravelRepository>()));
  gh.lazySingleton<_i123.GetPreviosStrengthTreaning>(() =>
      _i123.GetPreviosStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i124.GetRockRouteAttempts>(
      () => _i124.GetRockRouteAttempts(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i125.GetRockRouteStatistic>(
      () => _i125.GetRockRouteStatistic(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i126.GetStrengthExercises>(() => _i126.GetStrengthExercises(
      strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>()));
  gh.lazySingleton<_i127.GetStrengthTreanings>(() => _i127.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i128.GetTechniqueGroupsUsecase>(
      () => _i128.GetTechniqueGroupsUsecase(gh<_i61.TechniquesRepository>()));
  gh.lazySingleton<_i129.GetTechniquesUsecase>(
      () => _i129.GetTechniquesUsecase(gh<_i61.TechniquesRepository>()));
  gh.lazySingleton<_i130.GetTravelsUsecase>(
      () => _i130.GetTravelsUsecase(gh<_i65.TravelRepository>()));
  gh.lazySingleton<_i131.GetTrekkingRegions>(
      () => _i131.GetTrekkingRegions(gh<_i73.TrekkingRepository>()));
  gh.lazySingleton<_i132.GetTreks>(
      () => _i132.GetTreks(gh<_i73.TrekkingRepository>()));
  gh.lazySingleton<_i133.HallRouteToArchive>(() =>
      _i133.HallRouteToArchive(repository: gh<_i93.ClimbingHallRepository>()));
  gh.lazySingleton<_i134.HallTreaningDataSource>(
      () => _i135.LocalHallTreaningDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i136.HallTreaningRepository>(
      () => _i137.HallTreaningRepositoryImpl(
            dataSource: gh<_i134.HallTreaningDataSource>(),
            hallDataSource: gh<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i138.IceRegionsRepository>(
      () => _i139.IceRegionsRepositoryImpl(
            gh<_i9.IceRegionsDataSource>(),
            gh<_i11.IceRegionsRemoteDataSource>(),
            gh<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i140.IceTreaningsDataSource>(
      () => _i141.LocalIceTreaningsDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i142.IceTreaningsRepository>(() =>
      _i143.IceTreaningsRepositoryImpl(gh<_i140.IceTreaningsDataSource>()));
  gh.lazySingleton<_i144.LastHallTreaning>(
      () => _i144.LastHallTreaning(gh<_i136.HallTreaningRepository>()));
  gh.lazySingleton<_i145.LoadDistrictsUseCase>(() => _i145.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i138.IceRegionsRepository>()));
  gh.lazySingleton<_i146.LoadPlaces>(
      () => _i146.LoadPlaces(gh<_i29.PlacesRepository>()));
  gh.lazySingleton<_i147.LoadRockDistricts>(
      () => _i147.LoadRockDistricts(gh<_i37.RockRegionsRepository>()));
  gh.lazySingleton<_i148.LoadRockRoutes>(
      () => _i148.LoadRockRoutes(gh<_i37.RockRegionsRepository>()));
  gh.lazySingleton<_i149.LoadRockSectors>(
      () => _i149.LoadRockSectors(gh<_i37.RockRegionsRepository>()));
  gh.lazySingleton<_i150.LoadSectorsUseCase>(() => _i150.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i138.IceRegionsRepository>()));
  gh.lazySingleton<_i151.LoadSimpleSettingsUsecase>(
      () => _i151.LoadSimpleSettingsUsecase(gh<_i45.SettingsRepository>()));
  gh.lazySingleton<_i152.LoadTreaningsSettings>(
      () => _i152.LoadTreaningsSettings(gh<_i45.SettingsRepository>()));
  gh.factory<_i153.MountainRegionsCubit>(
      () => _i153.MountainRegionsCubit(gh<_i119.GetMountainRegions>()));
  gh.factory<_i154.MountainRoutesCubit>(
      () => _i154.MountainRoutesCubit(gh<_i120.GetMountainRoutes>()));
  gh.factory<_i155.MountainsCubit>(
      () => _i155.MountainsCubit(gh<_i121.GetMountains>()));
  gh.lazySingleton<_i156.NewHallAttempt>(() => _i156.NewHallAttempt(
      treaningRepository: gh<_i136.HallTreaningRepository>()));
  gh.lazySingleton<_i157.NewHallAttemptFromRoute>(() =>
      _i157.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i136.HallTreaningRepository>()));
  gh.lazySingleton<_i158.NewHallRoute>(() => _i158.NewHallRoute(
      climbingHallRepository: gh<_i93.ClimbingHallRepository>()));
  gh.lazySingleton<_i159.NewHallTreaning>(() => _i159.NewHallTreaning(
      treaningRepository: gh<_i136.HallTreaningRepository>()));
  gh.lazySingleton<_i160.NewIceAttempt>(
      () => _i160.NewIceAttempt(gh<_i142.IceTreaningsRepository>()));
  gh.lazySingleton<_i161.NewIceTreaning>(() => _i161.NewIceTreaning(
        iceTreaningsRepository: gh<_i142.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i138.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i162.NewRockAttempt>(
      () => _i162.NewRockAttempt(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i163.NewRockTreaning>(
      () => _i163.NewRockTreaning(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i164.PreviosTechniqueTreaningUseCase>(() =>
      _i164.PreviosTechniqueTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i165.PreviosTrekkingPathUsecase>(() =>
      _i165.PreviosTrekkingPathUsecase(gh<_i69.TrekkingPathRepository>()));
  gh.factory<_i166.RockDistrictsCubit>(
      () => _i166.RockDistrictsCubit(gh<_i147.LoadRockDistricts>()));
  gh.factory<_i167.RockRoutesCubit>(() => _i167.RockRoutesCubit(
        gh<_i148.LoadRockRoutes>(),
        gh<_i125.GetRockRouteStatistic>(),
      ));
  gh.lazySingleton<_i168.RockSectorToTreaning>(
      () => _i168.RockSectorToTreaning(gh<_i41.RockTreaningsRepository>()));
  gh.factory<_i169.RockSectorsCubit>(
      () => _i169.RockSectorsCubit(gh<_i149.LoadRockSectors>()));
  gh.factory<_i170.RockTreaningCubit>(() => _i170.RockTreaningCubit(
        gh<_i163.NewRockTreaning>(),
        gh<_i168.RockSectorToTreaning>(),
        gh<_i162.NewRockAttempt>(),
        gh<_i108.FinishRockAttempt>(),
        gh<_i109.FinishRockTreaning>(),
        gh<_i118.GetLastRockTreaning>(),
        gh<_i115.GetCurrentRockTreaning>(),
        gh<_i125.GetRockRouteStatistic>(),
        gh<_i103.DeleteRockAttempt>(),
      ));
  gh.lazySingleton<_i171.SaveCardioTreaning>(() => _i171.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i91.CardioTreaningsRepository>()));
  gh.lazySingleton<_i172.SaveSimpleSettingsUsecase>(
      () => _i172.SaveSimpleSettingsUsecase(gh<_i45.SettingsRepository>()));
  gh.lazySingleton<_i173.SaveStrengthExercise>(() => _i173.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>()));
  gh.lazySingleton<_i174.SaveTreaningsSettings>(
      () => _i174.SaveTreaningsSettings(gh<_i45.SettingsRepository>()));
  gh.lazySingleton<_i175.SelectToUseStrengthExercise>(() =>
      _i175.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>()));
  gh.lazySingleton<_i176.SettingsCubit>(() => _i176.SettingsCubit(
        gh<_i152.LoadTreaningsSettings>(),
        gh<_i174.SaveTreaningsSettings>(),
        gh<_i146.LoadPlaces>(),
        gh<_i151.LoadSimpleSettingsUsecase>(),
        gh<_i172.SaveSimpleSettingsUsecase>(),
      ));
  gh.lazySingleton<_i177.StartTrekUsecase>(
      () => _i177.StartTrekUsecase(gh<_i69.TrekkingPathRepository>()));
  gh.factory<_i178.StrengthExercisesCubit>(() => _i178.StrengthExercisesCubit(
        gh<_i126.GetStrengthExercises>(),
        gh<_i173.SaveStrengthExercise>(),
        gh<_i175.SelectToUseStrengthExercise>(),
        gh<_i104.DeleteStrengthExercise>(),
      ));
  gh.factory<_i179.StrengthTrainingCubit>(() => _i179.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i116.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i123.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i77.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i75.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i76.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i110.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i102.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i180.StrengthTrainingsCubit>(() => _i180.StrengthTrainingsCubit(
        gh<_i127.GetStrengthTreanings>(),
        gh<_i105.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i181.TechniqueGroupsCubit>(
      () => _i181.TechniqueGroupsCubit(gh<_i128.GetTechniqueGroupsUsecase>()));
  gh.factory<_i182.TechniqueTreaningCubit>(() => _i182.TechniqueTreaningCubit(
        gh<_i79.AddTechniqueTreaningUseCase>(),
        gh<_i164.PreviosTechniqueTreaningUseCase>(),
        gh<_i98.CurrentTechniqueTreaningUseCase>(),
        gh<_i78.AddTechniqueToTreaningUseCase>(),
        gh<_i111.FinishTechniqueTreaningUseCase>(),
        gh<_i107.EditTechniqueItemUseCase>(),
      ));
  gh.factory<_i183.TechniquesCubit>(
      () => _i183.TechniquesCubit(gh<_i129.GetTechniquesUsecase>()));
  gh.factory<_i184.TravelsCubit>(() => _i184.TravelsCubit(
        gh<_i130.GetTravelsUsecase>(),
        gh<_i122.GetPlanedTravelsUsecase>(),
      ));
  gh.factory<_i185.TrekkingCubit>(() => _i185.TrekkingCubit(
        gh<_i100.CurrentTrekkingPathUsecase>(),
        gh<_i165.PreviosTrekkingPathUsecase>(),
        gh<_i177.StartTrekUsecase>(),
        gh<_i80.AddTrekEventUsecase>(),
        gh<_i95.ContinueTrekUsecase>(),
      ));
  gh.factory<_i186.TrekkingRegionsCubit>(
      () => _i186.TrekkingRegionsCubit(gh<_i131.GetTrekkingRegions>()));
  gh.factory<_i187.TreksCubit>(() => _i187.TreksCubit(gh<_i132.GetTreks>()));
  gh.lazySingleton<_i188.AddAscensionUsecase>(
      () => _i188.AddAscensionUsecase(gh<_i83.AscensionRepository>()));
  gh.lazySingleton<_i189.AllClimbingHalls>(
      () => _i189.AllClimbingHalls(gh<_i93.ClimbingHallRepository>()));
  gh.lazySingleton<_i190.AllHallTreanings>(
      () => _i190.AllHallTreanings(gh<_i136.HallTreaningRepository>()));
  gh.factory<_i191.AscensionCubit>(() => _i191.AscensionCubit(
        gh<_i188.AddAscensionUsecase>(),
        gh<_i112.GetAscensionUsecase>(),
      ));
  gh.factory<_i192.AuthGetUser>(
      () => _i192.AuthGetUser(authRepository: gh<_i87.AuthRepository>()));
  gh.factory<_i193.AuthLogin>(
      () => _i193.AuthLogin(authRepository: gh<_i87.AuthRepository>()));
  gh.factory<_i194.AuthLogout>(
      () => _i194.AuthLogout(authRepository: gh<_i87.AuthRepository>()));
  gh.factory<_i195.AuthenticationCubit>(() => _i195.AuthenticationCubit(
        gh<_i193.AuthLogin>(),
        gh<_i194.AuthLogout>(),
        gh<_i192.AuthGetUser>(),
      ));
  gh.factory<_i196.CardioTreaningCubit>(() => _i196.CardioTreaningCubit(
        gh<_i117.GetLastCardioTreaning>(),
        gh<_i171.SaveCardioTreaning>(),
      ));
  gh.factory<_i197.CardioTreaningsCubit>(() => _i197.CardioTreaningsCubit(
        gh<_i113.GetCardioTreanings>(),
        gh<_i101.DeleteCardioTreaning>(),
        gh<_i171.SaveCardioTreaning>(),
      ));
  gh.factory<_i198.ClimbingHallsCubit>(() =>
      _i198.ClimbingHallsCubit(allClimbingHalls: gh<_i189.AllClimbingHalls>()));
  gh.lazySingleton<_i199.CurrentHallTreaning>(
      () => _i199.CurrentHallTreaning(gh<_i136.HallTreaningRepository>()));
  gh.factory<_i200.CurrentTravelCubit>(() => _i200.CurrentTravelCubit(
        gh<_i99.CurrentTravelUsecase>(),
        gh<_i122.GetPlanedTravelsUsecase>(),
      ));
  gh.lazySingleton<_i201.DeleteHallAttempt>(() => _i201.DeleteHallAttempt(
      treaningRepository: gh<_i136.HallTreaningRepository>()));
  gh.lazySingleton<_i202.DeleteHallTreaning>(() => _i202.DeleteHallTreaning(
      treaningRepository: gh<_i136.HallTreaningRepository>()));
  gh.lazySingleton<_i203.DeleteIceAttempt>(
      () => _i203.DeleteIceAttempt(gh<_i142.IceTreaningsRepository>()));
  gh.lazySingleton<_i204.DeleteTreaning>(() => _i204.DeleteTreaning(
        gh<_i136.HallTreaningRepository>(),
        gh<_i142.IceTreaningsRepository>(),
        gh<_i53.StrengthTreaningsRepository>(),
        gh<_i91.CardioTreaningsRepository>(),
        gh<_i41.RockTreaningsRepository>(),
        gh<_i69.TrekkingPathRepository>(),
        gh<_i57.TechniqueTreaningsRepository>(),
        gh<_i83.AscensionRepository>(),
      ));
  gh.lazySingleton<_i205.FinishHallAttempt>(() => _i205.FinishHallAttempt(
      treaningRepository: gh<_i136.HallTreaningRepository>()));
  gh.lazySingleton<_i206.FinishHallTreaning>(() => _i206.FinishHallTreaning(
      treaningRepository: gh<_i136.HallTreaningRepository>()));
  gh.lazySingleton<_i207.FinishIceAttempt>(
      () => _i207.FinishIceAttempt(gh<_i142.IceTreaningsRepository>()));
  gh.lazySingleton<_i208.FinishIceTreaning>(() => _i208.FinishIceTreaning(
      iceTreaningsRepository: gh<_i142.IceTreaningsRepository>()));
  gh.lazySingleton<_i209.GetAllTreanings>(() => _i209.GetAllTreanings(
        gh<_i136.HallTreaningRepository>(),
        gh<_i142.IceTreaningsRepository>(),
        gh<_i53.StrengthTreaningsRepository>(),
        gh<_i91.CardioTreaningsRepository>(),
        gh<_i41.RockTreaningsRepository>(),
        gh<_i65.TravelRepository>(),
        gh<_i69.TrekkingPathRepository>(),
        gh<_i57.TechniqueTreaningsRepository>(),
        gh<_i83.AscensionRepository>(),
      ));
  gh.lazySingleton<_i210.GetCurrentIceTreaning>(() =>
      _i210.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i142.IceTreaningsRepository>()));
  gh.lazySingleton<_i211.GetGymRouteStatistic>(
      () => _i211.GetGymRouteStatistic(gh<_i136.HallTreaningRepository>()));
  gh.lazySingleton<_i212.GetHallRouteAttempts>(() => _i212.GetHallRouteAttempts(
      repository: gh<_i136.HallTreaningRepository>()));
  gh.lazySingleton<_i213.GetLastIceTreaning>(() => _i213.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i142.IceTreaningsRepository>()));
  gh.factory<_i214.HallRouteAttemptsCubit>(() => _i214.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i212.GetHallRouteAttempts>()));
  gh.factory<_i215.HallRouteCubit>(
      () => _i215.HallRouteCubit(gh<_i158.NewHallRoute>()));
  gh.factory<_i216.HallTreaningsCubit>(() => _i216.HallTreaningsCubit(
        allHallTreanings: gh<_i190.AllHallTreanings>(),
        deleteHallTreaning: gh<_i202.DeleteHallTreaning>(),
      ));
  gh.factory<_i217.HomePageCubit>(() =>
      _i217.HomePageCubit(allClimbingHalls: gh<_i189.AllClimbingHalls>()));
  gh.factory<_i218.IceDistrictsCubit>(() => _i218.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i145.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i219.IceSectorToTreaning>(() => _i219.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i142.IceTreaningsRepository>()));
  gh.factory<_i220.IceSectorsCubit>(() => _i220.IceSectorsCubit(
      loadSectorsUseCase: gh<_i150.LoadSectorsUseCase>()));
  gh.factory<_i221.TreaningsCubit>(() => _i221.TreaningsCubit(
        gh<_i209.GetAllTreanings>(),
        gh<_i204.DeleteTreaning>(),
      ));
  gh.factory<_i222.ClimbingHallCubit>(() => _i222.ClimbingHallCubit(
        gh<_i114.GetClimbingHallRoures>(),
        gh<_i133.HallRouteToArchive>(),
        gh<_i211.GetGymRouteStatistic>(),
      ));
  gh.factory<_i223.CurrentHallTreaningCubit>(
      () => _i223.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i157.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i159.NewHallTreaning>(),
            newHallAttempt: gh<_i156.NewHallAttempt>(),
            currentHallTreaning: gh<_i199.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i205.FinishHallAttempt>(),
            finishHallTreaning: gh<_i206.FinishHallTreaning>(),
            lastHallTreaning: gh<_i144.LastHallTreaning>(),
            deleteHallAttempt: gh<_i201.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i211.GetGymRouteStatistic>(),
          ));
  gh.factory<_i224.CurrentIceTreaningCubit>(() => _i224.CurrentIceTreaningCubit(
        gh<_i161.NewIceTreaning>(),
        gh<_i219.IceSectorToTreaning>(),
        gh<_i160.NewIceAttempt>(),
        gh<_i207.FinishIceAttempt>(),
        gh<_i208.FinishIceTreaning>(),
        gh<_i210.GetCurrentIceTreaning>(),
        gh<_i213.GetLastIceTreaning>(),
        gh<_i203.DeleteIceAttempt>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i225.InjectableModule {}

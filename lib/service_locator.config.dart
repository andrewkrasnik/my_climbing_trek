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
import 'core/injectable_module.dart' as _i232;
import 'core/services/analitics/analitics_service.dart' as _i80;
import 'core/services/analitics/firebase_analitics_service.dart' as _i81;
import 'core/services/crash_log_service/crash_log_service.dart' as _i93;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i94;
import 'core/services/network/network_info.dart' as _i22;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i82;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i83;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i85;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i84;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i194;
import 'features/authentication/domain/usecases/auth_login.dart' as _i195;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i196;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i197;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i86;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i87;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i89;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i88;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i98;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i111;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i116;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i172;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i198;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i199;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i133;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i134;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i29;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i30;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i91;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i136;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i90;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i135;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i190;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i112;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i216;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i217;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i132;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i159;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i191;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i201;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i203;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i204;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i209;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i210;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i143;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i157;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i158;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i160;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i229;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i200;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i230;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i220;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i219;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i221;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i222;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i12;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i9;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i11;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i139;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i10;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i140;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i138;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i142;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i137;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i141;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i205;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i211;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i212;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i215;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i218;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i224;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i144;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i149;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i161;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i162;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i231;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i223;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i225;
import 'features/mountaineering/data/datasources/drift_local_ascension_datasource.dart'
    as _i153;
import 'features/mountaineering/data/datasources/firebase_mountain_regions_remote_datasource.dart'
    as _i19;
import 'features/mountaineering/data/datasources/local_ascension_datasource.dart'
    as _i152;
import 'features/mountaineering/data/datasources/mock_mountain_regions_local_datasource.dart'
    as _i17;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i16;
import 'features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart'
    as _i18;
import 'features/mountaineering/data/repositories/ascension_repository_impl.dart'
    as _i193;
import 'features/mountaineering/data/repositories/mountain_regions_repository_impl.dart'
    as _i21;
import 'features/mountaineering/domain/repositories/ascension_repository.dart'
    as _i192;
import 'features/mountaineering/domain/repositories/mountain_regions_repository.dart'
    as _i20;
import 'features/mountaineering/domain/usecases/add_ascension_usecase.dart'
    as _i227;
import 'features/mountaineering/domain/usecases/edit_ascension_event_usecase.dart'
    as _i207;
import 'features/mountaineering/domain/usecases/finish_ascension_usecase.dart'
    as _i208;
import 'features/mountaineering/domain/usecases/get_ascension_usecase.dart'
    as _i214;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i118;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i119;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i120;
import 'features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart'
    as _i228;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i154;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i155;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i156;
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
    as _i101;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i107;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i108;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i114;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i117;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i123;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i124;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i146;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i147;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i148;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i163;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i164;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i169;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i167;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i168;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i170;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i171;
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
import 'features/settings/domain/usecases/load_places.dart' as _i145;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i150;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i151;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i173;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i175;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i177;
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
    as _i74;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i75;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i100;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i102;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i103;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i109;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i115;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i122;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i125;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i126;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i174;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i176;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i73;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i179;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i180;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i181;
import 'features/techniques/data/datasources/drift_technique_treanings_local_datasource.dart'
    as _i54;
import 'features/techniques/data/datasources/firebase_techniques_remote_datasource.dart'
    as _i58;
import 'features/techniques/data/datasources/technique_treanings_local_datasource.dart'
    as _i53;
import 'features/techniques/data/datasources/techniques_remote_datasource.dart'
    as _i57;
import 'features/techniques/data/repositories/technique_treanings_repository_impl.dart'
    as _i56;
import 'features/techniques/data/repositories/techniques_repository_impl.dart'
    as _i60;
import 'features/techniques/domain/repositories/technique_treanings_repository.dart'
    as _i55;
import 'features/techniques/domain/repositories/techniques_repository.dart'
    as _i59;
import 'features/techniques/domain/usecases/add_technique_to_treaning_usecase.dart'
    as _i76;
import 'features/techniques/domain/usecases/add_technique_treaning_usecase.dart'
    as _i77;
import 'features/techniques/domain/usecases/current_technique_treaning_usecase.dart'
    as _i95;
import 'features/techniques/domain/usecases/delete_technique_treaning_usecase.dart'
    as _i104;
import 'features/techniques/domain/usecases/edit_technique_item_usecase.dart'
    as _i106;
import 'features/techniques/domain/usecases/finish_technique_treaning_usecase.dart'
    as _i110;
import 'features/techniques/domain/usecases/get_technique_groups_usecase.dart'
    as _i127;
import 'features/techniques/domain/usecases/get_techniques_usecase.dart'
    as _i128;
import 'features/techniques/domain/usecases/previos_technique_treaning_usecase.dart'
    as _i165;
import 'features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart'
    as _i182;
import 'features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart'
    as _i183;
import 'features/techniques/presentation/bloc/techniques/techniques_cubit.dart'
    as _i184;
import 'features/traveling/data/datasources/mock_travel_local_datasource.dart'
    as _i62;
import 'features/traveling/data/datasources/travel_local_datasource.dart'
    as _i61;
import 'features/traveling/data/repositories/travel_repository.dart' as _i64;
import 'features/traveling/domain/repositories/travel_repository.dart' as _i63;
import 'features/traveling/domain/usecases/add_travel_usecase.dart' as _i78;
import 'features/traveling/domain/usecases/current_travel_usecase.dart' as _i96;
import 'features/traveling/domain/usecases/get_planed_travels_usecase.dart'
    as _i121;
import 'features/traveling/domain/usecases/get_travels_usecase.dart' as _i129;
import 'features/traveling/domain/usecases/travel_page/delete_cost_line_usecase.dart'
    as _i99;
import 'features/traveling/domain/usecases/travel_page/edit_cost_line_usecase.dart'
    as _i105;
import 'features/traveling/domain/usecases/travel_page/get_cost_lines_usecase.dart'
    as _i113;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i202;
import 'features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart'
    as _i185;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i186;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i206;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i213;
import 'features/treanings/presentation/cubit/treanings_cubit.dart' as _i226;
import 'features/trekking/data/datasources/drift_trekking_path_local_datasource.dart'
    as _i66;
import 'features/trekking/data/datasources/firebase_trekking_remote_datasource.dart'
    as _i70;
import 'features/trekking/data/datasources/trekking_path_local_datasource.dart'
    as _i65;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i69;
import 'features/trekking/data/repositories/trekking_path_repository_impl.dart'
    as _i68;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i72;
import 'features/trekking/domain/repositories/trekking_path_repository.dart'
    as _i67;
import 'features/trekking/domain/repositories/trekking_repository.dart' as _i71;
import 'features/trekking/domain/usecases/add_trek_event_usecase.dart' as _i79;
import 'features/trekking/domain/usecases/continue_trek_usecase.dart' as _i92;
import 'features/trekking/domain/usecases/current_trekking_path_usecase.dart'
    as _i97;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i130;
import 'features/trekking/domain/usecases/get_treks.dart' as _i131;
import 'features/trekking/domain/usecases/previos_trekking_path_usecase.dart'
    as _i166;
import 'features/trekking/domain/usecases/start_trek_usecase.dart' as _i178;
import 'features/trekking/presentation/bloc/trekking/trekking_cubit.dart'
    as _i187;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i188;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i189;

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
  gh.lazySingleton<_i53.TechniqueTreaningsLocalDataSource>(() =>
      _i54.DriftTechniqueTreaningsLocalDataSource(
          gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i55.TechniqueTreaningsRepository>(() =>
      _i56.TechniqueTreaningsRepositoryImpl(
          gh<_i53.TechniqueTreaningsLocalDataSource>()));
  gh.lazySingleton<_i57.TechniquesRemoteDataSource>(() =>
      _i58.FirebaseTechniquesRemoteDataSource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i59.TechniquesRepository>(() =>
      _i60.TechniquesRepositoryImpl(gh<_i57.TechniquesRemoteDataSource>()));
  gh.lazySingleton<_i61.TravelLocalDatasource>(
      () => _i62.MockTravelLocalDatasource());
  gh.lazySingleton<_i63.TravelRepository>(
      () => _i64.TravelRepositoryImpl(gh<_i61.TravelLocalDatasource>()));
  gh.lazySingleton<_i65.TrekkingPathLocalDataSource>(() =>
      _i66.DriftTrekkingPathLocalDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i67.TrekkingPathRepository>(() =>
      _i68.TrekkingPathRepositoryImpl(gh<_i65.TrekkingPathLocalDataSource>()));
  gh.lazySingleton<_i69.TrekkingRemoteDataSource>(
      () => _i70.FirebaseTrekkingRemoteDatasource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i71.TrekkingRepository>(
      () => _i72.TrekkingRepositoryImpl(gh<_i69.TrekkingRemoteDataSource>()));
  gh.lazySingleton<_i73.UpdateStrengthTreaningExercises>(
      () => _i73.UpdateStrengthTreaningExercises(
            strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>(),
            strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>(),
          ));
  gh.lazySingleton<_i74.AddRepetitionForStrengthTreaning>(() =>
      _i74.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i75.AddStrengthTreaning>(() => _i75.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i76.AddTechniqueToTreaningUseCase>(() =>
      _i76.AddTechniqueToTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i77.AddTechniqueTreaningUseCase>(() =>
      _i77.AddTechniqueTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i78.AddTravelUsecase>(
      () => _i78.AddTravelUsecase(gh<_i63.TravelRepository>()));
  gh.lazySingleton<_i79.AddTrekEventUsecase>(
      () => _i79.AddTrekEventUsecase(gh<_i67.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i80.AnaliticsService>(() async =>
      _i81.FirebaseAnaliticsService(
          await gh.getAsync<_i5.FirebaseAnalytics>()));
  gh.lazySingleton<_i82.AuthDataSource>(
      () => _i83.FirebaseAuthDataSource(firebaseAuth: gh<_i6.FirebaseAuth>()));
  gh.lazySingleton<_i84.AuthRepository>(
      () => _i85.AuthRepositoryImpl(authDataSource: gh<_i82.AuthDataSource>()));
  gh.lazySingleton<_i86.CardioTreaningsDatasource>(
      () => _i87.LocalCardioTreaningsDatasource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i88.CardioTreaningsRepository>(() =>
      _i89.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i86.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i90.ClimbingHallRepository>(
      () => _i91.ClimbingHallRepositoryImpl(
            gh<_i3.ClimbingHallDataSource>(),
            gh<_i29.RemoteGymDataSource>(),
            gh<_i22.NetworkInfo>(),
          ));
  gh.lazySingleton<_i92.ContinueTrekUsecase>(
      () => _i92.ContinueTrekUsecase(gh<_i67.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i93.CrashLogService>(() async =>
      _i94.GoogleCrashLogService(await gh.getAsync<_i7.FirebaseCrashlytics>()));
  gh.lazySingleton<_i95.CurrentTechniqueTreaningUseCase>(() =>
      _i95.CurrentTechniqueTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i96.CurrentTravelUsecase>(
      () => _i96.CurrentTravelUsecase(gh<_i63.TravelRepository>()));
  gh.lazySingleton<_i97.CurrentTrekkingPathUsecase>(
      () => _i97.CurrentTrekkingPathUsecase(gh<_i67.TrekkingPathRepository>()));
  gh.lazySingleton<_i98.DeleteCardioTreaning>(() => _i98.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i88.CardioTreaningsRepository>()));
  gh.lazySingleton<_i99.DeleteCostLineUsecase>(
      () => _i99.DeleteCostLineUsecase(gh<_i63.TravelRepository>()));
  gh.lazySingleton<_i100.DeleteRepetitionForStrengthTreaning>(() =>
      _i100.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i101.DeleteRockAttempt>(
      () => _i101.DeleteRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i102.DeleteStrengthExercise>(() =>
      _i102.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i103.DeleteStrengthTreaning>(() =>
      _i103.DeleteStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i104.DeleteTechniqueTreaningUseCase>(() =>
      _i104.DeleteTechniqueTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i105.EditCostLineUsecase>(
      () => _i105.EditCostLineUsecase(gh<_i63.TravelRepository>()));
  gh.lazySingleton<_i106.EditTechniqueItemUseCase>(() =>
      _i106.EditTechniqueItemUseCase(gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i107.FinishRockAttempt>(
      () => _i107.FinishRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i108.FinishRockTreaning>(
      () => _i108.FinishRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i109.FinishStrengthTreaning>(() =>
      _i109.FinishStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i110.FinishTechniqueTreaningUseCase>(() =>
      _i110.FinishTechniqueTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i111.GetCardioTreanings>(() => _i111.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i88.CardioTreaningsRepository>()));
  gh.lazySingleton<_i112.GetClimbingHallRoures>(
      () => _i112.GetClimbingHallRoures(gh<_i90.ClimbingHallRepository>()));
  gh.lazySingleton<_i113.GetCostLinesUsecase>(
      () => _i113.GetCostLinesUsecase(gh<_i63.TravelRepository>()));
  gh.lazySingleton<_i114.GetCurrentRockTreaning>(
      () => _i114.GetCurrentRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i115.GetCurrentStrengthTreaning>(() =>
      _i115.GetCurrentStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i116.GetLastCardioTreaning>(() =>
      _i116.GetLastCardioTreaning(
          cardioTreaningsRepository: gh<_i88.CardioTreaningsRepository>()));
  gh.lazySingleton<_i117.GetLastRockTreaning>(
      () => _i117.GetLastRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i118.GetMountainRegions>(
      () => _i118.GetMountainRegions(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i119.GetMountainRoutes>(
      () => _i119.GetMountainRoutes(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i120.GetMountains>(
      () => _i120.GetMountains(gh<_i20.MountainRegionsRepository>()));
  gh.lazySingleton<_i121.GetPlanedTravelsUsecase>(
      () => _i121.GetPlanedTravelsUsecase(gh<_i63.TravelRepository>()));
  gh.lazySingleton<_i122.GetPreviosStrengthTreaning>(() =>
      _i122.GetPreviosStrengthTreaning(
          strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i123.GetRockRouteAttempts>(
      () => _i123.GetRockRouteAttempts(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i124.GetRockRouteStatistic>(
      () => _i124.GetRockRouteStatistic(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i125.GetStrengthExercises>(() => _i125.GetStrengthExercises(
      strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i126.GetStrengthTreanings>(() => _i126.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i51.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i127.GetTechniqueGroupsUsecase>(
      () => _i127.GetTechniqueGroupsUsecase(gh<_i59.TechniquesRepository>()));
  gh.lazySingleton<_i128.GetTechniquesUsecase>(
      () => _i128.GetTechniquesUsecase(gh<_i59.TechniquesRepository>()));
  gh.lazySingleton<_i129.GetTravelsUsecase>(
      () => _i129.GetTravelsUsecase(gh<_i63.TravelRepository>()));
  gh.lazySingleton<_i130.GetTrekkingRegions>(
      () => _i130.GetTrekkingRegions(gh<_i71.TrekkingRepository>()));
  gh.lazySingleton<_i131.GetTreks>(
      () => _i131.GetTreks(gh<_i71.TrekkingRepository>()));
  gh.lazySingleton<_i132.HallRouteToArchive>(() =>
      _i132.HallRouteToArchive(repository: gh<_i90.ClimbingHallRepository>()));
  gh.lazySingleton<_i133.HallTreaningDataSource>(
      () => _i134.LocalHallTreaningDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i135.HallTreaningRepository>(
      () => _i136.HallTreaningRepositoryImpl(
            dataSource: gh<_i133.HallTreaningDataSource>(),
            hallDataSource: gh<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i137.IceRegionsRepository>(
      () => _i138.IceRegionsRepositoryImpl(
            gh<_i9.IceRegionsDataSource>(),
            gh<_i11.IceRegionsRemoteDataSource>(),
            gh<_i22.NetworkInfo>(),
          ));
  gh.lazySingleton<_i139.IceTreaningsDataSource>(
      () => _i140.LocalIceTreaningsDataSource(gh<_i14.LocalDBDatasource>()));
  gh.lazySingleton<_i141.IceTreaningsRepository>(() =>
      _i142.IceTreaningsRepositoryImpl(gh<_i139.IceTreaningsDataSource>()));
  gh.lazySingleton<_i143.LastHallTreaning>(
      () => _i143.LastHallTreaning(gh<_i135.HallTreaningRepository>()));
  gh.lazySingleton<_i144.LoadDistrictsUseCase>(() => _i144.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i137.IceRegionsRepository>()));
  gh.lazySingleton<_i145.LoadPlaces>(
      () => _i145.LoadPlaces(gh<_i27.PlacesRepository>()));
  gh.lazySingleton<_i146.LoadRockDistricts>(
      () => _i146.LoadRockDistricts(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i147.LoadRockRoutes>(
      () => _i147.LoadRockRoutes(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i148.LoadRockSectors>(
      () => _i148.LoadRockSectors(gh<_i35.RockRegionsRepository>()));
  gh.lazySingleton<_i149.LoadSectorsUseCase>(() => _i149.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i137.IceRegionsRepository>()));
  gh.lazySingleton<_i150.LoadSimpleSettingsUsecase>(
      () => _i150.LoadSimpleSettingsUsecase(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i151.LoadTreaningsSettings>(
      () => _i151.LoadTreaningsSettings(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i152.LocalAscensionDataSource>(
      () => _i153.DriftLocalAscensionDataSource(gh<_i14.LocalDBDatasource>()));
  gh.factory<_i154.MountainRegionsCubit>(
      () => _i154.MountainRegionsCubit(gh<_i118.GetMountainRegions>()));
  gh.factory<_i155.MountainRoutesCubit>(
      () => _i155.MountainRoutesCubit(gh<_i119.GetMountainRoutes>()));
  gh.factory<_i156.MountainsCubit>(
      () => _i156.MountainsCubit(gh<_i120.GetMountains>()));
  gh.lazySingleton<_i157.NewHallAttempt>(() => _i157.NewHallAttempt(
      treaningRepository: gh<_i135.HallTreaningRepository>()));
  gh.lazySingleton<_i158.NewHallAttemptFromRoute>(() =>
      _i158.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i135.HallTreaningRepository>()));
  gh.lazySingleton<_i159.NewHallRoute>(() => _i159.NewHallRoute(
      climbingHallRepository: gh<_i90.ClimbingHallRepository>()));
  gh.lazySingleton<_i160.NewHallTreaning>(() => _i160.NewHallTreaning(
      treaningRepository: gh<_i135.HallTreaningRepository>()));
  gh.lazySingleton<_i161.NewIceAttempt>(
      () => _i161.NewIceAttempt(gh<_i141.IceTreaningsRepository>()));
  gh.lazySingleton<_i162.NewIceTreaning>(() => _i162.NewIceTreaning(
        iceTreaningsRepository: gh<_i141.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i137.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i163.NewRockAttempt>(
      () => _i163.NewRockAttempt(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i164.NewRockTreaning>(
      () => _i164.NewRockTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.lazySingleton<_i165.PreviosTechniqueTreaningUseCase>(() =>
      _i165.PreviosTechniqueTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i166.PreviosTrekkingPathUsecase>(() =>
      _i166.PreviosTrekkingPathUsecase(gh<_i67.TrekkingPathRepository>()));
  gh.factory<_i167.RockDistrictsCubit>(
      () => _i167.RockDistrictsCubit(gh<_i146.LoadRockDistricts>()));
  gh.factory<_i168.RockRoutesCubit>(() => _i168.RockRoutesCubit(
        gh<_i147.LoadRockRoutes>(),
        gh<_i124.GetRockRouteStatistic>(),
      ));
  gh.lazySingleton<_i169.RockSectorToTreaning>(
      () => _i169.RockSectorToTreaning(gh<_i39.RockTreaningsRepository>()));
  gh.factory<_i170.RockSectorsCubit>(
      () => _i170.RockSectorsCubit(gh<_i148.LoadRockSectors>()));
  gh.factory<_i171.RockTreaningCubit>(() => _i171.RockTreaningCubit(
        gh<_i164.NewRockTreaning>(),
        gh<_i169.RockSectorToTreaning>(),
        gh<_i163.NewRockAttempt>(),
        gh<_i107.FinishRockAttempt>(),
        gh<_i108.FinishRockTreaning>(),
        gh<_i117.GetLastRockTreaning>(),
        gh<_i114.GetCurrentRockTreaning>(),
        gh<_i124.GetRockRouteStatistic>(),
        gh<_i101.DeleteRockAttempt>(),
      ));
  gh.lazySingleton<_i172.SaveCardioTreaning>(() => _i172.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i88.CardioTreaningsRepository>()));
  gh.lazySingleton<_i173.SaveSimpleSettingsUsecase>(
      () => _i173.SaveSimpleSettingsUsecase(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i174.SaveStrengthExercise>(() => _i174.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i175.SaveTreaningsSettings>(
      () => _i175.SaveTreaningsSettings(gh<_i43.SettingsRepository>()));
  gh.lazySingleton<_i176.SelectToUseStrengthExercise>(() =>
      _i176.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i47.StrengthExerciseRepository>()));
  gh.lazySingleton<_i177.SettingsCubit>(() => _i177.SettingsCubit(
        gh<_i151.LoadTreaningsSettings>(),
        gh<_i175.SaveTreaningsSettings>(),
        gh<_i145.LoadPlaces>(),
        gh<_i150.LoadSimpleSettingsUsecase>(),
        gh<_i173.SaveSimpleSettingsUsecase>(),
      ));
  gh.lazySingleton<_i178.StartTrekUsecase>(
      () => _i178.StartTrekUsecase(gh<_i67.TrekkingPathRepository>()));
  gh.factory<_i179.StrengthExercisesCubit>(() => _i179.StrengthExercisesCubit(
        gh<_i125.GetStrengthExercises>(),
        gh<_i174.SaveStrengthExercise>(),
        gh<_i176.SelectToUseStrengthExercise>(),
        gh<_i102.DeleteStrengthExercise>(),
      ));
  gh.factory<_i180.StrengthTrainingCubit>(() => _i180.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i115.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i122.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i75.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i73.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i74.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i109.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i100.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i181.StrengthTrainingsCubit>(() => _i181.StrengthTrainingsCubit(
        gh<_i126.GetStrengthTreanings>(),
        gh<_i103.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i182.TechniqueGroupsCubit>(
      () => _i182.TechniqueGroupsCubit(gh<_i127.GetTechniqueGroupsUsecase>()));
  gh.factory<_i183.TechniqueTreaningCubit>(() => _i183.TechniqueTreaningCubit(
        gh<_i77.AddTechniqueTreaningUseCase>(),
        gh<_i165.PreviosTechniqueTreaningUseCase>(),
        gh<_i95.CurrentTechniqueTreaningUseCase>(),
        gh<_i76.AddTechniqueToTreaningUseCase>(),
        gh<_i110.FinishTechniqueTreaningUseCase>(),
        gh<_i106.EditTechniqueItemUseCase>(),
      ));
  gh.factory<_i184.TechniquesCubit>(
      () => _i184.TechniquesCubit(gh<_i128.GetTechniquesUsecase>()));
  gh.factory<_i185.TravelPageCubit>(() => _i185.TravelPageCubit(
        gh<_i99.DeleteCostLineUsecase>(),
        gh<_i105.EditCostLineUsecase>(),
        gh<_i113.GetCostLinesUsecase>(),
      ));
  gh.factory<_i186.TravelsCubit>(() => _i186.TravelsCubit(
        gh<_i129.GetTravelsUsecase>(),
        gh<_i121.GetPlanedTravelsUsecase>(),
        gh<_i78.AddTravelUsecase>(),
      ));
  gh.factory<_i187.TrekkingCubit>(() => _i187.TrekkingCubit(
        gh<_i97.CurrentTrekkingPathUsecase>(),
        gh<_i166.PreviosTrekkingPathUsecase>(),
        gh<_i178.StartTrekUsecase>(),
        gh<_i79.AddTrekEventUsecase>(),
        gh<_i92.ContinueTrekUsecase>(),
      ));
  gh.factory<_i188.TrekkingRegionsCubit>(
      () => _i188.TrekkingRegionsCubit(gh<_i130.GetTrekkingRegions>()));
  gh.factory<_i189.TreksCubit>(() => _i189.TreksCubit(gh<_i131.GetTreks>()));
  gh.lazySingleton<_i190.AllClimbingHalls>(
      () => _i190.AllClimbingHalls(gh<_i90.ClimbingHallRepository>()));
  gh.lazySingleton<_i191.AllHallTreanings>(
      () => _i191.AllHallTreanings(gh<_i135.HallTreaningRepository>()));
  gh.lazySingleton<_i192.AscensionRepository>(() =>
      _i193.AscensionRepositoryImpl(gh<_i152.LocalAscensionDataSource>()));
  gh.factory<_i194.AuthGetUser>(
      () => _i194.AuthGetUser(authRepository: gh<_i84.AuthRepository>()));
  gh.factory<_i195.AuthLogin>(
      () => _i195.AuthLogin(authRepository: gh<_i84.AuthRepository>()));
  gh.factory<_i196.AuthLogout>(
      () => _i196.AuthLogout(authRepository: gh<_i84.AuthRepository>()));
  gh.factory<_i197.AuthenticationCubit>(() => _i197.AuthenticationCubit(
        gh<_i195.AuthLogin>(),
        gh<_i196.AuthLogout>(),
        gh<_i194.AuthGetUser>(),
      ));
  gh.factory<_i198.CardioTreaningCubit>(() => _i198.CardioTreaningCubit(
        gh<_i116.GetLastCardioTreaning>(),
        gh<_i172.SaveCardioTreaning>(),
      ));
  gh.factory<_i199.CardioTreaningsCubit>(() => _i199.CardioTreaningsCubit(
        gh<_i111.GetCardioTreanings>(),
        gh<_i98.DeleteCardioTreaning>(),
        gh<_i172.SaveCardioTreaning>(),
      ));
  gh.factory<_i200.ClimbingHallsCubit>(() =>
      _i200.ClimbingHallsCubit(allClimbingHalls: gh<_i190.AllClimbingHalls>()));
  gh.lazySingleton<_i201.CurrentHallTreaning>(
      () => _i201.CurrentHallTreaning(gh<_i135.HallTreaningRepository>()));
  gh.factory<_i202.CurrentTravelCubit>(() => _i202.CurrentTravelCubit(
        gh<_i96.CurrentTravelUsecase>(),
        gh<_i121.GetPlanedTravelsUsecase>(),
      ));
  gh.lazySingleton<_i203.DeleteHallAttempt>(() => _i203.DeleteHallAttempt(
      treaningRepository: gh<_i135.HallTreaningRepository>()));
  gh.lazySingleton<_i204.DeleteHallTreaning>(() => _i204.DeleteHallTreaning(
      treaningRepository: gh<_i135.HallTreaningRepository>()));
  gh.lazySingleton<_i205.DeleteIceAttempt>(
      () => _i205.DeleteIceAttempt(gh<_i141.IceTreaningsRepository>()));
  gh.lazySingleton<_i206.DeleteTreaning>(() => _i206.DeleteTreaning(
        gh<_i135.HallTreaningRepository>(),
        gh<_i141.IceTreaningsRepository>(),
        gh<_i51.StrengthTreaningsRepository>(),
        gh<_i88.CardioTreaningsRepository>(),
        gh<_i39.RockTreaningsRepository>(),
        gh<_i67.TrekkingPathRepository>(),
        gh<_i55.TechniqueTreaningsRepository>(),
        gh<_i192.AscensionRepository>(),
      ));
  gh.lazySingleton<_i207.EditAscensionEventUsecase>(
      () => _i207.EditAscensionEventUsecase(gh<_i192.AscensionRepository>()));
  gh.lazySingleton<_i208.FinishAscensionUsecase>(
      () => _i208.FinishAscensionUsecase(gh<_i192.AscensionRepository>()));
  gh.lazySingleton<_i209.FinishHallAttempt>(() => _i209.FinishHallAttempt(
      treaningRepository: gh<_i135.HallTreaningRepository>()));
  gh.lazySingleton<_i210.FinishHallTreaning>(() => _i210.FinishHallTreaning(
      treaningRepository: gh<_i135.HallTreaningRepository>()));
  gh.lazySingleton<_i211.FinishIceAttempt>(
      () => _i211.FinishIceAttempt(gh<_i141.IceTreaningsRepository>()));
  gh.lazySingleton<_i212.FinishIceTreaning>(() => _i212.FinishIceTreaning(
      iceTreaningsRepository: gh<_i141.IceTreaningsRepository>()));
  gh.lazySingleton<_i213.GetAllTreanings>(() => _i213.GetAllTreanings(
        gh<_i135.HallTreaningRepository>(),
        gh<_i141.IceTreaningsRepository>(),
        gh<_i51.StrengthTreaningsRepository>(),
        gh<_i88.CardioTreaningsRepository>(),
        gh<_i39.RockTreaningsRepository>(),
        gh<_i63.TravelRepository>(),
        gh<_i67.TrekkingPathRepository>(),
        gh<_i55.TechniqueTreaningsRepository>(),
        gh<_i192.AscensionRepository>(),
      ));
  gh.lazySingleton<_i214.GetAscensionUsecase>(
      () => _i214.GetAscensionUsecase(gh<_i192.AscensionRepository>()));
  gh.lazySingleton<_i215.GetCurrentIceTreaning>(() =>
      _i215.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i141.IceTreaningsRepository>()));
  gh.lazySingleton<_i216.GetGymRouteStatistic>(
      () => _i216.GetGymRouteStatistic(gh<_i135.HallTreaningRepository>()));
  gh.lazySingleton<_i217.GetHallRouteAttempts>(() => _i217.GetHallRouteAttempts(
      repository: gh<_i135.HallTreaningRepository>()));
  gh.lazySingleton<_i218.GetLastIceTreaning>(() => _i218.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i141.IceTreaningsRepository>()));
  gh.factory<_i219.HallRouteAttemptsCubit>(() => _i219.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i217.GetHallRouteAttempts>()));
  gh.factory<_i220.HallRouteCubit>(
      () => _i220.HallRouteCubit(gh<_i159.NewHallRoute>()));
  gh.factory<_i221.HallTreaningsCubit>(() => _i221.HallTreaningsCubit(
        allHallTreanings: gh<_i191.AllHallTreanings>(),
        deleteHallTreaning: gh<_i204.DeleteHallTreaning>(),
      ));
  gh.factory<_i222.HomePageCubit>(() =>
      _i222.HomePageCubit(allClimbingHalls: gh<_i190.AllClimbingHalls>()));
  gh.factory<_i223.IceDistrictsCubit>(() => _i223.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i144.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i224.IceSectorToTreaning>(() => _i224.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i141.IceTreaningsRepository>()));
  gh.factory<_i225.IceSectorsCubit>(() => _i225.IceSectorsCubit(
      loadSectorsUseCase: gh<_i149.LoadSectorsUseCase>()));
  gh.factory<_i226.TreaningsCubit>(() => _i226.TreaningsCubit(
        gh<_i213.GetAllTreanings>(),
        gh<_i206.DeleteTreaning>(),
      ));
  gh.lazySingleton<_i227.AddAscensionUsecase>(
      () => _i227.AddAscensionUsecase(gh<_i192.AscensionRepository>()));
  gh.factory<_i228.AscensionCubit>(() => _i228.AscensionCubit(
        gh<_i227.AddAscensionUsecase>(),
        gh<_i214.GetAscensionUsecase>(),
        gh<_i208.FinishAscensionUsecase>(),
        gh<_i207.EditAscensionEventUsecase>(),
      ));
  gh.factory<_i229.ClimbingHallCubit>(() => _i229.ClimbingHallCubit(
        gh<_i112.GetClimbingHallRoures>(),
        gh<_i132.HallRouteToArchive>(),
        gh<_i216.GetGymRouteStatistic>(),
      ));
  gh.factory<_i230.CurrentHallTreaningCubit>(
      () => _i230.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i158.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i160.NewHallTreaning>(),
            newHallAttempt: gh<_i157.NewHallAttempt>(),
            currentHallTreaning: gh<_i201.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i209.FinishHallAttempt>(),
            finishHallTreaning: gh<_i210.FinishHallTreaning>(),
            lastHallTreaning: gh<_i143.LastHallTreaning>(),
            deleteHallAttempt: gh<_i203.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i216.GetGymRouteStatistic>(),
          ));
  gh.factory<_i231.CurrentIceTreaningCubit>(() => _i231.CurrentIceTreaningCubit(
        gh<_i162.NewIceTreaning>(),
        gh<_i224.IceSectorToTreaning>(),
        gh<_i161.NewIceAttempt>(),
        gh<_i211.FinishIceAttempt>(),
        gh<_i212.FinishIceTreaning>(),
        gh<_i215.GetCurrentIceTreaning>(),
        gh<_i218.GetLastIceTreaning>(),
        gh<_i205.DeleteIceAttempt>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i232.InjectableModule {}

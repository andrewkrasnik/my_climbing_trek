// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:firebase_analytics/firebase_analytics.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i10;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i15;

import 'core/datasource/drift_db_local_datasource.dart' as _i17;
import 'core/datasource/local_db_datasource.dart' as _i16;
import 'core/injectable_module.dart' as _i252;
import 'core/services/analitics/analitics_service.dart' as _i86;
import 'core/services/analitics/firebase_analitics_service.dart' as _i87;
import 'core/services/crash_log_service/crash_log_service.dart' as _i99;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i100;
import 'core/services/network/network_info.dart' as _i24;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i88;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i89;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i91;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i90;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i211;
import 'features/authentication/domain/usecases/auth_login.dart' as _i212;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i213;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i214;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i92;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i93;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i95;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i94;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i105;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i124;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i132;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i188;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i215;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i216;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i149;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i150;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i31;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i32;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i97;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i152;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i96;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i151;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i207;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i125;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i234;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i235;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i148;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i175;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i208;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i218;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i220;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i221;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i227;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i228;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i159;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i173;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i174;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i176;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i249;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i217;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i250;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i238;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i237;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i239;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i240;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i14;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i11;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i13;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i155;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i12;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i156;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i154;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i158;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i153;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i157;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i222;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i229;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i230;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i233;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i236;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i242;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i160;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i165;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i177;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i178;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i251;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i241;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i243;
import 'features/mountaineering/data/datasources/drift_local_ascension_datasource.dart'
    as _i169;
import 'features/mountaineering/data/datasources/firebase_mountain_regions_remote_datasource.dart'
    as _i21;
import 'features/mountaineering/data/datasources/local_ascension_datasource.dart'
    as _i168;
import 'features/mountaineering/data/datasources/mock_mountain_regions_local_datasource.dart'
    as _i19;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i18;
import 'features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart'
    as _i20;
import 'features/mountaineering/data/repositories/ascension_repository_impl.dart'
    as _i210;
import 'features/mountaineering/data/repositories/mountain_regions_repository_impl.dart'
    as _i23;
import 'features/mountaineering/domain/repositories/ascension_repository.dart'
    as _i209;
import 'features/mountaineering/domain/repositories/mountain_regions_repository.dart'
    as _i22;
import 'features/mountaineering/domain/usecases/add_ascension_usecase.dart'
    as _i247;
import 'features/mountaineering/domain/usecases/edit_ascension_event_usecase.dart'
    as _i224;
import 'features/mountaineering/domain/usecases/finish_ascension_usecase.dart'
    as _i226;
import 'features/mountaineering/domain/usecases/get_ascension_usecase.dart'
    as _i232;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i134;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i135;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i136;
import 'features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart'
    as _i248;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i170;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i171;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i172;
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
    as _i109;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i119;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i120;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i127;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i133;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i138;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i139;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i162;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i163;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i164;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i179;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i180;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i185;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i183;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i184;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i186;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i187;
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
import 'features/settings/domain/usecases/load_places.dart' as _i161;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i166;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i167;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i189;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i191;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i193;
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
    as _i80;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i81;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i108;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i110;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i111;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i121;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i128;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i137;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i140;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i141;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i190;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i192;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i79;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i195;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i196;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i197;
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
    as _i82;
import 'features/techniques/domain/usecases/add_technique_treaning_usecase.dart'
    as _i83;
import 'features/techniques/domain/usecases/current_technique_treaning_usecase.dart'
    as _i101;
import 'features/techniques/domain/usecases/delete_technique_treaning_usecase.dart'
    as _i112;
import 'features/techniques/domain/usecases/edit_technique_item_usecase.dart'
    as _i117;
import 'features/techniques/domain/usecases/finish_technique_treaning_usecase.dart'
    as _i122;
import 'features/techniques/domain/usecases/get_technique_groups_usecase.dart'
    as _i142;
import 'features/techniques/domain/usecases/get_techniques_usecase.dart'
    as _i143;
import 'features/techniques/domain/usecases/previos_technique_treaning_usecase.dart'
    as _i181;
import 'features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart'
    as _i198;
import 'features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart'
    as _i199;
import 'features/techniques/presentation/bloc/techniques/techniques_cubit.dart'
    as _i200;
import 'features/traveling/data/datasources/drift_travel_local_datasource.dart'
    as _i64;
import 'features/traveling/data/datasources/hive_travel_regions_datasource.dart'
    as _i66;
import 'features/traveling/data/datasources/travel_local_datasource.dart'
    as _i63;
import 'features/traveling/data/datasources/travel_regions_datasource.dart'
    as _i65;
import 'features/traveling/data/repositories/travel_regions_repository_impl.dart'
    as _i68;
import 'features/traveling/data/repositories/travel_repository.dart' as _i70;
import 'features/traveling/domain/repositories/travel_regions_repository.dart'
    as _i67;
import 'features/traveling/domain/repositories/travel_repository.dart' as _i69;
import 'features/traveling/domain/usecases/add_travel_usecase.dart' as _i84;
import 'features/traveling/domain/usecases/current_travel_usecase.dart'
    as _i102;
import 'features/traveling/domain/usecases/edit_travel_usecase.dart' as _i118;
import 'features/traveling/domain/usecases/get_current_travel_day_usecase.dart'
    as _i129;
import 'features/traveling/domain/usecases/get_travels_usecase.dart' as _i145;
import 'features/traveling/domain/usecases/travel_page/delete_budget_line_usecase.dart'
    as _i104;
import 'features/traveling/domain/usecases/travel_page/delete_cost_line_usecase.dart'
    as _i106;
import 'features/traveling/domain/usecases/travel_page/delete_insurance_line_usecase.dart'
    as _i107;
import 'features/traveling/domain/usecases/travel_page/edit_budget_line_usecase.dart'
    as _i113;
import 'features/traveling/domain/usecases/travel_page/edit_cost_line_usecase.dart'
    as _i114;
import 'features/traveling/domain/usecases/travel_page/edit_day_line_usecase.dart'
    as _i115;
import 'features/traveling/domain/usecases/travel_page/edit_insurance_line_usecase.dart'
    as _i116;
import 'features/traveling/domain/usecases/travel_page/get_budget_line_usecase.dart'
    as _i123;
import 'features/traveling/domain/usecases/travel_page/get_cost_lines_usecase.dart'
    as _i126;
import 'features/traveling/domain/usecases/travel_page/get_day_lines_usecase.dart'
    as _i130;
import 'features/traveling/domain/usecases/travel_page/get_feeding_statistic_usecase.dart'
    as _i9;
import 'features/traveling/domain/usecases/travel_page/get_insurance_lines_usecase.dart'
    as _i131;
import 'features/traveling/domain/usecases/travel_page/get_travel_regions_usecase.dart'
    as _i144;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i219;
import 'features/traveling/presentation/cubit/travel_day/travel_day_cubit.dart'
    as _i201;
import 'features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart'
    as _i202;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i203;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i223;
import 'features/treanings/domain/usecases/export_treanings_usecase.dart'
    as _i225;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i231;
import 'features/treanings/domain/usecases/import_treanings_usecase.dart'
    as _i244;
import 'features/treanings/presentation/cubit/treanings/treanings_cubit.dart'
    as _i245;
import 'features/treanings/presentation/cubit/treanings_export_import/treanings_export_import_cubit.dart'
    as _i246;
import 'features/trekking/data/datasources/drift_trekking_path_local_datasource.dart'
    as _i72;
import 'features/trekking/data/datasources/firebase_trekking_remote_datasource.dart'
    as _i76;
import 'features/trekking/data/datasources/trekking_path_local_datasource.dart'
    as _i71;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i75;
import 'features/trekking/data/repositories/trekking_path_repository_impl.dart'
    as _i74;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i78;
import 'features/trekking/domain/repositories/trekking_path_repository.dart'
    as _i73;
import 'features/trekking/domain/repositories/trekking_repository.dart' as _i77;
import 'features/trekking/domain/usecases/add_trek_event_usecase.dart' as _i85;
import 'features/trekking/domain/usecases/continue_trek_usecase.dart' as _i98;
import 'features/trekking/domain/usecases/current_trekking_path_usecase.dart'
    as _i103;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i146;
import 'features/trekking/domain/usecases/get_treks.dart' as _i147;
import 'features/trekking/domain/usecases/previos_trekking_path_usecase.dart'
    as _i182;
import 'features/trekking/domain/usecases/start_trek_usecase.dart' as _i194;
import 'features/trekking/presentation/bloc/trekking/trekking_cubit.dart'
    as _i204;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i205;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i206;

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
  gh.lazySingleton<_i9.GetFeedingStatisticUsecase>(
      () => _i9.GetFeedingStatisticUsecase());
  gh.lazySingleton<_i10.HiveInterface>(() => injectableModule.hiveInterface);
  gh.lazySingleton<_i11.IceRegionsDataSource>(
      () => _i12.LocalIceRegionsDataSource());
  gh.lazySingleton<_i13.IceRegionsRemoteDataSource>(() =>
      _i14.FirebaseIceRegionsRemoteDataSource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i15.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker);
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
      () => _i24.NetworkInfoImpl(gh<_i15.InternetConnectionChecker>()));
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
      () => _i64.DriftTravelLocalDatasource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i65.TravelRegionsDataSource>(
      () => _i66.HiveTravelRegionsDataSource(gh<_i10.HiveInterface>()));
  gh.lazySingleton<_i67.TravelRegionsRepository>(() =>
      _i68.TravelRegionsRepositoryImpl(gh<_i65.TravelRegionsDataSource>()));
  gh.lazySingleton<_i69.TravelRepository>(
      () => _i70.TravelRepositoryImpl(gh<_i63.TravelLocalDatasource>()));
  gh.lazySingleton<_i71.TrekkingPathLocalDataSource>(() =>
      _i72.DriftTrekkingPathLocalDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i73.TrekkingPathRepository>(() =>
      _i74.TrekkingPathRepositoryImpl(gh<_i71.TrekkingPathLocalDataSource>()));
  gh.lazySingleton<_i75.TrekkingRemoteDataSource>(
      () => _i76.FirebaseTrekkingRemoteDatasource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i77.TrekkingRepository>(
      () => _i78.TrekkingRepositoryImpl(gh<_i75.TrekkingRemoteDataSource>()));
  gh.lazySingleton<_i79.UpdateStrengthTreaningExercises>(
      () => _i79.UpdateStrengthTreaningExercises(
            strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>(),
            strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>(),
          ));
  gh.lazySingleton<_i80.AddRepetitionForStrengthTreaning>(() =>
      _i80.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i81.AddStrengthTreaning>(() => _i81.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i82.AddTechniqueToTreaningUseCase>(() =>
      _i82.AddTechniqueToTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i83.AddTechniqueTreaningUseCase>(() =>
      _i83.AddTechniqueTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i84.AddTravelUsecase>(
      () => _i84.AddTravelUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i85.AddTrekEventUsecase>(
      () => _i85.AddTrekEventUsecase(gh<_i73.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i86.AnaliticsService>(() async =>
      _i87.FirebaseAnaliticsService(
          await gh.getAsync<_i5.FirebaseAnalytics>()));
  gh.lazySingleton<_i88.AuthDataSource>(
      () => _i89.FirebaseAuthDataSource(firebaseAuth: gh<_i6.FirebaseAuth>()));
  gh.lazySingleton<_i90.AuthRepository>(
      () => _i91.AuthRepositoryImpl(authDataSource: gh<_i88.AuthDataSource>()));
  gh.lazySingleton<_i92.CardioTreaningsDatasource>(
      () => _i93.LocalCardioTreaningsDatasource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i94.CardioTreaningsRepository>(() =>
      _i95.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i92.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i96.ClimbingHallRepository>(
      () => _i97.ClimbingHallRepositoryImpl(
            gh<_i3.ClimbingHallDataSource>(),
            gh<_i31.RemoteGymDataSource>(),
            gh<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i98.ContinueTrekUsecase>(
      () => _i98.ContinueTrekUsecase(gh<_i73.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i99.CrashLogService>(() async =>
      _i100.GoogleCrashLogService(
          await gh.getAsync<_i7.FirebaseCrashlytics>()));
  gh.lazySingleton<_i101.CurrentTechniqueTreaningUseCase>(() =>
      _i101.CurrentTechniqueTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i102.CurrentTravelUsecase>(
      () => _i102.CurrentTravelUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i103.CurrentTrekkingPathUsecase>(() =>
      _i103.CurrentTrekkingPathUsecase(gh<_i73.TrekkingPathRepository>()));
  gh.lazySingleton<_i104.DeleteBudgetLineUsecase>(
      () => _i104.DeleteBudgetLineUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i105.DeleteCardioTreaning>(() => _i105.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i94.CardioTreaningsRepository>()));
  gh.lazySingleton<_i106.DeleteCostLineUsecase>(
      () => _i106.DeleteCostLineUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i107.DeleteInsuranceLineUsecase>(
      () => _i107.DeleteInsuranceLineUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i108.DeleteRepetitionForStrengthTreaning>(() =>
      _i108.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i109.DeleteRockAttempt>(
      () => _i109.DeleteRockAttempt(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i110.DeleteStrengthExercise>(() =>
      _i110.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>()));
  gh.lazySingleton<_i111.DeleteStrengthTreaning>(() =>
      _i111.DeleteStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i112.DeleteTechniqueTreaningUseCase>(() =>
      _i112.DeleteTechniqueTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i113.EditBudgetLineUsecase>(
      () => _i113.EditBudgetLineUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i114.EditCostLineUsecase>(
      () => _i114.EditCostLineUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i115.EditDayLineUsecase>(
      () => _i115.EditDayLineUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i116.EditInsuranceLineUsecase>(
      () => _i116.EditInsuranceLineUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i117.EditTechniqueItemUseCase>(() =>
      _i117.EditTechniqueItemUseCase(gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i118.EditTravelUsecase>(
      () => _i118.EditTravelUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i119.FinishRockAttempt>(
      () => _i119.FinishRockAttempt(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i120.FinishRockTreaning>(
      () => _i120.FinishRockTreaning(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i121.FinishStrengthTreaning>(() =>
      _i121.FinishStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i122.FinishTechniqueTreaningUseCase>(() =>
      _i122.FinishTechniqueTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i123.GetBudgetLinesUsecase>(
      () => _i123.GetBudgetLinesUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i124.GetCardioTreanings>(() => _i124.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i94.CardioTreaningsRepository>()));
  gh.lazySingleton<_i125.GetClimbingHallRoures>(
      () => _i125.GetClimbingHallRoures(gh<_i96.ClimbingHallRepository>()));
  gh.lazySingleton<_i126.GetCostLinesUsecase>(
      () => _i126.GetCostLinesUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i127.GetCurrentRockTreaning>(
      () => _i127.GetCurrentRockTreaning(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i128.GetCurrentStrengthTreaning>(() =>
      _i128.GetCurrentStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i129.GetCurrentTravelDayUsecase>(
      () => _i129.GetCurrentTravelDayUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i130.GetDayLinesUsecase>(
      () => _i130.GetDayLinesUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i131.GetInsuranceLineUsecase>(
      () => _i131.GetInsuranceLineUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i132.GetLastCardioTreaning>(() =>
      _i132.GetLastCardioTreaning(
          cardioTreaningsRepository: gh<_i94.CardioTreaningsRepository>()));
  gh.lazySingleton<_i133.GetLastRockTreaning>(
      () => _i133.GetLastRockTreaning(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i134.GetMountainRegions>(
      () => _i134.GetMountainRegions(gh<_i22.MountainRegionsRepository>()));
  gh.lazySingleton<_i135.GetMountainRoutes>(
      () => _i135.GetMountainRoutes(gh<_i22.MountainRegionsRepository>()));
  gh.lazySingleton<_i136.GetMountains>(
      () => _i136.GetMountains(gh<_i22.MountainRegionsRepository>()));
  gh.lazySingleton<_i137.GetPreviosStrengthTreaning>(() =>
      _i137.GetPreviosStrengthTreaning(
          strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i138.GetRockRouteAttempts>(
      () => _i138.GetRockRouteAttempts(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i139.GetRockRouteStatistic>(
      () => _i139.GetRockRouteStatistic(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i140.GetStrengthExercises>(() => _i140.GetStrengthExercises(
      strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>()));
  gh.lazySingleton<_i141.GetStrengthTreanings>(() => _i141.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i53.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i142.GetTechniqueGroupsUsecase>(
      () => _i142.GetTechniqueGroupsUsecase(gh<_i61.TechniquesRepository>()));
  gh.lazySingleton<_i143.GetTechniquesUsecase>(
      () => _i143.GetTechniquesUsecase(gh<_i61.TechniquesRepository>()));
  gh.lazySingleton<_i144.GetTravelRegionsUsecase>(
      () => _i144.GetTravelRegionsUsecase(gh<_i67.TravelRegionsRepository>()));
  gh.lazySingleton<_i145.GetTravelsUsecase>(
      () => _i145.GetTravelsUsecase(gh<_i69.TravelRepository>()));
  gh.lazySingleton<_i146.GetTrekkingRegions>(
      () => _i146.GetTrekkingRegions(gh<_i77.TrekkingRepository>()));
  gh.lazySingleton<_i147.GetTreks>(
      () => _i147.GetTreks(gh<_i77.TrekkingRepository>()));
  gh.lazySingleton<_i148.HallRouteToArchive>(() =>
      _i148.HallRouteToArchive(repository: gh<_i96.ClimbingHallRepository>()));
  gh.lazySingleton<_i149.HallTreaningDataSource>(
      () => _i150.LocalHallTreaningDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i151.HallTreaningRepository>(
      () => _i152.HallTreaningRepositoryImpl(
            dataSource: gh<_i149.HallTreaningDataSource>(),
            hallDataSource: gh<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i153.IceRegionsRepository>(
      () => _i154.IceRegionsRepositoryImpl(
            gh<_i11.IceRegionsDataSource>(),
            gh<_i13.IceRegionsRemoteDataSource>(),
            gh<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i155.IceTreaningsDataSource>(
      () => _i156.LocalIceTreaningsDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i157.IceTreaningsRepository>(() =>
      _i158.IceTreaningsRepositoryImpl(gh<_i155.IceTreaningsDataSource>()));
  gh.lazySingleton<_i159.LastHallTreaning>(
      () => _i159.LastHallTreaning(gh<_i151.HallTreaningRepository>()));
  gh.lazySingleton<_i160.LoadDistrictsUseCase>(() => _i160.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i153.IceRegionsRepository>()));
  gh.lazySingleton<_i161.LoadPlaces>(
      () => _i161.LoadPlaces(gh<_i29.PlacesRepository>()));
  gh.lazySingleton<_i162.LoadRockDistricts>(
      () => _i162.LoadRockDistricts(gh<_i37.RockRegionsRepository>()));
  gh.lazySingleton<_i163.LoadRockRoutes>(
      () => _i163.LoadRockRoutes(gh<_i37.RockRegionsRepository>()));
  gh.lazySingleton<_i164.LoadRockSectors>(
      () => _i164.LoadRockSectors(gh<_i37.RockRegionsRepository>()));
  gh.lazySingleton<_i165.LoadSectorsUseCase>(() => _i165.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i153.IceRegionsRepository>()));
  gh.lazySingleton<_i166.LoadSimpleSettingsUsecase>(
      () => _i166.LoadSimpleSettingsUsecase(gh<_i45.SettingsRepository>()));
  gh.lazySingleton<_i167.LoadTreaningsSettings>(
      () => _i167.LoadTreaningsSettings(gh<_i45.SettingsRepository>()));
  gh.lazySingleton<_i168.LocalAscensionDataSource>(
      () => _i169.DriftLocalAscensionDataSource(gh<_i16.LocalDBDatasource>()));
  gh.factory<_i170.MountainRegionsCubit>(
      () => _i170.MountainRegionsCubit(gh<_i134.GetMountainRegions>()));
  gh.factory<_i171.MountainRoutesCubit>(
      () => _i171.MountainRoutesCubit(gh<_i135.GetMountainRoutes>()));
  gh.factory<_i172.MountainsCubit>(
      () => _i172.MountainsCubit(gh<_i136.GetMountains>()));
  gh.lazySingleton<_i173.NewHallAttempt>(() => _i173.NewHallAttempt(
      treaningRepository: gh<_i151.HallTreaningRepository>()));
  gh.lazySingleton<_i174.NewHallAttemptFromRoute>(() =>
      _i174.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i151.HallTreaningRepository>()));
  gh.lazySingleton<_i175.NewHallRoute>(() => _i175.NewHallRoute(
      climbingHallRepository: gh<_i96.ClimbingHallRepository>()));
  gh.lazySingleton<_i176.NewHallTreaning>(() => _i176.NewHallTreaning(
      treaningRepository: gh<_i151.HallTreaningRepository>()));
  gh.lazySingleton<_i177.NewIceAttempt>(
      () => _i177.NewIceAttempt(gh<_i157.IceTreaningsRepository>()));
  gh.lazySingleton<_i178.NewIceTreaning>(() => _i178.NewIceTreaning(
        iceTreaningsRepository: gh<_i157.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i153.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i179.NewRockAttempt>(
      () => _i179.NewRockAttempt(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i180.NewRockTreaning>(
      () => _i180.NewRockTreaning(gh<_i41.RockTreaningsRepository>()));
  gh.lazySingleton<_i181.PreviosTechniqueTreaningUseCase>(() =>
      _i181.PreviosTechniqueTreaningUseCase(
          gh<_i57.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i182.PreviosTrekkingPathUsecase>(() =>
      _i182.PreviosTrekkingPathUsecase(gh<_i73.TrekkingPathRepository>()));
  gh.factory<_i183.RockDistrictsCubit>(
      () => _i183.RockDistrictsCubit(gh<_i162.LoadRockDistricts>()));
  gh.factory<_i184.RockRoutesCubit>(() => _i184.RockRoutesCubit(
        gh<_i163.LoadRockRoutes>(),
        gh<_i139.GetRockRouteStatistic>(),
      ));
  gh.lazySingleton<_i185.RockSectorToTreaning>(
      () => _i185.RockSectorToTreaning(gh<_i41.RockTreaningsRepository>()));
  gh.factory<_i186.RockSectorsCubit>(
      () => _i186.RockSectorsCubit(gh<_i164.LoadRockSectors>()));
  gh.factory<_i187.RockTreaningCubit>(() => _i187.RockTreaningCubit(
        gh<_i180.NewRockTreaning>(),
        gh<_i185.RockSectorToTreaning>(),
        gh<_i179.NewRockAttempt>(),
        gh<_i119.FinishRockAttempt>(),
        gh<_i120.FinishRockTreaning>(),
        gh<_i133.GetLastRockTreaning>(),
        gh<_i127.GetCurrentRockTreaning>(),
        gh<_i139.GetRockRouteStatistic>(),
        gh<_i109.DeleteRockAttempt>(),
      ));
  gh.lazySingleton<_i188.SaveCardioTreaning>(() => _i188.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i94.CardioTreaningsRepository>()));
  gh.lazySingleton<_i189.SaveSimpleSettingsUsecase>(
      () => _i189.SaveSimpleSettingsUsecase(gh<_i45.SettingsRepository>()));
  gh.lazySingleton<_i190.SaveStrengthExercise>(() => _i190.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>()));
  gh.lazySingleton<_i191.SaveTreaningsSettings>(
      () => _i191.SaveTreaningsSettings(gh<_i45.SettingsRepository>()));
  gh.lazySingleton<_i192.SelectToUseStrengthExercise>(() =>
      _i192.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i49.StrengthExerciseRepository>()));
  gh.lazySingleton<_i193.SettingsCubit>(() => _i193.SettingsCubit(
        gh<_i167.LoadTreaningsSettings>(),
        gh<_i191.SaveTreaningsSettings>(),
        gh<_i161.LoadPlaces>(),
        gh<_i166.LoadSimpleSettingsUsecase>(),
        gh<_i189.SaveSimpleSettingsUsecase>(),
      ));
  gh.lazySingleton<_i194.StartTrekUsecase>(
      () => _i194.StartTrekUsecase(gh<_i73.TrekkingPathRepository>()));
  gh.factory<_i195.StrengthExercisesCubit>(() => _i195.StrengthExercisesCubit(
        gh<_i140.GetStrengthExercises>(),
        gh<_i190.SaveStrengthExercise>(),
        gh<_i192.SelectToUseStrengthExercise>(),
        gh<_i110.DeleteStrengthExercise>(),
      ));
  gh.factory<_i196.StrengthTrainingCubit>(() => _i196.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i128.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i137.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i81.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i79.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i80.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i121.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i108.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i197.StrengthTrainingsCubit>(() => _i197.StrengthTrainingsCubit(
        gh<_i141.GetStrengthTreanings>(),
        gh<_i111.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i198.TechniqueGroupsCubit>(
      () => _i198.TechniqueGroupsCubit(gh<_i142.GetTechniqueGroupsUsecase>()));
  gh.factory<_i199.TechniqueTreaningCubit>(() => _i199.TechniqueTreaningCubit(
        gh<_i83.AddTechniqueTreaningUseCase>(),
        gh<_i181.PreviosTechniqueTreaningUseCase>(),
        gh<_i101.CurrentTechniqueTreaningUseCase>(),
        gh<_i82.AddTechniqueToTreaningUseCase>(),
        gh<_i122.FinishTechniqueTreaningUseCase>(),
        gh<_i117.EditTechniqueItemUseCase>(),
      ));
  gh.factory<_i200.TechniquesCubit>(
      () => _i200.TechniquesCubit(gh<_i143.GetTechniquesUsecase>()));
  gh.factory<_i201.TravelDayCubit>(
      () => _i201.TravelDayCubit(gh<_i115.EditDayLineUsecase>()));
  gh.factory<_i202.TravelPageCubit>(() => _i202.TravelPageCubit(
        gh<_i106.DeleteCostLineUsecase>(),
        gh<_i114.EditCostLineUsecase>(),
        gh<_i126.GetCostLinesUsecase>(),
        gh<_i131.GetInsuranceLineUsecase>(),
        gh<_i123.GetBudgetLinesUsecase>(),
        gh<_i116.EditInsuranceLineUsecase>(),
        gh<_i113.EditBudgetLineUsecase>(),
        gh<_i107.DeleteInsuranceLineUsecase>(),
        gh<_i104.DeleteBudgetLineUsecase>(),
        gh<_i130.GetDayLinesUsecase>(),
        gh<_i9.GetFeedingStatisticUsecase>(),
        gh<_i118.EditTravelUsecase>(),
        gh<_i144.GetTravelRegionsUsecase>(),
      ));
  gh.factory<_i203.TravelsCubit>(() => _i203.TravelsCubit(
        gh<_i145.GetTravelsUsecase>(),
        gh<_i84.AddTravelUsecase>(),
      ));
  gh.factory<_i204.TrekkingCubit>(() => _i204.TrekkingCubit(
        gh<_i103.CurrentTrekkingPathUsecase>(),
        gh<_i182.PreviosTrekkingPathUsecase>(),
        gh<_i194.StartTrekUsecase>(),
        gh<_i85.AddTrekEventUsecase>(),
        gh<_i98.ContinueTrekUsecase>(),
      ));
  gh.factory<_i205.TrekkingRegionsCubit>(
      () => _i205.TrekkingRegionsCubit(gh<_i146.GetTrekkingRegions>()));
  gh.factory<_i206.TreksCubit>(() => _i206.TreksCubit(gh<_i147.GetTreks>()));
  gh.lazySingleton<_i207.AllClimbingHalls>(
      () => _i207.AllClimbingHalls(gh<_i96.ClimbingHallRepository>()));
  gh.lazySingleton<_i208.AllHallTreanings>(
      () => _i208.AllHallTreanings(gh<_i151.HallTreaningRepository>()));
  gh.lazySingleton<_i209.AscensionRepository>(() =>
      _i210.AscensionRepositoryImpl(gh<_i168.LocalAscensionDataSource>()));
  gh.factory<_i211.AuthGetUser>(
      () => _i211.AuthGetUser(authRepository: gh<_i90.AuthRepository>()));
  gh.factory<_i212.AuthLogin>(
      () => _i212.AuthLogin(authRepository: gh<_i90.AuthRepository>()));
  gh.factory<_i213.AuthLogout>(
      () => _i213.AuthLogout(authRepository: gh<_i90.AuthRepository>()));
  gh.factory<_i214.AuthenticationCubit>(() => _i214.AuthenticationCubit(
        gh<_i212.AuthLogin>(),
        gh<_i213.AuthLogout>(),
        gh<_i211.AuthGetUser>(),
      ));
  gh.factory<_i215.CardioTreaningCubit>(() => _i215.CardioTreaningCubit(
        gh<_i132.GetLastCardioTreaning>(),
        gh<_i188.SaveCardioTreaning>(),
      ));
  gh.factory<_i216.CardioTreaningsCubit>(() => _i216.CardioTreaningsCubit(
        gh<_i124.GetCardioTreanings>(),
        gh<_i105.DeleteCardioTreaning>(),
        gh<_i188.SaveCardioTreaning>(),
      ));
  gh.factory<_i217.ClimbingHallsCubit>(() =>
      _i217.ClimbingHallsCubit(allClimbingHalls: gh<_i207.AllClimbingHalls>()));
  gh.lazySingleton<_i218.CurrentHallTreaning>(
      () => _i218.CurrentHallTreaning(gh<_i151.HallTreaningRepository>()));
  gh.factory<_i219.CurrentTravelCubit>(() => _i219.CurrentTravelCubit(
        gh<_i102.CurrentTravelUsecase>(),
        gh<_i114.EditCostLineUsecase>(),
        gh<_i129.GetCurrentTravelDayUsecase>(),
      ));
  gh.lazySingleton<_i220.DeleteHallAttempt>(() => _i220.DeleteHallAttempt(
      treaningRepository: gh<_i151.HallTreaningRepository>()));
  gh.lazySingleton<_i221.DeleteHallTreaning>(() => _i221.DeleteHallTreaning(
      treaningRepository: gh<_i151.HallTreaningRepository>()));
  gh.lazySingleton<_i222.DeleteIceAttempt>(
      () => _i222.DeleteIceAttempt(gh<_i157.IceTreaningsRepository>()));
  gh.lazySingleton<_i223.DeleteTreaning>(() => _i223.DeleteTreaning(
        gh<_i151.HallTreaningRepository>(),
        gh<_i157.IceTreaningsRepository>(),
        gh<_i53.StrengthTreaningsRepository>(),
        gh<_i94.CardioTreaningsRepository>(),
        gh<_i41.RockTreaningsRepository>(),
        gh<_i73.TrekkingPathRepository>(),
        gh<_i57.TechniqueTreaningsRepository>(),
        gh<_i209.AscensionRepository>(),
      ));
  gh.lazySingleton<_i224.EditAscensionEventUsecase>(
      () => _i224.EditAscensionEventUsecase(gh<_i209.AscensionRepository>()));
  gh.lazySingleton<_i225.ExportTreaningsUseCase>(
      () => _i225.ExportTreaningsUseCase(
            gh<_i151.HallTreaningRepository>(),
            gh<_i157.IceTreaningsRepository>(),
            gh<_i53.StrengthTreaningsRepository>(),
            gh<_i94.CardioTreaningsRepository>(),
            gh<_i41.RockTreaningsRepository>(),
            gh<_i69.TravelRepository>(),
            gh<_i73.TrekkingPathRepository>(),
            gh<_i57.TechniqueTreaningsRepository>(),
            gh<_i209.AscensionRepository>(),
          ));
  gh.lazySingleton<_i226.FinishAscensionUsecase>(
      () => _i226.FinishAscensionUsecase(gh<_i209.AscensionRepository>()));
  gh.lazySingleton<_i227.FinishHallAttempt>(() => _i227.FinishHallAttempt(
      treaningRepository: gh<_i151.HallTreaningRepository>()));
  gh.lazySingleton<_i228.FinishHallTreaning>(() => _i228.FinishHallTreaning(
      treaningRepository: gh<_i151.HallTreaningRepository>()));
  gh.lazySingleton<_i229.FinishIceAttempt>(
      () => _i229.FinishIceAttempt(gh<_i157.IceTreaningsRepository>()));
  gh.lazySingleton<_i230.FinishIceTreaning>(() => _i230.FinishIceTreaning(
      iceTreaningsRepository: gh<_i157.IceTreaningsRepository>()));
  gh.lazySingleton<_i231.GetAllTreanings>(() => _i231.GetAllTreanings(
        gh<_i151.HallTreaningRepository>(),
        gh<_i157.IceTreaningsRepository>(),
        gh<_i53.StrengthTreaningsRepository>(),
        gh<_i94.CardioTreaningsRepository>(),
        gh<_i41.RockTreaningsRepository>(),
        gh<_i69.TravelRepository>(),
        gh<_i73.TrekkingPathRepository>(),
        gh<_i57.TechniqueTreaningsRepository>(),
        gh<_i209.AscensionRepository>(),
      ));
  gh.lazySingleton<_i232.GetAscensionUsecase>(
      () => _i232.GetAscensionUsecase(gh<_i209.AscensionRepository>()));
  gh.lazySingleton<_i233.GetCurrentIceTreaning>(() =>
      _i233.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i157.IceTreaningsRepository>()));
  gh.lazySingleton<_i234.GetGymRouteStatistic>(
      () => _i234.GetGymRouteStatistic(gh<_i151.HallTreaningRepository>()));
  gh.lazySingleton<_i235.GetHallRouteAttempts>(() => _i235.GetHallRouteAttempts(
      repository: gh<_i151.HallTreaningRepository>()));
  gh.lazySingleton<_i236.GetLastIceTreaning>(() => _i236.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i157.IceTreaningsRepository>()));
  gh.factory<_i237.HallRouteAttemptsCubit>(() => _i237.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i235.GetHallRouteAttempts>()));
  gh.factory<_i238.HallRouteCubit>(
      () => _i238.HallRouteCubit(gh<_i175.NewHallRoute>()));
  gh.factory<_i239.HallTreaningsCubit>(() => _i239.HallTreaningsCubit(
        allHallTreanings: gh<_i208.AllHallTreanings>(),
        deleteHallTreaning: gh<_i221.DeleteHallTreaning>(),
      ));
  gh.factory<_i240.HomePageCubit>(() =>
      _i240.HomePageCubit(allClimbingHalls: gh<_i207.AllClimbingHalls>()));
  gh.factory<_i241.IceDistrictsCubit>(() => _i241.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i160.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i242.IceSectorToTreaning>(() => _i242.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i157.IceTreaningsRepository>()));
  gh.factory<_i243.IceSectorsCubit>(() => _i243.IceSectorsCubit(
      loadSectorsUseCase: gh<_i165.LoadSectorsUseCase>()));
  gh.lazySingleton<_i244.ImportTreaningsUseCase>(
      () => _i244.ImportTreaningsUseCase(
            gh<_i151.HallTreaningRepository>(),
            gh<_i157.IceTreaningsRepository>(),
            gh<_i53.StrengthTreaningsRepository>(),
            gh<_i94.CardioTreaningsRepository>(),
            gh<_i41.RockTreaningsRepository>(),
            gh<_i69.TravelRepository>(),
            gh<_i73.TrekkingPathRepository>(),
            gh<_i57.TechniqueTreaningsRepository>(),
            gh<_i209.AscensionRepository>(),
          ));
  gh.factory<_i245.TreaningsCubit>(() => _i245.TreaningsCubit(
        gh<_i231.GetAllTreanings>(),
        gh<_i223.DeleteTreaning>(),
      ));
  gh.factory<_i246.TreaningsExportImportCubit>(
      () => _i246.TreaningsExportImportCubit(
            gh<_i225.ExportTreaningsUseCase>(),
            gh<_i244.ImportTreaningsUseCase>(),
          ));
  gh.lazySingleton<_i247.AddAscensionUsecase>(
      () => _i247.AddAscensionUsecase(gh<_i209.AscensionRepository>()));
  gh.factory<_i248.AscensionCubit>(() => _i248.AscensionCubit(
        gh<_i247.AddAscensionUsecase>(),
        gh<_i232.GetAscensionUsecase>(),
        gh<_i226.FinishAscensionUsecase>(),
        gh<_i224.EditAscensionEventUsecase>(),
      ));
  gh.factory<_i249.ClimbingHallCubit>(() => _i249.ClimbingHallCubit(
        gh<_i125.GetClimbingHallRoures>(),
        gh<_i148.HallRouteToArchive>(),
        gh<_i234.GetGymRouteStatistic>(),
      ));
  gh.factory<_i250.CurrentHallTreaningCubit>(
      () => _i250.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i174.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i176.NewHallTreaning>(),
            newHallAttempt: gh<_i173.NewHallAttempt>(),
            currentHallTreaning: gh<_i218.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i227.FinishHallAttempt>(),
            finishHallTreaning: gh<_i228.FinishHallTreaning>(),
            lastHallTreaning: gh<_i159.LastHallTreaning>(),
            deleteHallAttempt: gh<_i220.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i234.GetGymRouteStatistic>(),
          ));
  gh.factory<_i251.CurrentIceTreaningCubit>(() => _i251.CurrentIceTreaningCubit(
        gh<_i178.NewIceTreaning>(),
        gh<_i242.IceSectorToTreaning>(),
        gh<_i177.NewIceAttempt>(),
        gh<_i229.FinishIceAttempt>(),
        gh<_i230.FinishIceTreaning>(),
        gh<_i233.GetCurrentIceTreaning>(),
        gh<_i236.GetLastIceTreaning>(),
        gh<_i222.DeleteIceAttempt>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i252.InjectableModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;

import 'core/datasource/drift_db_local_datasource.dart' as _i31;
import 'core/datasource/local_db_datasource.dart' as _i30;
import 'core/injectable_module.dart' as _i254;
import 'core/services/analitics/analitics_service.dart' as _i61;
import 'core/services/analitics/firebase_analitics_service.dart' as _i62;
import 'core/services/crash_log_service/crash_log_service.dart' as _i18;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i19;
import 'core/services/network/network_info.dart' as _i52;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i50;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i51;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i54;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i53;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i122;
import 'features/authentication/domain/usecases/auth_login.dart' as _i123;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i124;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i130;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i82;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i83;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i168;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i167;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i177;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i178;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i179;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i180;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i183;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i235;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i14;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i80;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i15;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i81;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i59;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i60;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i132;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i151;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i131;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i150;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i181;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i182;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i184;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i226;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i199;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i146;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i161;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i162;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i191;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i192;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i193;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i194;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i163;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i195;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i174;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i196;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i233;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i244;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i197;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i198;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i230;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i229;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i245;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i13;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i10;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i12;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i38;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i11;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i39;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i116;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i66;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i115;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i65;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i103;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i104;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i133;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i134;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i135;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i136;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i169;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i170;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i105;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i176;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i242;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i185;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i225;
import 'features/mountaineering/data/datasources/drift_local_ascension_datasource.dart'
    as _i37;
import 'features/mountaineering/data/datasources/firebase_mountain_regions_remote_datasource.dart'
    as _i49;
import 'features/mountaineering/data/datasources/local_ascension_datasource.dart'
    as _i36;
import 'features/mountaineering/data/datasources/mock_mountain_regions_local_datasource.dart'
    as _i27;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i26;
import 'features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart'
    as _i48;
import 'features/mountaineering/data/repositories/ascension_repository_impl.dart'
    as _i41;
import 'features/mountaineering/data/repositories/mountain_regions_repository_impl.dart'
    as _i70;
import 'features/mountaineering/domain/repositories/ascension_repository.dart'
    as _i40;
import 'features/mountaineering/domain/repositories/mountain_regions_repository.dart'
    as _i69;
import 'features/mountaineering/domain/usecases/add_ascension_usecase.dart'
    as _i44;
import 'features/mountaineering/domain/usecases/edit_ascension_event_usecase.dart'
    as _i45;
import 'features/mountaineering/domain/usecases/finish_ascension_usecase.dart'
    as _i46;
import 'features/mountaineering/domain/usecases/get_ascension_usecase.dart'
    as _i47;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i111;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i112;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i110;
import 'features/mountaineering/domain/usecases/save_mountain_route_usecase.dart'
    as _i113;
import 'features/mountaineering/domain/usecases/save_mountain_usecase.dart'
    as _i114;
import 'features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart'
    as _i77;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i142;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i149;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i166;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i100;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i29;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i25;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i24;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i28;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i99;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i68;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i148;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i67;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i147;
import 'features/rock_climbing/domain/usecases/delete_rock_attempt.dart'
    as _i153;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i154;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i155;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i156;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i157;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i231;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i232;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i125;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i126;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i127;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i158;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i159;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i160;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i200;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i251;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i171;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i250;
import 'features/settings/data/datasources/firebase_places_remote_datasource.dart'
    as _i23;
import 'features/settings/data/datasources/hive_places_local_datasource.dart'
    as _i17;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i33;
import 'features/settings/data/datasources/places_local_datasource.dart'
    as _i16;
import 'features/settings/data/datasources/places_remote_datasource.dart'
    as _i22;
import 'features/settings/data/datasources/settings_datasource.dart' as _i32;
import 'features/settings/data/repositories/places_repository_impl.dart'
    as _i109;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i64;
import 'features/settings/domain/repositories/places_repository.dart' as _i108;
import 'features/settings/domain/repositories/settings_repository.dart' as _i63;
import 'features/settings/domain/usecases/load_places.dart' as _i175;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i138;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i139;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i140;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i141;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i201;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i76;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i89;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i75;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i88;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i85;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i165;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i84;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i164;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i202;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i227;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i203;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i117;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i204;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i205;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i206;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i207;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i118;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i208;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i119;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i120;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i228;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i143;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i243;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i246;
import 'features/techniques/data/datasources/drift_technique_treanings_local_datasource.dart'
    as _i43;
import 'features/techniques/data/datasources/firebase_techniques_remote_datasource.dart'
    as _i35;
import 'features/techniques/data/datasources/technique_treanings_local_datasource.dart'
    as _i42;
import 'features/techniques/data/datasources/techniques_remote_datasource.dart'
    as _i34;
import 'features/techniques/data/repositories/technique_treanings_repository_impl.dart'
    as _i56;
import 'features/techniques/data/repositories/techniques_repository_impl.dart'
    as _i58;
import 'features/techniques/domain/repositories/technique_treanings_repository.dart'
    as _i55;
import 'features/techniques/domain/repositories/techniques_repository.dart'
    as _i57;
import 'features/techniques/domain/usecases/add_technique_to_treaning_usecase.dart'
    as _i92;
import 'features/techniques/domain/usecases/add_technique_treaning_usecase.dart'
    as _i93;
import 'features/techniques/domain/usecases/current_technique_treaning_usecase.dart'
    as _i94;
import 'features/techniques/domain/usecases/delete_technique_treaning_usecase.dart'
    as _i95;
import 'features/techniques/domain/usecases/edit_technique_item_usecase.dart'
    as _i96;
import 'features/techniques/domain/usecases/finish_technique_treaning_usecase.dart'
    as _i97;
import 'features/techniques/domain/usecases/get_technique_groups_usecase.dart'
    as _i72;
import 'features/techniques/domain/usecases/get_techniques_usecase.dart'
    as _i71;
import 'features/techniques/domain/usecases/previos_technique_treaning_usecase.dart'
    as _i98;
import 'features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart'
    as _i107;
import 'features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart'
    as _i121;
import 'features/techniques/presentation/bloc/techniques/techniques_cubit.dart'
    as _i137;
import 'features/traveling/data/datasources/drift_travel_local_datasource.dart'
    as _i91;
import 'features/traveling/data/datasources/hive_travel_regions_datasource.dart'
    as _i74;
import 'features/traveling/data/datasources/travel_local_datasource.dart'
    as _i90;
import 'features/traveling/data/datasources/travel_regions_datasource.dart'
    as _i73;
import 'features/traveling/data/repositories/travel_regions_repository_impl.dart'
    as _i102;
import 'features/traveling/data/repositories/travel_repository.dart' as _i173;
import 'features/traveling/domain/repositories/travel_regions_repository.dart'
    as _i101;
import 'features/traveling/domain/repositories/travel_repository.dart' as _i172;
import 'features/traveling/domain/usecases/add_travel_usecase.dart' as _i209;
import 'features/traveling/domain/usecases/current_travel_usecase.dart'
    as _i210;
import 'features/traveling/domain/usecases/edit_travel_usecase.dart' as _i211;
import 'features/traveling/domain/usecases/get_current_travel_day_usecase.dart'
    as _i212;
import 'features/traveling/domain/usecases/get_travels_usecase.dart' as _i213;
import 'features/traveling/domain/usecases/travel_page/delete_budget_line_usecase.dart'
    as _i214;
import 'features/traveling/domain/usecases/travel_page/delete_cost_line_usecase.dart'
    as _i215;
import 'features/traveling/domain/usecases/travel_page/delete_insurance_line_usecase.dart'
    as _i216;
import 'features/traveling/domain/usecases/travel_page/edit_budget_line_usecase.dart'
    as _i217;
import 'features/traveling/domain/usecases/travel_page/edit_cost_line_usecase.dart'
    as _i218;
import 'features/traveling/domain/usecases/travel_page/edit_day_line_usecase.dart'
    as _i219;
import 'features/traveling/domain/usecases/travel_page/edit_insurance_line_usecase.dart'
    as _i220;
import 'features/traveling/domain/usecases/travel_page/get_budget_line_usecase.dart'
    as _i221;
import 'features/traveling/domain/usecases/travel_page/get_cost_lines_usecase.dart'
    as _i222;
import 'features/traveling/domain/usecases/travel_page/get_day_lines_usecase.dart'
    as _i223;
import 'features/traveling/domain/usecases/travel_page/get_feeding_statistic_usecase.dart'
    as _i9;
import 'features/traveling/domain/usecases/travel_page/get_insurance_lines_usecase.dart'
    as _i224;
import 'features/traveling/domain/usecases/travel_page/get_travel_regions_usecase.dart'
    as _i106;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i237;
import 'features/traveling/presentation/cubit/travel_day/travel_day_cubit.dart'
    as _i248;
import 'features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart'
    as _i252;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i241;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i236;
import 'features/treanings/domain/usecases/export_treanings_usecase.dart'
    as _i238;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i239;
import 'features/treanings/domain/usecases/import_treanings_usecase.dart'
    as _i240;
import 'features/treanings/presentation/cubit/treanings/treanings_cubit.dart'
    as _i247;
import 'features/treanings/presentation/cubit/treanings_export_import/treanings_export_import_cubit.dart'
    as _i253;
import 'features/trekking/data/datasources/drift_trekking_path_local_datasource.dart'
    as _i87;
import 'features/trekking/data/datasources/firebase_trekking_remote_datasource.dart'
    as _i21;
import 'features/trekking/data/datasources/trekking_path_local_datasource.dart'
    as _i86;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i20;
import 'features/trekking/data/repositories/trekking_path_repository_impl.dart'
    as _i129;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i79;
import 'features/trekking/domain/repositories/trekking_path_repository.dart'
    as _i128;
import 'features/trekking/domain/repositories/trekking_repository.dart' as _i78;
import 'features/trekking/domain/usecases/add_trek_event_usecase.dart' as _i186;
import 'features/trekking/domain/usecases/continue_trek_usecase.dart' as _i187;
import 'features/trekking/domain/usecases/current_trekking_path_usecase.dart'
    as _i188;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i144;
import 'features/trekking/domain/usecases/get_treks.dart' as _i145;
import 'features/trekking/domain/usecases/previos_trekking_path_usecase.dart'
    as _i189;
import 'features/trekking/domain/usecases/start_trek_usecase.dart' as _i190;
import 'features/trekking/presentation/bloc/trekking/trekking_cubit.dart'
    as _i249;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i152;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i234;

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
  gh.lazySingletonAsync<_i3.FirebaseCrashlytics>(
      () => injectableModule.firebaseCrashlytics);
  gh.lazySingletonAsync<_i4.FirebaseAnalytics>(
      () => injectableModule.firebaseAnalytics);
  gh.lazySingleton<_i5.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingleton<_i6.HiveInterface>(() => injectableModule.hiveInterface);
  gh.lazySingleton<_i7.FirebaseFirestore>(
      () => injectableModule.firebaseFirestore);
  gh.lazySingleton<_i8.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker);
  gh.lazySingleton<_i9.GetFeedingStatisticUsecase>(
      () => _i9.GetFeedingStatisticUsecase());
  gh.lazySingleton<_i10.IceRegionsDataSource>(
      () => _i11.LocalIceRegionsDataSource());
  gh.lazySingleton<_i12.IceRegionsRemoteDataSource>(() =>
      _i13.FirebaseIceRegionsRemoteDataSource(gh<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i14.ClimbingHallDataSource>(
      () => _i15.LocalClimbingHallDataSource());
  gh.lazySingleton<_i16.PlacesLocalDataSource>(
      () => _i17.HivePlacesLocalDataSource());
  gh.lazySingletonAsync<_i18.CrashLogService>(() async =>
      _i19.GoogleCrashLogService(await gh.getAsync<_i3.FirebaseCrashlytics>()));
  gh.lazySingleton<_i20.TrekkingRemoteDataSource>(
      () => _i21.FirebaseTrekkingRemoteDatasource(gh<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i22.PlacesRemoteDataSource>(
      () => _i23.FirebasePlacesRemoteDataSource(gh<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i24.RockRegionsLocalDataSource>(
      () => _i25.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i26.MountainRegionsLocalDataSource>(
      () => _i27.MountainRegionsLocalDataSourceImpl());
  gh.lazySingleton<_i28.RockRegionsRemoteDataSource>(() =>
      _i29.FirebaseRockRegionsRemoteDataSource(gh<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i30.LocalDBDatasource>(() => _i31.DriftDBLocalDataSource());
  gh.lazySingleton<_i32.SettingsDataSource>(
      () => _i33.SettingsDataSourceImpl());
  gh.lazySingleton<_i34.TechniquesRemoteDataSource>(() =>
      _i35.FirebaseTechniquesRemoteDataSource(gh<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i36.LocalAscensionDataSource>(
      () => _i37.DriftLocalAscensionDataSource(gh<_i30.LocalDBDatasource>()));
  gh.lazySingleton<_i38.IceTreaningsDataSource>(
      () => _i39.LocalIceTreaningsDataSource(gh<_i30.LocalDBDatasource>()));
  gh.lazySingleton<_i40.AscensionRepository>(
      () => _i41.AscensionRepositoryImpl(gh<_i36.LocalAscensionDataSource>()));
  gh.lazySingleton<_i42.TechniqueTreaningsLocalDataSource>(() =>
      _i43.DriftTechniqueTreaningsLocalDataSource(
          gh<_i30.LocalDBDatasource>()));
  gh.lazySingleton<_i44.AddAscensionUsecase>(
      () => _i44.AddAscensionUsecase(gh<_i40.AscensionRepository>()));
  gh.lazySingleton<_i45.EditAscensionEventUsecase>(
      () => _i45.EditAscensionEventUsecase(gh<_i40.AscensionRepository>()));
  gh.lazySingleton<_i46.FinishAscensionUsecase>(
      () => _i46.FinishAscensionUsecase(gh<_i40.AscensionRepository>()));
  gh.lazySingleton<_i47.GetAscensionUsecase>(
      () => _i47.GetAscensionUsecase(gh<_i40.AscensionRepository>()));
  gh.lazySingleton<_i48.MountainRegionsRemoteDataSource>(
      () => _i49.FirebaseMountainRegionsRemoteDataSource(
            gh<_i7.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i50.AuthDataSource>(
      () => _i51.FirebaseAuthDataSource(firebaseAuth: gh<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i52.NetworkInfo>(
      () => _i52.NetworkInfoImpl(gh<_i8.InternetConnectionChecker>()));
  gh.lazySingleton<_i53.AuthRepository>(
      () => _i54.AuthRepositoryImpl(authDataSource: gh<_i50.AuthDataSource>()));
  gh.lazySingleton<_i55.TechniqueTreaningsRepository>(() =>
      _i56.TechniqueTreaningsRepositoryImpl(
          gh<_i42.TechniqueTreaningsLocalDataSource>()));
  gh.lazySingleton<_i57.TechniquesRepository>(() =>
      _i58.TechniquesRepositoryImpl(gh<_i34.TechniquesRemoteDataSource>()));
  gh.lazySingleton<_i59.RemoteGymDataSource>(() => _i60.RemoteGymDataSourceImpl(
        gh<_i7.FirebaseFirestore>(),
        gh<_i5.FirebaseAuth>(),
      ));
  gh.lazySingletonAsync<_i61.AnaliticsService>(() async =>
      _i62.FirebaseAnaliticsService(
          await gh.getAsync<_i4.FirebaseAnalytics>()));
  gh.lazySingleton<_i63.SettingsRepository>(
      () => _i64.SettingsRepositoryImpl(gh<_i32.SettingsDataSource>()));
  gh.lazySingleton<_i65.IceTreaningsRepository>(
      () => _i66.IceTreaningsRepositoryImpl(gh<_i38.IceTreaningsDataSource>()));
  gh.lazySingleton<_i67.RockRegionsRepository>(
      () => _i68.RockRegionsRepositoryImpl(
            gh<_i24.RockRegionsLocalDataSource>(),
            gh<_i28.RockRegionsRemoteDataSource>(),
            gh<_i52.NetworkInfo>(),
          ));
  gh.lazySingleton<_i69.MountainRegionsRepository>(
      () => _i70.MountainRegionsRepositoryImpl(
            gh<_i26.MountainRegionsLocalDataSource>(),
            gh<_i48.MountainRegionsRemoteDataSource>(),
          ));
  gh.lazySingleton<_i71.GetTechniquesUsecase>(
      () => _i71.GetTechniquesUsecase(gh<_i57.TechniquesRepository>()));
  gh.lazySingleton<_i72.GetTechniqueGroupsUsecase>(
      () => _i72.GetTechniqueGroupsUsecase(gh<_i57.TechniquesRepository>()));
  gh.lazySingleton<_i73.TravelRegionsDataSource>(
      () => _i74.HiveTravelRegionsDataSource(gh<_i6.HiveInterface>()));
  gh.lazySingleton<_i75.StrengthExerciseDataSource>(
      () => _i76.LocalStrengthExerciseDataSource(gh<_i30.LocalDBDatasource>()));
  gh.factory<_i77.AscensionCubit>(() => _i77.AscensionCubit(
        gh<_i44.AddAscensionUsecase>(),
        gh<_i47.GetAscensionUsecase>(),
        gh<_i46.FinishAscensionUsecase>(),
        gh<_i45.EditAscensionEventUsecase>(),
      ));
  gh.lazySingleton<_i78.TrekkingRepository>(
      () => _i79.TrekkingRepositoryImpl(gh<_i20.TrekkingRemoteDataSource>()));
  gh.lazySingleton<_i80.HallTreaningDataSource>(
      () => _i81.LocalHallTreaningDataSource(gh<_i30.LocalDBDatasource>()));
  gh.lazySingleton<_i82.CardioTreaningsDatasource>(
      () => _i83.LocalCardioTreaningsDatasource(gh<_i30.LocalDBDatasource>()));
  gh.lazySingleton<_i84.StrengthExerciseRepository>(() =>
      _i85.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: gh<_i75.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i86.TrekkingPathLocalDataSource>(() =>
      _i87.DriftTrekkingPathLocalDataSource(gh<_i30.LocalDBDatasource>()));
  gh.lazySingleton<_i88.StrengthTreaningsDataSource>(() =>
      _i89.LocalStrengthTreaningsDataSource(gh<_i30.LocalDBDatasource>()));
  gh.lazySingleton<_i90.TravelLocalDatasource>(
      () => _i91.DriftTravelLocalDatasource(gh<_i30.LocalDBDatasource>()));
  gh.lazySingleton<_i92.AddTechniqueToTreaningUseCase>(() =>
      _i92.AddTechniqueToTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i93.AddTechniqueTreaningUseCase>(() =>
      _i93.AddTechniqueTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i94.CurrentTechniqueTreaningUseCase>(() =>
      _i94.CurrentTechniqueTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i95.DeleteTechniqueTreaningUseCase>(() =>
      _i95.DeleteTechniqueTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i96.EditTechniqueItemUseCase>(() =>
      _i96.EditTechniqueItemUseCase(gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i97.FinishTechniqueTreaningUseCase>(() =>
      _i97.FinishTechniqueTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i98.PreviosTechniqueTreaningUseCase>(() =>
      _i98.PreviosTechniqueTreaningUseCase(
          gh<_i55.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i99.RockTreaningsLocalDataSource>(() =>
      _i100.DriftRockTreaningsLocalDataSource(gh<_i30.LocalDBDatasource>()));
  gh.lazySingleton<_i101.TravelRegionsRepository>(() =>
      _i102.TravelRegionsRepositoryImpl(gh<_i73.TravelRegionsDataSource>()));
  gh.lazySingleton<_i103.DeleteIceAttempt>(
      () => _i103.DeleteIceAttempt(gh<_i65.IceTreaningsRepository>()));
  gh.lazySingleton<_i104.FinishIceAttempt>(
      () => _i104.FinishIceAttempt(gh<_i65.IceTreaningsRepository>()));
  gh.lazySingleton<_i105.NewIceAttempt>(
      () => _i105.NewIceAttempt(gh<_i65.IceTreaningsRepository>()));
  gh.lazySingleton<_i106.GetTravelRegionsUsecase>(
      () => _i106.GetTravelRegionsUsecase(gh<_i101.TravelRegionsRepository>()));
  gh.factory<_i107.TechniqueGroupsCubit>(
      () => _i107.TechniqueGroupsCubit(gh<_i72.GetTechniqueGroupsUsecase>()));
  gh.lazySingleton<_i108.PlacesRepository>(() => _i109.PlacesRepositoryImpl(
        gh<_i16.PlacesLocalDataSource>(),
        gh<_i22.PlacesRemoteDataSource>(),
        gh<_i52.NetworkInfo>(),
      ));
  gh.lazySingleton<_i110.GetMountains>(
      () => _i110.GetMountains(gh<_i69.MountainRegionsRepository>()));
  gh.lazySingleton<_i111.GetMountainRegions>(
      () => _i111.GetMountainRegions(gh<_i69.MountainRegionsRepository>()));
  gh.lazySingleton<_i112.GetMountainRoutes>(
      () => _i112.GetMountainRoutes(gh<_i69.MountainRegionsRepository>()));
  gh.lazySingleton<_i113.SaveMountainRouteUsecase>(() =>
      _i113.SaveMountainRouteUsecase(gh<_i69.MountainRegionsRepository>()));
  gh.lazySingleton<_i114.SaveMountainUsecase>(
      () => _i114.SaveMountainUsecase(gh<_i69.MountainRegionsRepository>()));
  gh.lazySingleton<_i115.IceRegionsRepository>(
      () => _i116.IceRegionsRepositoryImpl(
            gh<_i10.IceRegionsDataSource>(),
            gh<_i12.IceRegionsRemoteDataSource>(),
            gh<_i52.NetworkInfo>(),
          ));
  gh.lazySingleton<_i117.DeleteStrengthExercise>(() =>
      _i117.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i84.StrengthExerciseRepository>()));
  gh.lazySingleton<_i118.GetStrengthExercises>(() => _i118.GetStrengthExercises(
      strengthExerciseRepository: gh<_i84.StrengthExerciseRepository>()));
  gh.lazySingleton<_i119.SaveStrengthExercise>(() => _i119.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i84.StrengthExerciseRepository>()));
  gh.lazySingleton<_i120.SelectToUseStrengthExercise>(() =>
      _i120.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i84.StrengthExerciseRepository>()));
  gh.factory<_i121.TechniqueTreaningCubit>(() => _i121.TechniqueTreaningCubit(
        gh<_i93.AddTechniqueTreaningUseCase>(),
        gh<_i98.PreviosTechniqueTreaningUseCase>(),
        gh<_i94.CurrentTechniqueTreaningUseCase>(),
        gh<_i92.AddTechniqueToTreaningUseCase>(),
        gh<_i97.FinishTechniqueTreaningUseCase>(),
        gh<_i96.EditTechniqueItemUseCase>(),
      ));
  gh.factory<_i122.AuthGetUser>(
      () => _i122.AuthGetUser(authRepository: gh<_i53.AuthRepository>()));
  gh.factory<_i123.AuthLogin>(
      () => _i123.AuthLogin(authRepository: gh<_i53.AuthRepository>()));
  gh.factory<_i124.AuthLogout>(
      () => _i124.AuthLogout(authRepository: gh<_i53.AuthRepository>()));
  gh.lazySingleton<_i125.LoadRockDistricts>(
      () => _i125.LoadRockDistricts(gh<_i67.RockRegionsRepository>()));
  gh.lazySingleton<_i126.LoadRockRoutes>(
      () => _i126.LoadRockRoutes(gh<_i67.RockRegionsRepository>()));
  gh.lazySingleton<_i127.LoadRockSectors>(
      () => _i127.LoadRockSectors(gh<_i67.RockRegionsRepository>()));
  gh.lazySingleton<_i128.TrekkingPathRepository>(() =>
      _i129.TrekkingPathRepositoryImpl(gh<_i86.TrekkingPathLocalDataSource>()));
  gh.factory<_i130.AuthenticationCubit>(() => _i130.AuthenticationCubit(
        gh<_i123.AuthLogin>(),
        gh<_i124.AuthLogout>(),
        gh<_i122.AuthGetUser>(),
      ));
  gh.lazySingleton<_i131.ClimbingHallRepository>(
      () => _i132.ClimbingHallRepositoryImpl(
            gh<_i14.ClimbingHallDataSource>(),
            gh<_i59.RemoteGymDataSource>(),
            gh<_i52.NetworkInfo>(),
          ));
  gh.lazySingleton<_i133.FinishIceTreaning>(() => _i133.FinishIceTreaning(
      iceTreaningsRepository: gh<_i65.IceTreaningsRepository>()));
  gh.lazySingleton<_i134.GetCurrentIceTreaning>(() =>
      _i134.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i65.IceTreaningsRepository>()));
  gh.lazySingleton<_i135.GetLastIceTreaning>(() => _i135.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i65.IceTreaningsRepository>()));
  gh.lazySingleton<_i136.IceSectorToTreaning>(() => _i136.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i65.IceTreaningsRepository>()));
  gh.factory<_i137.TechniquesCubit>(
      () => _i137.TechniquesCubit(gh<_i71.GetTechniquesUsecase>()));
  gh.lazySingleton<_i138.LoadSimpleSettingsUsecase>(
      () => _i138.LoadSimpleSettingsUsecase(gh<_i63.SettingsRepository>()));
  gh.lazySingleton<_i139.LoadTreaningsSettings>(
      () => _i139.LoadTreaningsSettings(gh<_i63.SettingsRepository>()));
  gh.lazySingleton<_i140.SaveSimpleSettingsUsecase>(
      () => _i140.SaveSimpleSettingsUsecase(gh<_i63.SettingsRepository>()));
  gh.lazySingleton<_i141.SaveTreaningsSettings>(
      () => _i141.SaveTreaningsSettings(gh<_i63.SettingsRepository>()));
  gh.factory<_i142.MountainRegionsCubit>(
      () => _i142.MountainRegionsCubit(gh<_i111.GetMountainRegions>()));
  gh.factory<_i143.StrengthExercisesCubit>(() => _i143.StrengthExercisesCubit(
        gh<_i118.GetStrengthExercises>(),
        gh<_i119.SaveStrengthExercise>(),
        gh<_i120.SelectToUseStrengthExercise>(),
        gh<_i117.DeleteStrengthExercise>(),
      ));
  gh.lazySingleton<_i144.GetTrekkingRegions>(
      () => _i144.GetTrekkingRegions(gh<_i78.TrekkingRepository>()));
  gh.lazySingleton<_i145.GetTreks>(
      () => _i145.GetTreks(gh<_i78.TrekkingRepository>()));
  gh.lazySingleton<_i146.NewHallRoute>(() => _i146.NewHallRoute(
      climbingHallRepository: gh<_i131.ClimbingHallRepository>()));
  gh.lazySingleton<_i147.RockTreaningsRepository>(() =>
      _i148.RockTreaningsRepositoryImpl(
          gh<_i99.RockTreaningsLocalDataSource>()));
  gh.factory<_i149.MountainRoutesCubit>(() => _i149.MountainRoutesCubit(
        gh<_i112.GetMountainRoutes>(),
        gh<_i113.SaveMountainRouteUsecase>(),
      ));
  gh.lazySingleton<_i150.HallTreaningRepository>(
      () => _i151.HallTreaningRepositoryImpl(
            dataSource: gh<_i80.HallTreaningDataSource>(),
            hallDataSource: gh<_i14.ClimbingHallDataSource>(),
          ));
  gh.factory<_i152.TrekkingRegionsCubit>(
      () => _i152.TrekkingRegionsCubit(gh<_i144.GetTrekkingRegions>()));
  gh.lazySingleton<_i153.DeleteRockAttempt>(
      () => _i153.DeleteRockAttempt(gh<_i147.RockTreaningsRepository>()));
  gh.lazySingleton<_i154.FinishRockAttempt>(
      () => _i154.FinishRockAttempt(gh<_i147.RockTreaningsRepository>()));
  gh.lazySingleton<_i155.FinishRockTreaning>(
      () => _i155.FinishRockTreaning(gh<_i147.RockTreaningsRepository>()));
  gh.lazySingleton<_i156.GetCurrentRockTreaning>(
      () => _i156.GetCurrentRockTreaning(gh<_i147.RockTreaningsRepository>()));
  gh.lazySingleton<_i157.GetLastRockTreaning>(
      () => _i157.GetLastRockTreaning(gh<_i147.RockTreaningsRepository>()));
  gh.lazySingleton<_i158.NewRockAttempt>(
      () => _i158.NewRockAttempt(gh<_i147.RockTreaningsRepository>()));
  gh.lazySingleton<_i159.NewRockTreaning>(
      () => _i159.NewRockTreaning(gh<_i147.RockTreaningsRepository>()));
  gh.lazySingleton<_i160.RockSectorToTreaning>(
      () => _i160.RockSectorToTreaning(gh<_i147.RockTreaningsRepository>()));
  gh.lazySingleton<_i161.AllHallTreanings>(
      () => _i161.AllHallTreanings(gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i162.CurrentHallTreaning>(
      () => _i162.CurrentHallTreaning(gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i163.LastHallTreaning>(
      () => _i163.LastHallTreaning(gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i164.StrengthTreaningsRepository>(() =>
      _i165.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource: gh<_i88.StrengthTreaningsDataSource>()));
  gh.factory<_i166.MountainsCubit>(() => _i166.MountainsCubit(
        gh<_i110.GetMountains>(),
        gh<_i114.SaveMountainUsecase>(),
      ));
  gh.lazySingleton<_i167.CardioTreaningsRepository>(() =>
      _i168.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i82.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i169.LoadDistrictsUseCase>(() => _i169.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i115.IceRegionsRepository>()));
  gh.lazySingleton<_i170.LoadSectorsUseCase>(() => _i170.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i115.IceRegionsRepository>()));
  gh.factory<_i171.RockSectorsCubit>(
      () => _i171.RockSectorsCubit(gh<_i127.LoadRockSectors>()));
  gh.lazySingleton<_i172.TravelRepository>(
      () => _i173.TravelRepositoryImpl(gh<_i90.TravelLocalDatasource>()));
  gh.lazySingleton<_i174.NewHallAttemptFromRoute>(() =>
      _i174.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i175.LoadPlaces>(
      () => _i175.LoadPlaces(gh<_i108.PlacesRepository>()));
  gh.lazySingleton<_i176.NewIceTreaning>(() => _i176.NewIceTreaning(
        iceTreaningsRepository: gh<_i65.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i115.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i177.DeleteCardioTreaning>(() => _i177.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i167.CardioTreaningsRepository>()));
  gh.lazySingleton<_i178.GetCardioTreanings>(() => _i178.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i167.CardioTreaningsRepository>()));
  gh.lazySingleton<_i179.GetLastCardioTreaning>(() =>
      _i179.GetLastCardioTreaning(
          cardioTreaningsRepository: gh<_i167.CardioTreaningsRepository>()));
  gh.lazySingleton<_i180.SaveCardioTreaning>(() => _i180.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i167.CardioTreaningsRepository>()));
  gh.lazySingleton<_i181.AllClimbingHalls>(
      () => _i181.AllClimbingHalls(gh<_i131.ClimbingHallRepository>()));
  gh.lazySingleton<_i182.GetClimbingHallRoures>(
      () => _i182.GetClimbingHallRoures(gh<_i131.ClimbingHallRepository>()));
  gh.factory<_i183.CardioTreaningCubit>(() => _i183.CardioTreaningCubit(
        gh<_i179.GetLastCardioTreaning>(),
        gh<_i180.SaveCardioTreaning>(),
      ));
  gh.lazySingleton<_i184.GetGymRouteStatistic>(
      () => _i184.GetGymRouteStatistic(gh<_i150.HallTreaningRepository>()));
  gh.factory<_i185.IceDistrictsCubit>(() => _i185.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i169.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i186.AddTrekEventUsecase>(
      () => _i186.AddTrekEventUsecase(gh<_i128.TrekkingPathRepository>()));
  gh.lazySingleton<_i187.ContinueTrekUsecase>(
      () => _i187.ContinueTrekUsecase(gh<_i128.TrekkingPathRepository>()));
  gh.lazySingleton<_i188.CurrentTrekkingPathUsecase>(() =>
      _i188.CurrentTrekkingPathUsecase(gh<_i128.TrekkingPathRepository>()));
  gh.lazySingleton<_i189.PreviosTrekkingPathUsecase>(() =>
      _i189.PreviosTrekkingPathUsecase(gh<_i128.TrekkingPathRepository>()));
  gh.lazySingleton<_i190.StartTrekUsecase>(
      () => _i190.StartTrekUsecase(gh<_i128.TrekkingPathRepository>()));
  gh.lazySingleton<_i191.DeleteHallAttempt>(() => _i191.DeleteHallAttempt(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i192.DeleteHallTreaning>(() => _i192.DeleteHallTreaning(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i193.FinishHallAttempt>(() => _i193.FinishHallAttempt(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i194.FinishHallTreaning>(() => _i194.FinishHallTreaning(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i195.NewHallAttempt>(() => _i195.NewHallAttempt(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i196.NewHallTreaning>(() => _i196.NewHallTreaning(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.factory<_i197.CurrentHallTreaningCubit>(
      () => _i197.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i174.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i196.NewHallTreaning>(),
            newHallAttempt: gh<_i195.NewHallAttempt>(),
            currentHallTreaning: gh<_i162.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i193.FinishHallAttempt>(),
            finishHallTreaning: gh<_i194.FinishHallTreaning>(),
            lastHallTreaning: gh<_i163.LastHallTreaning>(),
            deleteHallAttempt: gh<_i191.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i184.GetGymRouteStatistic>(),
          ));
  gh.factory<_i198.HallRouteCubit>(
      () => _i198.HallRouteCubit(gh<_i146.NewHallRoute>()));
  gh.lazySingleton<_i199.HallRouteToArchive>(() =>
      _i199.HallRouteToArchive(repository: gh<_i131.ClimbingHallRepository>()));
  gh.factory<_i200.RockDistrictsCubit>(
      () => _i200.RockDistrictsCubit(gh<_i125.LoadRockDistricts>()));
  gh.lazySingleton<_i201.SettingsCubit>(() => _i201.SettingsCubit(
        gh<_i139.LoadTreaningsSettings>(),
        gh<_i141.SaveTreaningsSettings>(),
        gh<_i175.LoadPlaces>(),
        gh<_i138.LoadSimpleSettingsUsecase>(),
        gh<_i140.SaveSimpleSettingsUsecase>(),
      ));
  gh.lazySingleton<_i202.AddRepetitionForStrengthTreaning>(() =>
      _i202.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i203.DeleteRepetitionForStrengthTreaning>(() =>
      _i203.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i204.DeleteStrengthTreaning>(() =>
      _i204.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i205.FinishStrengthTreaning>(() =>
      _i205.FinishStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i206.GetCurrentStrengthTreaning>(() =>
      _i206.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i207.GetPreviosStrengthTreaning>(() =>
      _i207.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i208.GetStrengthTreanings>(() => _i208.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i209.AddTravelUsecase>(
      () => _i209.AddTravelUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i210.CurrentTravelUsecase>(
      () => _i210.CurrentTravelUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i211.EditTravelUsecase>(
      () => _i211.EditTravelUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i212.GetCurrentTravelDayUsecase>(
      () => _i212.GetCurrentTravelDayUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i213.GetTravelsUsecase>(
      () => _i213.GetTravelsUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i214.DeleteBudgetLineUsecase>(
      () => _i214.DeleteBudgetLineUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i215.DeleteCostLineUsecase>(
      () => _i215.DeleteCostLineUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i216.DeleteInsuranceLineUsecase>(
      () => _i216.DeleteInsuranceLineUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i217.EditBudgetLineUsecase>(
      () => _i217.EditBudgetLineUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i218.EditCostLineUsecase>(
      () => _i218.EditCostLineUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i219.EditDayLineUsecase>(
      () => _i219.EditDayLineUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i220.EditInsuranceLineUsecase>(
      () => _i220.EditInsuranceLineUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i221.GetBudgetLinesUsecase>(
      () => _i221.GetBudgetLinesUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i222.GetCostLinesUsecase>(
      () => _i222.GetCostLinesUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i223.GetDayLinesUsecase>(
      () => _i223.GetDayLinesUsecase(gh<_i172.TravelRepository>()));
  gh.lazySingleton<_i224.GetInsuranceLineUsecase>(
      () => _i224.GetInsuranceLineUsecase(gh<_i172.TravelRepository>()));
  gh.factory<_i225.IceSectorsCubit>(() => _i225.IceSectorsCubit(
      loadSectorsUseCase: gh<_i170.LoadSectorsUseCase>()));
  gh.lazySingleton<_i226.GetHallRouteAttempts>(() => _i226.GetHallRouteAttempts(
      repository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i227.AddStrengthTreaning>(() => _i227.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i164.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i84.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i228.UpdateStrengthTreaningExercises>(() =>
      _i228.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: gh<_i164.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i84.StrengthExerciseRepository>(),
      ));
  gh.factory<_i229.HallTreaningsCubit>(() => _i229.HallTreaningsCubit(
        allHallTreanings: gh<_i161.AllHallTreanings>(),
        deleteHallTreaning: gh<_i192.DeleteHallTreaning>(),
      ));
  gh.factory<_i230.HallRouteAttemptsCubit>(() => _i230.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i226.GetHallRouteAttempts>()));
  gh.lazySingleton<_i231.GetRockRouteAttempts>(
      () => _i231.GetRockRouteAttempts(gh<_i147.RockTreaningsRepository>()));
  gh.lazySingleton<_i232.GetRockRouteStatistic>(
      () => _i232.GetRockRouteStatistic(gh<_i147.RockTreaningsRepository>()));
  gh.factory<_i233.ClimbingHallCubit>(() => _i233.ClimbingHallCubit(
        gh<_i182.GetClimbingHallRoures>(),
        gh<_i199.HallRouteToArchive>(),
        gh<_i184.GetGymRouteStatistic>(),
      ));
  gh.factory<_i234.TreksCubit>(() => _i234.TreksCubit(gh<_i145.GetTreks>()));
  gh.factory<_i235.CardioTreaningsCubit>(() => _i235.CardioTreaningsCubit(
        gh<_i178.GetCardioTreanings>(),
        gh<_i177.DeleteCardioTreaning>(),
        gh<_i180.SaveCardioTreaning>(),
      ));
  gh.lazySingleton<_i236.DeleteTreaning>(() => _i236.DeleteTreaning(
        gh<_i150.HallTreaningRepository>(),
        gh<_i65.IceTreaningsRepository>(),
        gh<_i164.StrengthTreaningsRepository>(),
        gh<_i167.CardioTreaningsRepository>(),
        gh<_i147.RockTreaningsRepository>(),
        gh<_i128.TrekkingPathRepository>(),
        gh<_i55.TechniqueTreaningsRepository>(),
        gh<_i40.AscensionRepository>(),
      ));
  gh.factory<_i237.CurrentTravelCubit>(() => _i237.CurrentTravelCubit(
        gh<_i210.CurrentTravelUsecase>(),
        gh<_i218.EditCostLineUsecase>(),
        gh<_i212.GetCurrentTravelDayUsecase>(),
      ));
  gh.lazySingleton<_i238.ExportTreaningsUseCase>(
      () => _i238.ExportTreaningsUseCase(
            gh<_i150.HallTreaningRepository>(),
            gh<_i65.IceTreaningsRepository>(),
            gh<_i164.StrengthTreaningsRepository>(),
            gh<_i167.CardioTreaningsRepository>(),
            gh<_i147.RockTreaningsRepository>(),
            gh<_i172.TravelRepository>(),
            gh<_i128.TrekkingPathRepository>(),
            gh<_i55.TechniqueTreaningsRepository>(),
            gh<_i40.AscensionRepository>(),
          ));
  gh.lazySingleton<_i239.GetAllTreanings>(() => _i239.GetAllTreanings(
        gh<_i150.HallTreaningRepository>(),
        gh<_i65.IceTreaningsRepository>(),
        gh<_i164.StrengthTreaningsRepository>(),
        gh<_i167.CardioTreaningsRepository>(),
        gh<_i147.RockTreaningsRepository>(),
        gh<_i172.TravelRepository>(),
        gh<_i128.TrekkingPathRepository>(),
        gh<_i55.TechniqueTreaningsRepository>(),
        gh<_i40.AscensionRepository>(),
      ));
  gh.lazySingleton<_i240.ImportTreaningsUseCase>(
      () => _i240.ImportTreaningsUseCase(
            gh<_i150.HallTreaningRepository>(),
            gh<_i65.IceTreaningsRepository>(),
            gh<_i164.StrengthTreaningsRepository>(),
            gh<_i167.CardioTreaningsRepository>(),
            gh<_i147.RockTreaningsRepository>(),
            gh<_i172.TravelRepository>(),
            gh<_i128.TrekkingPathRepository>(),
            gh<_i55.TechniqueTreaningsRepository>(),
            gh<_i40.AscensionRepository>(),
          ));
  gh.factory<_i241.TravelsCubit>(() => _i241.TravelsCubit(
        gh<_i213.GetTravelsUsecase>(),
        gh<_i209.AddTravelUsecase>(),
      ));
  gh.factory<_i242.CurrentIceTreaningCubit>(() => _i242.CurrentIceTreaningCubit(
        gh<_i176.NewIceTreaning>(),
        gh<_i136.IceSectorToTreaning>(),
        gh<_i105.NewIceAttempt>(),
        gh<_i104.FinishIceAttempt>(),
        gh<_i133.FinishIceTreaning>(),
        gh<_i134.GetCurrentIceTreaning>(),
        gh<_i135.GetLastIceTreaning>(),
        gh<_i103.DeleteIceAttempt>(),
      ));
  gh.factory<_i243.StrengthTrainingCubit>(() => _i243.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i206.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i207.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i227.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i228.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i202.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i205.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i203.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i244.ClimbingHallsCubit>(() =>
      _i244.ClimbingHallsCubit(allClimbingHalls: gh<_i181.AllClimbingHalls>()));
  gh.factory<_i245.HomePageCubit>(() =>
      _i245.HomePageCubit(allClimbingHalls: gh<_i181.AllClimbingHalls>()));
  gh.factory<_i246.StrengthTrainingsCubit>(() => _i246.StrengthTrainingsCubit(
        gh<_i208.GetStrengthTreanings>(),
        gh<_i204.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i247.TreaningsCubit>(() => _i247.TreaningsCubit(
        gh<_i239.GetAllTreanings>(),
        gh<_i236.DeleteTreaning>(),
      ));
  gh.factory<_i248.TravelDayCubit>(
      () => _i248.TravelDayCubit(gh<_i219.EditDayLineUsecase>()));
  gh.factory<_i249.TrekkingCubit>(() => _i249.TrekkingCubit(
        gh<_i188.CurrentTrekkingPathUsecase>(),
        gh<_i189.PreviosTrekkingPathUsecase>(),
        gh<_i190.StartTrekUsecase>(),
        gh<_i186.AddTrekEventUsecase>(),
        gh<_i187.ContinueTrekUsecase>(),
      ));
  gh.factory<_i250.RockTreaningCubit>(() => _i250.RockTreaningCubit(
        gh<_i159.NewRockTreaning>(),
        gh<_i160.RockSectorToTreaning>(),
        gh<_i158.NewRockAttempt>(),
        gh<_i154.FinishRockAttempt>(),
        gh<_i155.FinishRockTreaning>(),
        gh<_i157.GetLastRockTreaning>(),
        gh<_i156.GetCurrentRockTreaning>(),
        gh<_i232.GetRockRouteStatistic>(),
        gh<_i153.DeleteRockAttempt>(),
      ));
  gh.factory<_i251.RockRoutesCubit>(() => _i251.RockRoutesCubit(
        gh<_i126.LoadRockRoutes>(),
        gh<_i232.GetRockRouteStatistic>(),
      ));
  gh.factory<_i252.TravelPageCubit>(() => _i252.TravelPageCubit(
        gh<_i215.DeleteCostLineUsecase>(),
        gh<_i218.EditCostLineUsecase>(),
        gh<_i222.GetCostLinesUsecase>(),
        gh<_i224.GetInsuranceLineUsecase>(),
        gh<_i221.GetBudgetLinesUsecase>(),
        gh<_i220.EditInsuranceLineUsecase>(),
        gh<_i217.EditBudgetLineUsecase>(),
        gh<_i216.DeleteInsuranceLineUsecase>(),
        gh<_i214.DeleteBudgetLineUsecase>(),
        gh<_i223.GetDayLinesUsecase>(),
        gh<_i9.GetFeedingStatisticUsecase>(),
        gh<_i211.EditTravelUsecase>(),
        gh<_i106.GetTravelRegionsUsecase>(),
      ));
  gh.factory<_i253.TreaningsExportImportCubit>(
      () => _i253.TreaningsExportImportCubit(
            gh<_i238.ExportTreaningsUseCase>(),
            gh<_i240.ImportTreaningsUseCase>(),
          ));
  return getIt;
}

class _$InjectableModule extends _i254.InjectableModule {}

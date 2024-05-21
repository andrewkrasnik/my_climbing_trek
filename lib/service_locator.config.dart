// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i8;
import 'package:firebase_analytics/firebase_analytics.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i3;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive_flutter/hive_flutter.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;

import 'core/datasource/drift_db_local_datasource.dart' as _i26;
import 'core/datasource/image_cash_manager.dart' as _i66;
import 'core/datasource/local_db_datasource.dart' as _i25;
import 'core/injectable_module.dart' as _i275;
import 'core/services/analitics/analitics_service.dart' as _i60;
import 'core/services/analitics/firebase_analitics_service.dart' as _i61;
import 'core/services/crash_log_service/crash_log_service.dart' as _i19;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i20;
import 'core/services/network/network_info.dart' as _i49;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i45;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i46;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i51;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i50;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i121;
import 'features/authentication/domain/usecases/auth_login.dart' as _i122;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i123;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i126;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i85;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i86;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i169;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i168;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i180;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i181;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i182;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i183;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i186;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i252;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i13;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i83;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i14;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i84;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i58;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i59;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i128;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i153;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i127;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i152;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i184;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i185;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i187;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i244;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i210;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i149;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i163;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i164;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i194;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i195;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i196;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i197;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i165;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i198;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i177;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i199;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i251;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i264;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i200;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i209;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i248;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i247;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i265;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i48;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i11;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i47;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i31;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i12;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i32;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i115;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i65;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i114;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i64;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i108;
import 'features/ice_climbing/domain/usecases/delete_sector_usecase.dart'
    as _i170;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i109;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i129;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i130;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i131;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i132;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i171;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i172;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i110;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i179;
import 'features/ice_climbing/domain/usecases/save_sector_usecase.dart'
    as _i173;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i262;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i188;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i211;
import 'features/mountaineering/data/datasources/drift_local_ascension_datasource.dart'
    as _i30;
import 'features/mountaineering/data/datasources/firebase_mountain_regions_remote_datasource.dart'
    as _i44;
import 'features/mountaineering/data/datasources/hive_mountain_regions_local_datasource.dart'
    as _i16;
import 'features/mountaineering/data/datasources/local_ascension_datasource.dart'
    as _i29;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i15;
import 'features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart'
    as _i43;
import 'features/mountaineering/data/repositories/ascension_repository_impl.dart'
    as _i34;
import 'features/mountaineering/data/repositories/mountain_regions_repository_impl.dart'
    as _i134;
import 'features/mountaineering/domain/repositories/ascension_repository.dart'
    as _i33;
import 'features/mountaineering/domain/repositories/mountain_regions_repository.dart'
    as _i133;
import 'features/mountaineering/domain/usecases/add_ascension_usecase.dart'
    as _i37;
import 'features/mountaineering/domain/usecases/add_my_mountain_region_usecase.dart'
    as _i201;
import 'features/mountaineering/domain/usecases/delete_my_mountain_region_usecase.dart'
    as _i202;
import 'features/mountaineering/domain/usecases/edit_ascension_event_usecase.dart'
    as _i38;
import 'features/mountaineering/domain/usecases/finish_ascension_usecase.dart'
    as _i39;
import 'features/mountaineering/domain/usecases/get_ascension_usecase.dart'
    as _i40;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i204;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i205;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i203;
import 'features/mountaineering/domain/usecases/get_my_mountain_regions.dart'
    as _i206;
import 'features/mountaineering/domain/usecases/save_mountain_route_usecase.dart'
    as _i207;
import 'features/mountaineering/domain/usecases/save_mountain_usecase.dart'
    as _i208;
import 'features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart'
    as _i80;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i227;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i253;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i257;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i104;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i77;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i24;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i23;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i76;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i103;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i141;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i151;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i140;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i150;
import 'features/rock_climbing/domain/usecases/delete_rock_attempt.dart'
    as _i155;
import 'features/rock_climbing/domain/usecases/delete_rock_route.dart' as _i212;
import 'features/rock_climbing/domain/usecases/delete_rock_sector.dart'
    as _i213;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i156;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i157;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i158;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i159;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i249;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i250;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i214;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i215;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i216;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i160;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i161;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i162;
import 'features/rock_climbing/domain/usecases/save_rock_route.dart' as _i217;
import 'features/rock_climbing/domain/usecases/save_rock_sector.dart' as _i218;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i273;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i270;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i255;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i271;
import 'features/settings/data/datasources/firebase_places_remote_datasource.dart'
    as _i22;
import 'features/settings/data/datasources/hive_places_local_datasource.dart'
    as _i18;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i28;
import 'features/settings/data/datasources/places_local_datasource.dart'
    as _i17;
import 'features/settings/data/datasources/places_remote_datasource.dart'
    as _i21;
import 'features/settings/data/datasources/settings_datasource.dart' as _i27;
import 'features/settings/data/repositories/places_repository_impl.dart'
    as _i113;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i63;
import 'features/settings/domain/repositories/places_repository.dart' as _i112;
import 'features/settings/domain/repositories/settings_repository.dart' as _i62;
import 'features/settings/domain/usecases/load_places.dart' as _i178;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i135;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i136;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i137;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i138;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i219;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i79;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i93;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i78;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i92;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i89;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i167;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i88;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i166;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i220;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i245;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i221;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i116;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i222;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i223;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i224;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i225;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i117;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i226;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i118;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i119;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i246;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i139;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i263;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i266;
import 'features/techniques/data/datasources/drift_technique_treanings_local_datasource.dart'
    as _i36;
import 'features/techniques/data/datasources/firebase_techniques_remote_datasource.dart'
    as _i53;
import 'features/techniques/data/datasources/technique_treanings_local_datasource.dart'
    as _i35;
import 'features/techniques/data/datasources/techniques_remote_datasource.dart'
    as _i52;
import 'features/techniques/data/repositories/technique_treanings_repository_impl.dart'
    as _i55;
import 'features/techniques/data/repositories/techniques_repository_impl.dart'
    as _i57;
import 'features/techniques/domain/repositories/technique_treanings_repository.dart'
    as _i54;
import 'features/techniques/domain/repositories/techniques_repository.dart'
    as _i56;
import 'features/techniques/domain/usecases/add_technique_to_treaning_usecase.dart'
    as _i96;
import 'features/techniques/domain/usecases/add_technique_treaning_usecase.dart'
    as _i97;
import 'features/techniques/domain/usecases/current_technique_treaning_usecase.dart'
    as _i98;
import 'features/techniques/domain/usecases/delete_technique_group_usecase.dart'
    as _i67;
import 'features/techniques/domain/usecases/delete_technique_treaning_usecase.dart'
    as _i99;
import 'features/techniques/domain/usecases/delete_technique_usecase.dart'
    as _i68;
import 'features/techniques/domain/usecases/edit_technique_item_usecase.dart'
    as _i100;
import 'features/techniques/domain/usecases/finish_technique_treaning_usecase.dart'
    as _i101;
import 'features/techniques/domain/usecases/get_technique_groups_usecase.dart'
    as _i71;
import 'features/techniques/domain/usecases/get_techniques_editing_usecase.dart'
    as _i69;
import 'features/techniques/domain/usecases/get_techniques_usecase.dart'
    as _i70;
import 'features/techniques/domain/usecases/previos_technique_treaning_usecase.dart'
    as _i102;
import 'features/techniques/domain/usecases/save_technique_group_usecase.dart'
    as _i72;
import 'features/techniques/domain/usecases/save_technique_usecase.dart'
    as _i73;
import 'features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart'
    as _i105;
import 'features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart'
    as _i120;
import 'features/techniques/presentation/bloc/techniques/techniques_cubit.dart'
    as _i87;
import 'features/traveling/data/datasources/drift_travel_local_datasource.dart'
    as _i95;
import 'features/traveling/data/datasources/hive_travel_regions_datasource.dart'
    as _i75;
import 'features/traveling/data/datasources/travel_local_datasource.dart'
    as _i94;
import 'features/traveling/data/datasources/travel_regions_datasource.dart'
    as _i74;
import 'features/traveling/data/repositories/travel_regions_repository_impl.dart'
    as _i107;
import 'features/traveling/data/repositories/travel_repository.dart' as _i175;
import 'features/traveling/domain/repositories/travel_regions_repository.dart'
    as _i106;
import 'features/traveling/domain/repositories/travel_repository.dart' as _i174;
import 'features/traveling/domain/usecases/add_travel_usecase.dart' as _i228;
import 'features/traveling/domain/usecases/current_travel_usecase.dart'
    as _i229;
import 'features/traveling/domain/usecases/edit_travel_usecase.dart' as _i230;
import 'features/traveling/domain/usecases/get_current_travel_day_usecase.dart'
    as _i231;
import 'features/traveling/domain/usecases/get_travels_usecase.dart' as _i232;
import 'features/traveling/domain/usecases/travel_page/delete_budget_line_usecase.dart'
    as _i233;
import 'features/traveling/domain/usecases/travel_page/delete_cost_line_usecase.dart'
    as _i234;
import 'features/traveling/domain/usecases/travel_page/delete_insurance_line_usecase.dart'
    as _i235;
import 'features/traveling/domain/usecases/travel_page/edit_budget_line_usecase.dart'
    as _i236;
import 'features/traveling/domain/usecases/travel_page/edit_cost_line_usecase.dart'
    as _i237;
import 'features/traveling/domain/usecases/travel_page/edit_day_line_usecase.dart'
    as _i238;
import 'features/traveling/domain/usecases/travel_page/edit_insurance_line_usecase.dart'
    as _i239;
import 'features/traveling/domain/usecases/travel_page/get_budget_line_usecase.dart'
    as _i240;
import 'features/traveling/domain/usecases/travel_page/get_cost_lines_usecase.dart'
    as _i241;
import 'features/traveling/domain/usecases/travel_page/get_day_lines_usecase.dart'
    as _i242;
import 'features/traveling/domain/usecases/travel_page/get_feeding_statistic_usecase.dart'
    as _i10;
import 'features/traveling/domain/usecases/travel_page/get_insurance_lines_usecase.dart'
    as _i243;
import 'features/traveling/domain/usecases/travel_page/get_travel_regions_usecase.dart'
    as _i111;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i256;
import 'features/traveling/presentation/cubit/travel_day/travel_day_cubit.dart'
    as _i268;
import 'features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart'
    as _i272;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i261;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i254;
import 'features/treanings/domain/usecases/export_treanings_usecase.dart'
    as _i258;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i259;
import 'features/treanings/domain/usecases/import_treanings_usecase.dart'
    as _i260;
import 'features/treanings/presentation/cubit/treanings/treanings_cubit.dart'
    as _i267;
import 'features/treanings/presentation/cubit/treanings_export_import/treanings_export_import_cubit.dart'
    as _i274;
import 'features/trekking/data/datasources/drift_trekking_path_local_datasource.dart'
    as _i91;
import 'features/trekking/data/datasources/firebase_trekking_remote_datasource.dart'
    as _i42;
import 'features/trekking/data/datasources/trekking_path_local_datasource.dart'
    as _i90;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i41;
import 'features/trekking/data/repositories/trekking_path_repository_impl.dart'
    as _i125;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i82;
import 'features/trekking/domain/repositories/trekking_path_repository.dart'
    as _i124;
import 'features/trekking/domain/repositories/trekking_repository.dart' as _i81;
import 'features/trekking/domain/usecases/add_trek_event_usecase.dart' as _i189;
import 'features/trekking/domain/usecases/continue_trek_usecase.dart' as _i190;
import 'features/trekking/domain/usecases/current_trekking_path_usecase.dart'
    as _i191;
import 'features/trekking/domain/usecases/delete_trek.dart' as _i142;
import 'features/trekking/domain/usecases/delete_trek_point.dart' as _i143;
import 'features/trekking/domain/usecases/get_trek_points.dart' as _i146;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i144;
import 'features/trekking/domain/usecases/get_treks.dart' as _i145;
import 'features/trekking/domain/usecases/previos_trekking_path_usecase.dart'
    as _i192;
import 'features/trekking/domain/usecases/save_trek.dart' as _i147;
import 'features/trekking/domain/usecases/save_trek_point.dart' as _i148;
import 'features/trekking/domain/usecases/start_trek_usecase.dart' as _i193;
import 'features/trekking/presentation/bloc/trekking/trekking_cubit.dart'
    as _i269;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i154;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i176;

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
  gh.lazySingleton<_i7.DefaultCacheManager>(
      () => injectableModule.cacheManager);
  gh.lazySingleton<_i8.FirebaseFirestore>(
      () => injectableModule.firebaseFirestore);
  gh.lazySingleton<_i9.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker);
  gh.lazySingleton<_i10.GetFeedingStatisticUsecase>(
      () => _i10.GetFeedingStatisticUsecase());
  gh.lazySingleton<_i11.IceRegionsDataSource>(
      () => _i12.LocalIceRegionsDataSource());
  gh.lazySingleton<_i13.ClimbingHallDataSource>(
      () => _i14.LocalClimbingHallDataSource());
  gh.lazySingleton<_i15.MountainRegionsLocalDataSource>(
      () => _i16.HiveMountainRegionsLocalDataSource());
  gh.lazySingleton<_i17.PlacesLocalDataSource>(
      () => _i18.HivePlacesLocalDataSource());
  gh.lazySingletonAsync<_i19.CrashLogService>(() async =>
      _i20.GoogleCrashLogService(await gh.getAsync<_i3.FirebaseCrashlytics>()));
  gh.lazySingleton<_i21.PlacesRemoteDataSource>(
      () => _i22.FirebasePlacesRemoteDataSource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i23.RockRegionsLocalDataSource>(
      () => _i24.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i25.LocalDBDatasource>(() => _i26.DriftDBLocalDataSource());
  gh.lazySingleton<_i27.SettingsDataSource>(
      () => _i28.SettingsDataSourceImpl());
  gh.lazySingleton<_i29.LocalAscensionDataSource>(
      () => _i30.DriftLocalAscensionDataSource(gh<_i25.LocalDBDatasource>()));
  gh.lazySingleton<_i31.IceTreaningsDataSource>(
      () => _i32.LocalIceTreaningsDataSource(gh<_i25.LocalDBDatasource>()));
  gh.lazySingleton<_i33.AscensionRepository>(
      () => _i34.AscensionRepositoryImpl(gh<_i29.LocalAscensionDataSource>()));
  gh.lazySingleton<_i35.TechniqueTreaningsLocalDataSource>(() =>
      _i36.DriftTechniqueTreaningsLocalDataSource(
          gh<_i25.LocalDBDatasource>()));
  gh.lazySingleton<_i37.AddAscensionUsecase>(
      () => _i37.AddAscensionUsecase(gh<_i33.AscensionRepository>()));
  gh.lazySingleton<_i38.EditAscensionEventUsecase>(
      () => _i38.EditAscensionEventUsecase(gh<_i33.AscensionRepository>()));
  gh.lazySingleton<_i39.FinishAscensionUsecase>(
      () => _i39.FinishAscensionUsecase(gh<_i33.AscensionRepository>()));
  gh.lazySingleton<_i40.GetAscensionUsecase>(
      () => _i40.GetAscensionUsecase(gh<_i33.AscensionRepository>()));
  gh.lazySingleton<_i41.TrekkingRemoteDataSource>(
      () => _i42.FirebaseTrekkingRemoteDatasource(
            gh<_i8.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i43.MountainRegionsRemoteDataSource>(
      () => _i44.FirebaseMountainRegionsRemoteDataSource(
            gh<_i8.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i45.AuthDataSource>(
      () => _i46.FirebaseAuthDataSource(firebaseAuth: gh<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i47.IceRegionsRemoteDataSource>(
      () => _i48.FirebaseIceRegionsRemoteDataSource(
            gh<_i8.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i49.NetworkInfo>(
      () => _i49.NetworkInfoImpl(gh<_i9.InternetConnectionChecker>()));
  gh.lazySingleton<_i50.AuthRepository>(
      () => _i51.AuthRepositoryImpl(authDataSource: gh<_i45.AuthDataSource>()));
  gh.lazySingleton<_i52.TechniquesRemoteDataSource>(
      () => _i53.FirebaseTechniquesRemoteDataSource(
            gh<_i8.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i54.TechniqueTreaningsRepository>(() =>
      _i55.TechniqueTreaningsRepositoryImpl(
          gh<_i35.TechniqueTreaningsLocalDataSource>()));
  gh.lazySingleton<_i56.TechniquesRepository>(() =>
      _i57.TechniquesRepositoryImpl(gh<_i52.TechniquesRemoteDataSource>()));
  gh.lazySingleton<_i58.RemoteGymDataSource>(() => _i59.RemoteGymDataSourceImpl(
        gh<_i8.FirebaseFirestore>(),
        gh<_i5.FirebaseAuth>(),
      ));
  gh.lazySingletonAsync<_i60.AnaliticsService>(() async =>
      _i61.FirebaseAnaliticsService(
          await gh.getAsync<_i4.FirebaseAnalytics>()));
  gh.lazySingleton<_i62.SettingsRepository>(
      () => _i63.SettingsRepositoryImpl(gh<_i27.SettingsDataSource>()));
  gh.lazySingleton<_i64.IceTreaningsRepository>(
      () => _i65.IceTreaningsRepositoryImpl(gh<_i31.IceTreaningsDataSource>()));
  gh.lazySingleton<_i66.ImageCashManager>(() =>
      _i66.ImageCashManagerImpl(cacheManager: gh<_i7.DefaultCacheManager>()));
  gh.lazySingleton<_i67.DeleteTechniqueGroupUsecase>(
      () => _i67.DeleteTechniqueGroupUsecase(gh<_i56.TechniquesRepository>()));
  gh.lazySingleton<_i68.DeleteTechniqueUsecase>(
      () => _i68.DeleteTechniqueUsecase(gh<_i56.TechniquesRepository>()));
  gh.lazySingleton<_i69.GetTechniquesEditingUsecase>(
      () => _i69.GetTechniquesEditingUsecase(gh<_i56.TechniquesRepository>()));
  gh.lazySingleton<_i70.GetTechniquesUsecase>(
      () => _i70.GetTechniquesUsecase(gh<_i56.TechniquesRepository>()));
  gh.lazySingleton<_i71.GetTechniqueGroupsUsecase>(
      () => _i71.GetTechniqueGroupsUsecase(gh<_i56.TechniquesRepository>()));
  gh.lazySingleton<_i72.SaveTechniqueGroupUsecase>(
      () => _i72.SaveTechniqueGroupUsecase(gh<_i56.TechniquesRepository>()));
  gh.lazySingleton<_i73.SaveTechniqueUsecase>(
      () => _i73.SaveTechniqueUsecase(gh<_i56.TechniquesRepository>()));
  gh.lazySingleton<_i74.TravelRegionsDataSource>(
      () => _i75.HiveTravelRegionsDataSource(gh<_i6.HiveInterface>()));
  gh.lazySingleton<_i76.RockRegionsRemoteDataSource>(
      () => _i77.FirebaseRockRegionsRemoteDataSource(
            gh<_i8.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i78.StrengthExerciseDataSource>(
      () => _i79.LocalStrengthExerciseDataSource(gh<_i25.LocalDBDatasource>()));
  gh.factory<_i80.AscensionCubit>(() => _i80.AscensionCubit(
        gh<_i37.AddAscensionUsecase>(),
        gh<_i40.GetAscensionUsecase>(),
        gh<_i39.FinishAscensionUsecase>(),
        gh<_i38.EditAscensionEventUsecase>(),
      ));
  gh.lazySingleton<_i81.TrekkingRepository>(
      () => _i82.TrekkingRepositoryImpl(gh<_i41.TrekkingRemoteDataSource>()));
  gh.lazySingleton<_i83.HallTreaningDataSource>(
      () => _i84.LocalHallTreaningDataSource(gh<_i25.LocalDBDatasource>()));
  gh.lazySingleton<_i85.CardioTreaningsDatasource>(
      () => _i86.LocalCardioTreaningsDatasource(gh<_i25.LocalDBDatasource>()));
  gh.factory<_i87.TechniquesCubit>(() => _i87.TechniquesCubit(
        gh<_i70.GetTechniquesUsecase>(),
        gh<_i69.GetTechniquesEditingUsecase>(),
        gh<_i68.DeleteTechniqueUsecase>(),
        gh<_i73.SaveTechniqueUsecase>(),
      ));
  gh.lazySingleton<_i88.StrengthExerciseRepository>(() =>
      _i89.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: gh<_i78.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i90.TrekkingPathLocalDataSource>(() =>
      _i91.DriftTrekkingPathLocalDataSource(gh<_i25.LocalDBDatasource>()));
  gh.lazySingleton<_i92.StrengthTreaningsDataSource>(() =>
      _i93.LocalStrengthTreaningsDataSource(gh<_i25.LocalDBDatasource>()));
  gh.lazySingleton<_i94.TravelLocalDatasource>(
      () => _i95.DriftTravelLocalDatasource(gh<_i25.LocalDBDatasource>()));
  gh.lazySingleton<_i96.AddTechniqueToTreaningUseCase>(() =>
      _i96.AddTechniqueToTreaningUseCase(
          gh<_i54.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i97.AddTechniqueTreaningUseCase>(() =>
      _i97.AddTechniqueTreaningUseCase(
          gh<_i54.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i98.CurrentTechniqueTreaningUseCase>(() =>
      _i98.CurrentTechniqueTreaningUseCase(
          gh<_i54.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i99.DeleteTechniqueTreaningUseCase>(() =>
      _i99.DeleteTechniqueTreaningUseCase(
          gh<_i54.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i100.EditTechniqueItemUseCase>(() =>
      _i100.EditTechniqueItemUseCase(gh<_i54.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i101.FinishTechniqueTreaningUseCase>(() =>
      _i101.FinishTechniqueTreaningUseCase(
          gh<_i54.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i102.PreviosTechniqueTreaningUseCase>(() =>
      _i102.PreviosTechniqueTreaningUseCase(
          gh<_i54.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i103.RockTreaningsLocalDataSource>(() =>
      _i104.DriftRockTreaningsLocalDataSource(gh<_i25.LocalDBDatasource>()));
  gh.factory<_i105.TechniqueGroupsCubit>(() => _i105.TechniqueGroupsCubit(
        gh<_i71.GetTechniqueGroupsUsecase>(),
        gh<_i69.GetTechniquesEditingUsecase>(),
        gh<_i67.DeleteTechniqueGroupUsecase>(),
        gh<_i72.SaveTechniqueGroupUsecase>(),
      ));
  gh.lazySingleton<_i106.TravelRegionsRepository>(() =>
      _i107.TravelRegionsRepositoryImpl(gh<_i74.TravelRegionsDataSource>()));
  gh.lazySingleton<_i108.DeleteIceAttempt>(
      () => _i108.DeleteIceAttempt(gh<_i64.IceTreaningsRepository>()));
  gh.lazySingleton<_i109.FinishIceAttempt>(
      () => _i109.FinishIceAttempt(gh<_i64.IceTreaningsRepository>()));
  gh.lazySingleton<_i110.NewIceAttempt>(
      () => _i110.NewIceAttempt(gh<_i64.IceTreaningsRepository>()));
  gh.lazySingleton<_i111.GetTravelRegionsUsecase>(
      () => _i111.GetTravelRegionsUsecase(gh<_i106.TravelRegionsRepository>()));
  gh.lazySingleton<_i112.PlacesRepository>(() => _i113.PlacesRepositoryImpl(
        gh<_i17.PlacesLocalDataSource>(),
        gh<_i21.PlacesRemoteDataSource>(),
        gh<_i49.NetworkInfo>(),
      ));
  gh.lazySingleton<_i114.IceRegionsRepository>(
      () => _i115.IceRegionsRepositoryImpl(
            gh<_i11.IceRegionsDataSource>(),
            gh<_i47.IceRegionsRemoteDataSource>(),
            gh<_i49.NetworkInfo>(),
          ));
  gh.lazySingleton<_i116.DeleteStrengthExercise>(() =>
      _i116.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>()));
  gh.lazySingleton<_i117.GetStrengthExercises>(() => _i117.GetStrengthExercises(
      strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>()));
  gh.lazySingleton<_i118.SaveStrengthExercise>(() => _i118.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>()));
  gh.lazySingleton<_i119.SelectToUseStrengthExercise>(() =>
      _i119.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>()));
  gh.factory<_i120.TechniqueTreaningCubit>(() => _i120.TechniqueTreaningCubit(
        gh<_i97.AddTechniqueTreaningUseCase>(),
        gh<_i102.PreviosTechniqueTreaningUseCase>(),
        gh<_i98.CurrentTechniqueTreaningUseCase>(),
        gh<_i96.AddTechniqueToTreaningUseCase>(),
        gh<_i101.FinishTechniqueTreaningUseCase>(),
        gh<_i100.EditTechniqueItemUseCase>(),
      ));
  gh.factory<_i121.AuthGetUser>(
      () => _i121.AuthGetUser(authRepository: gh<_i50.AuthRepository>()));
  gh.factory<_i122.AuthLogin>(
      () => _i122.AuthLogin(authRepository: gh<_i50.AuthRepository>()));
  gh.factory<_i123.AuthLogout>(
      () => _i123.AuthLogout(authRepository: gh<_i50.AuthRepository>()));
  gh.lazySingleton<_i124.TrekkingPathRepository>(() =>
      _i125.TrekkingPathRepositoryImpl(gh<_i90.TrekkingPathLocalDataSource>()));
  gh.factory<_i126.AuthenticationCubit>(() => _i126.AuthenticationCubit(
        gh<_i122.AuthLogin>(),
        gh<_i123.AuthLogout>(),
        gh<_i121.AuthGetUser>(),
      ));
  gh.lazySingleton<_i127.ClimbingHallRepository>(
      () => _i128.ClimbingHallRepositoryImpl(
            gh<_i13.ClimbingHallDataSource>(),
            gh<_i58.RemoteGymDataSource>(),
            gh<_i49.NetworkInfo>(),
          ));
  gh.lazySingleton<_i129.FinishIceTreaning>(() => _i129.FinishIceTreaning(
      iceTreaningsRepository: gh<_i64.IceTreaningsRepository>()));
  gh.lazySingleton<_i130.GetCurrentIceTreaning>(() =>
      _i130.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i64.IceTreaningsRepository>()));
  gh.lazySingleton<_i131.GetLastIceTreaning>(() => _i131.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i64.IceTreaningsRepository>()));
  gh.lazySingleton<_i132.IceSectorToTreaning>(() => _i132.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i64.IceTreaningsRepository>()));
  gh.lazySingleton<_i133.MountainRegionsRepository>(
      () => _i134.MountainRegionsRepositoryImpl(
            gh<_i15.MountainRegionsLocalDataSource>(),
            gh<_i43.MountainRegionsRemoteDataSource>(),
            gh<_i66.ImageCashManager>(),
          ));
  gh.lazySingleton<_i135.LoadSimpleSettingsUsecase>(
      () => _i135.LoadSimpleSettingsUsecase(gh<_i62.SettingsRepository>()));
  gh.lazySingleton<_i136.LoadTreaningsSettings>(
      () => _i136.LoadTreaningsSettings(gh<_i62.SettingsRepository>()));
  gh.lazySingleton<_i137.SaveSimpleSettingsUsecase>(
      () => _i137.SaveSimpleSettingsUsecase(gh<_i62.SettingsRepository>()));
  gh.lazySingleton<_i138.SaveTreaningsSettings>(
      () => _i138.SaveTreaningsSettings(gh<_i62.SettingsRepository>()));
  gh.factory<_i139.StrengthExercisesCubit>(() => _i139.StrengthExercisesCubit(
        gh<_i117.GetStrengthExercises>(),
        gh<_i118.SaveStrengthExercise>(),
        gh<_i119.SelectToUseStrengthExercise>(),
        gh<_i116.DeleteStrengthExercise>(),
      ));
  gh.lazySingleton<_i140.RockRegionsRepository>(
      () => _i141.RockRegionsRepositoryImpl(
            gh<_i23.RockRegionsLocalDataSource>(),
            gh<_i76.RockRegionsRemoteDataSource>(),
            gh<_i49.NetworkInfo>(),
          ));
  gh.lazySingleton<_i142.DeleteTrek>(
      () => _i142.DeleteTrek(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i143.DeleteTrekPoint>(
      () => _i143.DeleteTrekPoint(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i144.GetTrekkingRegions>(
      () => _i144.GetTrekkingRegions(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i145.GetTreks>(
      () => _i145.GetTreks(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i146.GetTrekPoints>(
      () => _i146.GetTrekPoints(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i147.SaveTrek>(
      () => _i147.SaveTrek(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i148.SaveTrekPoint>(
      () => _i148.SaveTrekPoint(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i149.NewHallRoute>(() => _i149.NewHallRoute(
      climbingHallRepository: gh<_i127.ClimbingHallRepository>()));
  gh.lazySingleton<_i150.RockTreaningsRepository>(() =>
      _i151.RockTreaningsRepositoryImpl(
          gh<_i103.RockTreaningsLocalDataSource>()));
  gh.lazySingleton<_i152.HallTreaningRepository>(
      () => _i153.HallTreaningRepositoryImpl(
            dataSource: gh<_i83.HallTreaningDataSource>(),
            hallDataSource: gh<_i13.ClimbingHallDataSource>(),
          ));
  gh.factory<_i154.TrekkingRegionsCubit>(
      () => _i154.TrekkingRegionsCubit(gh<_i144.GetTrekkingRegions>()));
  gh.lazySingleton<_i155.DeleteRockAttempt>(
      () => _i155.DeleteRockAttempt(gh<_i150.RockTreaningsRepository>()));
  gh.lazySingleton<_i156.FinishRockAttempt>(
      () => _i156.FinishRockAttempt(gh<_i150.RockTreaningsRepository>()));
  gh.lazySingleton<_i157.FinishRockTreaning>(
      () => _i157.FinishRockTreaning(gh<_i150.RockTreaningsRepository>()));
  gh.lazySingleton<_i158.GetCurrentRockTreaning>(
      () => _i158.GetCurrentRockTreaning(gh<_i150.RockTreaningsRepository>()));
  gh.lazySingleton<_i159.GetLastRockTreaning>(
      () => _i159.GetLastRockTreaning(gh<_i150.RockTreaningsRepository>()));
  gh.lazySingleton<_i160.NewRockAttempt>(
      () => _i160.NewRockAttempt(gh<_i150.RockTreaningsRepository>()));
  gh.lazySingleton<_i161.NewRockTreaning>(
      () => _i161.NewRockTreaning(gh<_i150.RockTreaningsRepository>()));
  gh.lazySingleton<_i162.RockSectorToTreaning>(
      () => _i162.RockSectorToTreaning(gh<_i150.RockTreaningsRepository>()));
  gh.lazySingleton<_i163.AllHallTreanings>(
      () => _i163.AllHallTreanings(gh<_i152.HallTreaningRepository>()));
  gh.lazySingleton<_i164.CurrentHallTreaning>(
      () => _i164.CurrentHallTreaning(gh<_i152.HallTreaningRepository>()));
  gh.lazySingleton<_i165.LastHallTreaning>(
      () => _i165.LastHallTreaning(gh<_i152.HallTreaningRepository>()));
  gh.lazySingleton<_i166.StrengthTreaningsRepository>(() =>
      _i167.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource: gh<_i92.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i168.CardioTreaningsRepository>(() =>
      _i169.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i85.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i170.DeleteSectorUseCase>(() => _i170.DeleteSectorUseCase(
      iceRegionsRepository: gh<_i114.IceRegionsRepository>()));
  gh.lazySingleton<_i171.LoadDistrictsUseCase>(() => _i171.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i114.IceRegionsRepository>()));
  gh.lazySingleton<_i172.LoadSectorsUseCase>(() => _i172.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i114.IceRegionsRepository>()));
  gh.lazySingleton<_i173.SaveSectorUseCase>(() => _i173.SaveSectorUseCase(
      iceRegionsRepository: gh<_i114.IceRegionsRepository>()));
  gh.lazySingleton<_i174.TravelRepository>(
      () => _i175.TravelRepositoryImpl(gh<_i94.TravelLocalDatasource>()));
  gh.factory<_i176.TreksCubit>(() => _i176.TreksCubit(
        gh<_i145.GetTreks>(),
        gh<_i146.GetTrekPoints>(),
        gh<_i142.DeleteTrek>(),
        gh<_i143.DeleteTrekPoint>(),
        gh<_i147.SaveTrek>(),
        gh<_i148.SaveTrekPoint>(),
      ));
  gh.lazySingleton<_i177.NewHallAttemptFromRoute>(() =>
      _i177.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i152.HallTreaningRepository>()));
  gh.lazySingleton<_i178.LoadPlaces>(
      () => _i178.LoadPlaces(gh<_i112.PlacesRepository>()));
  gh.lazySingleton<_i179.NewIceTreaning>(() => _i179.NewIceTreaning(
        iceTreaningsRepository: gh<_i64.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i114.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i180.DeleteCardioTreaning>(() => _i180.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i168.CardioTreaningsRepository>()));
  gh.lazySingleton<_i181.GetCardioTreanings>(() => _i181.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i168.CardioTreaningsRepository>()));
  gh.lazySingleton<_i182.GetLastCardioTreaning>(() =>
      _i182.GetLastCardioTreaning(
          cardioTreaningsRepository: gh<_i168.CardioTreaningsRepository>()));
  gh.lazySingleton<_i183.SaveCardioTreaning>(() => _i183.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i168.CardioTreaningsRepository>()));
  gh.lazySingleton<_i184.AllClimbingHalls>(
      () => _i184.AllClimbingHalls(gh<_i127.ClimbingHallRepository>()));
  gh.lazySingleton<_i185.GetClimbingHallRoures>(
      () => _i185.GetClimbingHallRoures(gh<_i127.ClimbingHallRepository>()));
  gh.factory<_i186.CardioTreaningCubit>(() => _i186.CardioTreaningCubit(
        gh<_i182.GetLastCardioTreaning>(),
        gh<_i183.SaveCardioTreaning>(),
      ));
  gh.lazySingleton<_i187.GetGymRouteStatistic>(
      () => _i187.GetGymRouteStatistic(gh<_i152.HallTreaningRepository>()));
  gh.factory<_i188.IceDistrictsCubit>(() => _i188.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i171.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i189.AddTrekEventUsecase>(
      () => _i189.AddTrekEventUsecase(gh<_i124.TrekkingPathRepository>()));
  gh.lazySingleton<_i190.ContinueTrekUsecase>(
      () => _i190.ContinueTrekUsecase(gh<_i124.TrekkingPathRepository>()));
  gh.lazySingleton<_i191.CurrentTrekkingPathUsecase>(() =>
      _i191.CurrentTrekkingPathUsecase(gh<_i124.TrekkingPathRepository>()));
  gh.lazySingleton<_i192.PreviosTrekkingPathUsecase>(() =>
      _i192.PreviosTrekkingPathUsecase(gh<_i124.TrekkingPathRepository>()));
  gh.lazySingleton<_i193.StartTrekUsecase>(
      () => _i193.StartTrekUsecase(gh<_i124.TrekkingPathRepository>()));
  gh.lazySingleton<_i194.DeleteHallAttempt>(() => _i194.DeleteHallAttempt(
      treaningRepository: gh<_i152.HallTreaningRepository>()));
  gh.lazySingleton<_i195.DeleteHallTreaning>(() => _i195.DeleteHallTreaning(
      treaningRepository: gh<_i152.HallTreaningRepository>()));
  gh.lazySingleton<_i196.FinishHallAttempt>(() => _i196.FinishHallAttempt(
      treaningRepository: gh<_i152.HallTreaningRepository>()));
  gh.lazySingleton<_i197.FinishHallTreaning>(() => _i197.FinishHallTreaning(
      treaningRepository: gh<_i152.HallTreaningRepository>()));
  gh.lazySingleton<_i198.NewHallAttempt>(() => _i198.NewHallAttempt(
      treaningRepository: gh<_i152.HallTreaningRepository>()));
  gh.lazySingleton<_i199.NewHallTreaning>(() => _i199.NewHallTreaning(
      treaningRepository: gh<_i152.HallTreaningRepository>()));
  gh.factory<_i200.CurrentHallTreaningCubit>(
      () => _i200.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i177.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i199.NewHallTreaning>(),
            newHallAttempt: gh<_i198.NewHallAttempt>(),
            currentHallTreaning: gh<_i164.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i196.FinishHallAttempt>(),
            finishHallTreaning: gh<_i197.FinishHallTreaning>(),
            lastHallTreaning: gh<_i165.LastHallTreaning>(),
            deleteHallAttempt: gh<_i194.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i187.GetGymRouteStatistic>(),
          ));
  gh.lazySingleton<_i201.AddMyMountainRegionUseCase>(() =>
      _i201.AddMyMountainRegionUseCase(gh<_i133.MountainRegionsRepository>()));
  gh.lazySingleton<_i202.DeleteMyMountainRegionUseCase>(() =>
      _i202.DeleteMyMountainRegionUseCase(
          gh<_i133.MountainRegionsRepository>()));
  gh.lazySingleton<_i203.GetMountains>(
      () => _i203.GetMountains(gh<_i133.MountainRegionsRepository>()));
  gh.lazySingleton<_i204.GetMountainRegions>(
      () => _i204.GetMountainRegions(gh<_i133.MountainRegionsRepository>()));
  gh.lazySingleton<_i205.GetMountainRoutes>(
      () => _i205.GetMountainRoutes(gh<_i133.MountainRegionsRepository>()));
  gh.lazySingleton<_i206.GetMyMountainRegions>(
      () => _i206.GetMyMountainRegions(gh<_i133.MountainRegionsRepository>()));
  gh.lazySingleton<_i207.SaveMountainRouteUsecase>(() =>
      _i207.SaveMountainRouteUsecase(gh<_i133.MountainRegionsRepository>()));
  gh.lazySingleton<_i208.SaveMountainUsecase>(
      () => _i208.SaveMountainUsecase(gh<_i133.MountainRegionsRepository>()));
  gh.factory<_i209.HallRouteCubit>(
      () => _i209.HallRouteCubit(gh<_i149.NewHallRoute>()));
  gh.lazySingleton<_i210.HallRouteToArchive>(() =>
      _i210.HallRouteToArchive(repository: gh<_i127.ClimbingHallRepository>()));
  gh.factory<_i211.IceSectorsCubit>(() => _i211.IceSectorsCubit(
        gh<_i172.LoadSectorsUseCase>(),
        gh<_i173.SaveSectorUseCase>(),
        gh<_i170.DeleteSectorUseCase>(),
      ));
  gh.lazySingleton<_i212.DeleteRockRoute>(
      () => _i212.DeleteRockRoute(gh<_i140.RockRegionsRepository>()));
  gh.lazySingleton<_i213.DeleteRockSector>(
      () => _i213.DeleteRockSector(gh<_i140.RockRegionsRepository>()));
  gh.lazySingleton<_i214.LoadRockDistricts>(
      () => _i214.LoadRockDistricts(gh<_i140.RockRegionsRepository>()));
  gh.lazySingleton<_i215.LoadRockRoutes>(
      () => _i215.LoadRockRoutes(gh<_i140.RockRegionsRepository>()));
  gh.lazySingleton<_i216.LoadRockSectors>(
      () => _i216.LoadRockSectors(gh<_i140.RockRegionsRepository>()));
  gh.lazySingleton<_i217.SaveRockRoute>(
      () => _i217.SaveRockRoute(gh<_i140.RockRegionsRepository>()));
  gh.lazySingleton<_i218.SaveRockSector>(
      () => _i218.SaveRockSector(gh<_i140.RockRegionsRepository>()));
  gh.lazySingleton<_i219.SettingsCubit>(() => _i219.SettingsCubit(
        gh<_i136.LoadTreaningsSettings>(),
        gh<_i138.SaveTreaningsSettings>(),
        gh<_i178.LoadPlaces>(),
        gh<_i135.LoadSimpleSettingsUsecase>(),
        gh<_i137.SaveSimpleSettingsUsecase>(),
      ));
  gh.lazySingleton<_i220.AddRepetitionForStrengthTreaning>(() =>
      _i220.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i166.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i221.DeleteRepetitionForStrengthTreaning>(() =>
      _i221.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i166.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i222.DeleteStrengthTreaning>(() =>
      _i222.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i166.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i223.FinishStrengthTreaning>(() =>
      _i223.FinishStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i166.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i224.GetCurrentStrengthTreaning>(() =>
      _i224.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i166.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i225.GetPreviosStrengthTreaning>(() =>
      _i225.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i166.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i226.GetStrengthTreanings>(() => _i226.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i166.StrengthTreaningsRepository>()));
  gh.factory<_i227.MountainRegionsCubit>(() => _i227.MountainRegionsCubit(
        gh<_i204.GetMountainRegions>(),
        gh<_i206.GetMyMountainRegions>(),
        gh<_i201.AddMyMountainRegionUseCase>(),
        gh<_i202.DeleteMyMountainRegionUseCase>(),
      ));
  gh.lazySingleton<_i228.AddTravelUsecase>(
      () => _i228.AddTravelUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i229.CurrentTravelUsecase>(
      () => _i229.CurrentTravelUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i230.EditTravelUsecase>(
      () => _i230.EditTravelUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i231.GetCurrentTravelDayUsecase>(
      () => _i231.GetCurrentTravelDayUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i232.GetTravelsUsecase>(
      () => _i232.GetTravelsUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i233.DeleteBudgetLineUsecase>(
      () => _i233.DeleteBudgetLineUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i234.DeleteCostLineUsecase>(
      () => _i234.DeleteCostLineUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i235.DeleteInsuranceLineUsecase>(
      () => _i235.DeleteInsuranceLineUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i236.EditBudgetLineUsecase>(
      () => _i236.EditBudgetLineUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i237.EditCostLineUsecase>(
      () => _i237.EditCostLineUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i238.EditDayLineUsecase>(
      () => _i238.EditDayLineUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i239.EditInsuranceLineUsecase>(
      () => _i239.EditInsuranceLineUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i240.GetBudgetLinesUsecase>(
      () => _i240.GetBudgetLinesUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i241.GetCostLinesUsecase>(
      () => _i241.GetCostLinesUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i242.GetDayLinesUsecase>(
      () => _i242.GetDayLinesUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i243.GetInsuranceLineUsecase>(
      () => _i243.GetInsuranceLineUsecase(gh<_i174.TravelRepository>()));
  gh.lazySingleton<_i244.GetHallRouteAttempts>(() => _i244.GetHallRouteAttempts(
      repository: gh<_i152.HallTreaningRepository>()));
  gh.lazySingleton<_i245.AddStrengthTreaning>(() => _i245.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i166.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i246.UpdateStrengthTreaningExercises>(() =>
      _i246.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: gh<_i166.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>(),
      ));
  gh.factory<_i247.HallTreaningsCubit>(() => _i247.HallTreaningsCubit(
        allHallTreanings: gh<_i163.AllHallTreanings>(),
        deleteHallTreaning: gh<_i195.DeleteHallTreaning>(),
      ));
  gh.factory<_i248.HallRouteAttemptsCubit>(() => _i248.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i244.GetHallRouteAttempts>()));
  gh.lazySingleton<_i249.GetRockRouteAttempts>(
      () => _i249.GetRockRouteAttempts(gh<_i150.RockTreaningsRepository>()));
  gh.lazySingleton<_i250.GetRockRouteStatistic>(
      () => _i250.GetRockRouteStatistic(gh<_i150.RockTreaningsRepository>()));
  gh.factory<_i251.ClimbingHallCubit>(() => _i251.ClimbingHallCubit(
        gh<_i185.GetClimbingHallRoures>(),
        gh<_i210.HallRouteToArchive>(),
        gh<_i187.GetGymRouteStatistic>(),
      ));
  gh.factory<_i252.CardioTreaningsCubit>(() => _i252.CardioTreaningsCubit(
        gh<_i181.GetCardioTreanings>(),
        gh<_i180.DeleteCardioTreaning>(),
        gh<_i183.SaveCardioTreaning>(),
      ));
  gh.factory<_i253.MountainRoutesCubit>(() => _i253.MountainRoutesCubit(
        gh<_i205.GetMountainRoutes>(),
        gh<_i207.SaveMountainRouteUsecase>(),
      ));
  gh.lazySingleton<_i254.DeleteTreaning>(() => _i254.DeleteTreaning(
        gh<_i152.HallTreaningRepository>(),
        gh<_i64.IceTreaningsRepository>(),
        gh<_i166.StrengthTreaningsRepository>(),
        gh<_i168.CardioTreaningsRepository>(),
        gh<_i150.RockTreaningsRepository>(),
        gh<_i124.TrekkingPathRepository>(),
        gh<_i54.TechniqueTreaningsRepository>(),
        gh<_i33.AscensionRepository>(),
      ));
  gh.factory<_i255.RockSectorsCubit>(() => _i255.RockSectorsCubit(
        gh<_i216.LoadRockSectors>(),
        gh<_i213.DeleteRockSector>(),
        gh<_i218.SaveRockSector>(),
      ));
  gh.factory<_i256.CurrentTravelCubit>(() => _i256.CurrentTravelCubit(
        gh<_i229.CurrentTravelUsecase>(),
        gh<_i237.EditCostLineUsecase>(),
        gh<_i231.GetCurrentTravelDayUsecase>(),
      ));
  gh.factory<_i257.MountainsCubit>(() => _i257.MountainsCubit(
        gh<_i203.GetMountains>(),
        gh<_i208.SaveMountainUsecase>(),
      ));
  gh.lazySingleton<_i258.ExportTreaningsUseCase>(
      () => _i258.ExportTreaningsUseCase(
            gh<_i152.HallTreaningRepository>(),
            gh<_i64.IceTreaningsRepository>(),
            gh<_i166.StrengthTreaningsRepository>(),
            gh<_i168.CardioTreaningsRepository>(),
            gh<_i150.RockTreaningsRepository>(),
            gh<_i174.TravelRepository>(),
            gh<_i124.TrekkingPathRepository>(),
            gh<_i54.TechniqueTreaningsRepository>(),
            gh<_i33.AscensionRepository>(),
          ));
  gh.lazySingleton<_i259.GetAllTreanings>(() => _i259.GetAllTreanings(
        gh<_i152.HallTreaningRepository>(),
        gh<_i64.IceTreaningsRepository>(),
        gh<_i166.StrengthTreaningsRepository>(),
        gh<_i168.CardioTreaningsRepository>(),
        gh<_i150.RockTreaningsRepository>(),
        gh<_i174.TravelRepository>(),
        gh<_i124.TrekkingPathRepository>(),
        gh<_i54.TechniqueTreaningsRepository>(),
        gh<_i33.AscensionRepository>(),
      ));
  gh.lazySingleton<_i260.ImportTreaningsUseCase>(
      () => _i260.ImportTreaningsUseCase(
            gh<_i152.HallTreaningRepository>(),
            gh<_i64.IceTreaningsRepository>(),
            gh<_i166.StrengthTreaningsRepository>(),
            gh<_i168.CardioTreaningsRepository>(),
            gh<_i150.RockTreaningsRepository>(),
            gh<_i174.TravelRepository>(),
            gh<_i124.TrekkingPathRepository>(),
            gh<_i54.TechniqueTreaningsRepository>(),
            gh<_i33.AscensionRepository>(),
          ));
  gh.factory<_i261.TravelsCubit>(() => _i261.TravelsCubit(
        gh<_i232.GetTravelsUsecase>(),
        gh<_i228.AddTravelUsecase>(),
      ));
  gh.factory<_i262.CurrentIceTreaningCubit>(() => _i262.CurrentIceTreaningCubit(
        gh<_i179.NewIceTreaning>(),
        gh<_i132.IceSectorToTreaning>(),
        gh<_i110.NewIceAttempt>(),
        gh<_i109.FinishIceAttempt>(),
        gh<_i129.FinishIceTreaning>(),
        gh<_i130.GetCurrentIceTreaning>(),
        gh<_i131.GetLastIceTreaning>(),
        gh<_i108.DeleteIceAttempt>(),
      ));
  gh.factory<_i263.StrengthTrainingCubit>(() => _i263.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i224.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i225.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i245.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i246.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i220.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i223.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i221.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i264.ClimbingHallsCubit>(() =>
      _i264.ClimbingHallsCubit(allClimbingHalls: gh<_i184.AllClimbingHalls>()));
  gh.factory<_i265.HomePageCubit>(() =>
      _i265.HomePageCubit(allClimbingHalls: gh<_i184.AllClimbingHalls>()));
  gh.factory<_i266.StrengthTrainingsCubit>(() => _i266.StrengthTrainingsCubit(
        gh<_i226.GetStrengthTreanings>(),
        gh<_i222.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i267.TreaningsCubit>(() => _i267.TreaningsCubit(
        gh<_i259.GetAllTreanings>(),
        gh<_i254.DeleteTreaning>(),
      ));
  gh.factory<_i268.TravelDayCubit>(
      () => _i268.TravelDayCubit(gh<_i238.EditDayLineUsecase>()));
  gh.factory<_i269.TrekkingCubit>(() => _i269.TrekkingCubit(
        gh<_i191.CurrentTrekkingPathUsecase>(),
        gh<_i192.PreviosTrekkingPathUsecase>(),
        gh<_i193.StartTrekUsecase>(),
        gh<_i189.AddTrekEventUsecase>(),
        gh<_i190.ContinueTrekUsecase>(),
      ));
  gh.factory<_i270.RockRoutesCubit>(() => _i270.RockRoutesCubit(
        gh<_i215.LoadRockRoutes>(),
        gh<_i250.GetRockRouteStatistic>(),
        gh<_i212.DeleteRockRoute>(),
        gh<_i217.SaveRockRoute>(),
      ));
  gh.factory<_i271.RockTreaningCubit>(() => _i271.RockTreaningCubit(
        gh<_i161.NewRockTreaning>(),
        gh<_i162.RockSectorToTreaning>(),
        gh<_i160.NewRockAttempt>(),
        gh<_i156.FinishRockAttempt>(),
        gh<_i157.FinishRockTreaning>(),
        gh<_i159.GetLastRockTreaning>(),
        gh<_i158.GetCurrentRockTreaning>(),
        gh<_i250.GetRockRouteStatistic>(),
        gh<_i155.DeleteRockAttempt>(),
      ));
  gh.factory<_i272.TravelPageCubit>(() => _i272.TravelPageCubit(
        gh<_i234.DeleteCostLineUsecase>(),
        gh<_i237.EditCostLineUsecase>(),
        gh<_i241.GetCostLinesUsecase>(),
        gh<_i243.GetInsuranceLineUsecase>(),
        gh<_i240.GetBudgetLinesUsecase>(),
        gh<_i239.EditInsuranceLineUsecase>(),
        gh<_i236.EditBudgetLineUsecase>(),
        gh<_i235.DeleteInsuranceLineUsecase>(),
        gh<_i233.DeleteBudgetLineUsecase>(),
        gh<_i242.GetDayLinesUsecase>(),
        gh<_i10.GetFeedingStatisticUsecase>(),
        gh<_i230.EditTravelUsecase>(),
        gh<_i111.GetTravelRegionsUsecase>(),
      ));
  gh.factory<_i273.RockDistrictsCubit>(
      () => _i273.RockDistrictsCubit(gh<_i214.LoadRockDistricts>()));
  gh.factory<_i274.TreaningsExportImportCubit>(
      () => _i274.TreaningsExportImportCubit(
            gh<_i258.ExportTreaningsUseCase>(),
            gh<_i260.ImportTreaningsUseCase>(),
          ));
  return getIt;
}

class _$InjectableModule extends _i275.InjectableModule {}

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

import 'core/datasource/drift_db_local_datasource.dart' as _i25;
import 'core/datasource/local_db_datasource.dart' as _i24;
import 'core/injectable_module.dart' as _i273;
import 'core/services/analitics/analitics_service.dart' as _i59;
import 'core/services/analitics/firebase_analitics_service.dart' as _i60;
import 'core/services/crash_log_service/crash_log_service.dart' as _i18;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i19;
import 'core/services/network/network_info.dart' as _i48;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i44;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i45;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i50;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i49;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i129;
import 'features/authentication/domain/usecases/auth_login.dart' as _i130;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i131;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i135;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i85;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i86;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i178;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i177;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i189;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i190;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i191;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i192;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i195;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i252;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i12;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i83;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i13;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i84;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i57;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i58;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i137;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i161;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i136;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i160;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i193;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i194;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i196;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i244;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i211;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i156;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i171;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i172;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i203;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i204;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i205;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i206;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i173;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i207;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i186;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i208;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i251;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i262;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i209;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i210;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i248;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i247;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i263;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i47;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i10;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i46;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i30;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i11;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i31;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i123;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i64;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i122;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i63;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i108;
import 'features/ice_climbing/domain/usecases/delete_sector_usecase.dart'
    as _i181;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i109;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i138;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i139;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i140;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i141;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i179;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i180;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i110;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i188;
import 'features/ice_climbing/domain/usecases/save_sector_usecase.dart'
    as _i182;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i260;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i197;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i212;
import 'features/mountaineering/data/datasources/drift_local_ascension_datasource.dart'
    as _i29;
import 'features/mountaineering/data/datasources/firebase_mountain_regions_remote_datasource.dart'
    as _i43;
import 'features/mountaineering/data/datasources/hive_mountain_regions_local_datasource.dart'
    as _i15;
import 'features/mountaineering/data/datasources/local_ascension_datasource.dart'
    as _i28;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i14;
import 'features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart'
    as _i42;
import 'features/mountaineering/data/repositories/ascension_repository_impl.dart'
    as _i33;
import 'features/mountaineering/data/repositories/mountain_regions_repository_impl.dart'
    as _i66;
import 'features/mountaineering/domain/repositories/ascension_repository.dart'
    as _i32;
import 'features/mountaineering/domain/repositories/mountain_regions_repository.dart'
    as _i65;
import 'features/mountaineering/domain/usecases/add_ascension_usecase.dart'
    as _i36;
import 'features/mountaineering/domain/usecases/add_my_mountain_region_usecase.dart'
    as _i120;
import 'features/mountaineering/domain/usecases/delete_my_mountain_region_usecase.dart'
    as _i121;
import 'features/mountaineering/domain/usecases/edit_ascension_event_usecase.dart'
    as _i37;
import 'features/mountaineering/domain/usecases/finish_ascension_usecase.dart'
    as _i38;
import 'features/mountaineering/domain/usecases/get_ascension_usecase.dart'
    as _i39;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i115;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i116;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i114;
import 'features/mountaineering/domain/usecases/get_my_mountain_regions.dart'
    as _i119;
import 'features/mountaineering/domain/usecases/save_mountain_route_usecase.dart'
    as _i117;
import 'features/mountaineering/domain/usecases/save_mountain_usecase.dart'
    as _i118;
import 'features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart'
    as _i80;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i134;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i159;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i176;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i104;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i77;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i23;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i22;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i76;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i103;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i148;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i158;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i147;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i157;
import 'features/rock_climbing/domain/usecases/delete_rock_attempt.dart'
    as _i163;
import 'features/rock_climbing/domain/usecases/delete_rock_route.dart' as _i216;
import 'features/rock_climbing/domain/usecases/delete_rock_sector.dart'
    as _i217;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i164;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i165;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i166;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i167;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i249;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i250;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i213;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i214;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i215;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i168;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i169;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i170;
import 'features/rock_climbing/domain/usecases/save_rock_route.dart' as _i218;
import 'features/rock_climbing/domain/usecases/save_rock_sector.dart' as _i219;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i271;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i268;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i254;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i269;
import 'features/settings/data/datasources/firebase_places_remote_datasource.dart'
    as _i21;
import 'features/settings/data/datasources/hive_places_local_datasource.dart'
    as _i17;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i27;
import 'features/settings/data/datasources/places_local_datasource.dart'
    as _i16;
import 'features/settings/data/datasources/places_remote_datasource.dart'
    as _i20;
import 'features/settings/data/datasources/settings_datasource.dart' as _i26;
import 'features/settings/data/repositories/places_repository_impl.dart'
    as _i113;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i62;
import 'features/settings/domain/repositories/places_repository.dart' as _i112;
import 'features/settings/domain/repositories/settings_repository.dart' as _i61;
import 'features/settings/domain/usecases/load_places.dart' as _i187;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i142;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i143;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i144;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i145;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i220;
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
    as _i175;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i88;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i174;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i221;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i245;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i222;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i124;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i223;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i224;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i225;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i226;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i125;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i227;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i126;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i127;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i246;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i146;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i261;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i264;
import 'features/techniques/data/datasources/drift_technique_treanings_local_datasource.dart'
    as _i35;
import 'features/techniques/data/datasources/firebase_techniques_remote_datasource.dart'
    as _i52;
import 'features/techniques/data/datasources/technique_treanings_local_datasource.dart'
    as _i34;
import 'features/techniques/data/datasources/techniques_remote_datasource.dart'
    as _i51;
import 'features/techniques/data/repositories/technique_treanings_repository_impl.dart'
    as _i54;
import 'features/techniques/data/repositories/techniques_repository_impl.dart'
    as _i56;
import 'features/techniques/domain/repositories/technique_treanings_repository.dart'
    as _i53;
import 'features/techniques/domain/repositories/techniques_repository.dart'
    as _i55;
import 'features/techniques/domain/usecases/add_technique_to_treaning_usecase.dart'
    as _i96;
import 'features/techniques/domain/usecases/add_technique_treaning_usecase.dart'
    as _i97;
import 'features/techniques/domain/usecases/current_technique_treaning_usecase.dart'
    as _i98;
import 'features/techniques/domain/usecases/delete_technique_group_usecase.dart'
    as _i72;
import 'features/techniques/domain/usecases/delete_technique_treaning_usecase.dart'
    as _i99;
import 'features/techniques/domain/usecases/delete_technique_usecase.dart'
    as _i70;
import 'features/techniques/domain/usecases/edit_technique_item_usecase.dart'
    as _i100;
import 'features/techniques/domain/usecases/finish_technique_treaning_usecase.dart'
    as _i101;
import 'features/techniques/domain/usecases/get_technique_groups_usecase.dart'
    as _i68;
import 'features/techniques/domain/usecases/get_techniques_editing_usecase.dart'
    as _i69;
import 'features/techniques/domain/usecases/get_techniques_usecase.dart'
    as _i67;
import 'features/techniques/domain/usecases/previos_technique_treaning_usecase.dart'
    as _i102;
import 'features/techniques/domain/usecases/save_technique_group_usecase.dart'
    as _i73;
import 'features/techniques/domain/usecases/save_technique_usecase.dart'
    as _i71;
import 'features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart'
    as _i105;
import 'features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart'
    as _i128;
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
import 'features/traveling/data/repositories/travel_repository.dart' as _i184;
import 'features/traveling/domain/repositories/travel_regions_repository.dart'
    as _i106;
import 'features/traveling/domain/repositories/travel_repository.dart' as _i183;
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
    as _i9;
import 'features/traveling/domain/usecases/travel_page/get_insurance_lines_usecase.dart'
    as _i243;
import 'features/traveling/domain/usecases/travel_page/get_travel_regions_usecase.dart'
    as _i111;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i255;
import 'features/traveling/presentation/cubit/travel_day/travel_day_cubit.dart'
    as _i266;
import 'features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart'
    as _i270;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i259;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i253;
import 'features/treanings/domain/usecases/export_treanings_usecase.dart'
    as _i256;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i257;
import 'features/treanings/domain/usecases/import_treanings_usecase.dart'
    as _i258;
import 'features/treanings/presentation/cubit/treanings/treanings_cubit.dart'
    as _i265;
import 'features/treanings/presentation/cubit/treanings_export_import/treanings_export_import_cubit.dart'
    as _i272;
import 'features/trekking/data/datasources/drift_trekking_path_local_datasource.dart'
    as _i91;
import 'features/trekking/data/datasources/firebase_trekking_remote_datasource.dart'
    as _i41;
import 'features/trekking/data/datasources/trekking_path_local_datasource.dart'
    as _i90;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i40;
import 'features/trekking/data/repositories/trekking_path_repository_impl.dart'
    as _i133;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i82;
import 'features/trekking/domain/repositories/trekking_path_repository.dart'
    as _i132;
import 'features/trekking/domain/repositories/trekking_repository.dart' as _i81;
import 'features/trekking/domain/usecases/add_trek_event_usecase.dart' as _i198;
import 'features/trekking/domain/usecases/continue_trek_usecase.dart' as _i199;
import 'features/trekking/domain/usecases/current_trekking_path_usecase.dart'
    as _i200;
import 'features/trekking/domain/usecases/delete_trek.dart' as _i152;
import 'features/trekking/domain/usecases/delete_trek_point.dart' as _i153;
import 'features/trekking/domain/usecases/get_trek_points.dart' as _i151;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i149;
import 'features/trekking/domain/usecases/get_treks.dart' as _i150;
import 'features/trekking/domain/usecases/previos_trekking_path_usecase.dart'
    as _i201;
import 'features/trekking/domain/usecases/save_trek.dart' as _i154;
import 'features/trekking/domain/usecases/save_trek_point.dart' as _i155;
import 'features/trekking/domain/usecases/start_trek_usecase.dart' as _i202;
import 'features/trekking/presentation/bloc/trekking/trekking_cubit.dart'
    as _i267;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i162;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i185;

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
  gh.lazySingleton<_i12.ClimbingHallDataSource>(
      () => _i13.LocalClimbingHallDataSource());
  gh.lazySingleton<_i14.MountainRegionsLocalDataSource>(
      () => _i15.HiveMountainRegionsLocalDataSource());
  gh.lazySingleton<_i16.PlacesLocalDataSource>(
      () => _i17.HivePlacesLocalDataSource());
  gh.lazySingletonAsync<_i18.CrashLogService>(() async =>
      _i19.GoogleCrashLogService(await gh.getAsync<_i3.FirebaseCrashlytics>()));
  gh.lazySingleton<_i20.PlacesRemoteDataSource>(
      () => _i21.FirebasePlacesRemoteDataSource(gh<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i22.RockRegionsLocalDataSource>(
      () => _i23.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i24.LocalDBDatasource>(() => _i25.DriftDBLocalDataSource());
  gh.lazySingleton<_i26.SettingsDataSource>(
      () => _i27.SettingsDataSourceImpl());
  gh.lazySingleton<_i28.LocalAscensionDataSource>(
      () => _i29.DriftLocalAscensionDataSource(gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i30.IceTreaningsDataSource>(
      () => _i31.LocalIceTreaningsDataSource(gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i32.AscensionRepository>(
      () => _i33.AscensionRepositoryImpl(gh<_i28.LocalAscensionDataSource>()));
  gh.lazySingleton<_i34.TechniqueTreaningsLocalDataSource>(() =>
      _i35.DriftTechniqueTreaningsLocalDataSource(
          gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i36.AddAscensionUsecase>(
      () => _i36.AddAscensionUsecase(gh<_i32.AscensionRepository>()));
  gh.lazySingleton<_i37.EditAscensionEventUsecase>(
      () => _i37.EditAscensionEventUsecase(gh<_i32.AscensionRepository>()));
  gh.lazySingleton<_i38.FinishAscensionUsecase>(
      () => _i38.FinishAscensionUsecase(gh<_i32.AscensionRepository>()));
  gh.lazySingleton<_i39.GetAscensionUsecase>(
      () => _i39.GetAscensionUsecase(gh<_i32.AscensionRepository>()));
  gh.lazySingleton<_i40.TrekkingRemoteDataSource>(
      () => _i41.FirebaseTrekkingRemoteDatasource(
            gh<_i7.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i42.MountainRegionsRemoteDataSource>(
      () => _i43.FirebaseMountainRegionsRemoteDataSource(
            gh<_i7.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i44.AuthDataSource>(
      () => _i45.FirebaseAuthDataSource(firebaseAuth: gh<_i5.FirebaseAuth>()));
  gh.lazySingleton<_i46.IceRegionsRemoteDataSource>(
      () => _i47.FirebaseIceRegionsRemoteDataSource(
            gh<_i7.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i48.NetworkInfo>(
      () => _i48.NetworkInfoImpl(gh<_i8.InternetConnectionChecker>()));
  gh.lazySingleton<_i49.AuthRepository>(
      () => _i50.AuthRepositoryImpl(authDataSource: gh<_i44.AuthDataSource>()));
  gh.lazySingleton<_i51.TechniquesRemoteDataSource>(
      () => _i52.FirebaseTechniquesRemoteDataSource(
            gh<_i7.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i53.TechniqueTreaningsRepository>(() =>
      _i54.TechniqueTreaningsRepositoryImpl(
          gh<_i34.TechniqueTreaningsLocalDataSource>()));
  gh.lazySingleton<_i55.TechniquesRepository>(() =>
      _i56.TechniquesRepositoryImpl(gh<_i51.TechniquesRemoteDataSource>()));
  gh.lazySingleton<_i57.RemoteGymDataSource>(() => _i58.RemoteGymDataSourceImpl(
        gh<_i7.FirebaseFirestore>(),
        gh<_i5.FirebaseAuth>(),
      ));
  gh.lazySingletonAsync<_i59.AnaliticsService>(() async =>
      _i60.FirebaseAnaliticsService(
          await gh.getAsync<_i4.FirebaseAnalytics>()));
  gh.lazySingleton<_i61.SettingsRepository>(
      () => _i62.SettingsRepositoryImpl(gh<_i26.SettingsDataSource>()));
  gh.lazySingleton<_i63.IceTreaningsRepository>(
      () => _i64.IceTreaningsRepositoryImpl(gh<_i30.IceTreaningsDataSource>()));
  gh.lazySingleton<_i65.MountainRegionsRepository>(
      () => _i66.MountainRegionsRepositoryImpl(
            gh<_i14.MountainRegionsLocalDataSource>(),
            gh<_i42.MountainRegionsRemoteDataSource>(),
          ));
  gh.lazySingleton<_i67.GetTechniquesUsecase>(
      () => _i67.GetTechniquesUsecase(gh<_i55.TechniquesRepository>()));
  gh.lazySingleton<_i68.GetTechniqueGroupsUsecase>(
      () => _i68.GetTechniqueGroupsUsecase(gh<_i55.TechniquesRepository>()));
  gh.lazySingleton<_i69.GetTechniquesEditingUsecase>(
      () => _i69.GetTechniquesEditingUsecase(gh<_i55.TechniquesRepository>()));
  gh.lazySingleton<_i70.DeleteTechniqueUsecase>(
      () => _i70.DeleteTechniqueUsecase(gh<_i55.TechniquesRepository>()));
  gh.lazySingleton<_i71.SaveTechniqueUsecase>(
      () => _i71.SaveTechniqueUsecase(gh<_i55.TechniquesRepository>()));
  gh.lazySingleton<_i72.DeleteTechniqueGroupUsecase>(
      () => _i72.DeleteTechniqueGroupUsecase(gh<_i55.TechniquesRepository>()));
  gh.lazySingleton<_i73.SaveTechniqueGroupUsecase>(
      () => _i73.SaveTechniqueGroupUsecase(gh<_i55.TechniquesRepository>()));
  gh.lazySingleton<_i74.TravelRegionsDataSource>(
      () => _i75.HiveTravelRegionsDataSource(gh<_i6.HiveInterface>()));
  gh.lazySingleton<_i76.RockRegionsRemoteDataSource>(
      () => _i77.FirebaseRockRegionsRemoteDataSource(
            gh<_i7.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i78.StrengthExerciseDataSource>(
      () => _i79.LocalStrengthExerciseDataSource(gh<_i24.LocalDBDatasource>()));
  gh.factory<_i80.AscensionCubit>(() => _i80.AscensionCubit(
        gh<_i36.AddAscensionUsecase>(),
        gh<_i39.GetAscensionUsecase>(),
        gh<_i38.FinishAscensionUsecase>(),
        gh<_i37.EditAscensionEventUsecase>(),
      ));
  gh.lazySingleton<_i81.TrekkingRepository>(
      () => _i82.TrekkingRepositoryImpl(gh<_i40.TrekkingRemoteDataSource>()));
  gh.lazySingleton<_i83.HallTreaningDataSource>(
      () => _i84.LocalHallTreaningDataSource(gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i85.CardioTreaningsDatasource>(
      () => _i86.LocalCardioTreaningsDatasource(gh<_i24.LocalDBDatasource>()));
  gh.factory<_i87.TechniquesCubit>(() => _i87.TechniquesCubit(
        gh<_i67.GetTechniquesUsecase>(),
        gh<_i69.GetTechniquesEditingUsecase>(),
        gh<_i70.DeleteTechniqueUsecase>(),
        gh<_i71.SaveTechniqueUsecase>(),
      ));
  gh.lazySingleton<_i88.StrengthExerciseRepository>(() =>
      _i89.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: gh<_i78.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i90.TrekkingPathLocalDataSource>(() =>
      _i91.DriftTrekkingPathLocalDataSource(gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i92.StrengthTreaningsDataSource>(() =>
      _i93.LocalStrengthTreaningsDataSource(gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i94.TravelLocalDatasource>(
      () => _i95.DriftTravelLocalDatasource(gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i96.AddTechniqueToTreaningUseCase>(() =>
      _i96.AddTechniqueToTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i97.AddTechniqueTreaningUseCase>(() =>
      _i97.AddTechniqueTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i98.CurrentTechniqueTreaningUseCase>(() =>
      _i98.CurrentTechniqueTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i99.DeleteTechniqueTreaningUseCase>(() =>
      _i99.DeleteTechniqueTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i100.EditTechniqueItemUseCase>(() =>
      _i100.EditTechniqueItemUseCase(gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i101.FinishTechniqueTreaningUseCase>(() =>
      _i101.FinishTechniqueTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i102.PreviosTechniqueTreaningUseCase>(() =>
      _i102.PreviosTechniqueTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i103.RockTreaningsLocalDataSource>(() =>
      _i104.DriftRockTreaningsLocalDataSource(gh<_i24.LocalDBDatasource>()));
  gh.factory<_i105.TechniqueGroupsCubit>(() => _i105.TechniqueGroupsCubit(
        gh<_i68.GetTechniqueGroupsUsecase>(),
        gh<_i69.GetTechniquesEditingUsecase>(),
        gh<_i72.DeleteTechniqueGroupUsecase>(),
        gh<_i73.SaveTechniqueGroupUsecase>(),
      ));
  gh.lazySingleton<_i106.TravelRegionsRepository>(() =>
      _i107.TravelRegionsRepositoryImpl(gh<_i74.TravelRegionsDataSource>()));
  gh.lazySingleton<_i108.DeleteIceAttempt>(
      () => _i108.DeleteIceAttempt(gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i109.FinishIceAttempt>(
      () => _i109.FinishIceAttempt(gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i110.NewIceAttempt>(
      () => _i110.NewIceAttempt(gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i111.GetTravelRegionsUsecase>(
      () => _i111.GetTravelRegionsUsecase(gh<_i106.TravelRegionsRepository>()));
  gh.lazySingleton<_i112.PlacesRepository>(() => _i113.PlacesRepositoryImpl(
        gh<_i16.PlacesLocalDataSource>(),
        gh<_i20.PlacesRemoteDataSource>(),
        gh<_i48.NetworkInfo>(),
      ));
  gh.lazySingleton<_i114.GetMountains>(
      () => _i114.GetMountains(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i115.GetMountainRegions>(
      () => _i115.GetMountainRegions(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i116.GetMountainRoutes>(
      () => _i116.GetMountainRoutes(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i117.SaveMountainRouteUsecase>(() =>
      _i117.SaveMountainRouteUsecase(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i118.SaveMountainUsecase>(
      () => _i118.SaveMountainUsecase(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i119.GetMyMountainRegions>(
      () => _i119.GetMyMountainRegions(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i120.AddMyMountainRegionUseCase>(() =>
      _i120.AddMyMountainRegionUseCase(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i121.DeleteMyMountainRegionUseCase>(() =>
      _i121.DeleteMyMountainRegionUseCase(
          gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i122.IceRegionsRepository>(
      () => _i123.IceRegionsRepositoryImpl(
            gh<_i10.IceRegionsDataSource>(),
            gh<_i46.IceRegionsRemoteDataSource>(),
            gh<_i48.NetworkInfo>(),
          ));
  gh.lazySingleton<_i124.DeleteStrengthExercise>(() =>
      _i124.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>()));
  gh.lazySingleton<_i125.GetStrengthExercises>(() => _i125.GetStrengthExercises(
      strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>()));
  gh.lazySingleton<_i126.SaveStrengthExercise>(() => _i126.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>()));
  gh.lazySingleton<_i127.SelectToUseStrengthExercise>(() =>
      _i127.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>()));
  gh.factory<_i128.TechniqueTreaningCubit>(() => _i128.TechniqueTreaningCubit(
        gh<_i97.AddTechniqueTreaningUseCase>(),
        gh<_i102.PreviosTechniqueTreaningUseCase>(),
        gh<_i98.CurrentTechniqueTreaningUseCase>(),
        gh<_i96.AddTechniqueToTreaningUseCase>(),
        gh<_i101.FinishTechniqueTreaningUseCase>(),
        gh<_i100.EditTechniqueItemUseCase>(),
      ));
  gh.factory<_i129.AuthGetUser>(
      () => _i129.AuthGetUser(authRepository: gh<_i49.AuthRepository>()));
  gh.factory<_i130.AuthLogin>(
      () => _i130.AuthLogin(authRepository: gh<_i49.AuthRepository>()));
  gh.factory<_i131.AuthLogout>(
      () => _i131.AuthLogout(authRepository: gh<_i49.AuthRepository>()));
  gh.lazySingleton<_i132.TrekkingPathRepository>(() =>
      _i133.TrekkingPathRepositoryImpl(gh<_i90.TrekkingPathLocalDataSource>()));
  gh.factory<_i134.MountainRegionsCubit>(() => _i134.MountainRegionsCubit(
        gh<_i115.GetMountainRegions>(),
        gh<_i119.GetMyMountainRegions>(),
        gh<_i120.AddMyMountainRegionUseCase>(),
        gh<_i121.DeleteMyMountainRegionUseCase>(),
      ));
  gh.factory<_i135.AuthenticationCubit>(() => _i135.AuthenticationCubit(
        gh<_i130.AuthLogin>(),
        gh<_i131.AuthLogout>(),
        gh<_i129.AuthGetUser>(),
      ));
  gh.lazySingleton<_i136.ClimbingHallRepository>(
      () => _i137.ClimbingHallRepositoryImpl(
            gh<_i12.ClimbingHallDataSource>(),
            gh<_i57.RemoteGymDataSource>(),
            gh<_i48.NetworkInfo>(),
          ));
  gh.lazySingleton<_i138.FinishIceTreaning>(() => _i138.FinishIceTreaning(
      iceTreaningsRepository: gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i139.GetCurrentIceTreaning>(() =>
      _i139.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i140.GetLastIceTreaning>(() => _i140.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i141.IceSectorToTreaning>(() => _i141.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i142.LoadSimpleSettingsUsecase>(
      () => _i142.LoadSimpleSettingsUsecase(gh<_i61.SettingsRepository>()));
  gh.lazySingleton<_i143.LoadTreaningsSettings>(
      () => _i143.LoadTreaningsSettings(gh<_i61.SettingsRepository>()));
  gh.lazySingleton<_i144.SaveSimpleSettingsUsecase>(
      () => _i144.SaveSimpleSettingsUsecase(gh<_i61.SettingsRepository>()));
  gh.lazySingleton<_i145.SaveTreaningsSettings>(
      () => _i145.SaveTreaningsSettings(gh<_i61.SettingsRepository>()));
  gh.factory<_i146.StrengthExercisesCubit>(() => _i146.StrengthExercisesCubit(
        gh<_i125.GetStrengthExercises>(),
        gh<_i126.SaveStrengthExercise>(),
        gh<_i127.SelectToUseStrengthExercise>(),
        gh<_i124.DeleteStrengthExercise>(),
      ));
  gh.lazySingleton<_i147.RockRegionsRepository>(
      () => _i148.RockRegionsRepositoryImpl(
            gh<_i22.RockRegionsLocalDataSource>(),
            gh<_i76.RockRegionsRemoteDataSource>(),
            gh<_i48.NetworkInfo>(),
          ));
  gh.lazySingleton<_i149.GetTrekkingRegions>(
      () => _i149.GetTrekkingRegions(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i150.GetTreks>(
      () => _i150.GetTreks(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i151.GetTrekPoints>(
      () => _i151.GetTrekPoints(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i152.DeleteTrek>(
      () => _i152.DeleteTrek(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i153.DeleteTrekPoint>(
      () => _i153.DeleteTrekPoint(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i154.SaveTrek>(
      () => _i154.SaveTrek(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i155.SaveTrekPoint>(
      () => _i155.SaveTrekPoint(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i156.NewHallRoute>(() => _i156.NewHallRoute(
      climbingHallRepository: gh<_i136.ClimbingHallRepository>()));
  gh.lazySingleton<_i157.RockTreaningsRepository>(() =>
      _i158.RockTreaningsRepositoryImpl(
          gh<_i103.RockTreaningsLocalDataSource>()));
  gh.factory<_i159.MountainRoutesCubit>(() => _i159.MountainRoutesCubit(
        gh<_i116.GetMountainRoutes>(),
        gh<_i117.SaveMountainRouteUsecase>(),
      ));
  gh.lazySingleton<_i160.HallTreaningRepository>(
      () => _i161.HallTreaningRepositoryImpl(
            dataSource: gh<_i83.HallTreaningDataSource>(),
            hallDataSource: gh<_i12.ClimbingHallDataSource>(),
          ));
  gh.factory<_i162.TrekkingRegionsCubit>(
      () => _i162.TrekkingRegionsCubit(gh<_i149.GetTrekkingRegions>()));
  gh.lazySingleton<_i163.DeleteRockAttempt>(
      () => _i163.DeleteRockAttempt(gh<_i157.RockTreaningsRepository>()));
  gh.lazySingleton<_i164.FinishRockAttempt>(
      () => _i164.FinishRockAttempt(gh<_i157.RockTreaningsRepository>()));
  gh.lazySingleton<_i165.FinishRockTreaning>(
      () => _i165.FinishRockTreaning(gh<_i157.RockTreaningsRepository>()));
  gh.lazySingleton<_i166.GetCurrentRockTreaning>(
      () => _i166.GetCurrentRockTreaning(gh<_i157.RockTreaningsRepository>()));
  gh.lazySingleton<_i167.GetLastRockTreaning>(
      () => _i167.GetLastRockTreaning(gh<_i157.RockTreaningsRepository>()));
  gh.lazySingleton<_i168.NewRockAttempt>(
      () => _i168.NewRockAttempt(gh<_i157.RockTreaningsRepository>()));
  gh.lazySingleton<_i169.NewRockTreaning>(
      () => _i169.NewRockTreaning(gh<_i157.RockTreaningsRepository>()));
  gh.lazySingleton<_i170.RockSectorToTreaning>(
      () => _i170.RockSectorToTreaning(gh<_i157.RockTreaningsRepository>()));
  gh.lazySingleton<_i171.AllHallTreanings>(
      () => _i171.AllHallTreanings(gh<_i160.HallTreaningRepository>()));
  gh.lazySingleton<_i172.CurrentHallTreaning>(
      () => _i172.CurrentHallTreaning(gh<_i160.HallTreaningRepository>()));
  gh.lazySingleton<_i173.LastHallTreaning>(
      () => _i173.LastHallTreaning(gh<_i160.HallTreaningRepository>()));
  gh.lazySingleton<_i174.StrengthTreaningsRepository>(() =>
      _i175.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource: gh<_i92.StrengthTreaningsDataSource>()));
  gh.factory<_i176.MountainsCubit>(() => _i176.MountainsCubit(
        gh<_i114.GetMountains>(),
        gh<_i118.SaveMountainUsecase>(),
      ));
  gh.lazySingleton<_i177.CardioTreaningsRepository>(() =>
      _i178.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i85.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i179.LoadDistrictsUseCase>(() => _i179.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i122.IceRegionsRepository>()));
  gh.lazySingleton<_i180.LoadSectorsUseCase>(() => _i180.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i122.IceRegionsRepository>()));
  gh.lazySingleton<_i181.DeleteSectorUseCase>(() => _i181.DeleteSectorUseCase(
      iceRegionsRepository: gh<_i122.IceRegionsRepository>()));
  gh.lazySingleton<_i182.SaveSectorUseCase>(() => _i182.SaveSectorUseCase(
      iceRegionsRepository: gh<_i122.IceRegionsRepository>()));
  gh.lazySingleton<_i183.TravelRepository>(
      () => _i184.TravelRepositoryImpl(gh<_i94.TravelLocalDatasource>()));
  gh.factory<_i185.TreksCubit>(() => _i185.TreksCubit(
        gh<_i150.GetTreks>(),
        gh<_i151.GetTrekPoints>(),
        gh<_i152.DeleteTrek>(),
        gh<_i153.DeleteTrekPoint>(),
        gh<_i154.SaveTrek>(),
        gh<_i155.SaveTrekPoint>(),
      ));
  gh.lazySingleton<_i186.NewHallAttemptFromRoute>(() =>
      _i186.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i160.HallTreaningRepository>()));
  gh.lazySingleton<_i187.LoadPlaces>(
      () => _i187.LoadPlaces(gh<_i112.PlacesRepository>()));
  gh.lazySingleton<_i188.NewIceTreaning>(() => _i188.NewIceTreaning(
        iceTreaningsRepository: gh<_i63.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i122.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i189.DeleteCardioTreaning>(() => _i189.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i177.CardioTreaningsRepository>()));
  gh.lazySingleton<_i190.GetCardioTreanings>(() => _i190.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i177.CardioTreaningsRepository>()));
  gh.lazySingleton<_i191.GetLastCardioTreaning>(() =>
      _i191.GetLastCardioTreaning(
          cardioTreaningsRepository: gh<_i177.CardioTreaningsRepository>()));
  gh.lazySingleton<_i192.SaveCardioTreaning>(() => _i192.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i177.CardioTreaningsRepository>()));
  gh.lazySingleton<_i193.AllClimbingHalls>(
      () => _i193.AllClimbingHalls(gh<_i136.ClimbingHallRepository>()));
  gh.lazySingleton<_i194.GetClimbingHallRoures>(
      () => _i194.GetClimbingHallRoures(gh<_i136.ClimbingHallRepository>()));
  gh.factory<_i195.CardioTreaningCubit>(() => _i195.CardioTreaningCubit(
        gh<_i191.GetLastCardioTreaning>(),
        gh<_i192.SaveCardioTreaning>(),
      ));
  gh.lazySingleton<_i196.GetGymRouteStatistic>(
      () => _i196.GetGymRouteStatistic(gh<_i160.HallTreaningRepository>()));
  gh.factory<_i197.IceDistrictsCubit>(() => _i197.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i179.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i198.AddTrekEventUsecase>(
      () => _i198.AddTrekEventUsecase(gh<_i132.TrekkingPathRepository>()));
  gh.lazySingleton<_i199.ContinueTrekUsecase>(
      () => _i199.ContinueTrekUsecase(gh<_i132.TrekkingPathRepository>()));
  gh.lazySingleton<_i200.CurrentTrekkingPathUsecase>(() =>
      _i200.CurrentTrekkingPathUsecase(gh<_i132.TrekkingPathRepository>()));
  gh.lazySingleton<_i201.PreviosTrekkingPathUsecase>(() =>
      _i201.PreviosTrekkingPathUsecase(gh<_i132.TrekkingPathRepository>()));
  gh.lazySingleton<_i202.StartTrekUsecase>(
      () => _i202.StartTrekUsecase(gh<_i132.TrekkingPathRepository>()));
  gh.lazySingleton<_i203.DeleteHallAttempt>(() => _i203.DeleteHallAttempt(
      treaningRepository: gh<_i160.HallTreaningRepository>()));
  gh.lazySingleton<_i204.DeleteHallTreaning>(() => _i204.DeleteHallTreaning(
      treaningRepository: gh<_i160.HallTreaningRepository>()));
  gh.lazySingleton<_i205.FinishHallAttempt>(() => _i205.FinishHallAttempt(
      treaningRepository: gh<_i160.HallTreaningRepository>()));
  gh.lazySingleton<_i206.FinishHallTreaning>(() => _i206.FinishHallTreaning(
      treaningRepository: gh<_i160.HallTreaningRepository>()));
  gh.lazySingleton<_i207.NewHallAttempt>(() => _i207.NewHallAttempt(
      treaningRepository: gh<_i160.HallTreaningRepository>()));
  gh.lazySingleton<_i208.NewHallTreaning>(() => _i208.NewHallTreaning(
      treaningRepository: gh<_i160.HallTreaningRepository>()));
  gh.factory<_i209.CurrentHallTreaningCubit>(
      () => _i209.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i186.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i208.NewHallTreaning>(),
            newHallAttempt: gh<_i207.NewHallAttempt>(),
            currentHallTreaning: gh<_i172.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i205.FinishHallAttempt>(),
            finishHallTreaning: gh<_i206.FinishHallTreaning>(),
            lastHallTreaning: gh<_i173.LastHallTreaning>(),
            deleteHallAttempt: gh<_i203.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i196.GetGymRouteStatistic>(),
          ));
  gh.factory<_i210.HallRouteCubit>(
      () => _i210.HallRouteCubit(gh<_i156.NewHallRoute>()));
  gh.lazySingleton<_i211.HallRouteToArchive>(() =>
      _i211.HallRouteToArchive(repository: gh<_i136.ClimbingHallRepository>()));
  gh.factory<_i212.IceSectorsCubit>(() => _i212.IceSectorsCubit(
        gh<_i180.LoadSectorsUseCase>(),
        gh<_i182.SaveSectorUseCase>(),
        gh<_i181.DeleteSectorUseCase>(),
      ));
  gh.lazySingleton<_i213.LoadRockDistricts>(
      () => _i213.LoadRockDistricts(gh<_i147.RockRegionsRepository>()));
  gh.lazySingleton<_i214.LoadRockRoutes>(
      () => _i214.LoadRockRoutes(gh<_i147.RockRegionsRepository>()));
  gh.lazySingleton<_i215.LoadRockSectors>(
      () => _i215.LoadRockSectors(gh<_i147.RockRegionsRepository>()));
  gh.lazySingleton<_i216.DeleteRockRoute>(
      () => _i216.DeleteRockRoute(gh<_i147.RockRegionsRepository>()));
  gh.lazySingleton<_i217.DeleteRockSector>(
      () => _i217.DeleteRockSector(gh<_i147.RockRegionsRepository>()));
  gh.lazySingleton<_i218.SaveRockRoute>(
      () => _i218.SaveRockRoute(gh<_i147.RockRegionsRepository>()));
  gh.lazySingleton<_i219.SaveRockSector>(
      () => _i219.SaveRockSector(gh<_i147.RockRegionsRepository>()));
  gh.lazySingleton<_i220.SettingsCubit>(() => _i220.SettingsCubit(
        gh<_i143.LoadTreaningsSettings>(),
        gh<_i145.SaveTreaningsSettings>(),
        gh<_i187.LoadPlaces>(),
        gh<_i142.LoadSimpleSettingsUsecase>(),
        gh<_i144.SaveSimpleSettingsUsecase>(),
      ));
  gh.lazySingleton<_i221.AddRepetitionForStrengthTreaning>(() =>
      _i221.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i174.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i222.DeleteRepetitionForStrengthTreaning>(() =>
      _i222.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i174.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i223.DeleteStrengthTreaning>(() =>
      _i223.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i174.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i224.FinishStrengthTreaning>(() =>
      _i224.FinishStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i174.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i225.GetCurrentStrengthTreaning>(() =>
      _i225.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i174.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i226.GetPreviosStrengthTreaning>(() =>
      _i226.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i174.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i227.GetStrengthTreanings>(() => _i227.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i174.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i228.AddTravelUsecase>(
      () => _i228.AddTravelUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i229.CurrentTravelUsecase>(
      () => _i229.CurrentTravelUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i230.EditTravelUsecase>(
      () => _i230.EditTravelUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i231.GetCurrentTravelDayUsecase>(
      () => _i231.GetCurrentTravelDayUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i232.GetTravelsUsecase>(
      () => _i232.GetTravelsUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i233.DeleteBudgetLineUsecase>(
      () => _i233.DeleteBudgetLineUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i234.DeleteCostLineUsecase>(
      () => _i234.DeleteCostLineUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i235.DeleteInsuranceLineUsecase>(
      () => _i235.DeleteInsuranceLineUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i236.EditBudgetLineUsecase>(
      () => _i236.EditBudgetLineUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i237.EditCostLineUsecase>(
      () => _i237.EditCostLineUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i238.EditDayLineUsecase>(
      () => _i238.EditDayLineUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i239.EditInsuranceLineUsecase>(
      () => _i239.EditInsuranceLineUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i240.GetBudgetLinesUsecase>(
      () => _i240.GetBudgetLinesUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i241.GetCostLinesUsecase>(
      () => _i241.GetCostLinesUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i242.GetDayLinesUsecase>(
      () => _i242.GetDayLinesUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i243.GetInsuranceLineUsecase>(
      () => _i243.GetInsuranceLineUsecase(gh<_i183.TravelRepository>()));
  gh.lazySingleton<_i244.GetHallRouteAttempts>(() => _i244.GetHallRouteAttempts(
      repository: gh<_i160.HallTreaningRepository>()));
  gh.lazySingleton<_i245.AddStrengthTreaning>(() => _i245.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i174.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i246.UpdateStrengthTreaningExercises>(() =>
      _i246.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: gh<_i174.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i88.StrengthExerciseRepository>(),
      ));
  gh.factory<_i247.HallTreaningsCubit>(() => _i247.HallTreaningsCubit(
        allHallTreanings: gh<_i171.AllHallTreanings>(),
        deleteHallTreaning: gh<_i204.DeleteHallTreaning>(),
      ));
  gh.factory<_i248.HallRouteAttemptsCubit>(() => _i248.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i244.GetHallRouteAttempts>()));
  gh.lazySingleton<_i249.GetRockRouteAttempts>(
      () => _i249.GetRockRouteAttempts(gh<_i157.RockTreaningsRepository>()));
  gh.lazySingleton<_i250.GetRockRouteStatistic>(
      () => _i250.GetRockRouteStatistic(gh<_i157.RockTreaningsRepository>()));
  gh.factory<_i251.ClimbingHallCubit>(() => _i251.ClimbingHallCubit(
        gh<_i194.GetClimbingHallRoures>(),
        gh<_i211.HallRouteToArchive>(),
        gh<_i196.GetGymRouteStatistic>(),
      ));
  gh.factory<_i252.CardioTreaningsCubit>(() => _i252.CardioTreaningsCubit(
        gh<_i190.GetCardioTreanings>(),
        gh<_i189.DeleteCardioTreaning>(),
        gh<_i192.SaveCardioTreaning>(),
      ));
  gh.lazySingleton<_i253.DeleteTreaning>(() => _i253.DeleteTreaning(
        gh<_i160.HallTreaningRepository>(),
        gh<_i63.IceTreaningsRepository>(),
        gh<_i174.StrengthTreaningsRepository>(),
        gh<_i177.CardioTreaningsRepository>(),
        gh<_i157.RockTreaningsRepository>(),
        gh<_i132.TrekkingPathRepository>(),
        gh<_i53.TechniqueTreaningsRepository>(),
        gh<_i32.AscensionRepository>(),
      ));
  gh.factory<_i254.RockSectorsCubit>(() => _i254.RockSectorsCubit(
        gh<_i215.LoadRockSectors>(),
        gh<_i217.DeleteRockSector>(),
        gh<_i219.SaveRockSector>(),
      ));
  gh.factory<_i255.CurrentTravelCubit>(() => _i255.CurrentTravelCubit(
        gh<_i229.CurrentTravelUsecase>(),
        gh<_i237.EditCostLineUsecase>(),
        gh<_i231.GetCurrentTravelDayUsecase>(),
      ));
  gh.lazySingleton<_i256.ExportTreaningsUseCase>(
      () => _i256.ExportTreaningsUseCase(
            gh<_i160.HallTreaningRepository>(),
            gh<_i63.IceTreaningsRepository>(),
            gh<_i174.StrengthTreaningsRepository>(),
            gh<_i177.CardioTreaningsRepository>(),
            gh<_i157.RockTreaningsRepository>(),
            gh<_i183.TravelRepository>(),
            gh<_i132.TrekkingPathRepository>(),
            gh<_i53.TechniqueTreaningsRepository>(),
            gh<_i32.AscensionRepository>(),
          ));
  gh.lazySingleton<_i257.GetAllTreanings>(() => _i257.GetAllTreanings(
        gh<_i160.HallTreaningRepository>(),
        gh<_i63.IceTreaningsRepository>(),
        gh<_i174.StrengthTreaningsRepository>(),
        gh<_i177.CardioTreaningsRepository>(),
        gh<_i157.RockTreaningsRepository>(),
        gh<_i183.TravelRepository>(),
        gh<_i132.TrekkingPathRepository>(),
        gh<_i53.TechniqueTreaningsRepository>(),
        gh<_i32.AscensionRepository>(),
      ));
  gh.lazySingleton<_i258.ImportTreaningsUseCase>(
      () => _i258.ImportTreaningsUseCase(
            gh<_i160.HallTreaningRepository>(),
            gh<_i63.IceTreaningsRepository>(),
            gh<_i174.StrengthTreaningsRepository>(),
            gh<_i177.CardioTreaningsRepository>(),
            gh<_i157.RockTreaningsRepository>(),
            gh<_i183.TravelRepository>(),
            gh<_i132.TrekkingPathRepository>(),
            gh<_i53.TechniqueTreaningsRepository>(),
            gh<_i32.AscensionRepository>(),
          ));
  gh.factory<_i259.TravelsCubit>(() => _i259.TravelsCubit(
        gh<_i232.GetTravelsUsecase>(),
        gh<_i228.AddTravelUsecase>(),
      ));
  gh.factory<_i260.CurrentIceTreaningCubit>(() => _i260.CurrentIceTreaningCubit(
        gh<_i188.NewIceTreaning>(),
        gh<_i141.IceSectorToTreaning>(),
        gh<_i110.NewIceAttempt>(),
        gh<_i109.FinishIceAttempt>(),
        gh<_i138.FinishIceTreaning>(),
        gh<_i139.GetCurrentIceTreaning>(),
        gh<_i140.GetLastIceTreaning>(),
        gh<_i108.DeleteIceAttempt>(),
      ));
  gh.factory<_i261.StrengthTrainingCubit>(() => _i261.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i225.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i226.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i245.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i246.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i221.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i224.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i222.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i262.ClimbingHallsCubit>(() =>
      _i262.ClimbingHallsCubit(allClimbingHalls: gh<_i193.AllClimbingHalls>()));
  gh.factory<_i263.HomePageCubit>(() =>
      _i263.HomePageCubit(allClimbingHalls: gh<_i193.AllClimbingHalls>()));
  gh.factory<_i264.StrengthTrainingsCubit>(() => _i264.StrengthTrainingsCubit(
        gh<_i227.GetStrengthTreanings>(),
        gh<_i223.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i265.TreaningsCubit>(() => _i265.TreaningsCubit(
        gh<_i257.GetAllTreanings>(),
        gh<_i253.DeleteTreaning>(),
      ));
  gh.factory<_i266.TravelDayCubit>(
      () => _i266.TravelDayCubit(gh<_i238.EditDayLineUsecase>()));
  gh.factory<_i267.TrekkingCubit>(() => _i267.TrekkingCubit(
        gh<_i200.CurrentTrekkingPathUsecase>(),
        gh<_i201.PreviosTrekkingPathUsecase>(),
        gh<_i202.StartTrekUsecase>(),
        gh<_i198.AddTrekEventUsecase>(),
        gh<_i199.ContinueTrekUsecase>(),
      ));
  gh.factory<_i268.RockRoutesCubit>(() => _i268.RockRoutesCubit(
        gh<_i214.LoadRockRoutes>(),
        gh<_i250.GetRockRouteStatistic>(),
        gh<_i216.DeleteRockRoute>(),
        gh<_i218.SaveRockRoute>(),
      ));
  gh.factory<_i269.RockTreaningCubit>(() => _i269.RockTreaningCubit(
        gh<_i169.NewRockTreaning>(),
        gh<_i170.RockSectorToTreaning>(),
        gh<_i168.NewRockAttempt>(),
        gh<_i164.FinishRockAttempt>(),
        gh<_i165.FinishRockTreaning>(),
        gh<_i167.GetLastRockTreaning>(),
        gh<_i166.GetCurrentRockTreaning>(),
        gh<_i250.GetRockRouteStatistic>(),
        gh<_i163.DeleteRockAttempt>(),
      ));
  gh.factory<_i270.TravelPageCubit>(() => _i270.TravelPageCubit(
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
        gh<_i9.GetFeedingStatisticUsecase>(),
        gh<_i230.EditTravelUsecase>(),
        gh<_i111.GetTravelRegionsUsecase>(),
      ));
  gh.factory<_i271.RockDistrictsCubit>(
      () => _i271.RockDistrictsCubit(gh<_i213.LoadRockDistricts>()));
  gh.factory<_i272.TreaningsExportImportCubit>(
      () => _i272.TreaningsExportImportCubit(
            gh<_i256.ExportTreaningsUseCase>(),
            gh<_i258.ImportTreaningsUseCase>(),
          ));
  return getIt;
}

class _$InjectableModule extends _i273.InjectableModule {}

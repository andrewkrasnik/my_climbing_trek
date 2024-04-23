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
import 'core/injectable_module.dart' as _i259;
import 'core/services/analitics/analitics_service.dart' as _i59;
import 'core/services/analitics/firebase_analitics_service.dart' as _i60;
import 'core/services/crash_log_service/crash_log_service.dart' as _i16;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i17;
import 'core/services/network/network_info.dart' as _i48;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i44;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i45;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i50;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i49;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i123;
import 'features/authentication/domain/usecases/auth_login.dart' as _i124;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i125;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i128;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i83;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i84;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i168;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i167;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i178;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i179;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i180;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i181;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i184;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i238;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i12;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i81;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i13;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i82;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i57;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i58;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i130;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i151;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i129;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i150;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i182;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i183;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i185;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i229;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i200;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i146;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i161;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i162;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i192;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i193;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i194;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i195;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i163;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i196;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i175;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i197;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i236;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i248;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i198;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i199;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i233;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i232;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i249;
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
    as _i117;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i64;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i116;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i63;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i105;
import 'features/ice_climbing/domain/usecases/delete_sector_usecase.dart'
    as _i171;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i106;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i131;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i132;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i133;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i134;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i169;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i170;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i107;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i177;
import 'features/ice_climbing/domain/usecases/save_sector_usecase.dart'
    as _i172;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i246;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i186;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i201;
import 'features/mountaineering/data/datasources/drift_local_ascension_datasource.dart'
    as _i29;
import 'features/mountaineering/data/datasources/firebase_mountain_regions_remote_datasource.dart'
    as _i43;
import 'features/mountaineering/data/datasources/local_ascension_datasource.dart'
    as _i28;
import 'features/mountaineering/data/datasources/mock_mountain_regions_local_datasource.dart'
    as _i23;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i22;
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
import 'features/mountaineering/domain/usecases/edit_ascension_event_usecase.dart'
    as _i37;
import 'features/mountaineering/domain/usecases/finish_ascension_usecase.dart'
    as _i38;
import 'features/mountaineering/domain/usecases/get_ascension_usecase.dart'
    as _i39;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i112;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i113;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i111;
import 'features/mountaineering/domain/usecases/save_mountain_route_usecase.dart'
    as _i114;
import 'features/mountaineering/domain/usecases/save_mountain_usecase.dart'
    as _i115;
import 'features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart'
    as _i78;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i140;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i149;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i166;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i102;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i75;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i21;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i20;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i74;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i101;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i143;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i148;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i142;
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
    as _i234;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i235;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i202;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i203;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i204;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i158;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i159;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i160;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i257;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i255;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i244;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i254;
import 'features/settings/data/datasources/firebase_places_remote_datasource.dart'
    as _i19;
import 'features/settings/data/datasources/hive_places_local_datasource.dart'
    as _i15;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i27;
import 'features/settings/data/datasources/places_local_datasource.dart'
    as _i14;
import 'features/settings/data/datasources/places_remote_datasource.dart'
    as _i18;
import 'features/settings/data/datasources/settings_datasource.dart' as _i26;
import 'features/settings/data/repositories/places_repository_impl.dart'
    as _i110;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i62;
import 'features/settings/domain/repositories/places_repository.dart' as _i109;
import 'features/settings/domain/repositories/settings_repository.dart' as _i61;
import 'features/settings/domain/usecases/load_places.dart' as _i176;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i135;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i136;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i137;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i138;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i205;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i77;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i91;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i76;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i90;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i87;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i165;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i86;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i164;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i206;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i230;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i207;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i118;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i208;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i209;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i210;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i211;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i119;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i212;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i120;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i121;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i231;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i141;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i247;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i250;
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
    as _i94;
import 'features/techniques/domain/usecases/add_technique_treaning_usecase.dart'
    as _i95;
import 'features/techniques/domain/usecases/current_technique_treaning_usecase.dart'
    as _i96;
import 'features/techniques/domain/usecases/delete_technique_treaning_usecase.dart'
    as _i97;
import 'features/techniques/domain/usecases/delete_technique_usecase.dart'
    as _i70;
import 'features/techniques/domain/usecases/edit_technique_item_usecase.dart'
    as _i98;
import 'features/techniques/domain/usecases/finish_technique_treaning_usecase.dart'
    as _i99;
import 'features/techniques/domain/usecases/get_technique_groups_usecase.dart'
    as _i68;
import 'features/techniques/domain/usecases/get_techniques_editing_usecase.dart'
    as _i69;
import 'features/techniques/domain/usecases/get_techniques_usecase.dart'
    as _i67;
import 'features/techniques/domain/usecases/previos_technique_treaning_usecase.dart'
    as _i100;
import 'features/techniques/domain/usecases/save_technique_usecase.dart'
    as _i71;
import 'features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart'
    as _i139;
import 'features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart'
    as _i122;
import 'features/techniques/presentation/bloc/techniques/techniques_cubit.dart'
    as _i85;
import 'features/traveling/data/datasources/drift_travel_local_datasource.dart'
    as _i93;
import 'features/traveling/data/datasources/hive_travel_regions_datasource.dart'
    as _i73;
import 'features/traveling/data/datasources/travel_local_datasource.dart'
    as _i92;
import 'features/traveling/data/datasources/travel_regions_datasource.dart'
    as _i72;
import 'features/traveling/data/repositories/travel_regions_repository_impl.dart'
    as _i104;
import 'features/traveling/data/repositories/travel_repository.dart' as _i174;
import 'features/traveling/domain/repositories/travel_regions_repository.dart'
    as _i103;
import 'features/traveling/domain/repositories/travel_repository.dart' as _i173;
import 'features/traveling/domain/usecases/add_travel_usecase.dart' as _i213;
import 'features/traveling/domain/usecases/current_travel_usecase.dart'
    as _i214;
import 'features/traveling/domain/usecases/edit_travel_usecase.dart' as _i215;
import 'features/traveling/domain/usecases/get_current_travel_day_usecase.dart'
    as _i216;
import 'features/traveling/domain/usecases/get_travels_usecase.dart' as _i217;
import 'features/traveling/domain/usecases/travel_page/delete_budget_line_usecase.dart'
    as _i218;
import 'features/traveling/domain/usecases/travel_page/delete_cost_line_usecase.dart'
    as _i219;
import 'features/traveling/domain/usecases/travel_page/delete_insurance_line_usecase.dart'
    as _i220;
import 'features/traveling/domain/usecases/travel_page/edit_budget_line_usecase.dart'
    as _i221;
import 'features/traveling/domain/usecases/travel_page/edit_cost_line_usecase.dart'
    as _i222;
import 'features/traveling/domain/usecases/travel_page/edit_day_line_usecase.dart'
    as _i223;
import 'features/traveling/domain/usecases/travel_page/edit_insurance_line_usecase.dart'
    as _i224;
import 'features/traveling/domain/usecases/travel_page/get_budget_line_usecase.dart'
    as _i225;
import 'features/traveling/domain/usecases/travel_page/get_cost_lines_usecase.dart'
    as _i226;
import 'features/traveling/domain/usecases/travel_page/get_day_lines_usecase.dart'
    as _i227;
import 'features/traveling/domain/usecases/travel_page/get_feeding_statistic_usecase.dart'
    as _i9;
import 'features/traveling/domain/usecases/travel_page/get_insurance_lines_usecase.dart'
    as _i228;
import 'features/traveling/domain/usecases/travel_page/get_travel_regions_usecase.dart'
    as _i108;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i240;
import 'features/traveling/presentation/cubit/travel_day/travel_day_cubit.dart'
    as _i252;
import 'features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart'
    as _i256;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i245;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i239;
import 'features/treanings/domain/usecases/export_treanings_usecase.dart'
    as _i241;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i242;
import 'features/treanings/domain/usecases/import_treanings_usecase.dart'
    as _i243;
import 'features/treanings/presentation/cubit/treanings/treanings_cubit.dart'
    as _i251;
import 'features/treanings/presentation/cubit/treanings_export_import/treanings_export_import_cubit.dart'
    as _i258;
import 'features/trekking/data/datasources/drift_trekking_path_local_datasource.dart'
    as _i89;
import 'features/trekking/data/datasources/firebase_trekking_remote_datasource.dart'
    as _i41;
import 'features/trekking/data/datasources/trekking_path_local_datasource.dart'
    as _i88;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i40;
import 'features/trekking/data/repositories/trekking_path_repository_impl.dart'
    as _i127;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i80;
import 'features/trekking/domain/repositories/trekking_path_repository.dart'
    as _i126;
import 'features/trekking/domain/repositories/trekking_repository.dart' as _i79;
import 'features/trekking/domain/usecases/add_trek_event_usecase.dart' as _i187;
import 'features/trekking/domain/usecases/continue_trek_usecase.dart' as _i188;
import 'features/trekking/domain/usecases/current_trekking_path_usecase.dart'
    as _i189;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i144;
import 'features/trekking/domain/usecases/get_treks.dart' as _i145;
import 'features/trekking/domain/usecases/previos_trekking_path_usecase.dart'
    as _i190;
import 'features/trekking/domain/usecases/start_trek_usecase.dart' as _i191;
import 'features/trekking/presentation/bloc/trekking/trekking_cubit.dart'
    as _i253;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i152;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i237;

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
  gh.lazySingleton<_i14.PlacesLocalDataSource>(
      () => _i15.HivePlacesLocalDataSource());
  gh.lazySingletonAsync<_i16.CrashLogService>(() async =>
      _i17.GoogleCrashLogService(await gh.getAsync<_i3.FirebaseCrashlytics>()));
  gh.lazySingleton<_i18.PlacesRemoteDataSource>(
      () => _i19.FirebasePlacesRemoteDataSource(gh<_i7.FirebaseFirestore>()));
  gh.lazySingleton<_i20.RockRegionsLocalDataSource>(
      () => _i21.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i22.MountainRegionsLocalDataSource>(
      () => _i23.MountainRegionsLocalDataSourceImpl());
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
            gh<_i22.MountainRegionsLocalDataSource>(),
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
  gh.lazySingleton<_i72.TravelRegionsDataSource>(
      () => _i73.HiveTravelRegionsDataSource(gh<_i6.HiveInterface>()));
  gh.lazySingleton<_i74.RockRegionsRemoteDataSource>(
      () => _i75.FirebaseRockRegionsRemoteDataSource(
            gh<_i7.FirebaseFirestore>(),
            gh<_i5.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i76.StrengthExerciseDataSource>(
      () => _i77.LocalStrengthExerciseDataSource(gh<_i24.LocalDBDatasource>()));
  gh.factory<_i78.AscensionCubit>(() => _i78.AscensionCubit(
        gh<_i36.AddAscensionUsecase>(),
        gh<_i39.GetAscensionUsecase>(),
        gh<_i38.FinishAscensionUsecase>(),
        gh<_i37.EditAscensionEventUsecase>(),
      ));
  gh.lazySingleton<_i79.TrekkingRepository>(
      () => _i80.TrekkingRepositoryImpl(gh<_i40.TrekkingRemoteDataSource>()));
  gh.lazySingleton<_i81.HallTreaningDataSource>(
      () => _i82.LocalHallTreaningDataSource(gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i83.CardioTreaningsDatasource>(
      () => _i84.LocalCardioTreaningsDatasource(gh<_i24.LocalDBDatasource>()));
  gh.factory<_i85.TechniquesCubit>(() => _i85.TechniquesCubit(
        gh<_i67.GetTechniquesUsecase>(),
        gh<_i69.GetTechniquesEditingUsecase>(),
        gh<_i70.DeleteTechniqueUsecase>(),
        gh<_i71.SaveTechniqueUsecase>(),
      ));
  gh.lazySingleton<_i86.StrengthExerciseRepository>(() =>
      _i87.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: gh<_i76.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i88.TrekkingPathLocalDataSource>(() =>
      _i89.DriftTrekkingPathLocalDataSource(gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i90.StrengthTreaningsDataSource>(() =>
      _i91.LocalStrengthTreaningsDataSource(gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i92.TravelLocalDatasource>(
      () => _i93.DriftTravelLocalDatasource(gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i94.AddTechniqueToTreaningUseCase>(() =>
      _i94.AddTechniqueToTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i95.AddTechniqueTreaningUseCase>(() =>
      _i95.AddTechniqueTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i96.CurrentTechniqueTreaningUseCase>(() =>
      _i96.CurrentTechniqueTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i97.DeleteTechniqueTreaningUseCase>(() =>
      _i97.DeleteTechniqueTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i98.EditTechniqueItemUseCase>(() =>
      _i98.EditTechniqueItemUseCase(gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i99.FinishTechniqueTreaningUseCase>(() =>
      _i99.FinishTechniqueTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i100.PreviosTechniqueTreaningUseCase>(() =>
      _i100.PreviosTechniqueTreaningUseCase(
          gh<_i53.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i101.RockTreaningsLocalDataSource>(() =>
      _i102.DriftRockTreaningsLocalDataSource(gh<_i24.LocalDBDatasource>()));
  gh.lazySingleton<_i103.TravelRegionsRepository>(() =>
      _i104.TravelRegionsRepositoryImpl(gh<_i72.TravelRegionsDataSource>()));
  gh.lazySingleton<_i105.DeleteIceAttempt>(
      () => _i105.DeleteIceAttempt(gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i106.FinishIceAttempt>(
      () => _i106.FinishIceAttempt(gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i107.NewIceAttempt>(
      () => _i107.NewIceAttempt(gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i108.GetTravelRegionsUsecase>(
      () => _i108.GetTravelRegionsUsecase(gh<_i103.TravelRegionsRepository>()));
  gh.lazySingleton<_i109.PlacesRepository>(() => _i110.PlacesRepositoryImpl(
        gh<_i14.PlacesLocalDataSource>(),
        gh<_i18.PlacesRemoteDataSource>(),
        gh<_i48.NetworkInfo>(),
      ));
  gh.lazySingleton<_i111.GetMountains>(
      () => _i111.GetMountains(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i112.GetMountainRegions>(
      () => _i112.GetMountainRegions(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i113.GetMountainRoutes>(
      () => _i113.GetMountainRoutes(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i114.SaveMountainRouteUsecase>(() =>
      _i114.SaveMountainRouteUsecase(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i115.SaveMountainUsecase>(
      () => _i115.SaveMountainUsecase(gh<_i65.MountainRegionsRepository>()));
  gh.lazySingleton<_i116.IceRegionsRepository>(
      () => _i117.IceRegionsRepositoryImpl(
            gh<_i10.IceRegionsDataSource>(),
            gh<_i46.IceRegionsRemoteDataSource>(),
            gh<_i48.NetworkInfo>(),
          ));
  gh.lazySingleton<_i118.DeleteStrengthExercise>(() =>
      _i118.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i86.StrengthExerciseRepository>()));
  gh.lazySingleton<_i119.GetStrengthExercises>(() => _i119.GetStrengthExercises(
      strengthExerciseRepository: gh<_i86.StrengthExerciseRepository>()));
  gh.lazySingleton<_i120.SaveStrengthExercise>(() => _i120.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i86.StrengthExerciseRepository>()));
  gh.lazySingleton<_i121.SelectToUseStrengthExercise>(() =>
      _i121.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i86.StrengthExerciseRepository>()));
  gh.factory<_i122.TechniqueTreaningCubit>(() => _i122.TechniqueTreaningCubit(
        gh<_i95.AddTechniqueTreaningUseCase>(),
        gh<_i100.PreviosTechniqueTreaningUseCase>(),
        gh<_i96.CurrentTechniqueTreaningUseCase>(),
        gh<_i94.AddTechniqueToTreaningUseCase>(),
        gh<_i99.FinishTechniqueTreaningUseCase>(),
        gh<_i98.EditTechniqueItemUseCase>(),
      ));
  gh.factory<_i123.AuthGetUser>(
      () => _i123.AuthGetUser(authRepository: gh<_i49.AuthRepository>()));
  gh.factory<_i124.AuthLogin>(
      () => _i124.AuthLogin(authRepository: gh<_i49.AuthRepository>()));
  gh.factory<_i125.AuthLogout>(
      () => _i125.AuthLogout(authRepository: gh<_i49.AuthRepository>()));
  gh.lazySingleton<_i126.TrekkingPathRepository>(() =>
      _i127.TrekkingPathRepositoryImpl(gh<_i88.TrekkingPathLocalDataSource>()));
  gh.factory<_i128.AuthenticationCubit>(() => _i128.AuthenticationCubit(
        gh<_i124.AuthLogin>(),
        gh<_i125.AuthLogout>(),
        gh<_i123.AuthGetUser>(),
      ));
  gh.lazySingleton<_i129.ClimbingHallRepository>(
      () => _i130.ClimbingHallRepositoryImpl(
            gh<_i12.ClimbingHallDataSource>(),
            gh<_i57.RemoteGymDataSource>(),
            gh<_i48.NetworkInfo>(),
          ));
  gh.lazySingleton<_i131.FinishIceTreaning>(() => _i131.FinishIceTreaning(
      iceTreaningsRepository: gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i132.GetCurrentIceTreaning>(() =>
      _i132.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i133.GetLastIceTreaning>(() => _i133.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i134.IceSectorToTreaning>(() => _i134.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i63.IceTreaningsRepository>()));
  gh.lazySingleton<_i135.LoadSimpleSettingsUsecase>(
      () => _i135.LoadSimpleSettingsUsecase(gh<_i61.SettingsRepository>()));
  gh.lazySingleton<_i136.LoadTreaningsSettings>(
      () => _i136.LoadTreaningsSettings(gh<_i61.SettingsRepository>()));
  gh.lazySingleton<_i137.SaveSimpleSettingsUsecase>(
      () => _i137.SaveSimpleSettingsUsecase(gh<_i61.SettingsRepository>()));
  gh.lazySingleton<_i138.SaveTreaningsSettings>(
      () => _i138.SaveTreaningsSettings(gh<_i61.SettingsRepository>()));
  gh.factory<_i139.TechniqueGroupsCubit>(() => _i139.TechniqueGroupsCubit(
        gh<_i68.GetTechniqueGroupsUsecase>(),
        gh<_i69.GetTechniquesEditingUsecase>(),
      ));
  gh.factory<_i140.MountainRegionsCubit>(
      () => _i140.MountainRegionsCubit(gh<_i112.GetMountainRegions>()));
  gh.factory<_i141.StrengthExercisesCubit>(() => _i141.StrengthExercisesCubit(
        gh<_i119.GetStrengthExercises>(),
        gh<_i120.SaveStrengthExercise>(),
        gh<_i121.SelectToUseStrengthExercise>(),
        gh<_i118.DeleteStrengthExercise>(),
      ));
  gh.lazySingleton<_i142.RockRegionsRepository>(
      () => _i143.RockRegionsRepositoryImpl(
            gh<_i20.RockRegionsLocalDataSource>(),
            gh<_i74.RockRegionsRemoteDataSource>(),
            gh<_i48.NetworkInfo>(),
          ));
  gh.lazySingleton<_i144.GetTrekkingRegions>(
      () => _i144.GetTrekkingRegions(gh<_i79.TrekkingRepository>()));
  gh.lazySingleton<_i145.GetTreks>(
      () => _i145.GetTreks(gh<_i79.TrekkingRepository>()));
  gh.lazySingleton<_i146.NewHallRoute>(() => _i146.NewHallRoute(
      climbingHallRepository: gh<_i129.ClimbingHallRepository>()));
  gh.lazySingleton<_i147.RockTreaningsRepository>(() =>
      _i148.RockTreaningsRepositoryImpl(
          gh<_i101.RockTreaningsLocalDataSource>()));
  gh.factory<_i149.MountainRoutesCubit>(() => _i149.MountainRoutesCubit(
        gh<_i113.GetMountainRoutes>(),
        gh<_i114.SaveMountainRouteUsecase>(),
      ));
  gh.lazySingleton<_i150.HallTreaningRepository>(
      () => _i151.HallTreaningRepositoryImpl(
            dataSource: gh<_i81.HallTreaningDataSource>(),
            hallDataSource: gh<_i12.ClimbingHallDataSource>(),
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
          strengthTreaningsDataSource: gh<_i90.StrengthTreaningsDataSource>()));
  gh.factory<_i166.MountainsCubit>(() => _i166.MountainsCubit(
        gh<_i111.GetMountains>(),
        gh<_i115.SaveMountainUsecase>(),
      ));
  gh.lazySingleton<_i167.CardioTreaningsRepository>(() =>
      _i168.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i83.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i169.LoadDistrictsUseCase>(() => _i169.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i116.IceRegionsRepository>()));
  gh.lazySingleton<_i170.LoadSectorsUseCase>(() => _i170.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i116.IceRegionsRepository>()));
  gh.lazySingleton<_i171.DeleteSectorUseCase>(() => _i171.DeleteSectorUseCase(
      iceRegionsRepository: gh<_i116.IceRegionsRepository>()));
  gh.lazySingleton<_i172.SaveSectorUseCase>(() => _i172.SaveSectorUseCase(
      iceRegionsRepository: gh<_i116.IceRegionsRepository>()));
  gh.lazySingleton<_i173.TravelRepository>(
      () => _i174.TravelRepositoryImpl(gh<_i92.TravelLocalDatasource>()));
  gh.lazySingleton<_i175.NewHallAttemptFromRoute>(() =>
      _i175.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i176.LoadPlaces>(
      () => _i176.LoadPlaces(gh<_i109.PlacesRepository>()));
  gh.lazySingleton<_i177.NewIceTreaning>(() => _i177.NewIceTreaning(
        iceTreaningsRepository: gh<_i63.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i116.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i178.DeleteCardioTreaning>(() => _i178.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i167.CardioTreaningsRepository>()));
  gh.lazySingleton<_i179.GetCardioTreanings>(() => _i179.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i167.CardioTreaningsRepository>()));
  gh.lazySingleton<_i180.GetLastCardioTreaning>(() =>
      _i180.GetLastCardioTreaning(
          cardioTreaningsRepository: gh<_i167.CardioTreaningsRepository>()));
  gh.lazySingleton<_i181.SaveCardioTreaning>(() => _i181.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i167.CardioTreaningsRepository>()));
  gh.lazySingleton<_i182.AllClimbingHalls>(
      () => _i182.AllClimbingHalls(gh<_i129.ClimbingHallRepository>()));
  gh.lazySingleton<_i183.GetClimbingHallRoures>(
      () => _i183.GetClimbingHallRoures(gh<_i129.ClimbingHallRepository>()));
  gh.factory<_i184.CardioTreaningCubit>(() => _i184.CardioTreaningCubit(
        gh<_i180.GetLastCardioTreaning>(),
        gh<_i181.SaveCardioTreaning>(),
      ));
  gh.lazySingleton<_i185.GetGymRouteStatistic>(
      () => _i185.GetGymRouteStatistic(gh<_i150.HallTreaningRepository>()));
  gh.factory<_i186.IceDistrictsCubit>(() => _i186.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i169.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i187.AddTrekEventUsecase>(
      () => _i187.AddTrekEventUsecase(gh<_i126.TrekkingPathRepository>()));
  gh.lazySingleton<_i188.ContinueTrekUsecase>(
      () => _i188.ContinueTrekUsecase(gh<_i126.TrekkingPathRepository>()));
  gh.lazySingleton<_i189.CurrentTrekkingPathUsecase>(() =>
      _i189.CurrentTrekkingPathUsecase(gh<_i126.TrekkingPathRepository>()));
  gh.lazySingleton<_i190.PreviosTrekkingPathUsecase>(() =>
      _i190.PreviosTrekkingPathUsecase(gh<_i126.TrekkingPathRepository>()));
  gh.lazySingleton<_i191.StartTrekUsecase>(
      () => _i191.StartTrekUsecase(gh<_i126.TrekkingPathRepository>()));
  gh.lazySingleton<_i192.DeleteHallAttempt>(() => _i192.DeleteHallAttempt(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i193.DeleteHallTreaning>(() => _i193.DeleteHallTreaning(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i194.FinishHallAttempt>(() => _i194.FinishHallAttempt(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i195.FinishHallTreaning>(() => _i195.FinishHallTreaning(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i196.NewHallAttempt>(() => _i196.NewHallAttempt(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i197.NewHallTreaning>(() => _i197.NewHallTreaning(
      treaningRepository: gh<_i150.HallTreaningRepository>()));
  gh.factory<_i198.CurrentHallTreaningCubit>(
      () => _i198.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i175.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i197.NewHallTreaning>(),
            newHallAttempt: gh<_i196.NewHallAttempt>(),
            currentHallTreaning: gh<_i162.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i194.FinishHallAttempt>(),
            finishHallTreaning: gh<_i195.FinishHallTreaning>(),
            lastHallTreaning: gh<_i163.LastHallTreaning>(),
            deleteHallAttempt: gh<_i192.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i185.GetGymRouteStatistic>(),
          ));
  gh.factory<_i199.HallRouteCubit>(
      () => _i199.HallRouteCubit(gh<_i146.NewHallRoute>()));
  gh.lazySingleton<_i200.HallRouteToArchive>(() =>
      _i200.HallRouteToArchive(repository: gh<_i129.ClimbingHallRepository>()));
  gh.factory<_i201.IceSectorsCubit>(() => _i201.IceSectorsCubit(
        gh<_i170.LoadSectorsUseCase>(),
        gh<_i172.SaveSectorUseCase>(),
        gh<_i171.DeleteSectorUseCase>(),
      ));
  gh.lazySingleton<_i202.LoadRockDistricts>(
      () => _i202.LoadRockDistricts(gh<_i142.RockRegionsRepository>()));
  gh.lazySingleton<_i203.LoadRockRoutes>(
      () => _i203.LoadRockRoutes(gh<_i142.RockRegionsRepository>()));
  gh.lazySingleton<_i204.LoadRockSectors>(
      () => _i204.LoadRockSectors(gh<_i142.RockRegionsRepository>()));
  gh.lazySingleton<_i205.SettingsCubit>(() => _i205.SettingsCubit(
        gh<_i136.LoadTreaningsSettings>(),
        gh<_i138.SaveTreaningsSettings>(),
        gh<_i176.LoadPlaces>(),
        gh<_i135.LoadSimpleSettingsUsecase>(),
        gh<_i137.SaveSimpleSettingsUsecase>(),
      ));
  gh.lazySingleton<_i206.AddRepetitionForStrengthTreaning>(() =>
      _i206.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i207.DeleteRepetitionForStrengthTreaning>(() =>
      _i207.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i208.DeleteStrengthTreaning>(() =>
      _i208.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i209.FinishStrengthTreaning>(() =>
      _i209.FinishStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i210.GetCurrentStrengthTreaning>(() =>
      _i210.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i211.GetPreviosStrengthTreaning>(() =>
      _i211.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i212.GetStrengthTreanings>(() => _i212.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i164.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i213.AddTravelUsecase>(
      () => _i213.AddTravelUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i214.CurrentTravelUsecase>(
      () => _i214.CurrentTravelUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i215.EditTravelUsecase>(
      () => _i215.EditTravelUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i216.GetCurrentTravelDayUsecase>(
      () => _i216.GetCurrentTravelDayUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i217.GetTravelsUsecase>(
      () => _i217.GetTravelsUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i218.DeleteBudgetLineUsecase>(
      () => _i218.DeleteBudgetLineUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i219.DeleteCostLineUsecase>(
      () => _i219.DeleteCostLineUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i220.DeleteInsuranceLineUsecase>(
      () => _i220.DeleteInsuranceLineUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i221.EditBudgetLineUsecase>(
      () => _i221.EditBudgetLineUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i222.EditCostLineUsecase>(
      () => _i222.EditCostLineUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i223.EditDayLineUsecase>(
      () => _i223.EditDayLineUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i224.EditInsuranceLineUsecase>(
      () => _i224.EditInsuranceLineUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i225.GetBudgetLinesUsecase>(
      () => _i225.GetBudgetLinesUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i226.GetCostLinesUsecase>(
      () => _i226.GetCostLinesUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i227.GetDayLinesUsecase>(
      () => _i227.GetDayLinesUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i228.GetInsuranceLineUsecase>(
      () => _i228.GetInsuranceLineUsecase(gh<_i173.TravelRepository>()));
  gh.lazySingleton<_i229.GetHallRouteAttempts>(() => _i229.GetHallRouteAttempts(
      repository: gh<_i150.HallTreaningRepository>()));
  gh.lazySingleton<_i230.AddStrengthTreaning>(() => _i230.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i164.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i86.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i231.UpdateStrengthTreaningExercises>(() =>
      _i231.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: gh<_i164.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i86.StrengthExerciseRepository>(),
      ));
  gh.factory<_i232.HallTreaningsCubit>(() => _i232.HallTreaningsCubit(
        allHallTreanings: gh<_i161.AllHallTreanings>(),
        deleteHallTreaning: gh<_i193.DeleteHallTreaning>(),
      ));
  gh.factory<_i233.HallRouteAttemptsCubit>(() => _i233.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i229.GetHallRouteAttempts>()));
  gh.lazySingleton<_i234.GetRockRouteAttempts>(
      () => _i234.GetRockRouteAttempts(gh<_i147.RockTreaningsRepository>()));
  gh.lazySingleton<_i235.GetRockRouteStatistic>(
      () => _i235.GetRockRouteStatistic(gh<_i147.RockTreaningsRepository>()));
  gh.factory<_i236.ClimbingHallCubit>(() => _i236.ClimbingHallCubit(
        gh<_i183.GetClimbingHallRoures>(),
        gh<_i200.HallRouteToArchive>(),
        gh<_i185.GetGymRouteStatistic>(),
      ));
  gh.factory<_i237.TreksCubit>(() => _i237.TreksCubit(gh<_i145.GetTreks>()));
  gh.factory<_i238.CardioTreaningsCubit>(() => _i238.CardioTreaningsCubit(
        gh<_i179.GetCardioTreanings>(),
        gh<_i178.DeleteCardioTreaning>(),
        gh<_i181.SaveCardioTreaning>(),
      ));
  gh.lazySingleton<_i239.DeleteTreaning>(() => _i239.DeleteTreaning(
        gh<_i150.HallTreaningRepository>(),
        gh<_i63.IceTreaningsRepository>(),
        gh<_i164.StrengthTreaningsRepository>(),
        gh<_i167.CardioTreaningsRepository>(),
        gh<_i147.RockTreaningsRepository>(),
        gh<_i126.TrekkingPathRepository>(),
        gh<_i53.TechniqueTreaningsRepository>(),
        gh<_i32.AscensionRepository>(),
      ));
  gh.factory<_i240.CurrentTravelCubit>(() => _i240.CurrentTravelCubit(
        gh<_i214.CurrentTravelUsecase>(),
        gh<_i222.EditCostLineUsecase>(),
        gh<_i216.GetCurrentTravelDayUsecase>(),
      ));
  gh.lazySingleton<_i241.ExportTreaningsUseCase>(
      () => _i241.ExportTreaningsUseCase(
            gh<_i150.HallTreaningRepository>(),
            gh<_i63.IceTreaningsRepository>(),
            gh<_i164.StrengthTreaningsRepository>(),
            gh<_i167.CardioTreaningsRepository>(),
            gh<_i147.RockTreaningsRepository>(),
            gh<_i173.TravelRepository>(),
            gh<_i126.TrekkingPathRepository>(),
            gh<_i53.TechniqueTreaningsRepository>(),
            gh<_i32.AscensionRepository>(),
          ));
  gh.lazySingleton<_i242.GetAllTreanings>(() => _i242.GetAllTreanings(
        gh<_i150.HallTreaningRepository>(),
        gh<_i63.IceTreaningsRepository>(),
        gh<_i164.StrengthTreaningsRepository>(),
        gh<_i167.CardioTreaningsRepository>(),
        gh<_i147.RockTreaningsRepository>(),
        gh<_i173.TravelRepository>(),
        gh<_i126.TrekkingPathRepository>(),
        gh<_i53.TechniqueTreaningsRepository>(),
        gh<_i32.AscensionRepository>(),
      ));
  gh.lazySingleton<_i243.ImportTreaningsUseCase>(
      () => _i243.ImportTreaningsUseCase(
            gh<_i150.HallTreaningRepository>(),
            gh<_i63.IceTreaningsRepository>(),
            gh<_i164.StrengthTreaningsRepository>(),
            gh<_i167.CardioTreaningsRepository>(),
            gh<_i147.RockTreaningsRepository>(),
            gh<_i173.TravelRepository>(),
            gh<_i126.TrekkingPathRepository>(),
            gh<_i53.TechniqueTreaningsRepository>(),
            gh<_i32.AscensionRepository>(),
          ));
  gh.factory<_i244.RockSectorsCubit>(
      () => _i244.RockSectorsCubit(gh<_i204.LoadRockSectors>()));
  gh.factory<_i245.TravelsCubit>(() => _i245.TravelsCubit(
        gh<_i217.GetTravelsUsecase>(),
        gh<_i213.AddTravelUsecase>(),
      ));
  gh.factory<_i246.CurrentIceTreaningCubit>(() => _i246.CurrentIceTreaningCubit(
        gh<_i177.NewIceTreaning>(),
        gh<_i134.IceSectorToTreaning>(),
        gh<_i107.NewIceAttempt>(),
        gh<_i106.FinishIceAttempt>(),
        gh<_i131.FinishIceTreaning>(),
        gh<_i132.GetCurrentIceTreaning>(),
        gh<_i133.GetLastIceTreaning>(),
        gh<_i105.DeleteIceAttempt>(),
      ));
  gh.factory<_i247.StrengthTrainingCubit>(() => _i247.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i210.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i211.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i230.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i231.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i206.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i209.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i207.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i248.ClimbingHallsCubit>(() =>
      _i248.ClimbingHallsCubit(allClimbingHalls: gh<_i182.AllClimbingHalls>()));
  gh.factory<_i249.HomePageCubit>(() =>
      _i249.HomePageCubit(allClimbingHalls: gh<_i182.AllClimbingHalls>()));
  gh.factory<_i250.StrengthTrainingsCubit>(() => _i250.StrengthTrainingsCubit(
        gh<_i212.GetStrengthTreanings>(),
        gh<_i208.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i251.TreaningsCubit>(() => _i251.TreaningsCubit(
        gh<_i242.GetAllTreanings>(),
        gh<_i239.DeleteTreaning>(),
      ));
  gh.factory<_i252.TravelDayCubit>(
      () => _i252.TravelDayCubit(gh<_i223.EditDayLineUsecase>()));
  gh.factory<_i253.TrekkingCubit>(() => _i253.TrekkingCubit(
        gh<_i189.CurrentTrekkingPathUsecase>(),
        gh<_i190.PreviosTrekkingPathUsecase>(),
        gh<_i191.StartTrekUsecase>(),
        gh<_i187.AddTrekEventUsecase>(),
        gh<_i188.ContinueTrekUsecase>(),
      ));
  gh.factory<_i254.RockTreaningCubit>(() => _i254.RockTreaningCubit(
        gh<_i159.NewRockTreaning>(),
        gh<_i160.RockSectorToTreaning>(),
        gh<_i158.NewRockAttempt>(),
        gh<_i154.FinishRockAttempt>(),
        gh<_i155.FinishRockTreaning>(),
        gh<_i157.GetLastRockTreaning>(),
        gh<_i156.GetCurrentRockTreaning>(),
        gh<_i235.GetRockRouteStatistic>(),
        gh<_i153.DeleteRockAttempt>(),
      ));
  gh.factory<_i255.RockRoutesCubit>(() => _i255.RockRoutesCubit(
        gh<_i203.LoadRockRoutes>(),
        gh<_i235.GetRockRouteStatistic>(),
      ));
  gh.factory<_i256.TravelPageCubit>(() => _i256.TravelPageCubit(
        gh<_i219.DeleteCostLineUsecase>(),
        gh<_i222.EditCostLineUsecase>(),
        gh<_i226.GetCostLinesUsecase>(),
        gh<_i228.GetInsuranceLineUsecase>(),
        gh<_i225.GetBudgetLinesUsecase>(),
        gh<_i224.EditInsuranceLineUsecase>(),
        gh<_i221.EditBudgetLineUsecase>(),
        gh<_i220.DeleteInsuranceLineUsecase>(),
        gh<_i218.DeleteBudgetLineUsecase>(),
        gh<_i227.GetDayLinesUsecase>(),
        gh<_i9.GetFeedingStatisticUsecase>(),
        gh<_i215.EditTravelUsecase>(),
        gh<_i108.GetTravelRegionsUsecase>(),
      ));
  gh.factory<_i257.RockDistrictsCubit>(
      () => _i257.RockDistrictsCubit(gh<_i202.LoadRockDistricts>()));
  gh.factory<_i258.TreaningsExportImportCubit>(
      () => _i258.TreaningsExportImportCubit(
            gh<_i241.ExportTreaningsUseCase>(),
            gh<_i243.ImportTreaningsUseCase>(),
          ));
  return getIt;
}

class _$InjectableModule extends _i259.InjectableModule {}

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
import 'core/injectable_module.dart' as _i258;
import 'core/services/analitics/analitics_service.dart' as _i90;
import 'core/services/analitics/firebase_analitics_service.dart' as _i91;
import 'core/services/crash_log_service/crash_log_service.dart' as _i103;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i104;
import 'core/services/network/network_info.dart' as _i24;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i92;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i93;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i95;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i94;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i216;
import 'features/authentication/domain/usecases/auth_login.dart' as _i217;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i218;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i219;
import 'features/blog/data/datasources/mock_publications_remote_datasource.dart'
    as _i32;
import 'features/blog/data/datasources/publications_remote_datasource.dart'
    as _i31;
import 'features/blog/data/repositories/publications_repository_impl.dart'
    as _i34;
import 'features/blog/domain/repositories/publications_repository.dart' as _i33;
import 'features/blog/domain/usecases/get_publications.dart' as _i142;
import 'features/blog/presentation/bloc/blog_cubit.dart' as _i220;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i96;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i97;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i99;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i98;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i109;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i128;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i136;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i193;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i221;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i222;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i154;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i155;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i35;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i36;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i101;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i157;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i100;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i156;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i212;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i129;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i240;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i241;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i153;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i180;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i213;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i224;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i226;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i227;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i233;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i234;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i164;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i178;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i179;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i181;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i255;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i223;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i256;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i244;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i243;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i245;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i246;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i14;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i11;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i13;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i160;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i12;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i161;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i159;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i163;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i158;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i162;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i228;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i235;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i236;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i239;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i242;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i248;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i165;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i170;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i182;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i183;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i257;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i247;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i249;
import 'features/mountaineering/data/datasources/drift_local_ascension_datasource.dart'
    as _i174;
import 'features/mountaineering/data/datasources/firebase_mountain_regions_remote_datasource.dart'
    as _i21;
import 'features/mountaineering/data/datasources/local_ascension_datasource.dart'
    as _i173;
import 'features/mountaineering/data/datasources/mock_mountain_regions_local_datasource.dart'
    as _i19;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i18;
import 'features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart'
    as _i20;
import 'features/mountaineering/data/repositories/ascension_repository_impl.dart'
    as _i215;
import 'features/mountaineering/data/repositories/mountain_regions_repository_impl.dart'
    as _i23;
import 'features/mountaineering/domain/repositories/ascension_repository.dart'
    as _i214;
import 'features/mountaineering/domain/repositories/mountain_regions_repository.dart'
    as _i22;
import 'features/mountaineering/domain/usecases/add_ascension_usecase.dart'
    as _i253;
import 'features/mountaineering/domain/usecases/edit_ascension_event_usecase.dart'
    as _i230;
import 'features/mountaineering/domain/usecases/finish_ascension_usecase.dart'
    as _i232;
import 'features/mountaineering/domain/usecases/get_ascension_usecase.dart'
    as _i238;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i138;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i139;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i140;
import 'features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart'
    as _i254;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i175;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i176;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i177;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i44;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i40;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i38;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i37;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i39;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i43;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i42;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i46;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i41;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i45;
import 'features/rock_climbing/domain/usecases/delete_rock_attempt.dart'
    as _i113;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i123;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i124;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i131;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i137;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i143;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i144;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i167;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i168;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i169;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i184;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i185;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i190;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i188;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i189;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i191;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i192;
import 'features/settings/data/datasources/firebase_places_remote_datasource.dart'
    as _i28;
import 'features/settings/data/datasources/hive_places_local_datasource.dart'
    as _i26;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i48;
import 'features/settings/data/datasources/places_local_datasource.dart'
    as _i25;
import 'features/settings/data/datasources/places_remote_datasource.dart'
    as _i27;
import 'features/settings/data/datasources/settings_datasource.dart' as _i47;
import 'features/settings/data/repositories/places_repository_impl.dart'
    as _i30;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i50;
import 'features/settings/domain/repositories/places_repository.dart' as _i29;
import 'features/settings/domain/repositories/settings_repository.dart' as _i49;
import 'features/settings/domain/usecases/load_places.dart' as _i166;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i171;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i172;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i194;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i196;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i198;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i52;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i56;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i51;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i55;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i54;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i58;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i53;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i57;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i84;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i85;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i112;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i114;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i115;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i125;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i132;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i141;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i145;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i146;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i195;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i197;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i83;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i200;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i201;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i202;
import 'features/techniques/data/datasources/drift_technique_treanings_local_datasource.dart'
    as _i60;
import 'features/techniques/data/datasources/firebase_techniques_remote_datasource.dart'
    as _i64;
import 'features/techniques/data/datasources/technique_treanings_local_datasource.dart'
    as _i59;
import 'features/techniques/data/datasources/techniques_remote_datasource.dart'
    as _i63;
import 'features/techniques/data/repositories/technique_treanings_repository_impl.dart'
    as _i62;
import 'features/techniques/data/repositories/techniques_repository_impl.dart'
    as _i66;
import 'features/techniques/domain/repositories/technique_treanings_repository.dart'
    as _i61;
import 'features/techniques/domain/repositories/techniques_repository.dart'
    as _i65;
import 'features/techniques/domain/usecases/add_technique_to_treaning_usecase.dart'
    as _i86;
import 'features/techniques/domain/usecases/add_technique_treaning_usecase.dart'
    as _i87;
import 'features/techniques/domain/usecases/current_technique_treaning_usecase.dart'
    as _i105;
import 'features/techniques/domain/usecases/delete_technique_treaning_usecase.dart'
    as _i116;
import 'features/techniques/domain/usecases/edit_technique_item_usecase.dart'
    as _i121;
import 'features/techniques/domain/usecases/finish_technique_treaning_usecase.dart'
    as _i126;
import 'features/techniques/domain/usecases/get_technique_groups_usecase.dart'
    as _i147;
import 'features/techniques/domain/usecases/get_techniques_usecase.dart'
    as _i148;
import 'features/techniques/domain/usecases/previos_technique_treaning_usecase.dart'
    as _i186;
import 'features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart'
    as _i203;
import 'features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart'
    as _i204;
import 'features/techniques/presentation/bloc/techniques/techniques_cubit.dart'
    as _i205;
import 'features/traveling/data/datasources/drift_travel_local_datasource.dart'
    as _i68;
import 'features/traveling/data/datasources/hive_travel_regions_datasource.dart'
    as _i70;
import 'features/traveling/data/datasources/travel_local_datasource.dart'
    as _i67;
import 'features/traveling/data/datasources/travel_regions_datasource.dart'
    as _i69;
import 'features/traveling/data/repositories/travel_regions_repository_impl.dart'
    as _i72;
import 'features/traveling/data/repositories/travel_repository.dart' as _i74;
import 'features/traveling/domain/repositories/travel_regions_repository.dart'
    as _i71;
import 'features/traveling/domain/repositories/travel_repository.dart' as _i73;
import 'features/traveling/domain/usecases/add_travel_usecase.dart' as _i88;
import 'features/traveling/domain/usecases/current_travel_usecase.dart'
    as _i106;
import 'features/traveling/domain/usecases/edit_travel_usecase.dart' as _i122;
import 'features/traveling/domain/usecases/get_current_travel_day_usecase.dart'
    as _i133;
import 'features/traveling/domain/usecases/get_travels_usecase.dart' as _i150;
import 'features/traveling/domain/usecases/travel_page/delete_budget_line_usecase.dart'
    as _i108;
import 'features/traveling/domain/usecases/travel_page/delete_cost_line_usecase.dart'
    as _i110;
import 'features/traveling/domain/usecases/travel_page/delete_insurance_line_usecase.dart'
    as _i111;
import 'features/traveling/domain/usecases/travel_page/edit_budget_line_usecase.dart'
    as _i117;
import 'features/traveling/domain/usecases/travel_page/edit_cost_line_usecase.dart'
    as _i118;
import 'features/traveling/domain/usecases/travel_page/edit_day_line_usecase.dart'
    as _i119;
import 'features/traveling/domain/usecases/travel_page/edit_insurance_line_usecase.dart'
    as _i120;
import 'features/traveling/domain/usecases/travel_page/get_budget_line_usecase.dart'
    as _i127;
import 'features/traveling/domain/usecases/travel_page/get_cost_lines_usecase.dart'
    as _i130;
import 'features/traveling/domain/usecases/travel_page/get_day_lines_usecase.dart'
    as _i134;
import 'features/traveling/domain/usecases/travel_page/get_feeding_statistic_usecase.dart'
    as _i9;
import 'features/traveling/domain/usecases/travel_page/get_insurance_lines_usecase.dart'
    as _i135;
import 'features/traveling/domain/usecases/travel_page/get_travel_regions_usecase.dart'
    as _i149;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i225;
import 'features/traveling/presentation/cubit/travel_day/travel_day_cubit.dart'
    as _i206;
import 'features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart'
    as _i207;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i208;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i229;
import 'features/treanings/domain/usecases/export_treanings_usecase.dart'
    as _i231;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i237;
import 'features/treanings/domain/usecases/import_treanings_usecase.dart'
    as _i250;
import 'features/treanings/presentation/cubit/treanings/treanings_cubit.dart'
    as _i251;
import 'features/treanings/presentation/cubit/treanings_export_import/treanings_export_import_cubit.dart'
    as _i252;
import 'features/trekking/data/datasources/drift_trekking_path_local_datasource.dart'
    as _i76;
import 'features/trekking/data/datasources/firebase_trekking_remote_datasource.dart'
    as _i80;
import 'features/trekking/data/datasources/trekking_path_local_datasource.dart'
    as _i75;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i79;
import 'features/trekking/data/repositories/trekking_path_repository_impl.dart'
    as _i78;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i82;
import 'features/trekking/domain/repositories/trekking_path_repository.dart'
    as _i77;
import 'features/trekking/domain/repositories/trekking_repository.dart' as _i81;
import 'features/trekking/domain/usecases/add_trek_event_usecase.dart' as _i89;
import 'features/trekking/domain/usecases/continue_trek_usecase.dart' as _i102;
import 'features/trekking/domain/usecases/current_trekking_path_usecase.dart'
    as _i107;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i151;
import 'features/trekking/domain/usecases/get_treks.dart' as _i152;
import 'features/trekking/domain/usecases/previos_trekking_path_usecase.dart'
    as _i187;
import 'features/trekking/domain/usecases/start_trek_usecase.dart' as _i199;
import 'features/trekking/presentation/bloc/trekking/trekking_cubit.dart'
    as _i209;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i210;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i211;

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
  gh.lazySingleton<_i31.PublicationRemoteDataSource>(
      () => _i32.MockPublicationRemoteDataSource());
  gh.lazySingleton<_i33.PublicationReporitory>(() =>
      _i34.PublicationReporitoryImpl(gh<_i31.PublicationRemoteDataSource>()));
  gh.lazySingleton<_i35.RemoteGymDataSource>(() => _i36.RemoteGymDataSourceImpl(
        gh<_i8.FirebaseFirestore>(),
        gh<_i6.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i37.RockRegionsLocalDataSource>(
      () => _i38.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i39.RockRegionsRemoteDataSource>(() =>
      _i40.FirebaseRockRegionsRemoteDataSource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i41.RockRegionsRepository>(
      () => _i42.RockRegionsRepositoryImpl(
            gh<_i37.RockRegionsLocalDataSource>(),
            gh<_i39.RockRegionsRemoteDataSource>(),
            gh<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i43.RockTreaningsLocalDataSource>(() =>
      _i44.DriftRockTreaningsLocalDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i45.RockTreaningsRepository>(() =>
      _i46.RockTreaningsRepositoryImpl(
          gh<_i43.RockTreaningsLocalDataSource>()));
  gh.lazySingleton<_i47.SettingsDataSource>(
      () => _i48.SettingsDataSourceImpl());
  gh.lazySingleton<_i49.SettingsRepository>(
      () => _i50.SettingsRepositoryImpl(gh<_i47.SettingsDataSource>()));
  gh.lazySingleton<_i51.StrengthExerciseDataSource>(
      () => _i52.LocalStrengthExerciseDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i53.StrengthExerciseRepository>(() =>
      _i54.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: gh<_i51.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i55.StrengthTreaningsDataSource>(() =>
      _i56.LocalStrengthTreaningsDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i57.StrengthTreaningsRepository>(() =>
      _i58.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource: gh<_i55.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i59.TechniqueTreaningsLocalDataSource>(() =>
      _i60.DriftTechniqueTreaningsLocalDataSource(
          gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i61.TechniqueTreaningsRepository>(() =>
      _i62.TechniqueTreaningsRepositoryImpl(
          gh<_i59.TechniqueTreaningsLocalDataSource>()));
  gh.lazySingleton<_i63.TechniquesRemoteDataSource>(() =>
      _i64.FirebaseTechniquesRemoteDataSource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i65.TechniquesRepository>(() =>
      _i66.TechniquesRepositoryImpl(gh<_i63.TechniquesRemoteDataSource>()));
  gh.lazySingleton<_i67.TravelLocalDatasource>(
      () => _i68.DriftTravelLocalDatasource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i69.TravelRegionsDataSource>(
      () => _i70.HiveTravelRegionsDataSource(gh<_i10.HiveInterface>()));
  gh.lazySingleton<_i71.TravelRegionsRepository>(() =>
      _i72.TravelRegionsRepositoryImpl(gh<_i69.TravelRegionsDataSource>()));
  gh.lazySingleton<_i73.TravelRepository>(
      () => _i74.TravelRepositoryImpl(gh<_i67.TravelLocalDatasource>()));
  gh.lazySingleton<_i75.TrekkingPathLocalDataSource>(() =>
      _i76.DriftTrekkingPathLocalDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i77.TrekkingPathRepository>(() =>
      _i78.TrekkingPathRepositoryImpl(gh<_i75.TrekkingPathLocalDataSource>()));
  gh.lazySingleton<_i79.TrekkingRemoteDataSource>(
      () => _i80.FirebaseTrekkingRemoteDatasource(gh<_i8.FirebaseFirestore>()));
  gh.lazySingleton<_i81.TrekkingRepository>(
      () => _i82.TrekkingRepositoryImpl(gh<_i79.TrekkingRemoteDataSource>()));
  gh.lazySingleton<_i83.UpdateStrengthTreaningExercises>(
      () => _i83.UpdateStrengthTreaningExercises(
            strengthTreaningsRepository: gh<_i57.StrengthTreaningsRepository>(),
            strengthExerciseRepository: gh<_i53.StrengthExerciseRepository>(),
          ));
  gh.lazySingleton<_i84.AddRepetitionForStrengthTreaning>(() =>
      _i84.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i85.AddStrengthTreaning>(() => _i85.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i57.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i53.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i86.AddTechniqueToTreaningUseCase>(() =>
      _i86.AddTechniqueToTreaningUseCase(
          gh<_i61.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i87.AddTechniqueTreaningUseCase>(() =>
      _i87.AddTechniqueTreaningUseCase(
          gh<_i61.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i88.AddTravelUsecase>(
      () => _i88.AddTravelUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i89.AddTrekEventUsecase>(
      () => _i89.AddTrekEventUsecase(gh<_i77.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i90.AnaliticsService>(() async =>
      _i91.FirebaseAnaliticsService(
          await gh.getAsync<_i5.FirebaseAnalytics>()));
  gh.lazySingleton<_i92.AuthDataSource>(
      () => _i93.FirebaseAuthDataSource(firebaseAuth: gh<_i6.FirebaseAuth>()));
  gh.lazySingleton<_i94.AuthRepository>(
      () => _i95.AuthRepositoryImpl(authDataSource: gh<_i92.AuthDataSource>()));
  gh.lazySingleton<_i96.CardioTreaningsDatasource>(
      () => _i97.LocalCardioTreaningsDatasource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i98.CardioTreaningsRepository>(() =>
      _i99.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i96.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i100.ClimbingHallRepository>(
      () => _i101.ClimbingHallRepositoryImpl(
            gh<_i3.ClimbingHallDataSource>(),
            gh<_i35.RemoteGymDataSource>(),
            gh<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i102.ContinueTrekUsecase>(
      () => _i102.ContinueTrekUsecase(gh<_i77.TrekkingPathRepository>()));
  gh.lazySingletonAsync<_i103.CrashLogService>(() async =>
      _i104.GoogleCrashLogService(
          await gh.getAsync<_i7.FirebaseCrashlytics>()));
  gh.lazySingleton<_i105.CurrentTechniqueTreaningUseCase>(() =>
      _i105.CurrentTechniqueTreaningUseCase(
          gh<_i61.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i106.CurrentTravelUsecase>(
      () => _i106.CurrentTravelUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i107.CurrentTrekkingPathUsecase>(() =>
      _i107.CurrentTrekkingPathUsecase(gh<_i77.TrekkingPathRepository>()));
  gh.lazySingleton<_i108.DeleteBudgetLineUsecase>(
      () => _i108.DeleteBudgetLineUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i109.DeleteCardioTreaning>(() => _i109.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i98.CardioTreaningsRepository>()));
  gh.lazySingleton<_i110.DeleteCostLineUsecase>(
      () => _i110.DeleteCostLineUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i111.DeleteInsuranceLineUsecase>(
      () => _i111.DeleteInsuranceLineUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i112.DeleteRepetitionForStrengthTreaning>(() =>
      _i112.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository: gh<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i113.DeleteRockAttempt>(
      () => _i113.DeleteRockAttempt(gh<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i114.DeleteStrengthExercise>(() =>
      _i114.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i53.StrengthExerciseRepository>()));
  gh.lazySingleton<_i115.DeleteStrengthTreaning>(() =>
      _i115.DeleteStrengthTreaning(
          strengthTreaningsRepository: gh<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i116.DeleteTechniqueTreaningUseCase>(() =>
      _i116.DeleteTechniqueTreaningUseCase(
          gh<_i61.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i117.EditBudgetLineUsecase>(
      () => _i117.EditBudgetLineUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i118.EditCostLineUsecase>(
      () => _i118.EditCostLineUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i119.EditDayLineUsecase>(
      () => _i119.EditDayLineUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i120.EditInsuranceLineUsecase>(
      () => _i120.EditInsuranceLineUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i121.EditTechniqueItemUseCase>(() =>
      _i121.EditTechniqueItemUseCase(gh<_i61.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i122.EditTravelUsecase>(
      () => _i122.EditTravelUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i123.FinishRockAttempt>(
      () => _i123.FinishRockAttempt(gh<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i124.FinishRockTreaning>(
      () => _i124.FinishRockTreaning(gh<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i125.FinishStrengthTreaning>(() =>
      _i125.FinishStrengthTreaning(
          strengthTreaningsRepository: gh<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i126.FinishTechniqueTreaningUseCase>(() =>
      _i126.FinishTechniqueTreaningUseCase(
          gh<_i61.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i127.GetBudgetLinesUsecase>(
      () => _i127.GetBudgetLinesUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i128.GetCardioTreanings>(() => _i128.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i98.CardioTreaningsRepository>()));
  gh.lazySingleton<_i129.GetClimbingHallRoures>(
      () => _i129.GetClimbingHallRoures(gh<_i100.ClimbingHallRepository>()));
  gh.lazySingleton<_i130.GetCostLinesUsecase>(
      () => _i130.GetCostLinesUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i131.GetCurrentRockTreaning>(
      () => _i131.GetCurrentRockTreaning(gh<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i132.GetCurrentStrengthTreaning>(() =>
      _i132.GetCurrentStrengthTreaning(
          strengthTreaningsRepository: gh<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i133.GetCurrentTravelDayUsecase>(
      () => _i133.GetCurrentTravelDayUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i134.GetDayLinesUsecase>(
      () => _i134.GetDayLinesUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i135.GetInsuranceLineUsecase>(
      () => _i135.GetInsuranceLineUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i136.GetLastCardioTreaning>(() =>
      _i136.GetLastCardioTreaning(
          cardioTreaningsRepository: gh<_i98.CardioTreaningsRepository>()));
  gh.lazySingleton<_i137.GetLastRockTreaning>(
      () => _i137.GetLastRockTreaning(gh<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i138.GetMountainRegions>(
      () => _i138.GetMountainRegions(gh<_i22.MountainRegionsRepository>()));
  gh.lazySingleton<_i139.GetMountainRoutes>(
      () => _i139.GetMountainRoutes(gh<_i22.MountainRegionsRepository>()));
  gh.lazySingleton<_i140.GetMountains>(
      () => _i140.GetMountains(gh<_i22.MountainRegionsRepository>()));
  gh.lazySingleton<_i141.GetPreviosStrengthTreaning>(() =>
      _i141.GetPreviosStrengthTreaning(
          strengthTreaningsRepository: gh<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i142.GetPublications>(
      () => _i142.GetPublications(gh<_i33.PublicationReporitory>()));
  gh.lazySingleton<_i143.GetRockRouteAttempts>(
      () => _i143.GetRockRouteAttempts(gh<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i144.GetRockRouteStatistic>(
      () => _i144.GetRockRouteStatistic(gh<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i145.GetStrengthExercises>(() => _i145.GetStrengthExercises(
      strengthExerciseRepository: gh<_i53.StrengthExerciseRepository>()));
  gh.lazySingleton<_i146.GetStrengthTreanings>(() => _i146.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i57.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i147.GetTechniqueGroupsUsecase>(
      () => _i147.GetTechniqueGroupsUsecase(gh<_i65.TechniquesRepository>()));
  gh.lazySingleton<_i148.GetTechniquesUsecase>(
      () => _i148.GetTechniquesUsecase(gh<_i65.TechniquesRepository>()));
  gh.lazySingleton<_i149.GetTravelRegionsUsecase>(
      () => _i149.GetTravelRegionsUsecase(gh<_i71.TravelRegionsRepository>()));
  gh.lazySingleton<_i150.GetTravelsUsecase>(
      () => _i150.GetTravelsUsecase(gh<_i73.TravelRepository>()));
  gh.lazySingleton<_i151.GetTrekkingRegions>(
      () => _i151.GetTrekkingRegions(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i152.GetTreks>(
      () => _i152.GetTreks(gh<_i81.TrekkingRepository>()));
  gh.lazySingleton<_i153.HallRouteToArchive>(() =>
      _i153.HallRouteToArchive(repository: gh<_i100.ClimbingHallRepository>()));
  gh.lazySingleton<_i154.HallTreaningDataSource>(
      () => _i155.LocalHallTreaningDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i156.HallTreaningRepository>(
      () => _i157.HallTreaningRepositoryImpl(
            dataSource: gh<_i154.HallTreaningDataSource>(),
            hallDataSource: gh<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i158.IceRegionsRepository>(
      () => _i159.IceRegionsRepositoryImpl(
            gh<_i11.IceRegionsDataSource>(),
            gh<_i13.IceRegionsRemoteDataSource>(),
            gh<_i24.NetworkInfo>(),
          ));
  gh.lazySingleton<_i160.IceTreaningsDataSource>(
      () => _i161.LocalIceTreaningsDataSource(gh<_i16.LocalDBDatasource>()));
  gh.lazySingleton<_i162.IceTreaningsRepository>(() =>
      _i163.IceTreaningsRepositoryImpl(gh<_i160.IceTreaningsDataSource>()));
  gh.lazySingleton<_i164.LastHallTreaning>(
      () => _i164.LastHallTreaning(gh<_i156.HallTreaningRepository>()));
  gh.lazySingleton<_i165.LoadDistrictsUseCase>(() => _i165.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i158.IceRegionsRepository>()));
  gh.lazySingleton<_i166.LoadPlaces>(
      () => _i166.LoadPlaces(gh<_i29.PlacesRepository>()));
  gh.lazySingleton<_i167.LoadRockDistricts>(
      () => _i167.LoadRockDistricts(gh<_i41.RockRegionsRepository>()));
  gh.lazySingleton<_i168.LoadRockRoutes>(
      () => _i168.LoadRockRoutes(gh<_i41.RockRegionsRepository>()));
  gh.lazySingleton<_i169.LoadRockSectors>(
      () => _i169.LoadRockSectors(gh<_i41.RockRegionsRepository>()));
  gh.lazySingleton<_i170.LoadSectorsUseCase>(() => _i170.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i158.IceRegionsRepository>()));
  gh.lazySingleton<_i171.LoadSimpleSettingsUsecase>(
      () => _i171.LoadSimpleSettingsUsecase(gh<_i49.SettingsRepository>()));
  gh.lazySingleton<_i172.LoadTreaningsSettings>(
      () => _i172.LoadTreaningsSettings(gh<_i49.SettingsRepository>()));
  gh.lazySingleton<_i173.LocalAscensionDataSource>(
      () => _i174.DriftLocalAscensionDataSource(gh<_i16.LocalDBDatasource>()));
  gh.factory<_i175.MountainRegionsCubit>(
      () => _i175.MountainRegionsCubit(gh<_i138.GetMountainRegions>()));
  gh.factory<_i176.MountainRoutesCubit>(
      () => _i176.MountainRoutesCubit(gh<_i139.GetMountainRoutes>()));
  gh.factory<_i177.MountainsCubit>(
      () => _i177.MountainsCubit(gh<_i140.GetMountains>()));
  gh.lazySingleton<_i178.NewHallAttempt>(() => _i178.NewHallAttempt(
      treaningRepository: gh<_i156.HallTreaningRepository>()));
  gh.lazySingleton<_i179.NewHallAttemptFromRoute>(() =>
      _i179.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i156.HallTreaningRepository>()));
  gh.lazySingleton<_i180.NewHallRoute>(() => _i180.NewHallRoute(
      climbingHallRepository: gh<_i100.ClimbingHallRepository>()));
  gh.lazySingleton<_i181.NewHallTreaning>(() => _i181.NewHallTreaning(
      treaningRepository: gh<_i156.HallTreaningRepository>()));
  gh.lazySingleton<_i182.NewIceAttempt>(
      () => _i182.NewIceAttempt(gh<_i162.IceTreaningsRepository>()));
  gh.lazySingleton<_i183.NewIceTreaning>(() => _i183.NewIceTreaning(
        iceTreaningsRepository: gh<_i162.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i158.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i184.NewRockAttempt>(
      () => _i184.NewRockAttempt(gh<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i185.NewRockTreaning>(
      () => _i185.NewRockTreaning(gh<_i45.RockTreaningsRepository>()));
  gh.lazySingleton<_i186.PreviosTechniqueTreaningUseCase>(() =>
      _i186.PreviosTechniqueTreaningUseCase(
          gh<_i61.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i187.PreviosTrekkingPathUsecase>(() =>
      _i187.PreviosTrekkingPathUsecase(gh<_i77.TrekkingPathRepository>()));
  gh.factory<_i188.RockDistrictsCubit>(
      () => _i188.RockDistrictsCubit(gh<_i167.LoadRockDistricts>()));
  gh.factory<_i189.RockRoutesCubit>(() => _i189.RockRoutesCubit(
        gh<_i168.LoadRockRoutes>(),
        gh<_i144.GetRockRouteStatistic>(),
      ));
  gh.lazySingleton<_i190.RockSectorToTreaning>(
      () => _i190.RockSectorToTreaning(gh<_i45.RockTreaningsRepository>()));
  gh.factory<_i191.RockSectorsCubit>(
      () => _i191.RockSectorsCubit(gh<_i169.LoadRockSectors>()));
  gh.factory<_i192.RockTreaningCubit>(() => _i192.RockTreaningCubit(
        gh<_i185.NewRockTreaning>(),
        gh<_i190.RockSectorToTreaning>(),
        gh<_i184.NewRockAttempt>(),
        gh<_i123.FinishRockAttempt>(),
        gh<_i124.FinishRockTreaning>(),
        gh<_i137.GetLastRockTreaning>(),
        gh<_i131.GetCurrentRockTreaning>(),
        gh<_i144.GetRockRouteStatistic>(),
        gh<_i113.DeleteRockAttempt>(),
      ));
  gh.lazySingleton<_i193.SaveCardioTreaning>(() => _i193.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i98.CardioTreaningsRepository>()));
  gh.lazySingleton<_i194.SaveSimpleSettingsUsecase>(
      () => _i194.SaveSimpleSettingsUsecase(gh<_i49.SettingsRepository>()));
  gh.lazySingleton<_i195.SaveStrengthExercise>(() => _i195.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i53.StrengthExerciseRepository>()));
  gh.lazySingleton<_i196.SaveTreaningsSettings>(
      () => _i196.SaveTreaningsSettings(gh<_i49.SettingsRepository>()));
  gh.lazySingleton<_i197.SelectToUseStrengthExercise>(() =>
      _i197.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i53.StrengthExerciseRepository>()));
  gh.lazySingleton<_i198.SettingsCubit>(() => _i198.SettingsCubit(
        gh<_i172.LoadTreaningsSettings>(),
        gh<_i196.SaveTreaningsSettings>(),
        gh<_i166.LoadPlaces>(),
        gh<_i171.LoadSimpleSettingsUsecase>(),
        gh<_i194.SaveSimpleSettingsUsecase>(),
      ));
  gh.lazySingleton<_i199.StartTrekUsecase>(
      () => _i199.StartTrekUsecase(gh<_i77.TrekkingPathRepository>()));
  gh.factory<_i200.StrengthExercisesCubit>(() => _i200.StrengthExercisesCubit(
        gh<_i145.GetStrengthExercises>(),
        gh<_i195.SaveStrengthExercise>(),
        gh<_i197.SelectToUseStrengthExercise>(),
        gh<_i114.DeleteStrengthExercise>(),
      ));
  gh.factory<_i201.StrengthTrainingCubit>(() => _i201.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i132.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i141.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i85.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i83.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i84.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i125.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i112.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i202.StrengthTrainingsCubit>(() => _i202.StrengthTrainingsCubit(
        gh<_i146.GetStrengthTreanings>(),
        gh<_i115.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i203.TechniqueGroupsCubit>(
      () => _i203.TechniqueGroupsCubit(gh<_i147.GetTechniqueGroupsUsecase>()));
  gh.factory<_i204.TechniqueTreaningCubit>(() => _i204.TechniqueTreaningCubit(
        gh<_i87.AddTechniqueTreaningUseCase>(),
        gh<_i186.PreviosTechniqueTreaningUseCase>(),
        gh<_i105.CurrentTechniqueTreaningUseCase>(),
        gh<_i86.AddTechniqueToTreaningUseCase>(),
        gh<_i126.FinishTechniqueTreaningUseCase>(),
        gh<_i121.EditTechniqueItemUseCase>(),
      ));
  gh.factory<_i205.TechniquesCubit>(
      () => _i205.TechniquesCubit(gh<_i148.GetTechniquesUsecase>()));
  gh.factory<_i206.TravelDayCubit>(
      () => _i206.TravelDayCubit(gh<_i119.EditDayLineUsecase>()));
  gh.factory<_i207.TravelPageCubit>(() => _i207.TravelPageCubit(
        gh<_i110.DeleteCostLineUsecase>(),
        gh<_i118.EditCostLineUsecase>(),
        gh<_i130.GetCostLinesUsecase>(),
        gh<_i135.GetInsuranceLineUsecase>(),
        gh<_i127.GetBudgetLinesUsecase>(),
        gh<_i120.EditInsuranceLineUsecase>(),
        gh<_i117.EditBudgetLineUsecase>(),
        gh<_i111.DeleteInsuranceLineUsecase>(),
        gh<_i108.DeleteBudgetLineUsecase>(),
        gh<_i134.GetDayLinesUsecase>(),
        gh<_i9.GetFeedingStatisticUsecase>(),
        gh<_i122.EditTravelUsecase>(),
        gh<_i149.GetTravelRegionsUsecase>(),
      ));
  gh.factory<_i208.TravelsCubit>(() => _i208.TravelsCubit(
        gh<_i150.GetTravelsUsecase>(),
        gh<_i88.AddTravelUsecase>(),
      ));
  gh.factory<_i209.TrekkingCubit>(() => _i209.TrekkingCubit(
        gh<_i107.CurrentTrekkingPathUsecase>(),
        gh<_i187.PreviosTrekkingPathUsecase>(),
        gh<_i199.StartTrekUsecase>(),
        gh<_i89.AddTrekEventUsecase>(),
        gh<_i102.ContinueTrekUsecase>(),
      ));
  gh.factory<_i210.TrekkingRegionsCubit>(
      () => _i210.TrekkingRegionsCubit(gh<_i151.GetTrekkingRegions>()));
  gh.factory<_i211.TreksCubit>(() => _i211.TreksCubit(gh<_i152.GetTreks>()));
  gh.lazySingleton<_i212.AllClimbingHalls>(
      () => _i212.AllClimbingHalls(gh<_i100.ClimbingHallRepository>()));
  gh.lazySingleton<_i213.AllHallTreanings>(
      () => _i213.AllHallTreanings(gh<_i156.HallTreaningRepository>()));
  gh.lazySingleton<_i214.AscensionRepository>(() =>
      _i215.AscensionRepositoryImpl(gh<_i173.LocalAscensionDataSource>()));
  gh.factory<_i216.AuthGetUser>(
      () => _i216.AuthGetUser(authRepository: gh<_i94.AuthRepository>()));
  gh.factory<_i217.AuthLogin>(
      () => _i217.AuthLogin(authRepository: gh<_i94.AuthRepository>()));
  gh.factory<_i218.AuthLogout>(
      () => _i218.AuthLogout(authRepository: gh<_i94.AuthRepository>()));
  gh.factory<_i219.AuthenticationCubit>(() => _i219.AuthenticationCubit(
        gh<_i217.AuthLogin>(),
        gh<_i218.AuthLogout>(),
        gh<_i216.AuthGetUser>(),
      ));
  gh.factory<_i220.BlogCubit>(
      () => _i220.BlogCubit(gh<_i142.GetPublications>()));
  gh.factory<_i221.CardioTreaningCubit>(() => _i221.CardioTreaningCubit(
        gh<_i136.GetLastCardioTreaning>(),
        gh<_i193.SaveCardioTreaning>(),
      ));
  gh.factory<_i222.CardioTreaningsCubit>(() => _i222.CardioTreaningsCubit(
        gh<_i128.GetCardioTreanings>(),
        gh<_i109.DeleteCardioTreaning>(),
        gh<_i193.SaveCardioTreaning>(),
      ));
  gh.factory<_i223.ClimbingHallsCubit>(() =>
      _i223.ClimbingHallsCubit(allClimbingHalls: gh<_i212.AllClimbingHalls>()));
  gh.lazySingleton<_i224.CurrentHallTreaning>(
      () => _i224.CurrentHallTreaning(gh<_i156.HallTreaningRepository>()));
  gh.factory<_i225.CurrentTravelCubit>(() => _i225.CurrentTravelCubit(
        gh<_i106.CurrentTravelUsecase>(),
        gh<_i118.EditCostLineUsecase>(),
        gh<_i133.GetCurrentTravelDayUsecase>(),
      ));
  gh.lazySingleton<_i226.DeleteHallAttempt>(() => _i226.DeleteHallAttempt(
      treaningRepository: gh<_i156.HallTreaningRepository>()));
  gh.lazySingleton<_i227.DeleteHallTreaning>(() => _i227.DeleteHallTreaning(
      treaningRepository: gh<_i156.HallTreaningRepository>()));
  gh.lazySingleton<_i228.DeleteIceAttempt>(
      () => _i228.DeleteIceAttempt(gh<_i162.IceTreaningsRepository>()));
  gh.lazySingleton<_i229.DeleteTreaning>(() => _i229.DeleteTreaning(
        gh<_i156.HallTreaningRepository>(),
        gh<_i162.IceTreaningsRepository>(),
        gh<_i57.StrengthTreaningsRepository>(),
        gh<_i98.CardioTreaningsRepository>(),
        gh<_i45.RockTreaningsRepository>(),
        gh<_i77.TrekkingPathRepository>(),
        gh<_i61.TechniqueTreaningsRepository>(),
        gh<_i214.AscensionRepository>(),
      ));
  gh.lazySingleton<_i230.EditAscensionEventUsecase>(
      () => _i230.EditAscensionEventUsecase(gh<_i214.AscensionRepository>()));
  gh.lazySingleton<_i231.ExportTreaningsUseCase>(
      () => _i231.ExportTreaningsUseCase(
            gh<_i156.HallTreaningRepository>(),
            gh<_i162.IceTreaningsRepository>(),
            gh<_i57.StrengthTreaningsRepository>(),
            gh<_i98.CardioTreaningsRepository>(),
            gh<_i45.RockTreaningsRepository>(),
            gh<_i73.TravelRepository>(),
            gh<_i77.TrekkingPathRepository>(),
            gh<_i61.TechniqueTreaningsRepository>(),
            gh<_i214.AscensionRepository>(),
          ));
  gh.lazySingleton<_i232.FinishAscensionUsecase>(
      () => _i232.FinishAscensionUsecase(gh<_i214.AscensionRepository>()));
  gh.lazySingleton<_i233.FinishHallAttempt>(() => _i233.FinishHallAttempt(
      treaningRepository: gh<_i156.HallTreaningRepository>()));
  gh.lazySingleton<_i234.FinishHallTreaning>(() => _i234.FinishHallTreaning(
      treaningRepository: gh<_i156.HallTreaningRepository>()));
  gh.lazySingleton<_i235.FinishIceAttempt>(
      () => _i235.FinishIceAttempt(gh<_i162.IceTreaningsRepository>()));
  gh.lazySingleton<_i236.FinishIceTreaning>(() => _i236.FinishIceTreaning(
      iceTreaningsRepository: gh<_i162.IceTreaningsRepository>()));
  gh.lazySingleton<_i237.GetAllTreanings>(() => _i237.GetAllTreanings(
        gh<_i156.HallTreaningRepository>(),
        gh<_i162.IceTreaningsRepository>(),
        gh<_i57.StrengthTreaningsRepository>(),
        gh<_i98.CardioTreaningsRepository>(),
        gh<_i45.RockTreaningsRepository>(),
        gh<_i73.TravelRepository>(),
        gh<_i77.TrekkingPathRepository>(),
        gh<_i61.TechniqueTreaningsRepository>(),
        gh<_i214.AscensionRepository>(),
      ));
  gh.lazySingleton<_i238.GetAscensionUsecase>(
      () => _i238.GetAscensionUsecase(gh<_i214.AscensionRepository>()));
  gh.lazySingleton<_i239.GetCurrentIceTreaning>(() =>
      _i239.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i162.IceTreaningsRepository>()));
  gh.lazySingleton<_i240.GetGymRouteStatistic>(
      () => _i240.GetGymRouteStatistic(gh<_i156.HallTreaningRepository>()));
  gh.lazySingleton<_i241.GetHallRouteAttempts>(() => _i241.GetHallRouteAttempts(
      repository: gh<_i156.HallTreaningRepository>()));
  gh.lazySingleton<_i242.GetLastIceTreaning>(() => _i242.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i162.IceTreaningsRepository>()));
  gh.factory<_i243.HallRouteAttemptsCubit>(() => _i243.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i241.GetHallRouteAttempts>()));
  gh.factory<_i244.HallRouteCubit>(
      () => _i244.HallRouteCubit(gh<_i180.NewHallRoute>()));
  gh.factory<_i245.HallTreaningsCubit>(() => _i245.HallTreaningsCubit(
        allHallTreanings: gh<_i213.AllHallTreanings>(),
        deleteHallTreaning: gh<_i227.DeleteHallTreaning>(),
      ));
  gh.factory<_i246.HomePageCubit>(() =>
      _i246.HomePageCubit(allClimbingHalls: gh<_i212.AllClimbingHalls>()));
  gh.factory<_i247.IceDistrictsCubit>(() => _i247.IceDistrictsCubit(
      loadDistrictsUseCase: gh<_i165.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i248.IceSectorToTreaning>(() => _i248.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i162.IceTreaningsRepository>()));
  gh.factory<_i249.IceSectorsCubit>(() => _i249.IceSectorsCubit(
      loadSectorsUseCase: gh<_i170.LoadSectorsUseCase>()));
  gh.lazySingleton<_i250.ImportTreaningsUseCase>(
      () => _i250.ImportTreaningsUseCase(
            gh<_i156.HallTreaningRepository>(),
            gh<_i162.IceTreaningsRepository>(),
            gh<_i57.StrengthTreaningsRepository>(),
            gh<_i98.CardioTreaningsRepository>(),
            gh<_i45.RockTreaningsRepository>(),
            gh<_i73.TravelRepository>(),
            gh<_i77.TrekkingPathRepository>(),
            gh<_i61.TechniqueTreaningsRepository>(),
            gh<_i214.AscensionRepository>(),
          ));
  gh.factory<_i251.TreaningsCubit>(() => _i251.TreaningsCubit(
        gh<_i237.GetAllTreanings>(),
        gh<_i229.DeleteTreaning>(),
      ));
  gh.factory<_i252.TreaningsExportImportCubit>(
      () => _i252.TreaningsExportImportCubit(
            gh<_i231.ExportTreaningsUseCase>(),
            gh<_i250.ImportTreaningsUseCase>(),
          ));
  gh.lazySingleton<_i253.AddAscensionUsecase>(
      () => _i253.AddAscensionUsecase(gh<_i214.AscensionRepository>()));
  gh.factory<_i254.AscensionCubit>(() => _i254.AscensionCubit(
        gh<_i253.AddAscensionUsecase>(),
        gh<_i238.GetAscensionUsecase>(),
        gh<_i232.FinishAscensionUsecase>(),
        gh<_i230.EditAscensionEventUsecase>(),
      ));
  gh.factory<_i255.ClimbingHallCubit>(() => _i255.ClimbingHallCubit(
        gh<_i129.GetClimbingHallRoures>(),
        gh<_i153.HallRouteToArchive>(),
        gh<_i240.GetGymRouteStatistic>(),
      ));
  gh.factory<_i256.CurrentHallTreaningCubit>(
      () => _i256.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i179.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i181.NewHallTreaning>(),
            newHallAttempt: gh<_i178.NewHallAttempt>(),
            currentHallTreaning: gh<_i224.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i233.FinishHallAttempt>(),
            finishHallTreaning: gh<_i234.FinishHallTreaning>(),
            lastHallTreaning: gh<_i164.LastHallTreaning>(),
            deleteHallAttempt: gh<_i226.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i240.GetGymRouteStatistic>(),
          ));
  gh.factory<_i257.CurrentIceTreaningCubit>(() => _i257.CurrentIceTreaningCubit(
        gh<_i183.NewIceTreaning>(),
        gh<_i248.IceSectorToTreaning>(),
        gh<_i182.NewIceAttempt>(),
        gh<_i235.FinishIceAttempt>(),
        gh<_i236.FinishIceTreaning>(),
        gh<_i239.GetCurrentIceTreaning>(),
        gh<_i242.GetLastIceTreaning>(),
        gh<_i228.DeleteIceAttempt>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i258.InjectableModule {}

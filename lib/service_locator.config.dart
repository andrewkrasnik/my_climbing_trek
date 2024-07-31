// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i141;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i447;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import 'core/datasource/drift_db_local_datasource.dart' as _i138;
import 'core/datasource/image_cash_manager.dart' as _i892;
import 'core/datasource/local_db_datasource.dart' as _i808;
import 'core/injectable_module.dart' as _i142;
import 'core/services/analitics/analitics_service.dart' as _i540;
import 'core/services/analitics/firebase_analitics_service.dart' as _i664;
import 'core/services/crash_log_service/crash_log_service.dart' as _i815;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i548;
import 'core/services/network/network_info.dart' as _i353;
import 'features/authentication/data/datasources/auth_data_source.dart'
    as _i313;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i159;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i446;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i877;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i186;
import 'features/authentication/domain/usecases/auth_login.dart' as _i801;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i581;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i48;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i682;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i1;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i613;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i969;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i275;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i1038;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i673;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i533;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i734;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i976;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i353;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i1059;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i635;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i653;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i775;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i808;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i1058;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i985;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i119;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i194;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i934;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i78;
import 'features/hall_climbing/domain/usecases/get_gym_route_statistic.dart'
    as _i456;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i541;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i231;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i44;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i313;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i284;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i1054;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i667;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i510;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i1043;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i591;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i643;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i424;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i364;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i273;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i1006;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i147;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i247;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i837;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i295;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i338;
import 'features/ice_climbing/data/datasources/firebase_ice_regions_remote_datasource.dart'
    as _i124;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i283;
import 'features/ice_climbing/data/datasources/ice_regions_remote_datasource.dart'
    as _i602;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i855;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i749;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i837;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i176;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i915;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i617;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i916;
import 'features/ice_climbing/domain/usecases/add_my_ice_district.dart' as _i32;
import 'features/ice_climbing/domain/usecases/delete_ice_attempt.dart' as _i187;
import 'features/ice_climbing/domain/usecases/delete_my_ice_district.dart'
    as _i21;
import 'features/ice_climbing/domain/usecases/delete_sector_usecase.dart'
    as _i16;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i213;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart'
    as _i312;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i146;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i77;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i197;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i150;
import 'features/ice_climbing/domain/usecases/load_my_ice_districts.dart'
    as _i73;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i66;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i1037;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i468;
import 'features/ice_climbing/domain/usecases/save_sector_usecase.dart'
    as _i476;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i240;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i897;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i630;
import 'features/mountaineering/data/datasources/drift_local_ascension_datasource.dart'
    as _i138;
import 'features/mountaineering/data/datasources/firebase_mountain_regions_remote_datasource.dart'
    as _i764;
import 'features/mountaineering/data/datasources/hive_mountain_regions_local_datasource.dart'
    as _i265;
import 'features/mountaineering/data/datasources/local_ascension_datasource.dart'
    as _i177;
import 'features/mountaineering/data/datasources/mountain_regions_local_datasource.dart'
    as _i342;
import 'features/mountaineering/data/datasources/mountain_regions_remote_datasource.dart'
    as _i179;
import 'features/mountaineering/data/repositories/ascension_repository_impl.dart'
    as _i806;
import 'features/mountaineering/data/repositories/mountain_regions_repository_impl.dart'
    as _i1063;
import 'features/mountaineering/domain/repositories/ascension_repository.dart'
    as _i248;
import 'features/mountaineering/domain/repositories/mountain_regions_repository.dart'
    as _i436;
import 'features/mountaineering/domain/usecases/add_ascension_usecase.dart'
    as _i329;
import 'features/mountaineering/domain/usecases/add_my_mountain_region_usecase.dart'
    as _i568;
import 'features/mountaineering/domain/usecases/delete_my_mountain_region_usecase.dart'
    as _i94;
import 'features/mountaineering/domain/usecases/edit_ascension_event_usecase.dart'
    as _i816;
import 'features/mountaineering/domain/usecases/finish_ascension_usecase.dart'
    as _i560;
import 'features/mountaineering/domain/usecases/get_ascension_usecase.dart'
    as _i124;
import 'features/mountaineering/domain/usecases/get_mountain_regions.dart'
    as _i397;
import 'features/mountaineering/domain/usecases/get_mountain_routes.dart'
    as _i215;
import 'features/mountaineering/domain/usecases/get_mountaints.dart' as _i207;
import 'features/mountaineering/domain/usecases/get_my_mountain_regions.dart'
    as _i6;
import 'features/mountaineering/domain/usecases/save_mountain_route_usecase.dart'
    as _i508;
import 'features/mountaineering/domain/usecases/save_mountain_usecase.dart'
    as _i959;
import 'features/mountaineering/presentation/bloc/ascension/ascension_cubit.dart'
    as _i387;
import 'features/mountaineering/presentation/bloc/mountain_regions/mountain_regions_cubit.dart'
    as _i780;
import 'features/mountaineering/presentation/bloc/mountain_routes/mountain_routes_cubit.dart'
    as _i163;
import 'features/mountaineering/presentation/bloc/mountains/mountains_cubit.dart'
    as _i675;
import 'features/rock_climbing/data/datasources/drift_rock_treanings_local_datasource.dart'
    as _i924;
import 'features/rock_climbing/data/datasources/firebase_rock_regions_remote_datasource.dart'
    as _i287;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i239;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i37;
import 'features/rock_climbing/data/datasources/rock_regions_remote_datasource.dart'
    as _i47;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i677;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i601;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i779;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i772;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i1067;
import 'features/rock_climbing/domain/usecases/add_my_rock_district.dart'
    as _i16;
import 'features/rock_climbing/domain/usecases/delete_my_rock_district.dart'
    as _i933;
import 'features/rock_climbing/domain/usecases/delete_rock_attempt.dart'
    as _i262;
import 'features/rock_climbing/domain/usecases/delete_rock_route.dart' as _i469;
import 'features/rock_climbing/domain/usecases/delete_rock_sector.dart'
    as _i550;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i32;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i20;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i884;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i17;
import 'features/rock_climbing/domain/usecases/get_rock_route_attempts.dart'
    as _i612;
import 'features/rock_climbing/domain/usecases/get_rock_route_statistic.dart'
    as _i145;
import 'features/rock_climbing/domain/usecases/load_my_rock_districts.dart'
    as _i942;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i816;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i162;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i534;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i546;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i205;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i937;
import 'features/rock_climbing/domain/usecases/save_rock_route.dart' as _i931;
import 'features/rock_climbing/domain/usecases/save_rock_sector.dart' as _i280;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i453;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i1049;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i453;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i535;
import 'features/settings/data/datasources/firebase_places_remote_datasource.dart'
    as _i1032;
import 'features/settings/data/datasources/hive_places_local_datasource.dart'
    as _i373;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i302;
import 'features/settings/data/datasources/places_local_datasource.dart'
    as _i1020;
import 'features/settings/data/datasources/places_remote_datasource.dart'
    as _i135;
import 'features/settings/data/datasources/settings_datasource.dart' as _i463;
import 'features/settings/data/repositories/places_repository_impl.dart'
    as _i139;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i113;
import 'features/settings/domain/repositories/places_repository.dart' as _i453;
import 'features/settings/domain/repositories/settings_repository.dart'
    as _i309;
import 'features/settings/domain/usecases/load_places.dart' as _i766;
import 'features/settings/domain/usecases/load_simple_settings_usecase.dart'
    as _i140;
import 'features/settings/domain/usecases/load_treanings_settings.dart' as _i63;
import 'features/settings/domain/usecases/save_simple_settings_usecase.dart'
    as _i637;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i481;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i837;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i264;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i465;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i211;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i600;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i707;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i1042;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i21;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i751;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i336;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i624;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i453;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i967;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i518;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i571;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i337;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i859;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i182;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i422;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i212;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i791;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i526;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i319;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i306;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i144;
import 'features/techniques/data/datasources/drift_technique_treanings_local_datasource.dart'
    as _i846;
import 'features/techniques/data/datasources/firebase_techniques_remote_datasource.dart'
    as _i133;
import 'features/techniques/data/datasources/hive_techniques_local_datasource.dart'
    as _i317;
import 'features/techniques/data/datasources/technique_treanings_local_datasource.dart'
    as _i377;
import 'features/techniques/data/datasources/techniques_local_datasource.dart'
    as _i855;
import 'features/techniques/data/datasources/techniques_remote_datasource.dart'
    as _i360;
import 'features/techniques/data/repositories/technique_treanings_repository_impl.dart'
    as _i770;
import 'features/techniques/data/repositories/techniques_repository_impl.dart'
    as _i820;
import 'features/techniques/domain/repositories/technique_treanings_repository.dart'
    as _i665;
import 'features/techniques/domain/repositories/techniques_repository.dart'
    as _i312;
import 'features/techniques/domain/usecases/add_my_technique_group.dart'
    as _i578;
import 'features/techniques/domain/usecases/add_technique_to_treaning_usecase.dart'
    as _i222;
import 'features/techniques/domain/usecases/add_technique_treaning_usecase.dart'
    as _i486;
import 'features/techniques/domain/usecases/current_technique_treaning_usecase.dart'
    as _i484;
import 'features/techniques/domain/usecases/delete_my_technique_group.dart'
    as _i828;
import 'features/techniques/domain/usecases/delete_technique_group_usecase.dart'
    as _i793;
import 'features/techniques/domain/usecases/delete_technique_treaning_usecase.dart'
    as _i588;
import 'features/techniques/domain/usecases/delete_technique_usecase.dart'
    as _i540;
import 'features/techniques/domain/usecases/edit_technique_item_usecase.dart'
    as _i157;
import 'features/techniques/domain/usecases/finish_technique_treaning_usecase.dart'
    as _i755;
import 'features/techniques/domain/usecases/get_technique_groups_usecase.dart'
    as _i545;
import 'features/techniques/domain/usecases/get_techniques_editing_usecase.dart'
    as _i289;
import 'features/techniques/domain/usecases/get_techniques_usecase.dart'
    as _i218;
import 'features/techniques/domain/usecases/load_my_technique_groups.dart'
    as _i940;
import 'features/techniques/domain/usecases/previos_technique_treaning_usecase.dart'
    as _i858;
import 'features/techniques/domain/usecases/save_technique_group_usecase.dart'
    as _i47;
import 'features/techniques/domain/usecases/save_technique_usecase.dart'
    as _i18;
import 'features/techniques/presentation/bloc/technique_groups/technique_groups_cubit.dart'
    as _i418;
import 'features/techniques/presentation/bloc/technique_treaning/technique_treaning_cubit.dart'
    as _i942;
import 'features/techniques/presentation/bloc/techniques/techniques_cubit.dart'
    as _i89;
import 'features/traveling/data/datasources/drift_travel_local_datasource.dart'
    as _i999;
import 'features/traveling/data/datasources/hive_travel_regions_datasource.dart'
    as _i361;
import 'features/traveling/data/datasources/travel_local_datasource.dart'
    as _i207;
import 'features/traveling/data/datasources/travel_regions_datasource.dart'
    as _i151;
import 'features/traveling/data/repositories/travel_regions_repository_impl.dart'
    as _i629;
import 'features/traveling/data/repositories/travel_repository.dart' as _i278;
import 'features/traveling/domain/repositories/travel_regions_repository.dart'
    as _i157;
import 'features/traveling/domain/repositories/travel_repository.dart'
    as _i1055;
import 'features/traveling/domain/usecases/add_travel_usecase.dart' as _i948;
import 'features/traveling/domain/usecases/current_travel_usecase.dart'
    as _i764;
import 'features/traveling/domain/usecases/edit_travel_usecase.dart' as _i806;
import 'features/traveling/domain/usecases/get_current_travel_day_usecase.dart'
    as _i861;
import 'features/traveling/domain/usecases/get_travels_usecase.dart' as _i110;
import 'features/traveling/domain/usecases/travel_page/delete_budget_line_usecase.dart'
    as _i699;
import 'features/traveling/domain/usecases/travel_page/delete_cost_line_usecase.dart'
    as _i126;
import 'features/traveling/domain/usecases/travel_page/delete_insurance_line_usecase.dart'
    as _i89;
import 'features/traveling/domain/usecases/travel_page/edit_budget_line_usecase.dart'
    as _i621;
import 'features/traveling/domain/usecases/travel_page/edit_cost_line_usecase.dart'
    as _i434;
import 'features/traveling/domain/usecases/travel_page/edit_day_line_usecase.dart'
    as _i515;
import 'features/traveling/domain/usecases/travel_page/edit_insurance_line_usecase.dart'
    as _i985;
import 'features/traveling/domain/usecases/travel_page/get_budget_line_usecase.dart'
    as _i552;
import 'features/traveling/domain/usecases/travel_page/get_cost_lines_usecase.dart'
    as _i693;
import 'features/traveling/domain/usecases/travel_page/get_day_lines_usecase.dart'
    as _i910;
import 'features/traveling/domain/usecases/travel_page/get_feeding_statistic_usecase.dart'
    as _i442;
import 'features/traveling/domain/usecases/travel_page/get_insurance_lines_usecase.dart'
    as _i1073;
import 'features/traveling/domain/usecases/travel_page/get_travel_regions_usecase.dart'
    as _i206;
import 'features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart'
    as _i621;
import 'features/traveling/presentation/cubit/travel_day/travel_day_cubit.dart'
    as _i124;
import 'features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart'
    as _i758;
import 'features/traveling/presentation/cubit/travels/travels_cubit.dart'
    as _i957;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i39;
import 'features/treanings/domain/usecases/export_treanings_usecase.dart'
    as _i1041;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i1058;
import 'features/treanings/domain/usecases/import_treanings_usecase.dart'
    as _i743;
import 'features/treanings/presentation/cubit/treanings/treanings_cubit.dart'
    as _i19;
import 'features/treanings/presentation/cubit/treanings_export_import/treanings_export_import_cubit.dart'
    as _i78;
import 'features/trekking/data/datasources/drift_trekking_path_local_datasource.dart'
    as _i331;
import 'features/trekking/data/datasources/firebase_trekking_remote_datasource.dart'
    as _i18;
import 'features/trekking/data/datasources/hive_trekking_local_datasource.dart'
    as _i73;
import 'features/trekking/data/datasources/trekking_local_datasource.dart'
    as _i391;
import 'features/trekking/data/datasources/trekking_path_local_datasource.dart'
    as _i637;
import 'features/trekking/data/datasources/trekking_remote_datasource.dart'
    as _i316;
import 'features/trekking/data/repositories/trekking_path_repository_impl.dart'
    as _i975;
import 'features/trekking/data/repositories/trekking_repository_impl.dart'
    as _i902;
import 'features/trekking/domain/repositories/trekking_path_repository.dart'
    as _i330;
import 'features/trekking/domain/repositories/trekking_repository.dart'
    as _i434;
import 'features/trekking/domain/usecases/add_my_trekking_region_usecase.dart'
    as _i940;
import 'features/trekking/domain/usecases/add_trek_event_usecase.dart' as _i816;
import 'features/trekking/domain/usecases/continue_trek_usecase.dart' as _i795;
import 'features/trekking/domain/usecases/current_trekking_path_usecase.dart'
    as _i150;
import 'features/trekking/domain/usecases/delete_my__trekking_region_usecase.dart'
    as _i449;
import 'features/trekking/domain/usecases/delete_trek.dart' as _i95;
import 'features/trekking/domain/usecases/delete_trek_point.dart' as _i753;
import 'features/trekking/domain/usecases/get_my__trekking_regions.dart'
    as _i864;
import 'features/trekking/domain/usecases/get_trek_points.dart' as _i837;
import 'features/trekking/domain/usecases/get_trekking_regions.dart' as _i605;
import 'features/trekking/domain/usecases/get_treks.dart' as _i230;
import 'features/trekking/domain/usecases/previos_trekking_path_usecase.dart'
    as _i730;
import 'features/trekking/domain/usecases/save_trek.dart' as _i1027;
import 'features/trekking/domain/usecases/save_trek_point.dart' as _i163;
import 'features/trekking/domain/usecases/start_trek_usecase.dart' as _i540;
import 'features/trekking/presentation/bloc/trekking/trekking_cubit.dart'
    as _i685;
import 'features/trekking/presentation/bloc/trekking_regions/trekking_regions_cubit.dart'
    as _i448;
import 'features/trekking/presentation/bloc/treks/treks_cubit.dart' as _i205;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.lazySingletonAsync<_i141.FirebaseCrashlytics>(
      () => injectableModule.firebaseCrashlytics);
  gh.lazySingletonAsync<_i398.FirebaseAnalytics>(
      () => injectableModule.firebaseAnalytics);
  gh.lazySingleton<_i59.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingleton<_i986.HiveInterface>(() => injectableModule.hiveInterface);
  gh.lazySingleton<_i447.DefaultCacheManager>(
      () => injectableModule.cacheManager);
  gh.lazySingleton<_i974.FirebaseFirestore>(
      () => injectableModule.firebaseFirestore);
  gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker);
  gh.lazySingleton<_i442.GetFeedingStatisticUsecase>(
      () => _i442.GetFeedingStatisticUsecase());
  gh.lazySingleton<_i283.IceRegionsDataSource>(
      () => _i749.LocalIceRegionsDataSource());
  gh.lazySingleton<_i353.ClimbingHallDataSource>(
      () => _i635.LocalClimbingHallDataSource());
  gh.lazySingleton<_i342.MountainRegionsLocalDataSource>(
      () => _i265.HiveMountainRegionsLocalDataSource());
  gh.lazySingleton<_i1020.PlacesLocalDataSource>(
      () => _i373.HivePlacesLocalDataSource());
  gh.lazySingletonAsync<_i815.CrashLogService>(() async =>
      _i548.GoogleCrashLogService(
          await gh.getAsync<_i141.FirebaseCrashlytics>()));
  gh.lazySingleton<_i135.PlacesRemoteDataSource>(() =>
      _i1032.FirebasePlacesRemoteDataSource(gh<_i974.FirebaseFirestore>()));
  gh.lazySingleton<_i855.TechniquesLocalDataSource>(
      () => _i317.HiveTechniquesLocalDataSource());
  gh.lazySingleton<_i37.RockRegionsLocalDataSource>(
      () => _i239.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i808.LocalDBDatasource>(
      () => _i138.DriftDBLocalDataSource());
  gh.lazySingleton<_i463.SettingsDataSource>(
      () => _i302.SettingsDataSourceImpl());
  gh.lazySingleton<_i177.LocalAscensionDataSource>(
      () => _i138.DriftLocalAscensionDataSource(gh<_i808.LocalDBDatasource>()));
  gh.lazySingleton<_i855.IceTreaningsDataSource>(
      () => _i837.LocalIceTreaningsDataSource(gh<_i808.LocalDBDatasource>()));
  gh.lazySingleton<_i391.TrekkingLocalDataSource>(
      () => _i73.HiveTrekkingLocalDataSource());
  gh.lazySingleton<_i248.AscensionRepository>(() =>
      _i806.AscensionRepositoryImpl(gh<_i177.LocalAscensionDataSource>()));
  gh.lazySingleton<_i377.TechniqueTreaningsLocalDataSource>(() =>
      _i846.DriftTechniqueTreaningsLocalDataSource(
          gh<_i808.LocalDBDatasource>()));
  gh.lazySingleton<_i329.AddAscensionUsecase>(
      () => _i329.AddAscensionUsecase(gh<_i248.AscensionRepository>()));
  gh.lazySingleton<_i816.EditAscensionEventUsecase>(
      () => _i816.EditAscensionEventUsecase(gh<_i248.AscensionRepository>()));
  gh.lazySingleton<_i560.FinishAscensionUsecase>(
      () => _i560.FinishAscensionUsecase(gh<_i248.AscensionRepository>()));
  gh.lazySingleton<_i124.GetAscensionUsecase>(
      () => _i124.GetAscensionUsecase(gh<_i248.AscensionRepository>()));
  gh.lazySingleton<_i316.TrekkingRemoteDataSource>(
      () => _i18.FirebaseTrekkingRemoteDatasource(
            gh<_i974.FirebaseFirestore>(),
            gh<_i59.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i179.MountainRegionsRemoteDataSource>(
      () => _i764.FirebaseMountainRegionsRemoteDataSource(
            gh<_i974.FirebaseFirestore>(),
            gh<_i59.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i313.AuthDataSource>(() =>
      _i159.FirebaseAuthDataSource(firebaseAuth: gh<_i59.FirebaseAuth>()));
  gh.lazySingleton<_i602.IceRegionsRemoteDataSource>(
      () => _i124.FirebaseIceRegionsRemoteDataSource(
            gh<_i974.FirebaseFirestore>(),
            gh<_i59.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i353.NetworkInfo>(
      () => _i353.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
  gh.lazySingleton<_i877.AuthRepository>(() =>
      _i446.AuthRepositoryImpl(authDataSource: gh<_i313.AuthDataSource>()));
  gh.lazySingleton<_i360.TechniquesRemoteDataSource>(
      () => _i133.FirebaseTechniquesRemoteDataSource(
            gh<_i974.FirebaseFirestore>(),
            gh<_i59.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i665.TechniqueTreaningsRepository>(() =>
      _i770.TechniqueTreaningsRepositoryImpl(
          gh<_i377.TechniqueTreaningsLocalDataSource>()));
  gh.lazySingleton<_i775.RemoteGymDataSource>(
      () => _i808.RemoteGymDataSourceImpl(
            gh<_i974.FirebaseFirestore>(),
            gh<_i59.FirebaseAuth>(),
          ));
  gh.lazySingletonAsync<_i540.AnaliticsService>(() async =>
      _i664.FirebaseAnaliticsService(
          await gh.getAsync<_i398.FirebaseAnalytics>()));
  gh.lazySingleton<_i309.SettingsRepository>(
      () => _i113.SettingsRepositoryImpl(gh<_i463.SettingsDataSource>()));
  gh.lazySingleton<_i916.IceTreaningsRepository>(() =>
      _i915.IceTreaningsRepositoryImpl(gh<_i855.IceTreaningsDataSource>()));
  gh.lazySingleton<_i892.ImageCashManager>(() => _i892.ImageCashManagerImpl(
      cacheManager: gh<_i447.DefaultCacheManager>()));
  gh.lazySingleton<_i151.TravelRegionsDataSource>(
      () => _i361.HiveTravelRegionsDataSource(gh<_i986.HiveInterface>()));
  gh.lazySingleton<_i47.RockRegionsRemoteDataSource>(
      () => _i287.FirebaseRockRegionsRemoteDataSource(
            gh<_i974.FirebaseFirestore>(),
            gh<_i59.FirebaseAuth>(),
          ));
  gh.lazySingleton<_i211.StrengthExerciseDataSource>(() =>
      _i264.LocalStrengthExerciseDataSource(gh<_i808.LocalDBDatasource>()));
  gh.factory<_i387.AscensionCubit>(() => _i387.AscensionCubit(
        gh<_i329.AddAscensionUsecase>(),
        gh<_i124.GetAscensionUsecase>(),
        gh<_i560.FinishAscensionUsecase>(),
        gh<_i816.EditAscensionEventUsecase>(),
      ));
  gh.lazySingleton<_i1059.HallTreaningDataSource>(
      () => _i653.LocalHallTreaningDataSource(gh<_i808.LocalDBDatasource>()));
  gh.lazySingleton<_i772.RockRegionsRepository>(
      () => _i601.RockRegionsRepositoryImpl(
            gh<_i37.RockRegionsLocalDataSource>(),
            gh<_i47.RockRegionsRemoteDataSource>(),
            gh<_i892.ImageCashManager>(),
          ));
  gh.lazySingleton<_i682.CardioTreaningsDatasource>(
      () => _i1.LocalCardioTreaningsDatasource(gh<_i808.LocalDBDatasource>()));
  gh.lazySingleton<_i21.StrengthExerciseRepository>(() =>
      _i707.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: gh<_i211.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i637.TrekkingPathLocalDataSource>(() =>
      _i331.DriftTrekkingPathLocalDataSource(gh<_i808.LocalDBDatasource>()));
  gh.lazySingleton<_i600.StrengthTreaningsDataSource>(() =>
      _i465.LocalStrengthTreaningsDataSource(gh<_i808.LocalDBDatasource>()));
  gh.lazySingleton<_i207.TravelLocalDatasource>(
      () => _i999.DriftTravelLocalDatasource(gh<_i808.LocalDBDatasource>()));
  gh.lazySingleton<_i222.AddTechniqueToTreaningUseCase>(() =>
      _i222.AddTechniqueToTreaningUseCase(
          gh<_i665.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i486.AddTechniqueTreaningUseCase>(() =>
      _i486.AddTechniqueTreaningUseCase(
          gh<_i665.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i484.CurrentTechniqueTreaningUseCase>(() =>
      _i484.CurrentTechniqueTreaningUseCase(
          gh<_i665.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i588.DeleteTechniqueTreaningUseCase>(() =>
      _i588.DeleteTechniqueTreaningUseCase(
          gh<_i665.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i157.EditTechniqueItemUseCase>(() =>
      _i157.EditTechniqueItemUseCase(gh<_i665.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i755.FinishTechniqueTreaningUseCase>(() =>
      _i755.FinishTechniqueTreaningUseCase(
          gh<_i665.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i858.PreviosTechniqueTreaningUseCase>(() =>
      _i858.PreviosTechniqueTreaningUseCase(
          gh<_i665.TechniqueTreaningsRepository>()));
  gh.lazySingleton<_i677.RockTreaningsLocalDataSource>(() =>
      _i924.DriftRockTreaningsLocalDataSource(gh<_i808.LocalDBDatasource>()));
  gh.lazySingleton<_i157.TravelRegionsRepository>(() =>
      _i629.TravelRegionsRepositoryImpl(gh<_i151.TravelRegionsDataSource>()));
  gh.lazySingleton<_i187.DeleteIceAttempt>(
      () => _i187.DeleteIceAttempt(gh<_i916.IceTreaningsRepository>()));
  gh.lazySingleton<_i213.FinishIceAttempt>(
      () => _i213.FinishIceAttempt(gh<_i916.IceTreaningsRepository>()));
  gh.lazySingleton<_i1037.NewIceAttempt>(
      () => _i1037.NewIceAttempt(gh<_i916.IceTreaningsRepository>()));
  gh.lazySingleton<_i206.GetTravelRegionsUsecase>(
      () => _i206.GetTravelRegionsUsecase(gh<_i157.TravelRegionsRepository>()));
  gh.lazySingleton<_i453.PlacesRepository>(() => _i139.PlacesRepositoryImpl(
        gh<_i1020.PlacesLocalDataSource>(),
        gh<_i135.PlacesRemoteDataSource>(),
        gh<_i353.NetworkInfo>(),
      ));
  gh.lazySingleton<_i967.DeleteStrengthExercise>(() =>
      _i967.DeleteStrengthExercise(
          strengthExerciseRepository: gh<_i21.StrengthExerciseRepository>()));
  gh.lazySingleton<_i182.GetStrengthExercises>(() => _i182.GetStrengthExercises(
      strengthExerciseRepository: gh<_i21.StrengthExerciseRepository>()));
  gh.lazySingleton<_i212.SaveStrengthExercise>(() => _i212.SaveStrengthExercise(
      strengthExerciseRepository: gh<_i21.StrengthExerciseRepository>()));
  gh.lazySingleton<_i791.SelectToUseStrengthExercise>(() =>
      _i791.SelectToUseStrengthExercise(
          strengthExerciseRepository: gh<_i21.StrengthExerciseRepository>()));
  gh.factory<_i942.TechniqueTreaningCubit>(() => _i942.TechniqueTreaningCubit(
        gh<_i486.AddTechniqueTreaningUseCase>(),
        gh<_i858.PreviosTechniqueTreaningUseCase>(),
        gh<_i484.CurrentTechniqueTreaningUseCase>(),
        gh<_i222.AddTechniqueToTreaningUseCase>(),
        gh<_i755.FinishTechniqueTreaningUseCase>(),
        gh<_i157.EditTechniqueItemUseCase>(),
      ));
  gh.factory<_i186.AuthGetUser>(
      () => _i186.AuthGetUser(authRepository: gh<_i877.AuthRepository>()));
  gh.factory<_i801.AuthLogin>(
      () => _i801.AuthLogin(authRepository: gh<_i877.AuthRepository>()));
  gh.factory<_i581.AuthLogout>(
      () => _i581.AuthLogout(authRepository: gh<_i877.AuthRepository>()));
  gh.lazySingleton<_i16.AddMyRockDistrict>(
      () => _i16.AddMyRockDistrict(gh<_i772.RockRegionsRepository>()));
  gh.lazySingleton<_i933.DeleteMyRockDistrict>(
      () => _i933.DeleteMyRockDistrict(gh<_i772.RockRegionsRepository>()));
  gh.lazySingleton<_i469.DeleteRockRoute>(
      () => _i469.DeleteRockRoute(gh<_i772.RockRegionsRepository>()));
  gh.lazySingleton<_i550.DeleteRockSector>(
      () => _i550.DeleteRockSector(gh<_i772.RockRegionsRepository>()));
  gh.lazySingleton<_i942.LoadMyRockDistricts>(
      () => _i942.LoadMyRockDistricts(gh<_i772.RockRegionsRepository>()));
  gh.lazySingleton<_i816.LoadRockDistricts>(
      () => _i816.LoadRockDistricts(gh<_i772.RockRegionsRepository>()));
  gh.lazySingleton<_i162.LoadRockRoutes>(
      () => _i162.LoadRockRoutes(gh<_i772.RockRegionsRepository>()));
  gh.lazySingleton<_i534.LoadRockSectors>(
      () => _i534.LoadRockSectors(gh<_i772.RockRegionsRepository>()));
  gh.lazySingleton<_i931.SaveRockRoute>(
      () => _i931.SaveRockRoute(gh<_i772.RockRegionsRepository>()));
  gh.lazySingleton<_i280.SaveRockSector>(
      () => _i280.SaveRockSector(gh<_i772.RockRegionsRepository>()));
  gh.lazySingleton<_i330.TrekkingPathRepository>(() =>
      _i975.TrekkingPathRepositoryImpl(
          gh<_i637.TrekkingPathLocalDataSource>()));
  gh.lazySingleton<_i312.TechniquesRepository>(
      () => _i820.TechniquesRepositoryImpl(
            gh<_i360.TechniquesRemoteDataSource>(),
            gh<_i855.TechniquesLocalDataSource>(),
            gh<_i892.ImageCashManager>(),
          ));
  gh.factory<_i48.AuthenticationCubit>(() => _i48.AuthenticationCubit(
        gh<_i801.AuthLogin>(),
        gh<_i581.AuthLogout>(),
        gh<_i186.AuthGetUser>(),
      ));
  gh.lazySingleton<_i119.ClimbingHallRepository>(
      () => _i1058.ClimbingHallRepositoryImpl(
            gh<_i353.ClimbingHallDataSource>(),
            gh<_i775.RemoteGymDataSource>(),
            gh<_i353.NetworkInfo>(),
          ));
  gh.lazySingleton<_i312.FinishIceTreaning>(() => _i312.FinishIceTreaning(
      iceTreaningsRepository: gh<_i916.IceTreaningsRepository>()));
  gh.lazySingleton<_i146.GetCurrentIceTreaning>(() =>
      _i146.GetCurrentIceTreaning(
          iceTreaningsRepository: gh<_i916.IceTreaningsRepository>()));
  gh.lazySingleton<_i77.GetLastIceTreaning>(() => _i77.GetLastIceTreaning(
      iceTreaningsRepository: gh<_i916.IceTreaningsRepository>()));
  gh.lazySingleton<_i197.IceSectorToTreaning>(() => _i197.IceSectorToTreaning(
      iceTreaningsRepository: gh<_i916.IceTreaningsRepository>()));
  gh.lazySingleton<_i436.MountainRegionsRepository>(
      () => _i1063.MountainRegionsRepositoryImpl(
            gh<_i342.MountainRegionsLocalDataSource>(),
            gh<_i179.MountainRegionsRemoteDataSource>(),
            gh<_i892.ImageCashManager>(),
          ));
  gh.lazySingleton<_i140.LoadSimpleSettingsUsecase>(
      () => _i140.LoadSimpleSettingsUsecase(gh<_i309.SettingsRepository>()));
  gh.lazySingleton<_i63.LoadTreaningsSettings>(
      () => _i63.LoadTreaningsSettings(gh<_i309.SettingsRepository>()));
  gh.lazySingleton<_i637.SaveSimpleSettingsUsecase>(
      () => _i637.SaveSimpleSettingsUsecase(gh<_i309.SettingsRepository>()));
  gh.lazySingleton<_i481.SaveTreaningsSettings>(
      () => _i481.SaveTreaningsSettings(gh<_i309.SettingsRepository>()));
  gh.lazySingleton<_i617.IceRegionsRepository>(
      () => _i176.IceRegionsRepositoryImpl(
            gh<_i283.IceRegionsDataSource>(),
            gh<_i602.IceRegionsRemoteDataSource>(),
            gh<_i353.NetworkInfo>(),
            gh<_i892.ImageCashManager>(),
          ));
  gh.lazySingleton<_i434.TrekkingRepository>(() => _i902.TrekkingRepositoryImpl(
        gh<_i316.TrekkingRemoteDataSource>(),
        gh<_i391.TrekkingLocalDataSource>(),
        gh<_i892.ImageCashManager>(),
      ));
  gh.factory<_i319.StrengthExercisesCubit>(() => _i319.StrengthExercisesCubit(
        gh<_i182.GetStrengthExercises>(),
        gh<_i212.SaveStrengthExercise>(),
        gh<_i791.SelectToUseStrengthExercise>(),
        gh<_i967.DeleteStrengthExercise>(),
      ));
  gh.lazySingleton<_i940.AddMyTrekkingRegionUseCase>(
      () => _i940.AddMyTrekkingRegionUseCase(gh<_i434.TrekkingRepository>()));
  gh.lazySingleton<_i449.DeleteMyTrekkingRegionUseCase>(() =>
      _i449.DeleteMyTrekkingRegionUseCase(gh<_i434.TrekkingRepository>()));
  gh.lazySingleton<_i95.DeleteTrek>(
      () => _i95.DeleteTrek(gh<_i434.TrekkingRepository>()));
  gh.lazySingleton<_i753.DeleteTrekPoint>(
      () => _i753.DeleteTrekPoint(gh<_i434.TrekkingRepository>()));
  gh.lazySingleton<_i864.GetMyTrekkingRegions>(
      () => _i864.GetMyTrekkingRegions(gh<_i434.TrekkingRepository>()));
  gh.lazySingleton<_i605.GetTrekkingRegions>(
      () => _i605.GetTrekkingRegions(gh<_i434.TrekkingRepository>()));
  gh.lazySingleton<_i230.GetTreks>(
      () => _i230.GetTreks(gh<_i434.TrekkingRepository>()));
  gh.lazySingleton<_i837.GetTrekPoints>(
      () => _i837.GetTrekPoints(gh<_i434.TrekkingRepository>()));
  gh.lazySingleton<_i1027.SaveTrek>(
      () => _i1027.SaveTrek(gh<_i434.TrekkingRepository>()));
  gh.lazySingleton<_i163.SaveTrekPoint>(
      () => _i163.SaveTrekPoint(gh<_i434.TrekkingRepository>()));
  gh.lazySingleton<_i44.NewHallRoute>(() => _i44.NewHallRoute(
      climbingHallRepository: gh<_i119.ClimbingHallRepository>()));
  gh.lazySingleton<_i578.AddMyTechniqueGroup>(
      () => _i578.AddMyTechniqueGroup(gh<_i312.TechniquesRepository>()));
  gh.lazySingleton<_i828.DeleteMyTechniqueGroup>(
      () => _i828.DeleteMyTechniqueGroup(gh<_i312.TechniquesRepository>()));
  gh.lazySingleton<_i793.DeleteTechniqueGroupUsecase>(() =>
      _i793.DeleteTechniqueGroupUsecase(gh<_i312.TechniquesRepository>()));
  gh.lazySingleton<_i540.DeleteTechniqueUsecase>(
      () => _i540.DeleteTechniqueUsecase(gh<_i312.TechniquesRepository>()));
  gh.lazySingleton<_i289.GetTechniquesEditingUsecase>(() =>
      _i289.GetTechniquesEditingUsecase(gh<_i312.TechniquesRepository>()));
  gh.lazySingleton<_i218.GetTechniquesUsecase>(
      () => _i218.GetTechniquesUsecase(gh<_i312.TechniquesRepository>()));
  gh.lazySingleton<_i545.GetTechniqueGroupsUsecase>(
      () => _i545.GetTechniqueGroupsUsecase(gh<_i312.TechniquesRepository>()));
  gh.lazySingleton<_i940.LoadMyTechniqueGroup>(
      () => _i940.LoadMyTechniqueGroup(gh<_i312.TechniquesRepository>()));
  gh.lazySingleton<_i47.SaveTechniqueGroupUsecase>(
      () => _i47.SaveTechniqueGroupUsecase(gh<_i312.TechniquesRepository>()));
  gh.lazySingleton<_i18.SaveTechniqueUsecase>(
      () => _i18.SaveTechniqueUsecase(gh<_i312.TechniquesRepository>()));
  gh.lazySingleton<_i1067.RockTreaningsRepository>(() =>
      _i779.RockTreaningsRepositoryImpl(
          gh<_i677.RockTreaningsLocalDataSource>()));
  gh.factory<_i448.TrekkingRegionsCubit>(() => _i448.TrekkingRegionsCubit(
        gh<_i605.GetTrekkingRegions>(),
        gh<_i449.DeleteMyTrekkingRegionUseCase>(),
        gh<_i940.AddMyTrekkingRegionUseCase>(),
        gh<_i864.GetMyTrekkingRegions>(),
      ));
  gh.factory<_i453.RockDistrictsCubit>(() => _i453.RockDistrictsCubit(
        gh<_i816.LoadRockDistricts>(),
        gh<_i942.LoadMyRockDistricts>(),
        gh<_i16.AddMyRockDistrict>(),
        gh<_i933.DeleteMyRockDistrict>(),
      ));
  gh.lazySingleton<_i194.HallTreaningRepository>(
      () => _i985.HallTreaningRepositoryImpl(
            dataSource: gh<_i1059.HallTreaningDataSource>(),
            hallDataSource: gh<_i353.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i32.AddMyIceDistrict>(
      () => _i32.AddMyIceDistrict(gh<_i617.IceRegionsRepository>()));
  gh.lazySingleton<_i21.DeleteMyIceDistrict>(
      () => _i21.DeleteMyIceDistrict(gh<_i617.IceRegionsRepository>()));
  gh.lazySingleton<_i73.LoadMyIceDistricts>(
      () => _i73.LoadMyIceDistricts(gh<_i617.IceRegionsRepository>()));
  gh.factory<_i453.RockSectorsCubit>(() => _i453.RockSectorsCubit(
        gh<_i534.LoadRockSectors>(),
        gh<_i550.DeleteRockSector>(),
        gh<_i280.SaveRockSector>(),
      ));
  gh.lazySingleton<_i262.DeleteRockAttempt>(
      () => _i262.DeleteRockAttempt(gh<_i1067.RockTreaningsRepository>()));
  gh.lazySingleton<_i32.FinishRockAttempt>(
      () => _i32.FinishRockAttempt(gh<_i1067.RockTreaningsRepository>()));
  gh.lazySingleton<_i20.FinishRockTreaning>(
      () => _i20.FinishRockTreaning(gh<_i1067.RockTreaningsRepository>()));
  gh.lazySingleton<_i884.GetCurrentRockTreaning>(
      () => _i884.GetCurrentRockTreaning(gh<_i1067.RockTreaningsRepository>()));
  gh.lazySingleton<_i17.GetLastRockTreaning>(
      () => _i17.GetLastRockTreaning(gh<_i1067.RockTreaningsRepository>()));
  gh.lazySingleton<_i546.NewRockAttempt>(
      () => _i546.NewRockAttempt(gh<_i1067.RockTreaningsRepository>()));
  gh.lazySingleton<_i205.NewRockTreaning>(
      () => _i205.NewRockTreaning(gh<_i1067.RockTreaningsRepository>()));
  gh.lazySingleton<_i937.RockSectorToTreaning>(
      () => _i937.RockSectorToTreaning(gh<_i1067.RockTreaningsRepository>()));
  gh.lazySingleton<_i313.AllHallTreanings>(
      () => _i313.AllHallTreanings(gh<_i194.HallTreaningRepository>()));
  gh.lazySingleton<_i284.CurrentHallTreaning>(
      () => _i284.CurrentHallTreaning(gh<_i194.HallTreaningRepository>()));
  gh.lazySingleton<_i591.LastHallTreaning>(
      () => _i591.LastHallTreaning(gh<_i194.HallTreaningRepository>()));
  gh.lazySingleton<_i751.StrengthTreaningsRepository>(() =>
      _i1042.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              gh<_i600.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i969.CardioTreaningsRepository>(() =>
      _i613.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: gh<_i682.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i16.DeleteSectorUseCase>(() => _i16.DeleteSectorUseCase(
      iceRegionsRepository: gh<_i617.IceRegionsRepository>()));
  gh.lazySingleton<_i150.LoadDistrictsUseCase>(() => _i150.LoadDistrictsUseCase(
      iceRegionsRepository: gh<_i617.IceRegionsRepository>()));
  gh.lazySingleton<_i66.LoadSectorsUseCase>(() => _i66.LoadSectorsUseCase(
      iceRegionsRepository: gh<_i617.IceRegionsRepository>()));
  gh.lazySingleton<_i476.SaveSectorUseCase>(() => _i476.SaveSectorUseCase(
      iceRegionsRepository: gh<_i617.IceRegionsRepository>()));
  gh.factory<_i89.TechniquesCubit>(() => _i89.TechniquesCubit(
        gh<_i218.GetTechniquesUsecase>(),
        gh<_i289.GetTechniquesEditingUsecase>(),
        gh<_i540.DeleteTechniqueUsecase>(),
        gh<_i18.SaveTechniqueUsecase>(),
      ));
  gh.lazySingleton<_i1055.TravelRepository>(
      () => _i278.TravelRepositoryImpl(gh<_i207.TravelLocalDatasource>()));
  gh.factory<_i205.TreksCubit>(() => _i205.TreksCubit(
        gh<_i230.GetTreks>(),
        gh<_i837.GetTrekPoints>(),
        gh<_i95.DeleteTrek>(),
        gh<_i753.DeleteTrekPoint>(),
        gh<_i1027.SaveTrek>(),
        gh<_i163.SaveTrekPoint>(),
      ));
  gh.lazySingleton<_i424.NewHallAttemptFromRoute>(() =>
      _i424.NewHallAttemptFromRoute(
          hallTreaningRepository: gh<_i194.HallTreaningRepository>()));
  gh.lazySingleton<_i766.LoadPlaces>(
      () => _i766.LoadPlaces(gh<_i453.PlacesRepository>()));
  gh.lazySingleton<_i468.NewIceTreaning>(() => _i468.NewIceTreaning(
        iceTreaningsRepository: gh<_i916.IceTreaningsRepository>(),
        iceRegionsRepository: gh<_i617.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i275.DeleteCardioTreaning>(() => _i275.DeleteCardioTreaning(
      cardioTreaningsRepository: gh<_i969.CardioTreaningsRepository>()));
  gh.lazySingleton<_i1038.GetCardioTreanings>(() => _i1038.GetCardioTreanings(
      cardioTreaningsRepository: gh<_i969.CardioTreaningsRepository>()));
  gh.lazySingleton<_i673.GetLastCardioTreaning>(() =>
      _i673.GetLastCardioTreaning(
          cardioTreaningsRepository: gh<_i969.CardioTreaningsRepository>()));
  gh.lazySingleton<_i533.SaveCardioTreaning>(() => _i533.SaveCardioTreaning(
      cardioTreaningsRepository: gh<_i969.CardioTreaningsRepository>()));
  gh.factory<_i418.TechniqueGroupsCubit>(() => _i418.TechniqueGroupsCubit(
        gh<_i545.GetTechniqueGroupsUsecase>(),
        gh<_i289.GetTechniquesEditingUsecase>(),
        gh<_i793.DeleteTechniqueGroupUsecase>(),
        gh<_i47.SaveTechniqueGroupUsecase>(),
        gh<_i940.LoadMyTechniqueGroup>(),
        gh<_i828.DeleteMyTechniqueGroup>(),
        gh<_i578.AddMyTechniqueGroup>(),
      ));
  gh.lazySingleton<_i934.AllClimbingHalls>(
      () => _i934.AllClimbingHalls(gh<_i119.ClimbingHallRepository>()));
  gh.lazySingleton<_i78.GetClimbingHallRoures>(
      () => _i78.GetClimbingHallRoures(gh<_i119.ClimbingHallRepository>()));
  gh.factory<_i734.CardioTreaningCubit>(() => _i734.CardioTreaningCubit(
        gh<_i673.GetLastCardioTreaning>(),
        gh<_i533.SaveCardioTreaning>(),
      ));
  gh.lazySingleton<_i456.GetGymRouteStatistic>(
      () => _i456.GetGymRouteStatistic(gh<_i194.HallTreaningRepository>()));
  gh.lazySingleton<_i816.AddTrekEventUsecase>(
      () => _i816.AddTrekEventUsecase(gh<_i330.TrekkingPathRepository>()));
  gh.lazySingleton<_i795.ContinueTrekUsecase>(
      () => _i795.ContinueTrekUsecase(gh<_i330.TrekkingPathRepository>()));
  gh.lazySingleton<_i150.CurrentTrekkingPathUsecase>(() =>
      _i150.CurrentTrekkingPathUsecase(gh<_i330.TrekkingPathRepository>()));
  gh.lazySingleton<_i730.PreviosTrekkingPathUsecase>(() =>
      _i730.PreviosTrekkingPathUsecase(gh<_i330.TrekkingPathRepository>()));
  gh.lazySingleton<_i540.StartTrekUsecase>(
      () => _i540.StartTrekUsecase(gh<_i330.TrekkingPathRepository>()));
  gh.lazySingleton<_i1054.DeleteHallAttempt>(() => _i1054.DeleteHallAttempt(
      treaningRepository: gh<_i194.HallTreaningRepository>()));
  gh.lazySingleton<_i667.DeleteHallTreaning>(() => _i667.DeleteHallTreaning(
      treaningRepository: gh<_i194.HallTreaningRepository>()));
  gh.lazySingleton<_i510.FinishHallAttempt>(() => _i510.FinishHallAttempt(
      treaningRepository: gh<_i194.HallTreaningRepository>()));
  gh.lazySingleton<_i1043.FinishHallTreaning>(() => _i1043.FinishHallTreaning(
      treaningRepository: gh<_i194.HallTreaningRepository>()));
  gh.lazySingleton<_i643.NewHallAttempt>(() => _i643.NewHallAttempt(
      treaningRepository: gh<_i194.HallTreaningRepository>()));
  gh.lazySingleton<_i364.NewHallTreaning>(() => _i364.NewHallTreaning(
      treaningRepository: gh<_i194.HallTreaningRepository>()));
  gh.factory<_i147.CurrentHallTreaningCubit>(
      () => _i147.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: gh<_i424.NewHallAttemptFromRoute>(),
            newHallTreaning: gh<_i364.NewHallTreaning>(),
            newHallAttempt: gh<_i643.NewHallAttempt>(),
            currentHallTreaning: gh<_i284.CurrentHallTreaning>(),
            finishHallAttempt: gh<_i510.FinishHallAttempt>(),
            finishHallTreaning: gh<_i1043.FinishHallTreaning>(),
            lastHallTreaning: gh<_i591.LastHallTreaning>(),
            deleteHallAttempt: gh<_i1054.DeleteHallAttempt>(),
            getGymRouteStatistic: gh<_i456.GetGymRouteStatistic>(),
          ));
  gh.lazySingleton<_i568.AddMyMountainRegionUseCase>(() =>
      _i568.AddMyMountainRegionUseCase(gh<_i436.MountainRegionsRepository>()));
  gh.lazySingleton<_i94.DeleteMyMountainRegionUseCase>(() =>
      _i94.DeleteMyMountainRegionUseCase(
          gh<_i436.MountainRegionsRepository>()));
  gh.lazySingleton<_i207.GetMountains>(
      () => _i207.GetMountains(gh<_i436.MountainRegionsRepository>()));
  gh.lazySingleton<_i397.GetMountainRegions>(
      () => _i397.GetMountainRegions(gh<_i436.MountainRegionsRepository>()));
  gh.lazySingleton<_i215.GetMountainRoutes>(
      () => _i215.GetMountainRoutes(gh<_i436.MountainRegionsRepository>()));
  gh.lazySingleton<_i6.GetMyMountainRegions>(
      () => _i6.GetMyMountainRegions(gh<_i436.MountainRegionsRepository>()));
  gh.lazySingleton<_i508.SaveMountainRouteUsecase>(() =>
      _i508.SaveMountainRouteUsecase(gh<_i436.MountainRegionsRepository>()));
  gh.lazySingleton<_i959.SaveMountainUsecase>(
      () => _i959.SaveMountainUsecase(gh<_i436.MountainRegionsRepository>()));
  gh.factory<_i247.HallRouteCubit>(
      () => _i247.HallRouteCubit(gh<_i44.NewHallRoute>()));
  gh.lazySingleton<_i231.HallRouteToArchive>(() =>
      _i231.HallRouteToArchive(repository: gh<_i119.ClimbingHallRepository>()));
  gh.factory<_i630.IceSectorsCubit>(() => _i630.IceSectorsCubit(
        gh<_i66.LoadSectorsUseCase>(),
        gh<_i476.SaveSectorUseCase>(),
        gh<_i16.DeleteSectorUseCase>(),
      ));
  gh.lazySingleton<_i837.SettingsCubit>(() => _i837.SettingsCubit(
        gh<_i63.LoadTreaningsSettings>(),
        gh<_i481.SaveTreaningsSettings>(),
        gh<_i766.LoadPlaces>(),
        gh<_i140.LoadSimpleSettingsUsecase>(),
        gh<_i637.SaveSimpleSettingsUsecase>(),
      ));
  gh.lazySingleton<_i336.AddRepetitionForStrengthTreaning>(() =>
      _i336.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i751.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i453.DeleteRepetitionForStrengthTreaning>(() =>
      _i453.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i751.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i518.DeleteStrengthTreaning>(() =>
      _i518.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i751.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i571.FinishStrengthTreaning>(() =>
      _i571.FinishStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i751.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i337.GetCurrentStrengthTreaning>(() =>
      _i337.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i751.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i859.GetPreviosStrengthTreaning>(() =>
      _i859.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              gh<_i751.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i422.GetStrengthTreanings>(() => _i422.GetStrengthTreanings(
      strengthTreaningsRepository: gh<_i751.StrengthTreaningsRepository>()));
  gh.factory<_i780.MountainRegionsCubit>(() => _i780.MountainRegionsCubit(
        gh<_i397.GetMountainRegions>(),
        gh<_i6.GetMyMountainRegions>(),
        gh<_i568.AddMyMountainRegionUseCase>(),
        gh<_i94.DeleteMyMountainRegionUseCase>(),
      ));
  gh.lazySingleton<_i948.AddTravelUsecase>(
      () => _i948.AddTravelUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i764.CurrentTravelUsecase>(
      () => _i764.CurrentTravelUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i806.EditTravelUsecase>(
      () => _i806.EditTravelUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i861.GetCurrentTravelDayUsecase>(
      () => _i861.GetCurrentTravelDayUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i110.GetTravelsUsecase>(
      () => _i110.GetTravelsUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i699.DeleteBudgetLineUsecase>(
      () => _i699.DeleteBudgetLineUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i126.DeleteCostLineUsecase>(
      () => _i126.DeleteCostLineUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i89.DeleteInsuranceLineUsecase>(
      () => _i89.DeleteInsuranceLineUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i621.EditBudgetLineUsecase>(
      () => _i621.EditBudgetLineUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i434.EditCostLineUsecase>(
      () => _i434.EditCostLineUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i515.EditDayLineUsecase>(
      () => _i515.EditDayLineUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i985.EditInsuranceLineUsecase>(
      () => _i985.EditInsuranceLineUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i552.GetBudgetLinesUsecase>(
      () => _i552.GetBudgetLinesUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i693.GetCostLinesUsecase>(
      () => _i693.GetCostLinesUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i910.GetDayLinesUsecase>(
      () => _i910.GetDayLinesUsecase(gh<_i1055.TravelRepository>()));
  gh.lazySingleton<_i1073.GetInsuranceLineUsecase>(
      () => _i1073.GetInsuranceLineUsecase(gh<_i1055.TravelRepository>()));
  gh.factory<_i897.IceDistrictsCubit>(() => _i897.IceDistrictsCubit(
        gh<_i150.LoadDistrictsUseCase>(),
        gh<_i73.LoadMyIceDistricts>(),
        gh<_i21.DeleteMyIceDistrict>(),
        gh<_i32.AddMyIceDistrict>(),
      ));
  gh.lazySingleton<_i541.GetHallRouteAttempts>(() => _i541.GetHallRouteAttempts(
      repository: gh<_i194.HallTreaningRepository>()));
  gh.lazySingleton<_i624.AddStrengthTreaning>(() => _i624.AddStrengthTreaning(
        strengthTreaningsRepository: gh<_i751.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i21.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i526.UpdateStrengthTreaningExercises>(() =>
      _i526.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: gh<_i751.StrengthTreaningsRepository>(),
        strengthExerciseRepository: gh<_i21.StrengthExerciseRepository>(),
      ));
  gh.factory<_i295.HallTreaningsCubit>(() => _i295.HallTreaningsCubit(
        allHallTreanings: gh<_i313.AllHallTreanings>(),
        deleteHallTreaning: gh<_i667.DeleteHallTreaning>(),
      ));
  gh.factory<_i837.HallRouteAttemptsCubit>(() => _i837.HallRouteAttemptsCubit(
      getHallRouteAttempts: gh<_i541.GetHallRouteAttempts>()));
  gh.lazySingleton<_i612.GetRockRouteAttempts>(
      () => _i612.GetRockRouteAttempts(gh<_i1067.RockTreaningsRepository>()));
  gh.lazySingleton<_i145.GetRockRouteStatistic>(
      () => _i145.GetRockRouteStatistic(gh<_i1067.RockTreaningsRepository>()));
  gh.factory<_i273.ClimbingHallCubit>(() => _i273.ClimbingHallCubit(
        gh<_i78.GetClimbingHallRoures>(),
        gh<_i231.HallRouteToArchive>(),
        gh<_i456.GetGymRouteStatistic>(),
      ));
  gh.factory<_i976.CardioTreaningsCubit>(() => _i976.CardioTreaningsCubit(
        gh<_i1038.GetCardioTreanings>(),
        gh<_i275.DeleteCardioTreaning>(),
        gh<_i533.SaveCardioTreaning>(),
      ));
  gh.factory<_i163.MountainRoutesCubit>(() => _i163.MountainRoutesCubit(
        gh<_i215.GetMountainRoutes>(),
        gh<_i508.SaveMountainRouteUsecase>(),
      ));
  gh.lazySingleton<_i39.DeleteTreaning>(() => _i39.DeleteTreaning(
        gh<_i194.HallTreaningRepository>(),
        gh<_i916.IceTreaningsRepository>(),
        gh<_i751.StrengthTreaningsRepository>(),
        gh<_i969.CardioTreaningsRepository>(),
        gh<_i1067.RockTreaningsRepository>(),
        gh<_i330.TrekkingPathRepository>(),
        gh<_i665.TechniqueTreaningsRepository>(),
        gh<_i248.AscensionRepository>(),
      ));
  gh.factory<_i621.CurrentTravelCubit>(() => _i621.CurrentTravelCubit(
        gh<_i764.CurrentTravelUsecase>(),
        gh<_i434.EditCostLineUsecase>(),
        gh<_i861.GetCurrentTravelDayUsecase>(),
      ));
  gh.factory<_i675.MountainsCubit>(() => _i675.MountainsCubit(
        gh<_i207.GetMountains>(),
        gh<_i959.SaveMountainUsecase>(),
      ));
  gh.lazySingleton<_i1041.ExportTreaningsUseCase>(
      () => _i1041.ExportTreaningsUseCase(
            gh<_i194.HallTreaningRepository>(),
            gh<_i916.IceTreaningsRepository>(),
            gh<_i751.StrengthTreaningsRepository>(),
            gh<_i969.CardioTreaningsRepository>(),
            gh<_i1067.RockTreaningsRepository>(),
            gh<_i1055.TravelRepository>(),
            gh<_i330.TrekkingPathRepository>(),
            gh<_i665.TechniqueTreaningsRepository>(),
            gh<_i248.AscensionRepository>(),
          ));
  gh.lazySingleton<_i1058.GetAllTreanings>(() => _i1058.GetAllTreanings(
        gh<_i194.HallTreaningRepository>(),
        gh<_i916.IceTreaningsRepository>(),
        gh<_i751.StrengthTreaningsRepository>(),
        gh<_i969.CardioTreaningsRepository>(),
        gh<_i1067.RockTreaningsRepository>(),
        gh<_i1055.TravelRepository>(),
        gh<_i330.TrekkingPathRepository>(),
        gh<_i665.TechniqueTreaningsRepository>(),
        gh<_i248.AscensionRepository>(),
      ));
  gh.lazySingleton<_i743.ImportTreaningsUseCase>(
      () => _i743.ImportTreaningsUseCase(
            gh<_i194.HallTreaningRepository>(),
            gh<_i916.IceTreaningsRepository>(),
            gh<_i751.StrengthTreaningsRepository>(),
            gh<_i969.CardioTreaningsRepository>(),
            gh<_i1067.RockTreaningsRepository>(),
            gh<_i1055.TravelRepository>(),
            gh<_i330.TrekkingPathRepository>(),
            gh<_i665.TechniqueTreaningsRepository>(),
            gh<_i248.AscensionRepository>(),
          ));
  gh.factory<_i957.TravelsCubit>(() => _i957.TravelsCubit(
        gh<_i110.GetTravelsUsecase>(),
        gh<_i948.AddTravelUsecase>(),
      ));
  gh.factory<_i240.CurrentIceTreaningCubit>(() => _i240.CurrentIceTreaningCubit(
        gh<_i468.NewIceTreaning>(),
        gh<_i197.IceSectorToTreaning>(),
        gh<_i1037.NewIceAttempt>(),
        gh<_i213.FinishIceAttempt>(),
        gh<_i312.FinishIceTreaning>(),
        gh<_i146.GetCurrentIceTreaning>(),
        gh<_i77.GetLastIceTreaning>(),
        gh<_i187.DeleteIceAttempt>(),
      ));
  gh.factory<_i306.StrengthTrainingCubit>(() => _i306.StrengthTrainingCubit(
        getCurrentStrengthTreaning: gh<_i337.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: gh<_i859.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: gh<_i624.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            gh<_i526.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            gh<_i336.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: gh<_i571.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            gh<_i453.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i1006.ClimbingHallsCubit>(() => _i1006.ClimbingHallsCubit(
      allClimbingHalls: gh<_i934.AllClimbingHalls>()));
  gh.factory<_i338.HomePageCubit>(() =>
      _i338.HomePageCubit(allClimbingHalls: gh<_i934.AllClimbingHalls>()));
  gh.factory<_i144.StrengthTrainingsCubit>(() => _i144.StrengthTrainingsCubit(
        gh<_i422.GetStrengthTreanings>(),
        gh<_i518.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i19.TreaningsCubit>(() => _i19.TreaningsCubit(
        gh<_i1058.GetAllTreanings>(),
        gh<_i39.DeleteTreaning>(),
      ));
  gh.factory<_i124.TravelDayCubit>(
      () => _i124.TravelDayCubit(gh<_i515.EditDayLineUsecase>()));
  gh.factory<_i685.TrekkingCubit>(() => _i685.TrekkingCubit(
        gh<_i150.CurrentTrekkingPathUsecase>(),
        gh<_i730.PreviosTrekkingPathUsecase>(),
        gh<_i540.StartTrekUsecase>(),
        gh<_i816.AddTrekEventUsecase>(),
        gh<_i795.ContinueTrekUsecase>(),
      ));
  gh.factory<_i1049.RockRoutesCubit>(() => _i1049.RockRoutesCubit(
        gh<_i162.LoadRockRoutes>(),
        gh<_i145.GetRockRouteStatistic>(),
        gh<_i469.DeleteRockRoute>(),
        gh<_i931.SaveRockRoute>(),
      ));
  gh.factory<_i535.RockTreaningCubit>(() => _i535.RockTreaningCubit(
        gh<_i205.NewRockTreaning>(),
        gh<_i937.RockSectorToTreaning>(),
        gh<_i546.NewRockAttempt>(),
        gh<_i32.FinishRockAttempt>(),
        gh<_i20.FinishRockTreaning>(),
        gh<_i17.GetLastRockTreaning>(),
        gh<_i884.GetCurrentRockTreaning>(),
        gh<_i145.GetRockRouteStatistic>(),
        gh<_i262.DeleteRockAttempt>(),
      ));
  gh.factory<_i758.TravelPageCubit>(() => _i758.TravelPageCubit(
        gh<_i126.DeleteCostLineUsecase>(),
        gh<_i434.EditCostLineUsecase>(),
        gh<_i693.GetCostLinesUsecase>(),
        gh<_i1073.GetInsuranceLineUsecase>(),
        gh<_i552.GetBudgetLinesUsecase>(),
        gh<_i985.EditInsuranceLineUsecase>(),
        gh<_i621.EditBudgetLineUsecase>(),
        gh<_i89.DeleteInsuranceLineUsecase>(),
        gh<_i699.DeleteBudgetLineUsecase>(),
        gh<_i910.GetDayLinesUsecase>(),
        gh<_i442.GetFeedingStatisticUsecase>(),
        gh<_i806.EditTravelUsecase>(),
        gh<_i206.GetTravelRegionsUsecase>(),
      ));
  gh.factory<_i78.TreaningsExportImportCubit>(
      () => _i78.TreaningsExportImportCubit(
            gh<_i1041.ExportTreaningsUseCase>(),
            gh<_i743.ImportTreaningsUseCase>(),
          ));
  return getIt;
}

class _$InjectableModule extends _i142.InjectableModule {}

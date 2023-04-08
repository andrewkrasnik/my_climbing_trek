// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i9;
import 'package:firebase_analytics/firebase_analytics.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i22;

import 'core/datasource/drift_db_local_datasource.dart' as _i5;
import 'core/injectable_module.dart' as _i141;
import 'core/services/analitics/analitics_service.dart' as _i58;
import 'core/services/analitics/firebase_analitics_service.dart' as _i59;
import 'core/services/crash_log_service/crash_log_service.dart' as _i70;
import 'core/services/crash_log_service/google_crash_log_service.dart' as _i71;
import 'core/services/network/network_info.dart' as _i26;
import 'features/authentication/data/datasources/auth_data_source.dart' as _i60;
import 'features/authentication/data/datasources/firebase_auth_data_source.dart'
    as _i61;
import 'features/authentication/data/repositories/auth_repository_impl.dart'
    as _i63;
import 'features/authentication/domain/repositories/auth_repository.dart'
    as _i62;
import 'features/authentication/domain/usecases/auth_get_user.dart' as _i129;
import 'features/authentication/domain/usecases/auth_login.dart' as _i130;
import 'features/authentication/domain/usecases/auth_logout.dart' as _i131;
import 'features/authentication/presentation/cubit/authentication_cubit.dart'
    as _i132;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i64;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i65;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i67;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i66;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i73;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i88;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i94;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i118;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i133;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i134;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i10;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i11;
import 'features/hall_climbing/data/datasources/remote_gym_data_source.dart'
    as _i32;
import 'features/hall_climbing/data/datasources/remote_gym_data_source_impl.dart'
    as _i33;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i69;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i13;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i68;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart'
    as _i128;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i89;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i93;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i101;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i110;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i57;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i72;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i74;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i75;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i80;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i81;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i23;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i27;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i28;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i29;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i127;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i135;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i136;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i137;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i139;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i100;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i102;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i140;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i14;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i18;
import 'features/ice_climbing/data/datasources/local_ice_regions_datasource.dart'
    as _i15;
import 'features/ice_climbing/data/datasources/local_ice_treanings_datasource.dart'
    as _i19;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i17;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i21;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i16;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i20;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i82;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i83;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i90;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i95;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i104;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i24;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i25;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i30;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i31;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i138;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i103;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i105;
import 'features/rock_climbing/data/datasources/hive_rock_regions_local_datasource.dart'
    as _i35;
import 'features/rock_climbing/data/datasources/mock_rock_treanings_local_datasource.dart'
    as _i39;
import 'features/rock_climbing/data/datasources/rock_regions_local_datasource.dart'
    as _i34;
import 'features/rock_climbing/data/datasources/rock_treanings_local_datasource.dart'
    as _i38;
import 'features/rock_climbing/data/repositories/rock_regions_repository_impl.dart'
    as _i37;
import 'features/rock_climbing/data/repositories/rock_treanings_repository_impl.dart'
    as _i41;
import 'features/rock_climbing/domain/repositories/rock_regions_repository.dart'
    as _i36;
import 'features/rock_climbing/domain/repositories/rock_treanings_repository.dart'
    as _i40;
import 'features/rock_climbing/domain/usecases/finish_rock_attempt.dart'
    as _i84;
import 'features/rock_climbing/domain/usecases/finish_rock_treaning.dart'
    as _i85;
import 'features/rock_climbing/domain/usecases/get_current_rock_treaning.dart'
    as _i91;
import 'features/rock_climbing/domain/usecases/get_last_rock_treaning.dart'
    as _i96;
import 'features/rock_climbing/domain/usecases/load_rock_districts.dart'
    as _i106;
import 'features/rock_climbing/domain/usecases/load_rock_routes.dart' as _i107;
import 'features/rock_climbing/domain/usecases/load_rock_sectors.dart' as _i108;
import 'features/rock_climbing/domain/usecases/new_rock_attempt.dart' as _i111;
import 'features/rock_climbing/domain/usecases/new_rock_treaning.dart' as _i112;
import 'features/rock_climbing/domain/usecases/rock_sector_to_treaning.dart'
    as _i115;
import 'features/rock_climbing/presentation/cubit/rock_districts/rock_districts_cubit.dart'
    as _i113;
import 'features/rock_climbing/presentation/cubit/rock_routes/rock_routes_cubit.dart'
    as _i114;
import 'features/rock_climbing/presentation/cubit/rock_sectors/rock_sectors_cubit.dart'
    as _i116;
import 'features/rock_climbing/presentation/cubit/rock_treaning/rock_treaning_cubit.dart'
    as _i117;
import 'features/settings/data/datasources/local_settings_datasource.dart'
    as _i43;
import 'features/settings/data/datasources/settings_datasource.dart' as _i42;
import 'features/settings/data/repositories/settings_repository_impl.dart'
    as _i45;
import 'features/settings/domain/repositories/settings_repository.dart' as _i44;
import 'features/settings/domain/usecases/load_treanings_settings.dart'
    as _i109;
import 'features/settings/domain/usecases/save_treanings_settings.dart'
    as _i120;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i122;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i47;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i51;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i46;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i50;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i49;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i53;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i48;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i52;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i55;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i56;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i76;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i77;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i78;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i86;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i92;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i97;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i98;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i99;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i119;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i121;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i54;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i123;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i124;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i125;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i79;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i87;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i126; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.ClimbingHallDataSource>(
      () => _i4.LocalClimbingHallDataSource());
  gh.lazySingleton<_i5.DriftDBLocalDataSource>(
      () => _i5.DriftDBLocalDataSource());
  gh.lazySingletonAsync<_i6.FirebaseAnalytics>(
      () => injectableModule.firebaseAnalytics);
  gh.lazySingleton<_i7.FirebaseAuth>(() => injectableModule.firebaseAuth);
  gh.lazySingletonAsync<_i8.FirebaseCrashlytics>(
      () => injectableModule.firebaseCrashlytics);
  gh.lazySingleton<_i9.FirebaseFirestore>(
      () => injectableModule.firebaseFirestore);
  gh.lazySingleton<_i10.HallTreaningDataSource>(() =>
      _i11.LocalHallTreaningDataSource(
          localDatabase: get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i12.HallTreaningRepository>(
      () => _i13.HallTreaningRepositoryImpl(
            dataSource: get<_i10.HallTreaningDataSource>(),
            hallDataSource: get<_i3.ClimbingHallDataSource>(),
          ));
  gh.lazySingleton<_i14.IceRegionsDataSource>(
      () => _i15.LocalIceRegionsDataSource());
  gh.lazySingleton<_i16.IceRegionsRepository>(() =>
      _i17.IceRegionsRepositoryImpl(
          iceRegionsDataSource: get<_i14.IceRegionsDataSource>()));
  gh.lazySingleton<_i18.IceTreaningsDataSource>(() =>
      _i19.LocalIceTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i20.IceTreaningsRepository>(() =>
      _i21.IceTreaningsRepositoryImpl(get<_i18.IceTreaningsDataSource>()));
  gh.lazySingleton<_i22.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker);
  gh.lazySingleton<_i23.LastHallTreaning>(
      () => _i23.LastHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i24.LoadDistrictsUseCase>(() => _i24.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i16.IceRegionsRepository>()));
  gh.lazySingleton<_i25.LoadSectorsUseCase>(() => _i25.LoadSectorsUseCase(
      iceRegionsRepository: get<_i16.IceRegionsRepository>()));
  gh.lazySingleton<_i26.NetworkInfo>(
      () => _i26.NetworkInfoImpl(get<_i22.InternetConnectionChecker>()));
  gh.lazySingleton<_i27.NewHallAttempt>(() => _i27.NewHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i28.NewHallAttemptFromRoute>(() =>
      _i28.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i29.NewHallTreaning>(() => _i29.NewHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i30.NewIceAttempt>(
      () => _i30.NewIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i31.NewIceTreaning>(() => _i31.NewIceTreaning(
        iceTreaningsRepository: get<_i20.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i16.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i32.RemoteGymDataSource>(() => _i33.RemoteGymDataSourceImpl(
        get<_i9.FirebaseFirestore>(),
        get<_i7.FirebaseAuth>(),
      ));
  gh.lazySingleton<_i34.RockRegionsLocalDataSource>(
      () => _i35.HiveRockRegionsLocalDataSource());
  gh.lazySingleton<_i36.RockRegionsRepository>(() =>
      _i37.RockRegionsRepositoryImpl(get<_i34.RockRegionsLocalDataSource>()));
  gh.lazySingleton<_i38.RockTreaningsLocalDataSource>(
      () => _i39.MockRockTreaningsLocalDataSource());
  gh.lazySingleton<_i40.RockTreaningsRepository>(() =>
      _i41.RockTreaningsRepositoryImpl(
          get<_i38.RockTreaningsLocalDataSource>()));
  gh.lazySingleton<_i42.SettingsDataSource>(
      () => _i43.SettingsDataSourceImpl());
  gh.lazySingleton<_i44.SettingsRepository>(
      () => _i45.SettingsRepositoryImpl(get<_i42.SettingsDataSource>()));
  gh.lazySingleton<_i46.StrengthExerciseDataSource>(() =>
      _i47.LocalStrengthExerciseDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i48.StrengthExerciseRepository>(() =>
      _i49.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i46.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i50.StrengthTreaningsDataSource>(() =>
      _i51.LocalStrengthTreaningsDataSource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i52.StrengthTreaningsRepository>(() =>
      _i53.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i50.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i54.UpdateStrengthTreaningExercises>(() =>
      _i54.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i52.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i48.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i55.AddRepetitionForStrengthTreaning>(() =>
      _i55.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i52.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i56.AddStrengthTreaning>(() => _i56.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i52.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i48.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i57.AllHallTreanings>(
      () => _i57.AllHallTreanings(get<_i12.HallTreaningRepository>()));
  gh.lazySingletonAsync<_i58.AnaliticsService>(() async =>
      _i59.FirebaseAnaliticsService(
          await get.getAsync<_i6.FirebaseAnalytics>()));
  gh.lazySingleton<_i60.AuthDataSource>(
      () => _i61.FirebaseAuthDataSource(firebaseAuth: get<_i7.FirebaseAuth>()));
  gh.lazySingleton<_i62.AuthRepository>(() =>
      _i63.AuthRepositoryImpl(authDataSource: get<_i60.AuthDataSource>()));
  gh.lazySingleton<_i64.CardioTreaningsDatasource>(() =>
      _i65.LocalCardioTreaningsDatasource(get<_i5.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i66.CardioTreaningsRepository>(() =>
      _i67.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i64.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i68.ClimbingHallRepository>(
      () => _i69.ClimbingHallRepositoryImpl(
            get<_i3.ClimbingHallDataSource>(),
            get<_i32.RemoteGymDataSource>(),
            get<_i26.NetworkInfo>(),
          ));
  gh.lazySingletonAsync<_i70.CrashLogService>(() async =>
      _i71.GoogleCrashLogService(
          await get.getAsync<_i8.FirebaseCrashlytics>()));
  gh.lazySingleton<_i72.CurrentHallTreaning>(
      () => _i72.CurrentHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i73.DeleteCardioTreaning>(() => _i73.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i66.CardioTreaningsRepository>()));
  gh.lazySingleton<_i74.DeleteHallAttempt>(() => _i74.DeleteHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i75.DeleteHallTreaning>(() => _i75.DeleteHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i76.DeleteRepetitionForStrengthTreaning>(() =>
      _i76.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i52.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i77.DeleteStrengthExercise>(() =>
      _i77.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i48.StrengthExerciseRepository>()));
  gh.lazySingleton<_i78.DeleteStrengthTreaning>(() =>
      _i78.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i52.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i79.DeleteTreaning>(() => _i79.DeleteTreaning(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i52.StrengthTreaningsRepository>(),
        get<_i66.CardioTreaningsRepository>(),
        get<_i40.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i80.FinishHallAttempt>(() => _i80.FinishHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i81.FinishHallTreaning>(() => _i81.FinishHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i82.FinishIceAttempt>(
      () => _i82.FinishIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i83.FinishIceTreaning>(() => _i83.FinishIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i84.FinishRockAttempt>(
      () => _i84.FinishRockAttempt(get<_i40.RockTreaningsRepository>()));
  gh.lazySingleton<_i85.FinishRockTreaning>(
      () => _i85.FinishRockTreaning(get<_i40.RockTreaningsRepository>()));
  gh.lazySingleton<_i86.FinishStrengthTreaning>(() =>
      _i86.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i52.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i87.GetAllTreanings>(() => _i87.GetAllTreanings(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i52.StrengthTreaningsRepository>(),
        get<_i66.CardioTreaningsRepository>(),
        get<_i40.RockTreaningsRepository>(),
      ));
  gh.lazySingleton<_i88.GetCardioTreanings>(() => _i88.GetCardioTreanings(
      cardioTreaningsRepository: get<_i66.CardioTreaningsRepository>()));
  gh.lazySingleton<_i89.GetClimbingHallRoures>(
      () => _i89.GetClimbingHallRoures(get<_i68.ClimbingHallRepository>()));
  gh.lazySingleton<_i90.GetCurrentIceTreaning>(() => _i90.GetCurrentIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i91.GetCurrentRockTreaning>(
      () => _i91.GetCurrentRockTreaning(get<_i40.RockTreaningsRepository>()));
  gh.lazySingleton<_i92.GetCurrentStrengthTreaning>(() =>
      _i92.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i52.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i93.GetHallRouteAttempts>(() => _i93.GetHallRouteAttempts(
      repository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i94.GetLastCardioTreaning>(() => _i94.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i66.CardioTreaningsRepository>()));
  gh.lazySingleton<_i95.GetLastIceTreaning>(() => _i95.GetLastIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i96.GetLastRockTreaning>(
      () => _i96.GetLastRockTreaning(get<_i40.RockTreaningsRepository>()));
  gh.lazySingleton<_i97.GetPreviosStrengthTreaning>(() =>
      _i97.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i52.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i98.GetStrengthExercises>(() => _i98.GetStrengthExercises(
      strengthExerciseRepository: get<_i48.StrengthExerciseRepository>()));
  gh.lazySingleton<_i99.GetStrengthTreanings>(() => _i99.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i52.StrengthTreaningsRepository>()));
  gh.factory<_i100.HallRouteAttemptsCubit>(() => _i100.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i93.GetHallRouteAttempts>()));
  gh.lazySingleton<_i101.HallRouteToArchive>(() =>
      _i101.HallRouteToArchive(repository: get<_i68.ClimbingHallRepository>()));
  gh.factory<_i102.HallTreaningsCubit>(() => _i102.HallTreaningsCubit(
        allHallTreanings: get<_i57.AllHallTreanings>(),
        deleteHallTreaning: get<_i75.DeleteHallTreaning>(),
      ));
  gh.factory<_i103.IceDistrictsCubit>(() => _i103.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i24.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i104.IceSectorToTreaning>(() => _i104.IceSectorToTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.factory<_i105.IceSectorsCubit>(() => _i105.IceSectorsCubit(
      loadSectorsUseCase: get<_i25.LoadSectorsUseCase>()));
  gh.lazySingleton<_i106.LoadRockDistricts>(
      () => _i106.LoadRockDistricts(get<_i36.RockRegionsRepository>()));
  gh.lazySingleton<_i107.LoadRockRoutes>(
      () => _i107.LoadRockRoutes(get<_i36.RockRegionsRepository>()));
  gh.lazySingleton<_i108.LoadRockSectors>(
      () => _i108.LoadRockSectors(get<_i36.RockRegionsRepository>()));
  gh.lazySingleton<_i109.LoadTreaningsSettings>(
      () => _i109.LoadTreaningsSettings(get<_i44.SettingsRepository>()));
  gh.lazySingleton<_i110.NewHallRoute>(() => _i110.NewHallRoute(
      climbingHallRepository: get<_i68.ClimbingHallRepository>()));
  gh.lazySingleton<_i111.NewRockAttempt>(
      () => _i111.NewRockAttempt(get<_i40.RockTreaningsRepository>()));
  gh.lazySingleton<_i112.NewRockTreaning>(
      () => _i112.NewRockTreaning(get<_i40.RockTreaningsRepository>()));
  gh.factory<_i113.RockDistrictsCubit>(
      () => _i113.RockDistrictsCubit(get<_i106.LoadRockDistricts>()));
  gh.factory<_i114.RockRoutesCubit>(
      () => _i114.RockRoutesCubit(get<_i107.LoadRockRoutes>()));
  gh.lazySingleton<_i115.RockSectorToTreaning>(
      () => _i115.RockSectorToTreaning(get<_i40.RockTreaningsRepository>()));
  gh.factory<_i116.RockSectorsCubit>(
      () => _i116.RockSectorsCubit(get<_i108.LoadRockSectors>()));
  gh.factory<_i117.RockTreaningCubit>(() => _i117.RockTreaningCubit(
        get<_i112.NewRockTreaning>(),
        get<_i115.RockSectorToTreaning>(),
        get<_i111.NewRockAttempt>(),
        get<_i84.FinishRockAttempt>(),
        get<_i85.FinishRockTreaning>(),
        get<_i96.GetLastRockTreaning>(),
        get<_i91.GetCurrentRockTreaning>(),
      ));
  gh.lazySingleton<_i118.SaveCardioTreaning>(() => _i118.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i66.CardioTreaningsRepository>()));
  gh.lazySingleton<_i119.SaveStrengthExercise>(() => _i119.SaveStrengthExercise(
      strengthExerciseRepository: get<_i48.StrengthExerciseRepository>()));
  gh.lazySingleton<_i120.SaveTreaningsSettings>(
      () => _i120.SaveTreaningsSettings(get<_i44.SettingsRepository>()));
  gh.lazySingleton<_i121.SelectToUseStrengthExercise>(() =>
      _i121.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i48.StrengthExerciseRepository>()));
  gh.lazySingleton<_i122.SettingsCubit>(() => _i122.SettingsCubit(
        get<_i109.LoadTreaningsSettings>(),
        get<_i120.SaveTreaningsSettings>(),
      ));
  gh.factory<_i123.StrengthExercisesCubit>(() => _i123.StrengthExercisesCubit(
        get<_i98.GetStrengthExercises>(),
        get<_i119.SaveStrengthExercise>(),
        get<_i121.SelectToUseStrengthExercise>(),
        get<_i77.DeleteStrengthExercise>(),
      ));
  gh.factory<_i124.StrengthTrainingCubit>(() => _i124.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i92.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i97.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i56.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i54.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i55.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i86.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i76.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i125.StrengthTrainingsCubit>(() => _i125.StrengthTrainingsCubit(
        get<_i99.GetStrengthTreanings>(),
        get<_i78.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i126.TreaningsCubit>(() => _i126.TreaningsCubit(
        get<_i87.GetAllTreanings>(),
        get<_i79.DeleteTreaning>(),
      ));
  gh.lazySingleton<_i127.UpdateHalls>(
      () => _i127.UpdateHalls(get<_i68.ClimbingHallRepository>()));
  gh.lazySingleton<_i128.AllClimbingHalls>(
      () => _i128.AllClimbingHalls(get<_i68.ClimbingHallRepository>()));
  gh.factory<_i129.AuthGetUser>(
      () => _i129.AuthGetUser(authRepository: get<_i62.AuthRepository>()));
  gh.factory<_i130.AuthLogin>(
      () => _i130.AuthLogin(authRepository: get<_i62.AuthRepository>()));
  gh.factory<_i131.AuthLogout>(
      () => _i131.AuthLogout(authRepository: get<_i62.AuthRepository>()));
  gh.factory<_i132.AuthenticationCubit>(() => _i132.AuthenticationCubit(
        get<_i130.AuthLogin>(),
        get<_i131.AuthLogout>(),
        get<_i129.AuthGetUser>(),
      ));
  gh.factory<_i133.CardioTreaningCubit>(() => _i133.CardioTreaningCubit(
        get<_i94.GetLastCardioTreaning>(),
        get<_i118.SaveCardioTreaning>(),
      ));
  gh.factory<_i134.CardioTreaningsCubit>(() => _i134.CardioTreaningsCubit(
        get<_i88.GetCardioTreanings>(),
        get<_i73.DeleteCardioTreaning>(),
        get<_i118.SaveCardioTreaning>(),
      ));
  gh.factory<_i135.ClimbingHallCubit>(() => _i135.ClimbingHallCubit(
        getClimbingHallRoures: get<_i89.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i101.HallRouteToArchive>(),
      ));
  gh.factory<_i136.ClimbingHallsCubit>(() => _i136.ClimbingHallsCubit(
      allClimbingHalls: get<_i128.AllClimbingHalls>()));
  gh.factory<_i137.CurrentHallTreaningCubit>(
      () => _i137.CurrentHallTreaningCubit(
            newHallAttemptFromRoute: get<_i28.NewHallAttemptFromRoute>(),
            newHallTreaning: get<_i29.NewHallTreaning>(),
            newHallAttempt: get<_i27.NewHallAttempt>(),
            currentHallTreaning: get<_i72.CurrentHallTreaning>(),
            finishHallAttempt: get<_i80.FinishHallAttempt>(),
            finishHallTreaning: get<_i81.FinishHallTreaning>(),
            lastHallTreaning: get<_i23.LastHallTreaning>(),
            deleteHallAttempt: get<_i74.DeleteHallAttempt>(),
          ));
  gh.factory<_i138.CurrentIceTreaningCubit>(() => _i138.CurrentIceTreaningCubit(
        get<_i31.NewIceTreaning>(),
        get<_i104.IceSectorToTreaning>(),
        get<_i30.NewIceAttempt>(),
        get<_i82.FinishIceAttempt>(),
        get<_i83.FinishIceTreaning>(),
        get<_i90.GetCurrentIceTreaning>(),
        get<_i95.GetLastIceTreaning>(),
      ));
  gh.factory<_i139.HallRouteCubit>(
      () => _i139.HallRouteCubit(get<_i110.NewHallRoute>()));
  gh.factory<_i140.HomePageCubit>(() =>
      _i140.HomePageCubit(allClimbingHalls: get<_i128.AllClimbingHalls>()));
  return get;
}

class _$InjectableModule extends _i141.InjectableModule {}

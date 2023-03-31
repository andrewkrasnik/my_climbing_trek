// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/datasource/drift_db_local_datasource.dart' as _i7;
import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i46;
import 'features/cardio_workout/data/datasources/local_cardio_treanings_datasource.dart'
    as _i47;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i49;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i48;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i53;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i66;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i70;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i82;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i89;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i90;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i10;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i11;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i6;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i13;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i5;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i44;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i8;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i69;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i9;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i27;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i45;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i52;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i54;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i55;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i60;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i61;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i22;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i25;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i26;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i28;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i40;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i50;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i51;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i91;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i76;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i75;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i77;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i78;
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
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i62;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i63;
import 'features/ice_climbing/domain/usecases/get_current_ice_treaning.dart'
    as _i67;
import 'features/ice_climbing/domain/usecases/get_last_ice_treaning.dart'
    as _i71;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i80;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i23;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i24;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i29;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i30;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i92;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i79;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i81;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i31;
import 'features/strength_training/data/datasources/local_strength_exercise_datasource.dart'
    as _i33;
import 'features/strength_training/data/datasources/local_strength_treanings_datasource.dart'
    as _i37;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i32;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i36;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i35;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i39;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i34;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i38;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i42;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i43;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i56;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i57;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i58;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i64;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i68;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i72;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i73;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i74;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i83;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i84;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i41;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i85;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i86;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i87;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i59;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i65;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i88; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.ClimbingHallDataSource>(
      () => _i4.LocalClimbingHallDataSource());
  gh.lazySingleton<_i5.ClimbingHallRepository>(() =>
      _i6.ClimbingHallRepositoryImpl(
          climbingHallDataSource: get<_i3.ClimbingHallDataSource>()));
  gh.lazySingleton<_i7.DriftDBLocalDataSource>(
      () => _i7.DriftDBLocalDataSource());
  gh.lazySingleton<_i8.GetClimbingHallRoures>(
      () => _i8.GetClimbingHallRoures(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i9.HallRouteToArchive>(() =>
      _i9.HallRouteToArchive(repository: get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i10.HallTreaningDataSource>(() =>
      _i11.LocalHallTreaningDataSource(
          localDatabase: get<_i7.DriftDBLocalDataSource>()));
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
      _i19.LocalIceTreaningsDataSource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i20.IceTreaningsRepository>(() =>
      _i21.IceTreaningsRepositoryImpl(get<_i18.IceTreaningsDataSource>()));
  gh.lazySingleton<_i22.LastHallTreaning>(
      () => _i22.LastHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i23.LoadDistrictsUseCase>(() => _i23.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i16.IceRegionsRepository>()));
  gh.lazySingleton<_i24.LoadSectorsUseCase>(() => _i24.LoadSectorsUseCase(
      iceRegionsRepository: get<_i16.IceRegionsRepository>()));
  gh.lazySingleton<_i25.NewHallAttempt>(() => _i25.NewHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i26.NewHallAttemptFromRoute>(() =>
      _i26.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i27.NewHallRoute>(() => _i27.NewHallRoute(
      climbingHallRepository: get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i28.NewHallTreaning>(() => _i28.NewHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i29.NewIceAttempt>(
      () => _i29.NewIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i30.NewIceTreaning>(() => _i30.NewIceTreaning(
        iceTreaningsRepository: get<_i20.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i16.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i31.SettingsCubit>(() => _i31.SettingsCubit());
  gh.lazySingleton<_i32.StrengthExerciseDataSource>(() =>
      _i33.LocalStrengthExerciseDataSource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i34.StrengthExerciseRepository>(() =>
      _i35.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i32.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i36.StrengthTreaningsDataSource>(() =>
      _i37.LocalStrengthTreaningsDataSource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i38.StrengthTreaningsRepository>(() =>
      _i39.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i36.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i40.UpdateHalls>(
      () => _i40.UpdateHalls(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i41.UpdateStrengthTreaningExercises>(() =>
      _i41.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i38.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i34.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i42.AddRepetitionForStrengthTreaning>(() =>
      _i42.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i38.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i43.AddStrengthTreaning>(() => _i43.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i38.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i34.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i44.AllClimbingHalls>(
      () => _i44.AllClimbingHalls(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i45.AllHallTreanings>(
      () => _i45.AllHallTreanings(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i46.CardioTreaningsDatasource>(() =>
      _i47.LocalCardioTreaningsDatasource(get<_i7.DriftDBLocalDataSource>()));
  gh.lazySingleton<_i48.CardioTreaningsRepository>(() =>
      _i49.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i46.CardioTreaningsDatasource>()));
  gh.factory<_i50.ClimbingHallCubit>(() => _i50.ClimbingHallCubit(
        getClimbingHallRoures: get<_i8.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i9.HallRouteToArchive>(),
      ));
  gh.factory<_i51.ClimbingHallsCubit>(() =>
      _i51.ClimbingHallsCubit(allClimbingHalls: get<_i44.AllClimbingHalls>()));
  gh.lazySingleton<_i52.CurrentHallTreaning>(
      () => _i52.CurrentHallTreaning(get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i53.DeleteCardioTreaning>(() => _i53.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i48.CardioTreaningsRepository>()));
  gh.lazySingleton<_i54.DeleteHallAttempt>(() => _i54.DeleteHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i55.DeleteHallTreaning>(() => _i55.DeleteHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i56.DeleteRepetitionForStrengthTreaning>(() =>
      _i56.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i38.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i57.DeleteStrengthExercise>(() =>
      _i57.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i34.StrengthExerciseRepository>()));
  gh.lazySingleton<_i58.DeleteStrengthTreaning>(() =>
      _i58.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i38.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i59.DeleteTreaning>(() => _i59.DeleteTreaning(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i38.StrengthTreaningsRepository>(),
        get<_i48.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i60.FinishHallAttempt>(() => _i60.FinishHallAttempt(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i61.FinishHallTreaning>(() => _i61.FinishHallTreaning(
      treaningRepository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i62.FinishIceAttempt>(
      () => _i62.FinishIceAttempt(get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i63.FinishIceTreaning>(() => _i63.FinishIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i64.FinishStrengthTreaning>(() =>
      _i64.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i38.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i65.GetAllTreanings>(() => _i65.GetAllTreanings(
        get<_i12.HallTreaningRepository>(),
        get<_i20.IceTreaningsRepository>(),
        get<_i38.StrengthTreaningsRepository>(),
        get<_i48.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i66.GetCardioTreanings>(() => _i66.GetCardioTreanings(
      cardioTreaningsRepository: get<_i48.CardioTreaningsRepository>()));
  gh.lazySingleton<_i67.GetCurrentIceTreaning>(() => _i67.GetCurrentIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i68.GetCurrentStrengthTreaning>(() =>
      _i68.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i38.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i69.GetHallRouteAttempts>(() => _i69.GetHallRouteAttempts(
      repository: get<_i12.HallTreaningRepository>()));
  gh.lazySingleton<_i70.GetLastCardioTreaning>(() => _i70.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i48.CardioTreaningsRepository>()));
  gh.lazySingleton<_i71.GetLastIceTreaning>(() => _i71.GetLastIceTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.lazySingleton<_i72.GetPreviosStrengthTreaning>(() =>
      _i72.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i38.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i73.GetStrengthExercises>(() => _i73.GetStrengthExercises(
      strengthExerciseRepository: get<_i34.StrengthExerciseRepository>()));
  gh.lazySingleton<_i74.GetStrengthTreanings>(() => _i74.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i38.StrengthTreaningsRepository>()));
  gh.factory<_i75.HallRouteAttemptsCubit>(() => _i75.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i69.GetHallRouteAttempts>()));
  gh.factory<_i76.HallRouteCubit>(
      () => _i76.HallRouteCubit(get<_i27.NewHallRoute>()));
  gh.factory<_i77.HallTreaningsCubit>(() => _i77.HallTreaningsCubit(
        allHallTreanings: get<_i45.AllHallTreanings>(),
        deleteHallTreaning: get<_i55.DeleteHallTreaning>(),
      ));
  gh.factory<_i78.HomePageCubit>(
      () => _i78.HomePageCubit(allClimbingHalls: get<_i44.AllClimbingHalls>()));
  gh.factory<_i79.IceDistrictsCubit>(() => _i79.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i23.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i80.IceSectorToTreaning>(() => _i80.IceSectorToTreaning(
      iceTreaningsRepository: get<_i20.IceTreaningsRepository>()));
  gh.factory<_i81.IceSectorsCubit>(() =>
      _i81.IceSectorsCubit(loadSectorsUseCase: get<_i24.LoadSectorsUseCase>()));
  gh.lazySingleton<_i82.SaveCardioTreaning>(() => _i82.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i48.CardioTreaningsRepository>()));
  gh.lazySingleton<_i83.SaveStrengthExercise>(() => _i83.SaveStrengthExercise(
      strengthExerciseRepository: get<_i34.StrengthExerciseRepository>()));
  gh.lazySingleton<_i84.SelectToUseStrengthExercise>(() =>
      _i84.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i34.StrengthExerciseRepository>()));
  gh.factory<_i85.StrengthExercisesCubit>(() => _i85.StrengthExercisesCubit(
        get<_i73.GetStrengthExercises>(),
        get<_i83.SaveStrengthExercise>(),
        get<_i84.SelectToUseStrengthExercise>(),
        get<_i57.DeleteStrengthExercise>(),
      ));
  gh.factory<_i86.StrengthTrainingCubit>(() => _i86.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i68.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i72.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i43.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i41.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i42.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i64.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i56.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i87.StrengthTrainingsCubit>(() => _i87.StrengthTrainingsCubit(
        get<_i74.GetStrengthTreanings>(),
        get<_i58.DeleteStrengthTreaning>(),
      ));
  gh.factory<_i88.TreaningsCubit>(() => _i88.TreaningsCubit(
        get<_i65.GetAllTreanings>(),
        get<_i59.DeleteTreaning>(),
      ));
  gh.factory<_i89.CardioTreaningCubit>(() => _i89.CardioTreaningCubit(
        get<_i70.GetLastCardioTreaning>(),
        get<_i82.SaveCardioTreaning>(),
      ));
  gh.factory<_i90.CardioTreaningsCubit>(() => _i90.CardioTreaningsCubit(
        get<_i66.GetCardioTreanings>(),
        get<_i53.DeleteCardioTreaning>(),
        get<_i82.SaveCardioTreaning>(),
      ));
  gh.factory<_i91.CurrentHallTreaningCubit>(() => _i91.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i26.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i28.NewHallTreaning>(),
        newHallAttempt: get<_i25.NewHallAttempt>(),
        currentHallTreaning: get<_i52.CurrentHallTreaning>(),
        finishHallAttempt: get<_i60.FinishHallAttempt>(),
        finishHallTreaning: get<_i61.FinishHallTreaning>(),
        lastHallTreaning: get<_i22.LastHallTreaning>(),
        deleteHallAttempt: get<_i54.DeleteHallAttempt>(),
      ));
  gh.factory<_i92.CurrentIceTreaningCubit>(() => _i92.CurrentIceTreaningCubit(
        get<_i30.NewIceTreaning>(),
        get<_i80.IceSectorToTreaning>(),
        get<_i29.NewIceAttempt>(),
        get<_i62.FinishIceAttempt>(),
        get<_i63.FinishIceTreaning>(),
        get<_i67.GetCurrentIceTreaning>(),
        get<_i71.GetLastIceTreaning>(),
      ));
  return get;
}

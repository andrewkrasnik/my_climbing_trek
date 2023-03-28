// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/cardio_workout/data/datasources/cardio_treanings_datasource.dart'
    as _i3;
import 'features/cardio_workout/data/repositories/cardio_treanings_repository_impl.dart'
    as _i5;
import 'features/cardio_workout/domain/repositories/cardio_treanings_repository.dart'
    as _i4;
import 'features/cardio_workout/domain/usecases/delete_cardio_treaning.dart'
    as _i10;
import 'features/cardio_workout/domain/usecases/get_cardio_treanings.dart'
    as _i11;
import 'features/cardio_workout/domain/usecases/get_last_cardio_treaning.dart'
    as _i13;
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i27;
import 'features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart'
    as _i40;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i41;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i6;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i55;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i7;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i23;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i9;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i57;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i8;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i56;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i39;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i80;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i14;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i24;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i71;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i72;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i74;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i75;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i77;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i78;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i62;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i63;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i64;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i65;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i35;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i42;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i43;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i84;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i54;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i81;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i82;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i58;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i15;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i18;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i17;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i20;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i16;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i19;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i47;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i48;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i60;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i21;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i22;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i25;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i26;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i73;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i59;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i61;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i28;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i29;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i32;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i31;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i34;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i30;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i33;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i37;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i38;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i44;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i45;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i46;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i49;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i50;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i51;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i52;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i53;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i66;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i67;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i36;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i68;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i69;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i70;
import 'features/treanings/domain/usecases/delete_treaning.dart' as _i76;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i79;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i83; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.CardioTreaningsDatasource>(
      () => _i3.MockCardioTreaningsDatasource());
  gh.lazySingleton<_i4.CardioTreaningsRepository>(() =>
      _i5.CardioTreaningsRepositoryImpl(
          cardioTreaningsDatasource: get<_i3.CardioTreaningsDatasource>()));
  gh.lazySingleton<_i6.ClimbingHallDataSource>(
      () => _i7.LocalClimbingHallDataSource());
  gh.lazySingleton<_i8.ClimbingHallRepository>(() =>
      _i9.ClimbingHallRepositoryImpl(
          climbingHallDataSource: get<_i6.ClimbingHallDataSource>()));
  gh.lazySingleton<_i10.DeleteCardioTreaning>(() => _i10.DeleteCardioTreaning(
      cardioTreaningsRepository: get<_i4.CardioTreaningsRepository>()));
  gh.lazySingleton<_i11.GetCardioTreanings>(() => _i11.GetCardioTreanings(
      cardioTreaningsRepository: get<_i4.CardioTreaningsRepository>()));
  gh.lazySingleton<_i12.GetClimbingHallRoures>(
      () => _i12.GetClimbingHallRoures(get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i13.GetLastCardioTreaning>(() => _i13.GetLastCardioTreaning(
      cardioTreaningsRepository: get<_i4.CardioTreaningsRepository>()));
  gh.lazySingleton<_i14.HallRouteToArchive>(() =>
      _i14.HallRouteToArchive(repository: get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i15.IceRegionsDataSource>(
      () => _i15.MockIceRegionsDataSource());
  gh.lazySingleton<_i16.IceRegionsRepository>(() =>
      _i17.IceRegionsRepositoryImpl(
          iceRegionsDataSource: get<_i15.IceRegionsDataSource>()));
  gh.lazySingleton<_i18.IceTreaningsDataSource>(
      () => _i18.MockIceTreaningsDataSource());
  gh.lazySingleton<_i19.IceTreaningsRepository>(() =>
      _i20.IceTreaningsRepositoryImpl(get<_i18.IceTreaningsDataSource>()));
  gh.lazySingleton<_i21.LoadDistrictsUseCase>(() => _i21.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i16.IceRegionsRepository>()));
  gh.lazySingleton<_i22.LoadSectorsUseCase>(() => _i22.LoadSectorsUseCase(
      iceRegionsRepository: get<_i16.IceRegionsRepository>()));
  gh.lazySingleton<_i23.LocalDatabase>(() => _i23.LocalDatabase());
  gh.lazySingleton<_i24.NewHallRoute>(() => _i24.NewHallRoute(
      climbingHallRepository: get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i25.NewIceAttempt>(
      () => _i25.NewIceAttempt(get<_i19.IceTreaningsRepository>()));
  gh.lazySingleton<_i26.NewIceTreaning>(() => _i26.NewIceTreaning(
        iceTreaningsRepository: get<_i19.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i16.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i27.SaveCardioTreaning>(() => _i27.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i4.CardioTreaningsRepository>()));
  gh.lazySingleton<_i28.SettingsCubit>(() => _i28.SettingsCubit());
  gh.lazySingleton<_i29.StrengthExerciseDataSource>(
      () => _i29.MockStrengthExerciseDataSource());
  gh.lazySingleton<_i30.StrengthExerciseRepository>(() =>
      _i31.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i29.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i32.StrengthTreaningsDataSource>(
      () => _i32.MockStrengthTreaningsDataSource());
  gh.lazySingleton<_i33.StrengthTreaningsRepository>(() =>
      _i34.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i32.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i35.UpdateHalls>(
      () => _i35.UpdateHalls(get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i36.UpdateStrengthTreaningExercises>(() =>
      _i36.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i33.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i30.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i37.AddRepetitionForStrengthTreaning>(() =>
      _i37.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i33.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i38.AddStrengthTreaning>(() => _i38.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i33.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i30.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i39.AllClimbingHalls>(
      () => _i39.AllClimbingHalls(get<_i8.ClimbingHallRepository>()));
  gh.factory<_i40.CardioTreaningCubit>(() => _i40.CardioTreaningCubit(
        get<_i13.GetLastCardioTreaning>(),
        get<_i27.SaveCardioTreaning>(),
      ));
  gh.factory<_i41.CardioTreaningsCubit>(() => _i41.CardioTreaningsCubit(
        get<_i11.GetCardioTreanings>(),
        get<_i10.DeleteCardioTreaning>(),
        get<_i27.SaveCardioTreaning>(),
      ));
  gh.factory<_i42.ClimbingHallCubit>(() => _i42.ClimbingHallCubit(
        getClimbingHallRoures: get<_i12.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i14.HallRouteToArchive>(),
      ));
  gh.factory<_i43.ClimbingHallsCubit>(() =>
      _i43.ClimbingHallsCubit(allClimbingHalls: get<_i39.AllClimbingHalls>()));
  gh.lazySingleton<_i44.DeleteRepetitionForStrengthTreaning>(() =>
      _i44.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i33.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i45.DeleteStrengthExercise>(() =>
      _i45.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i30.StrengthExerciseRepository>()));
  gh.lazySingleton<_i46.DeleteStrengthTreaning>(() =>
      _i46.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i33.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i47.FinishIceAttempt>(
      () => _i47.FinishIceAttempt(get<_i19.IceTreaningsRepository>()));
  gh.lazySingleton<_i48.FinishIceTreaning>(() => _i48.FinishIceTreaning(
      iceTreaningsRepository: get<_i19.IceTreaningsRepository>()));
  gh.lazySingleton<_i49.FinishStrengthTreaning>(() =>
      _i49.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i33.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i50.GetCurrentStrengthTreaning>(() =>
      _i50.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i33.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i51.GetPreviosStrengthTreaning>(() =>
      _i51.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i33.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i52.GetStrengthExercises>(() => _i52.GetStrengthExercises(
      strengthExerciseRepository: get<_i30.StrengthExerciseRepository>()));
  gh.lazySingleton<_i53.GetStrengthTreanings>(() => _i53.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i33.StrengthTreaningsRepository>()));
  gh.factory<_i54.HallRouteCubit>(
      () => _i54.HallRouteCubit(get<_i24.NewHallRoute>()));
  gh.lazySingleton<_i55.HallTreaningDataSource>(() =>
      _i23.LocalHallTreaningDataSource(
          localDatabase: get<_i23.LocalDatabase>()));
  gh.lazySingleton<_i56.HallTreaningRepository>(
      () => _i57.HallTreaningRepositoryImpl(
            dataSource: get<_i55.HallTreaningDataSource>(),
            hallDataSource: get<_i6.ClimbingHallDataSource>(),
          ));
  gh.factory<_i58.HomePageCubit>(
      () => _i58.HomePageCubit(allClimbingHalls: get<_i39.AllClimbingHalls>()));
  gh.factory<_i59.IceDistrictsCubit>(() => _i59.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i21.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i60.IceSectorToTreaning>(() => _i60.IceSectorToTreaning(
      iceTreaningsRepository: get<_i19.IceTreaningsRepository>()));
  gh.factory<_i61.IceSectorsCubit>(() =>
      _i61.IceSectorsCubit(loadSectorsUseCase: get<_i22.LoadSectorsUseCase>()));
  gh.lazySingleton<_i62.LastHallTreaning>(
      () => _i62.LastHallTreaning(get<_i56.HallTreaningRepository>()));
  gh.lazySingleton<_i63.NewHallAttempt>(() => _i63.NewHallAttempt(
      treaningRepository: get<_i56.HallTreaningRepository>()));
  gh.lazySingleton<_i64.NewHallAttemptFromRoute>(() =>
      _i64.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i56.HallTreaningRepository>()));
  gh.lazySingleton<_i65.NewHallTreaning>(() => _i65.NewHallTreaning(
      treaningRepository: get<_i56.HallTreaningRepository>()));
  gh.lazySingleton<_i66.SaveStrengthExercise>(() => _i66.SaveStrengthExercise(
      strengthExerciseRepository: get<_i30.StrengthExerciseRepository>()));
  gh.lazySingleton<_i67.SelectToUseStrengthExercise>(() =>
      _i67.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i30.StrengthExerciseRepository>()));
  gh.factory<_i68.StrengthExercisesCubit>(() => _i68.StrengthExercisesCubit(
        get<_i52.GetStrengthExercises>(),
        get<_i66.SaveStrengthExercise>(),
        get<_i67.SelectToUseStrengthExercise>(),
        get<_i45.DeleteStrengthExercise>(),
      ));
  gh.factory<_i69.StrengthTrainingCubit>(() => _i69.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i50.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i51.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i38.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i36.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i37.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i49.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i44.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i70.StrengthTrainingsCubit>(() => _i70.StrengthTrainingsCubit(
        get<_i53.GetStrengthTreanings>(),
        get<_i46.DeleteStrengthTreaning>(),
      ));
  gh.lazySingleton<_i71.AllHallTreanings>(
      () => _i71.AllHallTreanings(get<_i56.HallTreaningRepository>()));
  gh.lazySingleton<_i72.CurrentHallTreaning>(
      () => _i72.CurrentHallTreaning(get<_i56.HallTreaningRepository>()));
  gh.factory<_i73.CurrentIceTreaningCubit>(() => _i73.CurrentIceTreaningCubit(
        get<_i26.NewIceTreaning>(),
        get<_i60.IceSectorToTreaning>(),
        get<_i25.NewIceAttempt>(),
        get<_i47.FinishIceAttempt>(),
        get<_i48.FinishIceTreaning>(),
      ));
  gh.lazySingleton<_i74.DeleteHallAttempt>(() => _i74.DeleteHallAttempt(
      treaningRepository: get<_i56.HallTreaningRepository>()));
  gh.lazySingleton<_i75.DeleteHallTreaning>(() => _i75.DeleteHallTreaning(
      treaningRepository: get<_i56.HallTreaningRepository>()));
  gh.lazySingleton<_i76.DeleteTreaning>(() => _i76.DeleteTreaning(
        get<_i56.HallTreaningRepository>(),
        get<_i19.IceTreaningsRepository>(),
        get<_i33.StrengthTreaningsRepository>(),
        get<_i4.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i77.FinishHallAttempt>(() => _i77.FinishHallAttempt(
      treaningRepository: get<_i56.HallTreaningRepository>()));
  gh.lazySingleton<_i78.FinishHallTreaning>(() => _i78.FinishHallTreaning(
      treaningRepository: get<_i56.HallTreaningRepository>()));
  gh.lazySingleton<_i79.GetAllTreanings>(() => _i79.GetAllTreanings(
        get<_i56.HallTreaningRepository>(),
        get<_i19.IceTreaningsRepository>(),
        get<_i33.StrengthTreaningsRepository>(),
        get<_i4.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i80.GetHallRouteAttempts>(() => _i80.GetHallRouteAttempts(
      repository: get<_i56.HallTreaningRepository>()));
  gh.factory<_i81.HallRouteAttemptsCubit>(() => _i81.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i80.GetHallRouteAttempts>()));
  gh.factory<_i82.HallTreaningsCubit>(() => _i82.HallTreaningsCubit(
        allHallTreanings: get<_i71.AllHallTreanings>(),
        deleteHallTreaning: get<_i75.DeleteHallTreaning>(),
      ));
  gh.factory<_i83.TreaningsCubit>(() => _i83.TreaningsCubit(
        get<_i79.GetAllTreanings>(),
        get<_i76.DeleteTreaning>(),
      ));
  gh.factory<_i84.CurrentHallTreaningCubit>(() => _i84.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i64.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i65.NewHallTreaning>(),
        newHallAttempt: get<_i63.NewHallAttempt>(),
        currentHallTreaning: get<_i72.CurrentHallTreaning>(),
        finishHallAttempt: get<_i77.FinishHallAttempt>(),
        finishHallTreaning: get<_i78.FinishHallTreaning>(),
        lastHallTreaning: get<_i62.LastHallTreaning>(),
        deleteHallAttempt: get<_i74.DeleteHallAttempt>(),
      ));
  return get;
}

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
import 'features/cardio_workout/domain/usecases/save_cardio_treaning.dart'
    as _i26;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i39;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i6;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i53;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i7;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i22;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i9;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i55;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i8;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i54;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i38;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i77;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i13;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i23;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i69;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i70;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i72;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i73;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i74;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i75;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i60;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i61;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i62;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i63;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i34;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i40;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i41;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i81;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i52;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i78;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i79;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i56;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i14;
import 'features/ice_climbing/data/datasources/ice_treanings_datasource.dart'
    as _i17;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i16;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i19;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i15;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i18;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i45;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i46;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i58;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i20;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i21;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i24;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i25;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i71;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i57;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i59;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i27;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i28;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i31;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i30;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i33;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i29;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i32;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i36;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i37;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i42;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i43;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i44;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i47;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i48;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i49;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i50;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i51;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i64;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i65;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i35;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i66;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i67;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i68;
import 'features/treanings/domain/usecases/get_all_treanings.dart' as _i76;
import 'features/treanings/presentation/cubit/treanings_cubit.dart'
    as _i80; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i13.HallRouteToArchive>(() =>
      _i13.HallRouteToArchive(repository: get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i14.IceRegionsDataSource>(
      () => _i14.MockIceRegionsDataSource());
  gh.lazySingleton<_i15.IceRegionsRepository>(() =>
      _i16.IceRegionsRepositoryImpl(
          iceRegionsDataSource: get<_i14.IceRegionsDataSource>()));
  gh.lazySingleton<_i17.IceTreaningsDataSource>(
      () => _i17.MockIceTreaningsDataSource());
  gh.lazySingleton<_i18.IceTreaningsRepository>(() =>
      _i19.IceTreaningsRepositoryImpl(get<_i17.IceTreaningsDataSource>()));
  gh.lazySingleton<_i20.LoadDistrictsUseCase>(() => _i20.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i15.IceRegionsRepository>()));
  gh.lazySingleton<_i21.LoadSectorsUseCase>(() => _i21.LoadSectorsUseCase(
      iceRegionsRepository: get<_i15.IceRegionsRepository>()));
  gh.lazySingleton<_i22.LocalDatabase>(() => _i22.LocalDatabase());
  gh.lazySingleton<_i23.NewHallRoute>(() => _i23.NewHallRoute(
      climbingHallRepository: get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i24.NewIceAttempt>(
      () => _i24.NewIceAttempt(get<_i18.IceTreaningsRepository>()));
  gh.lazySingleton<_i25.NewIceTreaning>(() => _i25.NewIceTreaning(
        iceTreaningsRepository: get<_i18.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i15.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i26.SaveCardioTreaning>(() => _i26.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i4.CardioTreaningsRepository>()));
  gh.lazySingleton<_i27.SettingsCubit>(() => _i27.SettingsCubit());
  gh.lazySingleton<_i28.StrengthExerciseDataSource>(
      () => _i28.MockStrengthExerciseDataSource());
  gh.lazySingleton<_i29.StrengthExerciseRepository>(() =>
      _i30.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i28.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i31.StrengthTreaningsDataSource>(
      () => _i31.MockStrengthTreaningsDataSource());
  gh.lazySingleton<_i32.StrengthTreaningsRepository>(() =>
      _i33.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i31.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i34.UpdateHalls>(
      () => _i34.UpdateHalls(get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i35.UpdateStrengthTreaningExercises>(() =>
      _i35.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i32.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i29.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i36.AddRepetitionForStrengthTreaning>(() =>
      _i36.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i32.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i37.AddStrengthTreaning>(() => _i37.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i32.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i29.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i38.AllClimbingHalls>(
      () => _i38.AllClimbingHalls(get<_i8.ClimbingHallRepository>()));
  gh.factory<_i39.CardioTreaningsCubit>(() => _i39.CardioTreaningsCubit(
        get<_i11.GetCardioTreanings>(),
        get<_i10.DeleteCardioTreaning>(),
        get<_i26.SaveCardioTreaning>(),
      ));
  gh.factory<_i40.ClimbingHallCubit>(() => _i40.ClimbingHallCubit(
        getClimbingHallRoures: get<_i12.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i13.HallRouteToArchive>(),
      ));
  gh.factory<_i41.ClimbingHallsCubit>(() =>
      _i41.ClimbingHallsCubit(allClimbingHalls: get<_i38.AllClimbingHalls>()));
  gh.lazySingleton<_i42.DeleteRepetitionForStrengthTreaning>(() =>
      _i42.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i32.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i43.DeleteStrengthExercise>(() =>
      _i43.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i29.StrengthExerciseRepository>()));
  gh.lazySingleton<_i44.DeleteStrengthTreaning>(() =>
      _i44.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i32.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i45.FinishIceAttempt>(
      () => _i45.FinishIceAttempt(get<_i18.IceTreaningsRepository>()));
  gh.lazySingleton<_i46.FinishIceTreaning>(() => _i46.FinishIceTreaning(
      iceTreaningsRepository: get<_i18.IceTreaningsRepository>()));
  gh.lazySingleton<_i47.FinishStrengthTreaning>(() =>
      _i47.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i32.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i48.GetCurrentStrengthTreaning>(() =>
      _i48.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i32.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i49.GetPreviosStrengthTreaning>(() =>
      _i49.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i32.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i50.GetStrengthExercises>(() => _i50.GetStrengthExercises(
      strengthExerciseRepository: get<_i29.StrengthExerciseRepository>()));
  gh.lazySingleton<_i51.GetStrengthTreanings>(() => _i51.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i32.StrengthTreaningsRepository>()));
  gh.factory<_i52.HallRouteCubit>(
      () => _i52.HallRouteCubit(get<_i23.NewHallRoute>()));
  gh.lazySingleton<_i53.HallTreaningDataSource>(() =>
      _i22.LocalHallTreaningDataSource(
          localDatabase: get<_i22.LocalDatabase>()));
  gh.lazySingleton<_i54.HallTreaningRepository>(
      () => _i55.HallTreaningRepositoryImpl(
            dataSource: get<_i53.HallTreaningDataSource>(),
            hallDataSource: get<_i6.ClimbingHallDataSource>(),
          ));
  gh.factory<_i56.HomePageCubit>(
      () => _i56.HomePageCubit(allClimbingHalls: get<_i38.AllClimbingHalls>()));
  gh.factory<_i57.IceDistrictsCubit>(() => _i57.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i20.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i58.IceSectorToTreaning>(() => _i58.IceSectorToTreaning(
      iceTreaningsRepository: get<_i18.IceTreaningsRepository>()));
  gh.factory<_i59.IceSectorsCubit>(() =>
      _i59.IceSectorsCubit(loadSectorsUseCase: get<_i21.LoadSectorsUseCase>()));
  gh.lazySingleton<_i60.LastHallTreaning>(
      () => _i60.LastHallTreaning(get<_i54.HallTreaningRepository>()));
  gh.lazySingleton<_i61.NewHallAttempt>(() => _i61.NewHallAttempt(
      treaningRepository: get<_i54.HallTreaningRepository>()));
  gh.lazySingleton<_i62.NewHallAttemptFromRoute>(() =>
      _i62.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i54.HallTreaningRepository>()));
  gh.lazySingleton<_i63.NewHallTreaning>(() => _i63.NewHallTreaning(
      treaningRepository: get<_i54.HallTreaningRepository>()));
  gh.lazySingleton<_i64.SaveStrengthExercise>(() => _i64.SaveStrengthExercise(
      strengthExerciseRepository: get<_i29.StrengthExerciseRepository>()));
  gh.lazySingleton<_i65.SelectToUseStrengthExercise>(() =>
      _i65.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i29.StrengthExerciseRepository>()));
  gh.factory<_i66.StrengthExercisesCubit>(() => _i66.StrengthExercisesCubit(
        get<_i50.GetStrengthExercises>(),
        get<_i64.SaveStrengthExercise>(),
        get<_i65.SelectToUseStrengthExercise>(),
        get<_i43.DeleteStrengthExercise>(),
      ));
  gh.factory<_i67.StrengthTrainingCubit>(() => _i67.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i48.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i49.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i37.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i35.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i36.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i47.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i42.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i68.StrengthTrainingsCubit>(() => _i68.StrengthTrainingsCubit(
        get<_i51.GetStrengthTreanings>(),
        get<_i44.DeleteStrengthTreaning>(),
      ));
  gh.lazySingleton<_i69.AllHallTreanings>(
      () => _i69.AllHallTreanings(get<_i54.HallTreaningRepository>()));
  gh.lazySingleton<_i70.CurrentHallTreaning>(
      () => _i70.CurrentHallTreaning(get<_i54.HallTreaningRepository>()));
  gh.factory<_i71.CurrentIceTreaningCubit>(() => _i71.CurrentIceTreaningCubit(
        get<_i25.NewIceTreaning>(),
        get<_i58.IceSectorToTreaning>(),
        get<_i24.NewIceAttempt>(),
        get<_i45.FinishIceAttempt>(),
        get<_i46.FinishIceTreaning>(),
      ));
  gh.lazySingleton<_i72.DeleteHallAttempt>(() => _i72.DeleteHallAttempt(
      treaningRepository: get<_i54.HallTreaningRepository>()));
  gh.lazySingleton<_i73.DeleteHallTreaning>(() => _i73.DeleteHallTreaning(
      treaningRepository: get<_i54.HallTreaningRepository>()));
  gh.lazySingleton<_i74.FinishHallAttempt>(() => _i74.FinishHallAttempt(
      treaningRepository: get<_i54.HallTreaningRepository>()));
  gh.lazySingleton<_i75.FinishHallTreaning>(() => _i75.FinishHallTreaning(
      treaningRepository: get<_i54.HallTreaningRepository>()));
  gh.lazySingleton<_i76.GetAllTreanings>(() => _i76.GetAllTreanings(
        get<_i54.HallTreaningRepository>(),
        get<_i18.IceTreaningsRepository>(),
        get<_i32.StrengthTreaningsRepository>(),
        get<_i4.CardioTreaningsRepository>(),
      ));
  gh.lazySingleton<_i77.GetHallRouteAttempts>(() => _i77.GetHallRouteAttempts(
      repository: get<_i54.HallTreaningRepository>()));
  gh.factory<_i78.HallRouteAttemptsCubit>(() => _i78.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i77.GetHallRouteAttempts>()));
  gh.factory<_i79.HallTreaningsCubit>(() => _i79.HallTreaningsCubit(
        allHallTreanings: get<_i69.AllHallTreanings>(),
        deleteHallTreaning: get<_i73.DeleteHallTreaning>(),
      ));
  gh.factory<_i80.TreaningsCubit>(
      () => _i80.TreaningsCubit(get<_i76.GetAllTreanings>()));
  gh.factory<_i81.CurrentHallTreaningCubit>(() => _i81.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i62.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i63.NewHallTreaning>(),
        newHallAttempt: get<_i61.NewHallAttempt>(),
        currentHallTreaning: get<_i70.CurrentHallTreaning>(),
        finishHallAttempt: get<_i74.FinishHallAttempt>(),
        finishHallTreaning: get<_i75.FinishHallTreaning>(),
        lastHallTreaning: get<_i60.LastHallTreaning>(),
        deleteHallAttempt: get<_i72.DeleteHallAttempt>(),
      ));
  return get;
}

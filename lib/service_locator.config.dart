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
    as _i25;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i38;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i6;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i52;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i7;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i21;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i9;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i54;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i8;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i53;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i37;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i75;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i13;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i22;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i68;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i69;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i71;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i72;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i73;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i74;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i59;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i60;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i61;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i62;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i33;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i39;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i40;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i78;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i51;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i76;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i77;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i55;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i14;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i16;
import 'features/ice_climbing/data/repositories/ice_treanings_repository_impl.dart'
    as _i18;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i15;
import 'features/ice_climbing/domain/repositories/ice_treanings_repository.dart'
    as _i17;
import 'features/ice_climbing/domain/usecases/finish_ice_attempt.dart' as _i44;
import 'features/ice_climbing/domain/usecases/finish_ice_treaning.dart' as _i45;
import 'features/ice_climbing/domain/usecases/ice_sector_to_treaning.dart'
    as _i57;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i19;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i20;
import 'features/ice_climbing/domain/usecases/new_ice_attempt.dart' as _i23;
import 'features/ice_climbing/domain/usecases/new_ice_treaning.dart' as _i24;
import 'features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart'
    as _i70;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i56;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i58;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i26;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i27;
import 'features/strength_training/data/datasources/strength_treanings_datasource.dart'
    as _i30;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i29;
import 'features/strength_training/data/repositories/strength_treanings_repository_impl.dart'
    as _i32;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i28;
import 'features/strength_training/domain/repositories/strength_treanings_repository.dart'
    as _i31;
import 'features/strength_training/domain/usecases/add_repetition_for_strength_treaning.dart'
    as _i35;
import 'features/strength_training/domain/usecases/add_strength_treaning.dart'
    as _i36;
import 'features/strength_training/domain/usecases/delete_repetition_for_strength_treaning.dart'
    as _i41;
import 'features/strength_training/domain/usecases/delete_strength_exercise.dart'
    as _i42;
import 'features/strength_training/domain/usecases/delete_strength_treaning.dart'
    as _i43;
import 'features/strength_training/domain/usecases/finish_stregth_treaning.dart'
    as _i46;
import 'features/strength_training/domain/usecases/get_current_strength_treaning.dart'
    as _i47;
import 'features/strength_training/domain/usecases/get_previos_strength_treaning.dart'
    as _i48;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i49;
import 'features/strength_training/domain/usecases/get_strength_treanings.dart'
    as _i50;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i63;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i64;
import 'features/strength_training/domain/usecases/update_strength_treaning_exercises.dart'
    as _i34;
import 'features/strength_training/presentation/cubit/strength_exercises/strength_exercises_cubit.dart'
    as _i65;
import 'features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart'
    as _i66;
import 'features/strength_training/presentation/cubit/strength_trainings/strength_trainings_cubit.dart'
    as _i67; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i17.IceTreaningsRepository>(
      () => _i18.IceTreaningsRepositoryImpl());
  gh.lazySingleton<_i19.LoadDistrictsUseCase>(() => _i19.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i15.IceRegionsRepository>()));
  gh.lazySingleton<_i20.LoadSectorsUseCase>(() => _i20.LoadSectorsUseCase(
      iceRegionsRepository: get<_i15.IceRegionsRepository>()));
  gh.lazySingleton<_i21.LocalDatabase>(() => _i21.LocalDatabase());
  gh.lazySingleton<_i22.NewHallRoute>(() => _i22.NewHallRoute(
      climbingHallRepository: get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i23.NewIceAttempt>(
      () => _i23.NewIceAttempt(get<_i17.IceTreaningsRepository>()));
  gh.lazySingleton<_i24.NewIceTreaning>(() => _i24.NewIceTreaning(
        iceTreaningsRepository: get<_i17.IceTreaningsRepository>(),
        iceRegionsRepository: get<_i15.IceRegionsRepository>(),
      ));
  gh.lazySingleton<_i25.SaveCardioTreaning>(() => _i25.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i4.CardioTreaningsRepository>()));
  gh.lazySingleton<_i26.SettingsCubit>(() => _i26.SettingsCubit());
  gh.lazySingleton<_i27.StrengthExerciseDataSource>(
      () => _i27.MockStrengthExerciseDataSource());
  gh.lazySingleton<_i28.StrengthExerciseRepository>(() =>
      _i29.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i27.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i30.StrengthTreaningsDataSource>(
      () => _i30.MockStrengthTreaningsDataSource());
  gh.lazySingleton<_i31.StrengthTreaningsRepository>(() =>
      _i32.StrengthTreaningsRepositoryImpl(
          strengthTreaningsDataSource:
              get<_i30.StrengthTreaningsDataSource>()));
  gh.lazySingleton<_i33.UpdateHalls>(
      () => _i33.UpdateHalls(get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i34.UpdateStrengthTreaningExercises>(() =>
      _i34.UpdateStrengthTreaningExercises(
        strengthTreaningsRepository: get<_i31.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i28.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i35.AddRepetitionForStrengthTreaning>(() =>
      _i35.AddRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i31.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i36.AddStrengthTreaning>(() => _i36.AddStrengthTreaning(
        strengthTreaningsRepository: get<_i31.StrengthTreaningsRepository>(),
        strengthExerciseRepository: get<_i28.StrengthExerciseRepository>(),
      ));
  gh.lazySingleton<_i37.AllClimbingHalls>(
      () => _i37.AllClimbingHalls(get<_i8.ClimbingHallRepository>()));
  gh.factory<_i38.CardioTreaningsCubit>(() => _i38.CardioTreaningsCubit(
        get<_i11.GetCardioTreanings>(),
        get<_i10.DeleteCardioTreaning>(),
        get<_i25.SaveCardioTreaning>(),
      ));
  gh.factory<_i39.ClimbingHallCubit>(() => _i39.ClimbingHallCubit(
        getClimbingHallRoures: get<_i12.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i13.HallRouteToArchive>(),
      ));
  gh.factory<_i40.ClimbingHallsCubit>(() =>
      _i40.ClimbingHallsCubit(allClimbingHalls: get<_i37.AllClimbingHalls>()));
  gh.lazySingleton<_i41.DeleteRepetitionForStrengthTreaning>(() =>
      _i41.DeleteRepetitionForStrengthTreaning(
          strengthTreaningsRepository:
              get<_i31.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i42.DeleteStrengthExercise>(() =>
      _i42.DeleteStrengthExercise(
          strengthExerciseRepository: get<_i28.StrengthExerciseRepository>()));
  gh.lazySingleton<_i43.DeleteStrengthTreaning>(() =>
      _i43.DeleteStrengthTreaning(
          strengthTreaningsRepository:
              get<_i31.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i44.FinishIceAttempt>(
      () => _i44.FinishIceAttempt(get<_i17.IceTreaningsRepository>()));
  gh.lazySingleton<_i45.FinishIceTreaning>(() => _i45.FinishIceTreaning(
      iceTreaningsRepository: get<_i17.IceTreaningsRepository>()));
  gh.lazySingleton<_i46.FinishStrengthTreaning>(() =>
      _i46.FinishStrengthTreaning(
          strengthTreaningsRepository:
              get<_i31.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i47.GetCurrentStrengthTreaning>(() =>
      _i47.GetCurrentStrengthTreaning(
          strengthTreaningsRepository:
              get<_i31.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i48.GetPreviosStrengthTreaning>(() =>
      _i48.GetPreviosStrengthTreaning(
          strengthTreaningsRepository:
              get<_i31.StrengthTreaningsRepository>()));
  gh.lazySingleton<_i49.GetStrengthExercises>(() => _i49.GetStrengthExercises(
      strengthExerciseRepository: get<_i28.StrengthExerciseRepository>()));
  gh.lazySingleton<_i50.GetStrengthTreanings>(() => _i50.GetStrengthTreanings(
      strengthTreaningsRepository: get<_i31.StrengthTreaningsRepository>()));
  gh.factory<_i51.HallRouteCubit>(
      () => _i51.HallRouteCubit(get<_i22.NewHallRoute>()));
  gh.lazySingleton<_i52.HallTreaningDataSource>(() =>
      _i21.LocalHallTreaningDataSource(
          localDatabase: get<_i21.LocalDatabase>()));
  gh.lazySingleton<_i53.HallTreaningRepository>(
      () => _i54.HallTreaningRepositoryImpl(
            dataSource: get<_i52.HallTreaningDataSource>(),
            hallDataSource: get<_i6.ClimbingHallDataSource>(),
          ));
  gh.factory<_i55.HomePageCubit>(
      () => _i55.HomePageCubit(allClimbingHalls: get<_i37.AllClimbingHalls>()));
  gh.factory<_i56.IceDistrictsCubit>(() => _i56.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i19.LoadDistrictsUseCase>()));
  gh.lazySingleton<_i57.IceSectorToTreaning>(() => _i57.IceSectorToTreaning(
      iceTreaningsRepository: get<_i17.IceTreaningsRepository>()));
  gh.factory<_i58.IceSectorsCubit>(() =>
      _i58.IceSectorsCubit(loadSectorsUseCase: get<_i20.LoadSectorsUseCase>()));
  gh.lazySingleton<_i59.LastHallTreaning>(
      () => _i59.LastHallTreaning(get<_i53.HallTreaningRepository>()));
  gh.lazySingleton<_i60.NewHallAttempt>(() => _i60.NewHallAttempt(
      treaningRepository: get<_i53.HallTreaningRepository>()));
  gh.lazySingleton<_i61.NewHallAttemptFromRoute>(() =>
      _i61.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i53.HallTreaningRepository>()));
  gh.lazySingleton<_i62.NewHallTreaning>(() => _i62.NewHallTreaning(
      treaningRepository: get<_i53.HallTreaningRepository>()));
  gh.lazySingleton<_i63.SaveStrengthExercise>(() => _i63.SaveStrengthExercise(
      strengthExerciseRepository: get<_i28.StrengthExerciseRepository>()));
  gh.lazySingleton<_i64.SelectToUseStrengthExercise>(() =>
      _i64.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i28.StrengthExerciseRepository>()));
  gh.factory<_i65.StrengthExercisesCubit>(() => _i65.StrengthExercisesCubit(
        get<_i49.GetStrengthExercises>(),
        get<_i63.SaveStrengthExercise>(),
        get<_i64.SelectToUseStrengthExercise>(),
        get<_i42.DeleteStrengthExercise>(),
      ));
  gh.factory<_i66.StrengthTrainingCubit>(() => _i66.StrengthTrainingCubit(
        getCurrentStrengthTreaning: get<_i47.GetCurrentStrengthTreaning>(),
        getPreviosStrengthTreaning: get<_i48.GetPreviosStrengthTreaning>(),
        addStrengthTreaning: get<_i36.AddStrengthTreaning>(),
        updateStrengthTreaningExercises:
            get<_i34.UpdateStrengthTreaningExercises>(),
        addRepetitionForStrengthTreaning:
            get<_i35.AddRepetitionForStrengthTreaning>(),
        finishStrengthTreaning: get<_i46.FinishStrengthTreaning>(),
        deleteRepetitionForStrengthTreaning:
            get<_i41.DeleteRepetitionForStrengthTreaning>(),
      ));
  gh.factory<_i67.StrengthTrainingsCubit>(() => _i67.StrengthTrainingsCubit(
        get<_i50.GetStrengthTreanings>(),
        get<_i43.DeleteStrengthTreaning>(),
      ));
  gh.lazySingleton<_i68.AllHallTreanings>(
      () => _i68.AllHallTreanings(get<_i53.HallTreaningRepository>()));
  gh.lazySingleton<_i69.CurrentHallTreaning>(
      () => _i69.CurrentHallTreaning(get<_i53.HallTreaningRepository>()));
  gh.factory<_i70.CurrentIceTreaningCubit>(() => _i70.CurrentIceTreaningCubit(
        get<_i24.NewIceTreaning>(),
        get<_i57.IceSectorToTreaning>(),
        get<_i23.NewIceAttempt>(),
        get<_i44.FinishIceAttempt>(),
        get<_i45.FinishIceTreaning>(),
      ));
  gh.lazySingleton<_i71.DeleteHallAttempt>(() => _i71.DeleteHallAttempt(
      treaningRepository: get<_i53.HallTreaningRepository>()));
  gh.lazySingleton<_i72.DeleteHallTreaning>(() => _i72.DeleteHallTreaning(
      treaningRepository: get<_i53.HallTreaningRepository>()));
  gh.lazySingleton<_i73.FinishHallAttempt>(() => _i73.FinishHallAttempt(
      treaningRepository: get<_i53.HallTreaningRepository>()));
  gh.lazySingleton<_i74.FinishHallTreaning>(() => _i74.FinishHallTreaning(
      treaningRepository: get<_i53.HallTreaningRepository>()));
  gh.lazySingleton<_i75.GetHallRouteAttempts>(() => _i75.GetHallRouteAttempts(
      repository: get<_i53.HallTreaningRepository>()));
  gh.factory<_i76.HallRouteAttemptsCubit>(() => _i76.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i75.GetHallRouteAttempts>()));
  gh.factory<_i77.HallTreaningsCubit>(() => _i77.HallTreaningsCubit(
        allHallTreanings: get<_i68.AllHallTreanings>(),
        deleteHallTreaning: get<_i72.DeleteHallTreaning>(),
      ));
  gh.factory<_i78.CurrentHallTreaningCubit>(() => _i78.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i61.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i62.NewHallTreaning>(),
        newHallAttempt: get<_i60.NewHallAttempt>(),
        currentHallTreaning: get<_i69.CurrentHallTreaning>(),
        finishHallAttempt: get<_i73.FinishHallAttempt>(),
        finishHallTreaning: get<_i74.FinishHallTreaning>(),
        lastHallTreaning: get<_i59.LastHallTreaning>(),
        deleteHallAttempt: get<_i71.DeleteHallAttempt>(),
      ));
  return get;
}

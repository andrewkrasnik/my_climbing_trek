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
    as _i16;
import 'features/cardio_workout/presentation/cubit/cardio_treanings/cardio_treanings_cubit.dart'
    as _i22;
import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i6;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i27;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i7;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i14;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i9;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i29;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i8;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i28;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i21;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i13;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i15;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i38;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i39;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i40;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i41;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i42;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i43;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i31;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i32;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i33;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i34;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i23;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i24;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i45;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i26;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i44;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i30;
import 'features/settings/presentation/cubit/settings_cubit.dart' as _i17;
import 'features/strength_training/data/datasources/strength_exercise_datasource.dart'
    as _i18;
import 'features/strength_training/data/repositories/strength_exercises_repository_impl.dart'
    as _i20;
import 'features/strength_training/domain/repositories/strength_exercises_repository.dart'
    as _i19;
import 'features/strength_training/domain/usecases/get_strength_exercises.dart'
    as _i25;
import 'features/strength_training/domain/usecases/save_strength_exercise.dart'
    as _i35;
import 'features/strength_training/domain/usecases/select_to_use_strength_exercise.dart'
    as _i36;
import 'features/strength_training/presentation/cubit/strength_exercise/strength_exercises_cubit.dart'
    as _i37; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i14.LocalDatabase>(() => _i14.LocalDatabase());
  gh.lazySingleton<_i15.NewHallRoute>(() => _i15.NewHallRoute(
      climbingHallRepository: get<_i8.ClimbingHallRepository>()));
  gh.lazySingleton<_i16.SaveCardioTreaning>(() => _i16.SaveCardioTreaning(
      cardioTreaningsRepository: get<_i4.CardioTreaningsRepository>()));
  gh.lazySingleton<_i17.SettingsCubit>(() => _i17.SettingsCubit());
  gh.lazySingleton<_i18.StrengthExerciseDataSource>(
      () => _i18.MockStrengthExerciseDataSource());
  gh.lazySingleton<_i19.StrengthExerciseRepository>(() =>
      _i20.StrengthExerciseRepositoryImpl(
          strengthExerciseDataSource: get<_i18.StrengthExerciseDataSource>()));
  gh.lazySingleton<_i21.AllClimbingHalls>(
      () => _i21.AllClimbingHalls(get<_i8.ClimbingHallRepository>()));
  gh.factory<_i22.CardioTreaningsCubit>(() => _i22.CardioTreaningsCubit(
        get<_i11.GetCardioTreanings>(),
        get<_i10.DeleteCardioTreaning>(),
        get<_i16.SaveCardioTreaning>(),
      ));
  gh.factory<_i23.ClimbingHallCubit>(() => _i23.ClimbingHallCubit(
        getClimbingHallRoures: get<_i12.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i13.HallRouteToArchive>(),
      ));
  gh.factory<_i24.ClimbingHallsCubit>(() =>
      _i24.ClimbingHallsCubit(allClimbingHalls: get<_i21.AllClimbingHalls>()));
  gh.lazySingleton<_i25.GetStrengthExercises>(() => _i25.GetStrengthExercises(
      strengthExerciseRepository: get<_i19.StrengthExerciseRepository>()));
  gh.factory<_i26.HallRouteCubit>(
      () => _i26.HallRouteCubit(get<_i15.NewHallRoute>()));
  gh.lazySingleton<_i27.HallTreaningDataSource>(() =>
      _i14.LocalHallTreaningDataSource(
          localDatabase: get<_i14.LocalDatabase>()));
  gh.lazySingleton<_i28.HallTreaningRepository>(
      () => _i29.HallTreaningRepositoryImpl(
            dataSource: get<_i27.HallTreaningDataSource>(),
            hallDataSource: get<_i6.ClimbingHallDataSource>(),
          ));
  gh.factory<_i30.HomePageCubit>(
      () => _i30.HomePageCubit(allClimbingHalls: get<_i21.AllClimbingHalls>()));
  gh.lazySingleton<_i31.LastHallTreaning>(
      () => _i31.LastHallTreaning(get<_i28.HallTreaningRepository>()));
  gh.lazySingleton<_i32.NewHallAttempt>(() => _i32.NewHallAttempt(
      treaningRepository: get<_i28.HallTreaningRepository>()));
  gh.lazySingleton<_i33.NewHallAttemptFromRoute>(() =>
      _i33.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i28.HallTreaningRepository>()));
  gh.lazySingleton<_i34.NewHallTreaning>(() => _i34.NewHallTreaning(
      treaningRepository: get<_i28.HallTreaningRepository>()));
  gh.lazySingleton<_i35.SaveStrengthExercise>(() => _i35.SaveStrengthExercise(
      strengthExerciseRepository: get<_i19.StrengthExerciseRepository>()));
  gh.lazySingleton<_i36.SelectToUseStrengthExercise>(() =>
      _i36.SelectToUseStrengthExercise(
          strengthExerciseRepository: get<_i19.StrengthExerciseRepository>()));
  gh.factory<_i37.StrengthExercisesCubit>(() => _i37.StrengthExercisesCubit(
        get<_i25.GetStrengthExercises>(),
        get<_i35.SaveStrengthExercise>(),
        get<_i36.SelectToUseStrengthExercise>(),
      ));
  gh.lazySingleton<_i38.AllHallTreanings>(
      () => _i38.AllHallTreanings(get<_i28.HallTreaningRepository>()));
  gh.lazySingleton<_i39.CurrentHallTreaning>(
      () => _i39.CurrentHallTreaning(get<_i28.HallTreaningRepository>()));
  gh.lazySingleton<_i40.DeleteHallAttempt>(() => _i40.DeleteHallAttempt(
      treaningRepository: get<_i28.HallTreaningRepository>()));
  gh.lazySingleton<_i41.DeleteHallTreaning>(() => _i41.DeleteHallTreaning(
      treaningRepository: get<_i28.HallTreaningRepository>()));
  gh.lazySingleton<_i42.FinishHallAttempt>(() => _i42.FinishHallAttempt(
      treaningRepository: get<_i28.HallTreaningRepository>()));
  gh.lazySingleton<_i43.FinishHallTreaning>(() => _i43.FinishHallTreaning(
      treaningRepository: get<_i28.HallTreaningRepository>()));
  gh.factory<_i44.HallTreaningsCubit>(() => _i44.HallTreaningsCubit(
        allHallTreanings: get<_i38.AllHallTreanings>(),
        deleteHallTreaning: get<_i41.DeleteHallTreaning>(),
      ));
  gh.factory<_i45.CurrentHallTreaningCubit>(() => _i45.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i33.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i34.NewHallTreaning>(),
        newHallAttempt: get<_i32.NewHallAttempt>(),
        currentHallTreaning: get<_i39.CurrentHallTreaning>(),
        finishHallAttempt: get<_i42.FinishHallAttempt>(),
        finishHallTreaning: get<_i43.FinishHallTreaning>(),
        lastHallTreaning: get<_i31.LastHallTreaning>(),
        deleteHallAttempt: get<_i40.DeleteHallAttempt>(),
      ));
  return get;
}

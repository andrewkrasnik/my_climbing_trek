// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/hall_treaning_data_source.dart'
    as _i17;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i9;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i6;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i19;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i5;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i18;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i13;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i7;
import 'features/hall_climbing/domain/usecases/get_hall_route_attempts.dart'
    as _i31;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i8;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i10;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i25;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i26;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i27;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i28;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i29;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i30;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i21;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i22;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i23;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i24;
import 'features/hall_climbing/domain/usecases/update_halls.dart' as _i12;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i14;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i15;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i34;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i16;
import 'features/hall_climbing/presentation/bloc/hall_route_attempts/hall_route_attempts_cubit.dart'
    as _i32;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i33;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i20;
import 'features/settings/presentation/cubit/settings_cubit.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i7.GetClimbingHallRoures>(
      () => _i7.GetClimbingHallRoures(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i8.HallRouteToArchive>(() =>
      _i8.HallRouteToArchive(repository: get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i9.LocalDatabase>(() => _i9.LocalDatabase());
  gh.lazySingleton<_i10.NewHallRoute>(() => _i10.NewHallRoute(
      climbingHallRepository: get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i11.SettingsCubit>(() => _i11.SettingsCubit());
  gh.lazySingleton<_i12.UpdateHalls>(
      () => _i12.UpdateHalls(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i13.AllClimbingHalls>(
      () => _i13.AllClimbingHalls(get<_i5.ClimbingHallRepository>()));
  gh.factory<_i14.ClimbingHallCubit>(() => _i14.ClimbingHallCubit(
        getClimbingHallRoures: get<_i7.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i8.HallRouteToArchive>(),
      ));
  gh.factory<_i15.ClimbingHallsCubit>(() =>
      _i15.ClimbingHallsCubit(allClimbingHalls: get<_i13.AllClimbingHalls>()));
  gh.factory<_i16.HallRouteCubit>(
      () => _i16.HallRouteCubit(get<_i10.NewHallRoute>()));
  gh.lazySingleton<_i17.HallTreaningDataSource>(() =>
      _i9.LocalHallTreaningDataSource(localDatabase: get<_i9.LocalDatabase>()));
  gh.lazySingleton<_i18.HallTreaningRepository>(
      () => _i19.HallTreaningRepositoryImpl(
            dataSource: get<_i17.HallTreaningDataSource>(),
            hallDataSource: get<_i3.ClimbingHallDataSource>(),
          ));
  gh.factory<_i20.HomePageCubit>(
      () => _i20.HomePageCubit(allClimbingHalls: get<_i13.AllClimbingHalls>()));
  gh.lazySingleton<_i21.LastHallTreaning>(
      () => _i21.LastHallTreaning(get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i22.NewHallAttempt>(() => _i22.NewHallAttempt(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i23.NewHallAttemptFromRoute>(() =>
      _i23.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i24.NewHallTreaning>(() => _i24.NewHallTreaning(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i25.AllHallTreanings>(
      () => _i25.AllHallTreanings(get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i26.CurrentHallTreaning>(
      () => _i26.CurrentHallTreaning(get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i27.DeleteHallAttempt>(() => _i27.DeleteHallAttempt(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i28.DeleteHallTreaning>(() => _i28.DeleteHallTreaning(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i29.FinishHallAttempt>(() => _i29.FinishHallAttempt(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i30.FinishHallTreaning>(() => _i30.FinishHallTreaning(
      treaningRepository: get<_i18.HallTreaningRepository>()));
  gh.lazySingleton<_i31.GetHallRouteAttempts>(() => _i31.GetHallRouteAttempts(
      repository: get<_i18.HallTreaningRepository>()));
  gh.factory<_i32.HallRouteAttemptsCubit>(() => _i32.HallRouteAttemptsCubit(
      getHallRouteAttempts: get<_i31.GetHallRouteAttempts>()));
  gh.factory<_i33.HallTreaningsCubit>(() => _i33.HallTreaningsCubit(
        allHallTreanings: get<_i25.AllHallTreanings>(),
        deleteHallTreaning: get<_i28.DeleteHallTreaning>(),
      ));
  gh.factory<_i34.CurrentHallTreaningCubit>(() => _i34.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i23.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i24.NewHallTreaning>(),
        newHallAttempt: get<_i22.NewHallAttempt>(),
        currentHallTreaning: get<_i26.CurrentHallTreaning>(),
        finishHallAttempt: get<_i29.FinishHallAttempt>(),
        finishHallTreaning: get<_i30.FinishHallTreaning>(),
        lastHallTreaning: get<_i21.LastHallTreaning>(),
        deleteHallAttempt: get<_i27.DeleteHallAttempt>(),
      ));
  return get;
}

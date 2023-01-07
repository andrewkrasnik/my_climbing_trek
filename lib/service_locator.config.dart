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
    as _i16;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i9;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i6;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i18;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i5;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i17;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i12;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i7;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i8;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i10;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i24;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i25;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i26;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i27;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i28;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i29;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i20;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i21;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i22;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i23;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i13;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i14;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i31;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i15;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i30;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i19;
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
  gh.lazySingleton<_i12.AllClimbingHalls>(
      () => _i12.AllClimbingHalls(get<_i5.ClimbingHallRepository>()));
  gh.factory<_i13.ClimbingHallCubit>(() => _i13.ClimbingHallCubit(
        getClimbingHallRoures: get<_i7.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i8.HallRouteToArchive>(),
      ));
  gh.factory<_i14.ClimbingHallsCubit>(() =>
      _i14.ClimbingHallsCubit(allClimbingHalls: get<_i12.AllClimbingHalls>()));
  gh.factory<_i15.HallRouteCubit>(
      () => _i15.HallRouteCubit(get<_i10.NewHallRoute>()));
  gh.lazySingleton<_i16.HallTreaningDataSource>(() =>
      _i9.LocalHallTreaningDataSource(localDatabase: get<_i9.LocalDatabase>()));
  gh.lazySingleton<_i17.HallTreaningRepository>(
      () => _i18.HallTreaningRepositoryImpl(
            dataSource: get<_i16.HallTreaningDataSource>(),
            hallDataSource: get<_i3.ClimbingHallDataSource>(),
          ));
  gh.factory<_i19.HomePageCubit>(
      () => _i19.HomePageCubit(allClimbingHalls: get<_i12.AllClimbingHalls>()));
  gh.lazySingleton<_i20.LastHallTreaning>(
      () => _i20.LastHallTreaning(get<_i17.HallTreaningRepository>()));
  gh.lazySingleton<_i21.NewHallAttempt>(() => _i21.NewHallAttempt(
      treaningRepository: get<_i17.HallTreaningRepository>()));
  gh.lazySingleton<_i22.NewHallAttemptFromRoute>(() =>
      _i22.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i17.HallTreaningRepository>()));
  gh.lazySingleton<_i23.NewHallTreaning>(() => _i23.NewHallTreaning(
      treaningRepository: get<_i17.HallTreaningRepository>()));
  gh.lazySingleton<_i24.AllHallTreanings>(
      () => _i24.AllHallTreanings(get<_i17.HallTreaningRepository>()));
  gh.lazySingleton<_i25.CurrentHallTreaning>(
      () => _i25.CurrentHallTreaning(get<_i17.HallTreaningRepository>()));
  gh.lazySingleton<_i26.DeleteHallAttempt>(() => _i26.DeleteHallAttempt(
      treaningRepository: get<_i17.HallTreaningRepository>()));
  gh.lazySingleton<_i27.DeleteHallTreaning>(() => _i27.DeleteHallTreaning(
      treaningRepository: get<_i17.HallTreaningRepository>()));
  gh.lazySingleton<_i28.FinishHallAttempt>(() => _i28.FinishHallAttempt(
      treaningRepository: get<_i17.HallTreaningRepository>()));
  gh.lazySingleton<_i29.FinishHallTreaning>(() => _i29.FinishHallTreaning(
      treaningRepository: get<_i17.HallTreaningRepository>()));
  gh.factory<_i30.HallTreaningsCubit>(() => _i30.HallTreaningsCubit(
        allHallTreanings: get<_i24.AllHallTreanings>(),
        deleteHallTreaning: get<_i27.DeleteHallTreaning>(),
      ));
  gh.factory<_i31.CurrentHallTreaningCubit>(() => _i31.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i22.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i23.NewHallTreaning>(),
        newHallAttempt: get<_i21.NewHallAttempt>(),
        currentHallTreaning: get<_i25.CurrentHallTreaning>(),
        finishHallAttempt: get<_i28.FinishHallAttempt>(),
        finishHallTreaning: get<_i29.FinishHallTreaning>(),
        lastHallTreaning: get<_i20.LastHallTreaning>(),
        deleteHallAttempt: get<_i26.DeleteHallAttempt>(),
      ));
  return get;
}

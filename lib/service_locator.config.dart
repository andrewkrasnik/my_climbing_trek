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
    as _i8;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/mock_hall_treaning_data_source.dart'
    as _i9;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i6;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i11;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i5;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i10;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i16;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i7;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i14;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i17;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i21;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i12;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i13;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i15;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i18;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i19;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i20;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i22;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i23;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i24; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i8.HallTreaningDataSource>(
      () => _i9.MockHallTreaningDataSource());
  gh.lazySingleton<_i10.HallTreaningRepository>(() =>
      _i11.HallTreaningRepositoryImpl(
          dataSource: get<_i8.HallTreaningDataSource>()));
  gh.lazySingleton<_i12.NewHallAttempt>(() => _i12.NewHallAttempt(
      treaningRepository: get<_i10.HallTreaningRepository>()));
  gh.lazySingleton<_i13.NewHallAttemptFromRoute>(() =>
      _i13.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i10.HallTreaningRepository>()));
  gh.lazySingleton<_i14.NewHallRoute>(() => _i14.NewHallRoute(
      climbingHallRepository: get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i15.NewHallTreaning>(() => _i15.NewHallTreaning(
      treaningRepository: get<_i10.HallTreaningRepository>()));
  gh.lazySingleton<_i16.AllClimbingHalls>(
      () => _i16.AllClimbingHalls(get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i17.AllHallTreanings>(
      () => _i17.AllHallTreanings(get<_i10.HallTreaningRepository>()));
  gh.factory<_i18.ClimbingHallCubit>(() => _i18.ClimbingHallCubit(
      getClimbingHallRoures: get<_i7.GetClimbingHallRoures>()));
  gh.factory<_i19.ClimbingHallsCubit>(() =>
      _i19.ClimbingHallsCubit(allClimbingHalls: get<_i16.AllClimbingHalls>()));
  gh.factory<_i20.CurrentHallTreaningCubit>(() => _i20.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i13.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i15.NewHallTreaning>(),
        newHallAttempt: get<_i12.NewHallAttempt>(),
      ));
  gh.lazySingleton<_i21.FinishHallAttempt>(() => _i21.FinishHallAttempt(
      treaningRepository: get<_i10.HallTreaningRepository>()));
  gh.factory<_i22.HallRouteCubit>(
      () => _i22.HallRouteCubit(get<_i14.NewHallRoute>()));
  gh.factory<_i23.HallTreaningsCubit>(() =>
      _i23.HallTreaningsCubit(allHallTreanings: get<_i17.AllHallTreanings>()));
  gh.factory<_i24.HomePageCubit>(
      () => _i24.HomePageCubit(allClimbingHalls: get<_i16.AllClimbingHalls>()));
  return get;
}

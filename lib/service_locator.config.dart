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
    as _i21;
import 'features/hall_climbing/data/datasources/local_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/datasources/local_hall_treaning_data_source.dart'
    as _i14;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i6;
import 'features/hall_climbing/data/repositories/hall_treaning_repository_impl.dart'
    as _i23;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i5;
import 'features/hall_climbing/domain/repositories/hall_treaning_repository.dart'
    as _i22;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i17;
import 'features/hall_climbing/domain/usecases/get_climbing_hall_routes.dart'
    as _i7;
import 'features/hall_climbing/domain/usecases/hall_route_to_archive.dart'
    as _i8;
import 'features/hall_climbing/domain/usecases/new_hall_route.dart' as _i15;
import 'features/hall_climbing/domain/usecases/treanings/all_hall_treanings.dart'
    as _i31;
import 'features/hall_climbing/domain/usecases/treanings/current_hall_treaning.dart'
    as _i32;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_attempt.dart'
    as _i33;
import 'features/hall_climbing/domain/usecases/treanings/delete_hall_treaning.dart'
    as _i34;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_attempt.dart'
    as _i35;
import 'features/hall_climbing/domain/usecases/treanings/finish_hall_treaning.dart'
    as _i36;
import 'features/hall_climbing/domain/usecases/treanings/last_hall_treaning.dart'
    as _i27;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt.dart'
    as _i28;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_attempt_from_route.dart'
    as _i29;
import 'features/hall_climbing/domain/usecases/treanings/new_hall_treaning.dart'
    as _i30;
import 'features/hall_climbing/presentation/bloc/climbing_hall/climbing_hall_cubit.dart'
    as _i18;
import 'features/hall_climbing/presentation/bloc/climbing_halls/climbing_halls_cubit.dart'
    as _i19;
import 'features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart'
    as _i38;
import 'features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart'
    as _i20;
import 'features/hall_climbing/presentation/bloc/hall_treanings/hall_treanings_cubit.dart'
    as _i37;
import 'features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart'
    as _i24;
import 'features/ice_climbing/data/datasources/ice_regions_datasource.dart'
    as _i9;
import 'features/ice_climbing/data/repositories/ice_regions_repository_impl.dart'
    as _i11;
import 'features/ice_climbing/domain/repositories/ice_regions_repository.dart'
    as _i10;
import 'features/ice_climbing/domain/usecases/load_disrtricts_usecase.dart'
    as _i12;
import 'features/ice_climbing/domain/usecases/load_sectors_usecase.dart'
    as _i13;
import 'features/ice_climbing/presentation/bloc/ice_districts/ice_districts_cubit.dart'
    as _i25;
import 'features/ice_climbing/presentation/bloc/ice_sectors/ice_sectors_cubit.dart'
    as _i26;
import 'features/settings/presentation/cubit/settings_cubit.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.IceRegionsDataSource>(
      () => _i9.MockIceRegionsDataSource());
  gh.lazySingleton<_i10.IceRegionsRepository>(() =>
      _i11.IceRegionsRepositoryImpl(
          iceRegionsDataSource: get<_i9.IceRegionsDataSource>()));
  gh.lazySingleton<_i12.LoadDistrictsUseCase>(() => _i12.LoadDistrictsUseCase(
      iceRegionsRepository: get<_i10.IceRegionsRepository>()));
  gh.lazySingleton<_i13.LoadSectorsUseCase>(() => _i13.LoadSectorsUseCase(
      iceRegionsRepository: get<_i10.IceRegionsRepository>()));
  gh.lazySingleton<_i14.LocalDatabase>(() => _i14.LocalDatabase());
  gh.lazySingleton<_i15.NewHallRoute>(() => _i15.NewHallRoute(
      climbingHallRepository: get<_i5.ClimbingHallRepository>()));
  gh.lazySingleton<_i16.SettingsCubit>(() => _i16.SettingsCubit());
  gh.lazySingleton<_i17.AllClimbingHalls>(
      () => _i17.AllClimbingHalls(get<_i5.ClimbingHallRepository>()));
  gh.factory<_i18.ClimbingHallCubit>(() => _i18.ClimbingHallCubit(
        getClimbingHallRoures: get<_i7.GetClimbingHallRoures>(),
        hallRouteToArchive: get<_i8.HallRouteToArchive>(),
      ));
  gh.factory<_i19.ClimbingHallsCubit>(() =>
      _i19.ClimbingHallsCubit(allClimbingHalls: get<_i17.AllClimbingHalls>()));
  gh.factory<_i20.HallRouteCubit>(
      () => _i20.HallRouteCubit(get<_i15.NewHallRoute>()));
  gh.lazySingleton<_i21.HallTreaningDataSource>(() =>
      _i14.LocalHallTreaningDataSource(
          localDatabase: get<_i14.LocalDatabase>()));
  gh.lazySingleton<_i22.HallTreaningRepository>(
      () => _i23.HallTreaningRepositoryImpl(
            dataSource: get<_i21.HallTreaningDataSource>(),
            hallDataSource: get<_i3.ClimbingHallDataSource>(),
          ));
  gh.factory<_i24.HomePageCubit>(
      () => _i24.HomePageCubit(allClimbingHalls: get<_i17.AllClimbingHalls>()));
  gh.factory<_i25.IceDistrictsCubit>(() => _i25.IceDistrictsCubit(
      loadDistrictsUseCase: get<_i12.LoadDistrictsUseCase>()));
  gh.factory<_i26.IceSectorsCubit>(() =>
      _i26.IceSectorsCubit(loadSectorsUseCase: get<_i13.LoadSectorsUseCase>()));
  gh.lazySingleton<_i27.LastHallTreaning>(
      () => _i27.LastHallTreaning(get<_i22.HallTreaningRepository>()));
  gh.lazySingleton<_i28.NewHallAttempt>(() => _i28.NewHallAttempt(
      treaningRepository: get<_i22.HallTreaningRepository>()));
  gh.lazySingleton<_i29.NewHallAttemptFromRoute>(() =>
      _i29.NewHallAttemptFromRoute(
          hallTreaningRepository: get<_i22.HallTreaningRepository>()));
  gh.lazySingleton<_i30.NewHallTreaning>(() => _i30.NewHallTreaning(
      treaningRepository: get<_i22.HallTreaningRepository>()));
  gh.lazySingleton<_i31.AllHallTreanings>(
      () => _i31.AllHallTreanings(get<_i22.HallTreaningRepository>()));
  gh.lazySingleton<_i32.CurrentHallTreaning>(
      () => _i32.CurrentHallTreaning(get<_i22.HallTreaningRepository>()));
  gh.lazySingleton<_i33.DeleteHallAttempt>(() => _i33.DeleteHallAttempt(
      treaningRepository: get<_i22.HallTreaningRepository>()));
  gh.lazySingleton<_i34.DeleteHallTreaning>(() => _i34.DeleteHallTreaning(
      treaningRepository: get<_i22.HallTreaningRepository>()));
  gh.lazySingleton<_i35.FinishHallAttempt>(() => _i35.FinishHallAttempt(
      treaningRepository: get<_i22.HallTreaningRepository>()));
  gh.lazySingleton<_i36.FinishHallTreaning>(() => _i36.FinishHallTreaning(
      treaningRepository: get<_i22.HallTreaningRepository>()));
  gh.factory<_i37.HallTreaningsCubit>(() => _i37.HallTreaningsCubit(
        allHallTreanings: get<_i31.AllHallTreanings>(),
        deleteHallTreaning: get<_i34.DeleteHallTreaning>(),
      ));
  gh.factory<_i38.CurrentHallTreaningCubit>(() => _i38.CurrentHallTreaningCubit(
        newHallAttemptFromRoute: get<_i29.NewHallAttemptFromRoute>(),
        newHallTreaning: get<_i30.NewHallTreaning>(),
        newHallAttempt: get<_i28.NewHallAttempt>(),
        currentHallTreaning: get<_i32.CurrentHallTreaning>(),
        finishHallAttempt: get<_i35.FinishHallAttempt>(),
        finishHallTreaning: get<_i36.FinishHallTreaning>(),
        lastHallTreaning: get<_i27.LastHallTreaning>(),
        deleteHallAttempt: get<_i33.DeleteHallAttempt>(),
      ));
  return get;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/hall_climbing/data/datasources/climbing_hall_data_source.dart'
    as _i3;
import 'features/hall_climbing/data/datasources/mock_climbing_hall_data_source.dart'
    as _i4;
import 'features/hall_climbing/data/repositories/climbing_hall_repository_impl.dart'
    as _i6;
import 'features/hall_climbing/domain/repositories/climbing_hall_repository.dart'
    as _i5;
import 'features/hall_climbing/domain/usecases/all_climbing_halls.dart' as _i7;
import 'features/hall_climbing/presentation/bloc/cubit/home_page_cubit.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

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
      () => _i4.MockClimbingHallDataSource());
  gh.lazySingleton<_i5.ClimbingHallRepository>(() =>
      _i6.ClimbingHallRepositoryImpl(
          climbingHallDataSource: get<_i3.ClimbingHallDataSource>()));
  gh.lazySingleton<_i7.AllClimbingHalls>(
      () => _i7.AllClimbingHalls(get<_i5.ClimbingHallRepository>()));
  gh.factory<_i8.HomePageCubit>(
      () => _i8.HomePageCubit(allClimbingHalls: get<_i7.AllClimbingHalls>()));
  return get;
}

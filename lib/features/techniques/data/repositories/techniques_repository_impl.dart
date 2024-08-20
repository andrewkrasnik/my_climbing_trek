import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/datasource/image_cash_manager.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';
import 'package:my_climbing_trek/core/services/network/network_info.dart';
import 'package:my_climbing_trek/features/techniques/data/datasources/techniques_local_datasource.dart';
import 'package:my_climbing_trek/features/techniques/data/datasources/techniques_remote_datasource.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique.dart';
import 'package:my_climbing_trek/features/techniques/domain/entities/technique_group.dart';
import 'package:my_climbing_trek/features/techniques/domain/repositories/techniques_repository.dart';

@LazySingleton(as: TechniquesRepository)
class TechniquesRepositoryImpl implements TechniquesRepository {
  final TechniquesRemoteDataSource _techniquesRemoteDataSource;
  final TechniquesLocalDataSource _techniquesLocalDataSource;
  final ImageCashManager _imageCashManager;
  final NetworkInfo _networkInfo;

  TechniquesRepositoryImpl(
    this._techniquesRemoteDataSource,
    this._techniquesLocalDataSource,
    this._imageCashManager,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, List<TechniqueGroup>>> groups() async {
    final failureOrLocalGroups = await _techniquesLocalDataSource.groups();

    return failureOrLocalGroups.fold(
      (failure) => Left(failure),
      (localGroups) async {
        if (await _networkInfo.isConnected) {
          final failureOrRemoteRegions =
              await _techniquesRemoteDataSource.groups();

          return failureOrRemoteRegions.fold(
            (failure) => Left(failure),
            (remoteGroups) {
              remoteGroups
                  .removeWhere((element) => localGroups.contains(element));

              final regions = [...localGroups, ...remoteGroups];

              return Right(regions);
            },
          );
        } else {
          return Right(localGroups);
        }
      },
    );
  }

  @override
  Future<Either<Failure, List<Technique>>> techniques(
      {required TechniqueGroup group}) async {
    if (group.localData) {
      return await _techniquesLocalDataSource.techniques(group: group);
    } else {
      return await _techniquesRemoteDataSource.techniques(group: group);
    }
  }

  @override
  Future<Either<Failure, bool>> getEditing() async {
    return await _techniquesRemoteDataSource.getEditing();
  }

  @override
  Future<Either<Failure, Unit>> delete({
    required Technique technique,
    required TechniqueGroup group,
  }) async {
    return await _techniquesRemoteDataSource.delete(
      technique: technique,
      group: group,
    );
  }

  @override
  Future<Either<Failure, Unit>> save({
    required Technique technique,
    required TechniqueGroup group,
  }) async {
    return await _techniquesRemoteDataSource.save(
      technique: technique,
      group: group,
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteGroup(
      {required TechniqueGroup group}) async {
    return await _techniquesRemoteDataSource.deleteGroup(group: group);
  }

  @override
  Future<Either<Failure, Unit>> saveGroup(
      {required TechniqueGroup group}) async {
    return await _techniquesRemoteDataSource.saveGroup(group: group);
  }

  @override
  Future<Either<Failure, Unit>> addMyGroup(
      {required TechniqueGroup group}) async {
    final List<String> images = [group.image];

    final failureOrUnit =
        await _techniquesLocalDataSource.saveGroup(group: group);

    return failureOrUnit.fold(
      (failure) => Left(failure),
      (_) async {
        final failureOrTechniques =
            await _techniquesRemoteDataSource.techniques(group: group);

        return failureOrTechniques.fold(
          (failure) => Left(failure),
          (techniques) async {
            final failureOrSaveTechniques = await _techniquesLocalDataSource
                .saveTechniques(group: group, techniques: techniques);

            return failureOrSaveTechniques.fold(
              (failure) => Left(failure),
              (_) async {
                for (final technique in techniques) {
                  if (technique.image != null) {
                    images.add(technique.image!);
                  }
                }

                _imageCashManager.saveImages(
                    cacheKey: group.cacheKey, images: images);

                return const Right(unit);
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> deleteMyGroup(
      {required TechniqueGroup group}) async {
    await _imageCashManager.clear(cacheKey: group.cacheKey);

    return _techniquesLocalDataSource.deleteGroup(group: group);
  }

  @override
  Future<Either<Failure, List<TechniqueGroup>>> myGroups() async {
    final failureOrLocalRegions = await _techniquesLocalDataSource.groups();

    return failureOrLocalRegions.fold(
      (failure) => Left(failure),
      (regions) async {
        if (regions.isEmpty) {
          return await _techniquesRemoteDataSource.groups(limit: 5);
        } else {
          return Right(regions);
        }
      },
    );
  }
}

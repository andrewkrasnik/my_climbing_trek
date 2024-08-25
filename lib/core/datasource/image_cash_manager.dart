import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/failures/failure.dart';

abstract class ImageCashManager {
  Future<Either<Failure, Unit>> saveImages({
    required String cacheKey,
    required List<String> images,
  });

  Future<Either<Failure, Unit>> clear({
    required String cacheKey,
  });
}

@LazySingleton(as: ImageCashManager)
class ImageCashManagerImpl implements ImageCashManager {
  final DefaultCacheManager cacheManager;

  ImageCashManagerImpl({required this.cacheManager});

  @override
  Future<Either<Failure, Unit>> saveImages({
    required String cacheKey,
    required List<String> images,
  }) async {
    final manager = CacheManager(Config(cacheKey));

    for (final image in images) {
      try {
        await manager.downloadFile(image);
      } catch (error) {
        log(error.toString());
      }
    }

    return const Right(unit);
  }

  @override
  Future<Either<Failure, Unit>> clear({required String cacheKey}) async {
    final manager = CacheManager(Config(cacheKey));

    await manager.emptyCache();

    return const Right(unit);
  }
}

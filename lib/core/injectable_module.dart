import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class InjectableModule {
  @LazySingleton()
  Future<FirebaseCrashlytics> get firebaseCrashlytics async {
    await Firebase.initializeApp();

    return FirebaseCrashlytics.instance;
  }

  @LazySingleton()
  Future<FirebaseAnalytics> get firebaseAnalytics async {
    await Firebase.initializeApp();

    return FirebaseAnalytics.instance;
  }

  @LazySingleton()
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @LazySingleton()
  HiveInterface get hiveInterface => Hive;

  @LazySingleton()
  DefaultCacheManager get cacheManager => DefaultCacheManager();

  @LazySingleton()
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @LazySingleton()
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker.createInstance(
        checkInterval: const Duration(milliseconds: 100),
        checkTimeout: const Duration(milliseconds: 500),
      );
}

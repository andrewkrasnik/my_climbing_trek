import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @LazySingleton()
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker.createInstance(
        checkInterval: const Duration(seconds: 2),
        checkTimeout: const Duration(seconds: 2),
      );
}

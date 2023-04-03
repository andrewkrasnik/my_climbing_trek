import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
}

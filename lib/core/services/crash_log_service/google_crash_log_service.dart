import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/services/crash_log_service/crash_log_service.dart';

@LazySingleton(as: CrashLogService)
class GoogleCrashLogService implements CrashLogService {
  final FirebaseCrashlytics _firebaseCrashlytics;

  GoogleCrashLogService(this._firebaseCrashlytics);
  @override
  Future<void> init() async {
    await Firebase.initializeApp();
    // if (!kDebugMode) {

    FlutterError.onError = _firebaseCrashlytics.recordFlutterError;
    _firebaseCrashlytics.setCrashlyticsCollectionEnabled(true);

    // }
  }

  @override
  void recordError(Object error, StackTrace? stack) {
    // if (!kDebugMode) {
    _firebaseCrashlytics.recordError(error, stack);
    // } else {
    //   log("Error: $error");
    // }
  }

  @override
  void log(String message) {
    // if (!kDebugMode)
    _firebaseCrashlytics.log(message);
  }

  @override
  void recordLogMessage(String message, String userIdentifier) {
    try {
      throw Exception(message);
    } catch (e, stack) {
      _firebaseCrashlytics.setUserIdentifier(userIdentifier);
      _firebaseCrashlytics.recordError(
        e,
        stack,
        reason: userIdentifier,
      );
    }
  }

  @override
  void test() {
    _firebaseCrashlytics.crash();
  }
}

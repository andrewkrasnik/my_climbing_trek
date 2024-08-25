import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:injectable/injectable.dart';
import 'package:my_climbing_trek/core/services/analitics/analitics_service.dart';

@LazySingleton(as: AnaliticsService)
class FirebaseAnaliticsService implements AnaliticsService {
  final FirebaseAnalytics _analytics;
  FirebaseAnaliticsService(
    this._analytics,
  );

  @override
  void logEvent({required String name, Map<String, Object>? parameters}) {
    _analytics.logEvent(name: name, parameters: parameters);
  }

  @override
  void logPageView({required String name}) {
    _analytics.logScreenView(screenName: name);
  }

  @override
  Future<void> init() async {
    //   await Firebase.initializeApp();
  }
}

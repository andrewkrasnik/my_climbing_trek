import 'dart:developer';
import 'package:my_climbing_trek/core/services/analitics/analitics_service.dart';

class MockAnaliticsService implements AnaliticsService {
  @override
  void logEvent({required String name, Map<String, Object?>? parameters}) {
    log('MockAnaliticsService event: $name');
  }

  @override
  void logPageView({required String name}) {
    log('MockAnaliticsService page view: $name');
  }

  @override
  Future<void> init() async {
    log('MockAnaliticsService: init');
  }
}

import 'dart:developer' as developer;
import 'package:my_climbing_trek/core/services/crash_log_service/crash_log_service.dart';

class MockCrashLogService implements CrashLogService {
  @override
  Future<void> init() async {
    log('Mock Crash Log Service initialization');
  }

  @override
  void log(String message) {
    developer.log(message);
  }

  @override
  void recordError(Object error, StackTrace? stack) {
    log('Mock Crash Log Service Error: ${error.toString()}');
  }

  @override
  void recordLogMessage(String message, String userIdentifier) {
    log('Mock Crash Log Service Error: $message');
  }

  @override
  void test() {
    log('Mock Crash Log Service Error: test error');
  }
}

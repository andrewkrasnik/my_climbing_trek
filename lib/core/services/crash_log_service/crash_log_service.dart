abstract class CrashLogService {
  Future<void> init();

  void recordError(Object error, StackTrace? stack);

  void log(String message);

  void recordLogMessage(String message, String userIdentifier);

  void test();
}

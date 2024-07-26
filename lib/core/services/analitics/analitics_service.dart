abstract class AnaliticsService {
  Future<void> init();

  void logEvent({
    required String name,
    Map<String, Object>? parameters,
  });

  void logPageView({required String name});
}

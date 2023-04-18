enum RouteStatus {
  done,
  progect,
  noAttempts,
}

extension RouteStatusExtension on RouteStatus {
  String get name {
    switch (this) {
      case RouteStatus.done:
        return 'Пролез';
      case RouteStatus.noAttempts:
        return 'Нет попыток';
      case RouteStatus.progect:
        return 'Проект';
    }
  }
}

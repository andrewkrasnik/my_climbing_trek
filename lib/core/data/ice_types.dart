class IceTypes {
  static const IceType noIce = IceType(name: 'Нет льда', prefix: '');

  static const IceType waterfall = IceType(name: 'Натечный', prefix: 'W');

  static const IceType glatcher = IceType(name: 'Ледник', prefix: 'A');

  static const values = [noIce, waterfall, glatcher];

  static IceType byPrefix(String prefix) {
    switch (prefix) {
      case 'W':
        return waterfall;
      case 'A':
        return glatcher;
      default:
        return noIce;
    }
  }
}

class IceType {
  final String name;
  final String prefix;

  const IceType({required this.name, required this.prefix});

  @override
  String toString() => name;
}

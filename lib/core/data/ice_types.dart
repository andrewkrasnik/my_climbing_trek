import 'package:my_climbing_trek/core/data/data_with_uuid.dart';

class IceTypes {
  static final IceType noIce = IceType(
    name: 'Нет льда',
    prefix: '',
    id: '0',
  );

  static final IceType waterfall = IceType(
    name: 'Натечный',
    prefix: 'W',
    id: 'W',
  );

  static final IceType glatcher = IceType(
    name: 'Ледник',
    prefix: 'A',
    id: 'A',
  );

  static final values = [noIce, waterfall, glatcher];

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

class IceType extends DataWithUUID {
  final String name;
  final String prefix;

  IceType({
    required this.name,
    required this.prefix,
    super.id,
  });

  @override
  String toString() => name;
}

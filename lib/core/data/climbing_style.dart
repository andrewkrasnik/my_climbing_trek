class ClimbingStyle {
  final String name;
  const ClimbingStyle._({
    required this.name,
  });
  static const lead = ClimbingStyle._(name: 'lead');
  static const topRope = ClimbingStyle._(name: 'top rope');
  static const bouldering = ClimbingStyle._(name: 'bouldering');
  static const trad = ClimbingStyle._(name: 'trad');
  // static const solo = ClimbingStyle._(name: 'solo');
  // static const ito = ClimbingStyle._(name: 'ito');
}

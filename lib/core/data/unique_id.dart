import 'package:uuid/uuid.dart';

class UniqueId {
  final String value;

  factory UniqueId() {
    return UniqueId._(const Uuid().v1());
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    if (uniqueId.isEmpty) {
      return UniqueId();
    } else {
      return UniqueId._(
        (uniqueId),
      );
    }
  }

  const UniqueId._(this.value);
}

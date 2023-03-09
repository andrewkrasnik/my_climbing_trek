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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UniqueId && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

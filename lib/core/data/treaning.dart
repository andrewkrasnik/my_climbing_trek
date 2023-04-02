import 'package:my_climbing_trek/core/data/unique_id.dart';
import 'package:intl/intl.dart';

class Treaning {
  final DateTime date;

  final UniqueId _id;

  DateTime? _finish;
  DateTime? _start;

  String get id => _id.value;

  DateTime? get start => _start;

  DateTime? get finish => _finish;

  bool get finished => _finish != null;

  String get dateString => DateFormat('dd.MM.yyyy').format(date);

  Treaning({
    required this.date,
    DateTime? finish,
    DateTime? start,
    String id = '',
  })  : _finish = finish,
        _start = start,
        _id = UniqueId.fromUniqueString(id);

  void finishTreaning() {
    _finish = DateTime.now();
  }

  void startTreaning() {
    _start = DateTime.now();
  }
}

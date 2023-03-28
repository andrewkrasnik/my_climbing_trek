import 'package:climbing_diary/core/data/unique_id.dart';
import 'package:intl/intl.dart';

class Treaning {
  final DateTime date;

  final UniqueId _id;

  DateTime? _finish;

  String get id => _id.value;

  DateTime? get getFinish => _finish;

  bool get finished => _finish != null;

  String get dateString => DateFormat('dd.MM.yyyy').format(date);

  Treaning({
    required this.date,
    DateTime? finish,
    String id = '',
  })  : _finish = finish,
        _id = UniqueId.fromUniqueString(id);

  void finish() {
    _finish = DateTime.now();
  }
}

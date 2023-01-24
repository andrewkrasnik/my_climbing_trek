import 'package:intl/intl.dart';

class Treaning {
  final DateTime date;

  DateTime? _finish;

  int? id;

  DateTime? get getFinish => _finish;

  bool get finished => _finish != null;

  bool get isNew => id == null;

  String get dateString => DateFormat('dd.MM.yyyy').format(date);

  Treaning({
    required this.date,
    DateTime? finish,
    this.id,
  }) : _finish = finish;

  void finish() {
    _finish = DateTime.now();
  }
}

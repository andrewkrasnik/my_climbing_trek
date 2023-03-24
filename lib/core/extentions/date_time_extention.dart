import 'package:intl/intl.dart';

extension DateTimeExtention on DateTime {
  DateTime toDayStart() => DateTime(year, month, day);
  DateTime nextDay() => add(const Duration(days: 1));
  DateTime previosDay() => add(const Duration(days: -1));
  String dayString() => DateFormat('dd.MM.yyyy').format(this);
}

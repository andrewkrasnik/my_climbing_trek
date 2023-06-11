import 'package:intl/intl.dart';

extension DateTimeExtention on DateTime {
  DateTime toDayStart() => DateTime(year, month, day);
  DateTime toDayEnd() => DateTime(year, month, day, 23, 59, 59);
  DateTime nextDay() => add(const Duration(days: 1));
  DateTime previosDay() => add(const Duration(days: -1));
  String dayString() => DateFormat('dd.MM.yyyy').format(this);
  String timeString() => DateFormat('hh:mm').format(this);
  DateTime monthStart() => DateTime(year, month, 1);
  String monthString() => DateFormat('MMMM yyyy').format(this);
}

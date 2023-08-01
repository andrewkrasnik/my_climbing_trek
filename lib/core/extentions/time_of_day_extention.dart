import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExtention on TimeOfDay {
  String timeString() =>
      DateFormat('HH:mm').format(DateTime(1, 1, 1, hour, minute));

  int compareTo(TimeOfDay other) {
    if (hour == other.hour) {
      // if (minute == other.minute) {
      //   return sec
      // }
      return minute.compareTo(other.minute);
    } else {
      return hour.compareTo(other.hour);
    }
  }
}

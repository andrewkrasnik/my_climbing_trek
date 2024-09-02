import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
    required this.date,
  });

  final ValueNotifier<DateTime> date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              date.value = date.value.previosDay();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        InkWell(
            onTap: () async {
              final newDate = await showDatePicker(
                  context: context,
                  initialDate: date.value,
                  lastDate: DateTime.now(),
                  firstDate:
                      DateTime.now().subtract(const Duration(days: 365)));

              if (newDate != null) {
                date.value = newDate;
              }
            },
            child: Text(
              date.value.dayString(),
              style: Theme.of(context).textTheme.headlineSmall,
            )),
        IconButton(
            onPressed: () {
              if (date.value
                  .toDayStart()
                  .isBefore(DateTime.now().toDayStart())) {
                date.value = date.value.nextDay();
              }
            },
            icon: const Icon(Icons.arrow_forward_ios)),
      ],
    );
  }
}

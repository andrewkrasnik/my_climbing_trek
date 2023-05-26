import 'package:flutter/material.dart';

class CurrentTravelHomePageWidget extends StatelessWidget {
  const CurrentTravelHomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Column(children: [
      const Text(
        'Альпсборы в Арче 2023',
        style: titleTextStyle,
      ),
      Text(
        'День 5 с 01.05.2023',
        style: titleTextStyle.copyWith(fontSize: 16),
      ),
      Text('Применить фильтр'),
      Text('Добавить расход'),
      Text('Подробнее'),
    ]);
  }
}

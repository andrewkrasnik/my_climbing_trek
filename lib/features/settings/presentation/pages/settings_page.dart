import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Настройки приложения',
                style: titleTextStyle,
              ),
            ),
            Text('Настройка темного режима'),
            Text('Выбор языка'),
            Text('Выбор категорий трасс'),
            Text('Выбор видов лазанья'),
            Text('Соглашение на уведомления'),
            Text('ВЫбор вида категорий трудности'),
          ],
        ),
      ),
    );
  }
}

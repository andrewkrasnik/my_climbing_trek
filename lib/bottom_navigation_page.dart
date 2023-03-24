import 'package:climbing_diary/features/hall_climbing/presentation/pages/hall_treanings_page.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/pages/home_page.dart';
import 'package:climbing_diary/other_treanings_page.dart';
import 'package:flutter/material.dart';

import 'features/settings/presentation/pages/settings_page.dart';

class BottomNavigationPage extends StatefulWidget {
  final String restorationId = 'BottomNavigationPage';

  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage>
    with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    HallTreaningsPage(),
    OtherTreaningsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex.value),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex.value,
        fixedColor: Colors.black,
        unselectedItemColor: Colors.black26,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.run_circle_outlined),
            label: 'Treanings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fitness_center_outlined,
            ),
            label: 'Other treanings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, 'bottom_navigation_tab_index');
  }
}

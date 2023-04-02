import 'package:my_climbing_trek/features/cardio_workout/presentation/widgets/cardio_home_page_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_home_page_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_home_page_widget.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/widgets/strength_home_page_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              HallHomePageWidget(),
              SizedBox(height: 16),
              CardioHomePageWidget(),
              SizedBox(height: 16),
              StrengthHomePageWidget(),
              SizedBox(height: 16),
              IceHomePageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

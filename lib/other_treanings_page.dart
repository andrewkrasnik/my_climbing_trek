import 'package:climbing_diary/features/cardio_workout/presentation/widgets/cardio_home_page_widget.dart';
import 'package:climbing_diary/features/strength_training/presentation/widgets/strength_home_page_widget.dart';
import 'package:flutter/material.dart';

class OtherTreaningsPage extends StatelessWidget {
  const OtherTreaningsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          CardioHomePageWidget(),
          StrengthHomePageWidget(),
        ],
      ),
    );
  }
}

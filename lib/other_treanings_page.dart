import 'package:climbing_diary/features/cardio_workout/presentation/widgets/cardio_home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherTreaningsPage extends StatelessWidget {
  const OtherTreaningsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CardioHomePageWidget(),
      ],
    );
  }
}

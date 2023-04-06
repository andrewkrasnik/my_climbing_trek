import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/cardio_workout/presentation/widgets/cardio_home_page_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_home_page_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_home_page_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_home_page_widget.dart';
import 'package:my_climbing_trek/features/settings/presentation/cubit/settings_cubit.dart';
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
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              return Column(
                children: [
                  if (state.treaningsSettings.useGymTreanings) ...[
                    const HallHomePageWidget(),
                    const SizedBox(height: 16),
                  ],
                  if (state.treaningsSettings.useCardioTreanings) ...[
                    const CardioHomePageWidget(),
                    const SizedBox(height: 16),
                  ],
                  if (state.treaningsSettings.useStrengthTraining) ...[
                    const StrengthHomePageWidget(),
                    const SizedBox(height: 16),
                  ],
                  if (state.treaningsSettings.useRockTraining) ...[
                    const RockHomePageWidget(),
                    const SizedBox(height: 16),
                  ],
                  if (state.treaningsSettings.useIceTreanings)
                    const IceHomePageWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

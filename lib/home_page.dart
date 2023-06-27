import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/cardio_workout/presentation/widgets/cardio_home_page_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_home_page_widget.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_home_page_widget.dart';
import 'package:my_climbing_trek/features/mountaineering/presentation/widgets/mountaineering_home_widget.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_home_page_widget.dart';
import 'package:my_climbing_trek/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/widgets/strength_home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/techniques/presentation/widgets/techniques_home_page_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/current_travel_home_page_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_home_page_widget.dart';
import 'package:my_climbing_trek/features/trekking/presentation/widgets/trekking_home_page_widget.dart';

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
                  if (state.treaningsSettings.useTraveling) ...[
                    const CurrentTravelHomePageWidget(),
                    const SizedBox(height: 16),
                  ],
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
                  if (state.treaningsSettings.useTechniques) ...[
                    const TechniquesHomePageWidget(),
                    const SizedBox(height: 16),
                  ],
                  if (state.treaningsSettings.useRockTraining) ...[
                    const RockHomePageWidget(),
                    const SizedBox(height: 16),
                  ],
                  if (state.treaningsSettings.useIceTreanings) ...[
                    const IceHomePageWidget(),
                    const SizedBox(height: 16),
                  ],
                  if (state.treaningsSettings.useMountaineering) ...[
                    const MountaineeringHomeWidget(),
                    const SizedBox(height: 16),
                  ],
                  if (state.treaningsSettings.useTrekking) ...[
                    const TrekkingHomePageWidget(),
                    const SizedBox(height: 16),
                  ],
                  if (state.treaningsSettings.useTraveling)
                    const TravelHomePageWidget(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

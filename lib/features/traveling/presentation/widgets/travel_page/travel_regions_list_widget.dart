import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart';

class TravelRegionsListWidget extends StatelessWidget {
  const TravelRegionsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TravelPageCubit, TravelPageState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<TravelPageCubit>(context);

        return Column(
          children: [
            ...state.regions.map(
              (region) => CheckboxListTile(
                value: state.travel?.regions.contains(region) ?? false,
                onChanged: (value) {
                  if (value == true) {
                    cubit.addRegion(travel: state.travel!, region: region);
                  } else {
                    cubit.removeRegion(travel: state.travel!, region: region);
                  }
                },
                title: Text(region.name),
              ),
            ),
          ],
        );
      },
    );
  }
}

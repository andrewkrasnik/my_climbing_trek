import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/pages/travel_day_page.dart';
import 'package:my_climbing_trek/features/traveling/presentation/pages/travel_page.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/cost_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_day_lines_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_day_title_widget.dart';

class CurrentTravelHomePageWidget extends StatelessWidget {
  const CurrentTravelHomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

    return BlocBuilder<CurrentTravelCubit, CurrentTravelState>(
      builder: (context, state) {
        return state.travel == null
            ? const SizedBox.shrink()
            : Column(children: [
                Text(
                  state.travel!.name,
                  style: titleTextStyle,
                ),
                Text(
                  state.travel!.period,
                  style: titleTextStyle.copyWith(fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.outlined(
                      onPressed: () {
                        BlocProvider.of<CurrentTravelCubit>(context)
                            .changeUseFilter();
                      },
                      icon: Icon(
                        Icons.filter_alt,
                        color: state.useFilter
                            ? Theme.of(context).colorScheme.surface
                            : Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.5),
                      ),
                    ),
                    IconButton.outlined(
                      onPressed: () {
                        showMyModalBottomSheet<void>(
                          context: context,
                          heightPersent: 0.8,
                          child: CostParametersWidget(
                            incomeExpense: IncomeExpense.income,
                            currencies: state.travel!.currencies,
                            travel: state.travel!,
                            cubit: BlocProvider.of<CurrentTravelCubit>(context),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add),
                    ),
                    IconButton.outlined(
                      onPressed: () {
                        showMyModalBottomSheet<void>(
                          context: context,
                          heightPersent: 0.8,
                          child: CostParametersWidget(
                            incomeExpense: IncomeExpense.expense,
                            currencies: state.travel!.currencies,
                            travel: state.travel!,
                            cubit: BlocProvider.of<CurrentTravelCubit>(context),
                          ),
                        );
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    IconButton.outlined(
                      onPressed: () async {
                        final cubit =
                            BlocProvider.of<CurrentTravelCubit>(context);

                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TravelPage(
                                  travel: state.travel!,
                                )));

                        cubit.loadData();
                      },
                      icon: const Icon(Icons.info),
                    ),
                  ],
                ),
                if (state.travelDay != null) ...[
                  InkWell(
                    onTap: () async {
                      final cubit =
                          BlocProvider.of<CurrentTravelCubit>(context);

                      await Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            TravelDayPage(day: state.travelDay!),
                      ));

                      cubit.loadData();
                    },
                    child: TravelDayTitleWidget(travelDay: state.travelDay!),
                  ),
                  TravelDayLinesWidget(
                    stayLines: state.travelDay!.stayLines,
                    transportLines: state.travelDay!.transportLines,
                  ),
                ]
              ]);
      },
    );
  }
}

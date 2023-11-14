import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/core/widgets/multi_selectable_chip_group_widget.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/pages/travel_day_page.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/budget_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/cost_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/insurance_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_day_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_page/travel_budget_list_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_page/travel_cost_list_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_page/travel_insurance_list_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_parameters_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';

class TravelPage extends StatelessWidget {
  final Travel travel;

  const TravelPage({
    required this.travel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'План по дням',
      'Доходы и расходы',
      'Бюджет',
      'Страхование',
      'Питание',
      'Фильтры',
    ];
    return BlocProvider(
      create: (context) => getIt<TravelPageCubit>()..loadData(travel: travel),
      child: BlocBuilder<TravelPageCubit, TravelPageState>(
        builder: (context, state) {
          final color = Theme.of(context).colorScheme.surface;

          final cubit = BlocProvider.of<TravelPageCubit>(context);
          return SafeArea(
            child: Scaffold(
                floatingActionButton: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (state.tabIndex == 1) ...[
                      FloatingActionButton(
                        onPressed: () {
                          showMyModalBottomSheet<void>(
                            context: context,
                            heightPersent: 0.8,
                            child: CostParametersWidget(
                              travel: state.travel!,
                              incomeExpense: IncomeExpense.income,
                              currencies: state.travel!.currencies,
                              cubit: cubit,
                            ),
                          );
                        },
                        child: const Icon(Icons.add),
                      ),
                      const SizedBox(width: 20)
                    ],
                    if (state.tabIndex == 1)
                      FloatingActionButton(
                        onPressed: () {
                          showMyModalBottomSheet<void>(
                            context: context,
                            heightPersent: 0.8,
                            child: CostParametersWidget(
                              travel: state.travel!,
                              incomeExpense: IncomeExpense.expense,
                              currencies: state.travel!.currencies,
                              cubit: cubit,
                            ),
                          );
                        },
                        child: const Icon(Icons.remove),
                      ),
                    if (state.tabIndex == 2)
                      FloatingActionButton(
                        onPressed: () {
                          showMyModalBottomSheet<void>(
                            context: context,
                            heightPersent: 0.8,
                            child: BudgetParametersWidget(
                              travel: state.travel!,
                              cubit: cubit,
                            ),
                          );
                        },
                        child: const Icon(Icons.add),
                      ),
                    if (state.tabIndex == 3)
                      FloatingActionButton(
                        onPressed: () {
                          showMyModalBottomSheet<void>(
                            context: context,
                            heightPersent: 0.8,
                            child: InsuranceParametersWidget(
                              cubit: cubit,
                              travel: state.travel!,
                            ),
                          );
                        },
                        child: const Icon(Icons.add),
                      ),
                  ],
                ),
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 200,
                      stretch: true,
                      floating: true,
                      pinned: true,
                      snap: false,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Hero(
                          tag: 'travel${state.travel?.id ?? ''}',
                          child: MyCachedNetworkImage(
                              imageUrl: state.travel?.image ?? '',
                              fit: BoxFit.cover),
                        ),
                        centerTitle: true,
                        title: InkWell(
                          onTap: () {
                            if (state.travel != null) {
                              showMyModalBottomSheet<void>(
                                context: context,
                                heightPersent: 0.8,
                                child: TravelParametersWidget(
                                    travel: state.travel!,
                                    cubit: BlocProvider.of<TravelPageCubit>(
                                        context)),
                              );
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                state.travel?.name ?? '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(offset: Offset.fromDirection(1))
                                    ]),
                              ),
                              Text(
                                state.travel?.period ?? '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(offset: Offset.fromDirection(1))
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      actions: [
                        PopupMenuButton<Text>(
                          itemBuilder: (context) {
                            return [
                              if (state.travel != null)
                                ...state.travel!.nextStatuses.map(
                                  (status) => PopupMenuItem(
                                    onTap: () async {
                                      if (state.travel != null) {
                                        await BlocProvider.of<TravelPageCubit>(
                                                context)
                                            .setStatus(
                                                travel: state.travel!,
                                                status: status);

                                        BlocProvider.of<CurrentTravelCubit>(
                                                context)
                                            .loadData();
                                      }
                                    },
                                    child: Text(
                                      status.action,
                                    ),
                                  ),
                                ),
                              const PopupMenuItem(
                                child: Text(
                                  'Удалить',
                                ),
                              ),
                            ];
                          },
                        )
                      ],
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          SizedBox(
                            height: 52,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(8),
                              itemCount: tabs.length,
                              itemBuilder: (context, index) {
                                final bool selected = index == state.tabIndex;
                                return InkWell(
                                  onTap: () {
                                    BlocProvider.of<TravelPageCubit>(context)
                                        .selectTab(tabIndex: index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Chip(
                                        label: Text(
                                      tabs[index],
                                      style: TextStyle(
                                          color: selected
                                              ? color
                                              : color.withOpacity(0.5)),
                                    )),
                                  ),
                                );
                              },
                            ),
                          ),
                          if (state.tabIndex == 0)
                            ...state.days.map(
                              (day) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                    onTap: () async {
                                      await Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            TravelDayPage(day: day),
                                      ));

                                      cubit.loadData(travel: travel);
                                    },
                                    child: TravelDayWidget(travelDay: day)),
                              ),
                            ),
                          if (state.tabIndex == 1) const TravelCostListWdget(),
                          if (state.tabIndex == 2)
                            const TravelBudgetListWidget(),
                          if (state.tabIndex == 3)
                            const TravelInsuranceListWidget(),
                          if (state.tabIndex == 4 &&
                              state.feedingStatistic != null)
                            ...state.feedingStatistic!.statistic.keys.map(
                              (meal) => Column(
                                children: [
                                  Text(meal.description),
                                  ...state
                                      .feedingStatistic!.statistic[meal]!.keys
                                      .map((type) {
                                    final count = state.feedingStatistic!
                                        .statistic[meal]![type]!;
                                    return Text('${type.description}: $count');
                                  }),
                                  const SizedBox(height: 8)
                                ],
                              ),
                            ),
                          if (state.tabIndex == 5) ...[
                            MultiSelectableChipGroupWidget(
                                lines: Currency.values,
                                title: const Text('Валюты:'),
                                onTap: (selected, currency) {
                                  if (state.travel != null) {
                                    final currencies = state.travel!.currencies;
                                    if (selected) {
                                      currencies.remove(currency);
                                    } else {
                                      currencies.add(currency);
                                    }

                                    cubit.setCurrencies(
                                        travel: state.travel!,
                                        currencies: currencies);
                                  }
                                },
                                selectedLines: state.travel?.currencies ?? [])
                          ]
                        ],
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}

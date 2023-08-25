import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/core/widgets/multi_selectable_chip_group_widget.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/selectable_chip_group_widget.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/currency.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/feeding_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/current_travel/current_travel_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/cubit/travel_page/travel_page_cubit.dart';
import 'package:my_climbing_trek/features/traveling/presentation/pages/travel_day_page.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/budget_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/contact_line_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/cost_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/insurance_parameters_widget.dart';
import 'package:my_climbing_trek/features/traveling/presentation/widgets/travel_day_widget.dart';
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
                                cubit:
                                    BlocProvider.of<TravelPageCubit>(context)),
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

                                    BlocProvider.of<CurrentTravelCubit>(context)
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2),
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
                      if (state.tabIndex == 1) ...[
                        ...state.costs.map((cost) => SlidableDataLineWidget(
                              onDelete: (context) {
                                cubit.deleteCostLine(
                                    travel: travel, line: cost);
                              },
                              onEdit: (context) {
                                showMyModalBottomSheet<void>(
                                  context: context,
                                  heightPersent: 0.8,
                                  child: CostParametersWidget(
                                    travel: travel,
                                    incomeExpense: cost.incomeExpense,
                                    line: cost,
                                    currencies: travel.currencies,
                                    cubit: cubit,
                                  ),
                                );
                              },
                              child: ListTile(
                                leading:
                                    cost.incomeExpense == IncomeExpense.expense
                                        ? const Icon(
                                            Icons.remove,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.add,
                                            color: Colors.green,
                                          ),
                                title: Text(cost.type.name),
                                subtitle: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (cost.description.isNotEmpty)
                                      Text(cost.description),
                                    Text(cost.date.dayString()),
                                  ],
                                ),
                                trailing: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      cost.sum.toString(),
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      cost.currency.name,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OutlinedButton(
                                onPressed: () {
                                  showMyModalBottomSheet<void>(
                                    context: context,
                                    heightPersent: 0.8,
                                    child: CostParametersWidget(
                                      travel: travel,
                                      incomeExpense: IncomeExpense.income,
                                      currencies: travel.currencies,
                                      cubit: cubit,
                                    ),
                                  );
                                },
                                child: const Text('Доход')),
                            OutlinedButton(
                                onPressed: () {
                                  showMyModalBottomSheet<void>(
                                    context: context,
                                    heightPersent: 0.8,
                                    child: CostParametersWidget(
                                      travel: travel,
                                      incomeExpense: IncomeExpense.expense,
                                      currencies: travel.currencies,
                                      cubit: cubit,
                                    ),
                                  );
                                },
                                child: const Text('Расход')),
                          ],
                        ),
                      ],
                      if (state.tabIndex == 2) ...[
                        if (state.travel != null)
                          SelectableChipGroupWidget<Currency>(
                            title: const Text('Валюта бюджета:'),
                            onTap: (currency) {
                              cubit.setBudgetCurrency(
                                  travel: state.travel!, currency: currency);
                            },
                            currentValue: state.travel!.budgetCurrency,
                            lines: state.travel!.currencies,
                          ),
                        ...state.budgetLines.map(
                          (line) => Slidable(
                            child: SlidableDataLineWidget(
                              onDelete: (context) {
                                cubit.deleteBudgetLine(
                                    travel: travel, line: line);
                              },
                              onEdit: (context) {
                                showMyModalBottomSheet<void>(
                                  context: context,
                                  heightPersent: 0.8,
                                  child: BudgetParametersWidget(
                                    travel: travel,
                                    cubit: cubit,
                                    line: line,
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text(line.type.name),
                                subtitle: Text(line.description),
                                trailing: Text(
                                  line.amount.toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        OutlinedButton(
                            onPressed: () {
                              showMyModalBottomSheet<void>(
                                context: context,
                                heightPersent: 0.8,
                                child: BudgetParametersWidget(
                                  travel: travel,
                                  cubit: cubit,
                                ),
                              );
                            },
                            child: const Text('Добавить')),
                      ],
                      if (state.tabIndex == 3) ...[
                        ...state.insurances.map((insurance) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SlidableDataLineWidget(
                                onDelete: (context) {
                                  cubit.deleteInsuranceLine(
                                      travel: travel, line: insurance);
                                },
                                onEdit: (context) {
                                  showMyModalBottomSheet<void>(
                                    context: context,
                                    heightPersent: 0.8,
                                    child: InsuranceParametersWidget(
                                      cubit: cubit,
                                      travel: travel,
                                      line: insurance,
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text('Полис № '),
                                          SelectableText(insurance.number),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Страховая компания:'),
                                          Text(insurance.insurer),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Застрахованное лицо:'),
                                          Text(insurance.insurant),
                                        ],
                                      ),
                                      if (insurance.description.isNotEmpty) ...[
                                        const SizedBox(height: 4),
                                        Text(insurance.description),
                                      ],
                                      ...insurance.contacts.map(
                                        (contact) => SlidableDataLineWidget(
                                          onDelete: (context) {
                                            cubit.deleteContactForInsuranceLine(
                                                line: insurance,
                                                travel: travel,
                                                contact: contact);
                                          },
                                          onEdit: (context) {
                                            showMyModalBottomSheet<void>(
                                              context: context,
                                              heightPersent: 0.8,
                                              child: ContactParametersWidget(
                                                line: contact,
                                                onTap: (
                                                    {required data,
                                                    required description,
                                                    required id,
                                                    required type}) {
                                                  cubit
                                                      .editContactForInsuranceLine(
                                                    line: insurance,
                                                    travel: travel,
                                                    contactData: data,
                                                    contactType: type,
                                                    contactDescription:
                                                        description,
                                                    contactId: id,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child: ContactLineWidget(
                                            contact: contact,
                                          ),
                                        ),
                                      ),
                                      OutlinedButton(
                                          onPressed: () {
                                            showMyModalBottomSheet<void>(
                                              context: context,
                                              heightPersent: 0.6,
                                              child: ContactParametersWidget(
                                                onTap: (
                                                    {required data,
                                                    required description,
                                                    required id,
                                                    required type}) {
                                                  cubit
                                                      .editContactForInsuranceLine(
                                                    line: insurance,
                                                    travel: travel,
                                                    contactData: data,
                                                    contactType: type,
                                                    contactDescription:
                                                        description,
                                                    contactId: id,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          child:
                                              const Text('Добавить контакт')),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        OutlinedButton(
                            onPressed: () {
                              showMyModalBottomSheet<void>(
                                context: context,
                                heightPersent: 0.8,
                                child: InsuranceParametersWidget(
                                  cubit: cubit,
                                  travel: travel,
                                ),
                              );
                            },
                            child: const Text('Добавить')),
                      ],
                      if (state.tabIndex == 4 && state.feedingStatistic != null)
                        ...state.feedingStatistic!.statistic.keys.map(
                          (meal) => Column(
                            children: [
                              Text(meal.description),
                              ...state.feedingStatistic!.statistic[meal]!.keys
                                  .map((type) {
                                final count = state
                                    .feedingStatistic!.statistic[meal]![type]!;
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

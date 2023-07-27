import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_climbing_trek/core/widgets/my_cached_network_image.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/core/widgets/slidable_data_line_widget.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/cost_line.dart';
import 'package:my_climbing_trek/features/traveling/domain/entities/travel.dart';
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
      create: (context) => getIt<TravelPageCubit>(),
      child: BlocBuilder<TravelPageCubit, TravelPageState>(
        builder: (context, state) {
          final color = Theme.of(context).colorScheme.surface;
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
                      tag: 'travel${travel.id}',
                      child: MyCachedNetworkImage(
                          imageUrl: travel.image, fit: BoxFit.cover),
                    ),
                    centerTitle: true,
                    title: InkWell(
                      onTap: () {
                        showMyModalBottomSheet<void>(
                          context: context,
                          heightPersent: 0.8,
                          child: TravelParametersWidget(
                              travel: travel,
                              cubit: BlocProvider.of<TravelPageCubit>(context)),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            travel.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(offset: Offset.fromDirection(1))
                                ]),
                          ),
                          Text(
                            travel.period,
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
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
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
                        ...travel.travelDays.map(
                          (day) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        TravelDayPage(day: day),
                                  ));
                                },
                                child: TravelDayWidget(travelDay: day)),
                          ),
                        ),
                      if (state.tabIndex == 1) ...[
                        ...travel.costs.map((cost) => SlidableDataLineWidget(
                              onDelete: (context) {},
                              onEdit: (context) {
                                showMyModalBottomSheet<void>(
                                  context: context,
                                  heightPersent: 0.8,
                                  child: CostParametersWidget(
                                    incomeExpense: cost.incomeExpense,
                                    line: cost,
                                    currencies: travel.currencies,
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
                                subtitle: Text(cost.description),
                                trailing: Text(
                                  cost.sum.toString(),
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                                onPressed: () {
                                  showMyModalBottomSheet<void>(
                                    context: context,
                                    heightPersent: 0.8,
                                    child: CostParametersWidget(
                                      incomeExpense: IncomeExpense.income,
                                      currencies: travel.currencies,
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
                                      incomeExpense: IncomeExpense.expense,
                                      currencies: travel.currencies,
                                    ),
                                  );
                                },
                                child: const Text('Расход')),
                          ],
                        ),
                      ],
                      if (state.tabIndex == 2)
                        if (travel.budget != null) ...[
                          Text(
                              '${travel.budget!.amount.toString()} ${travel.budget!.currency.name}'),
                          ...travel.budget!.lines.map(
                            (line) => Slidable(
                              child: SlidableDataLineWidget(
                                onDelete: (context) {},
                                onEdit: (context) {
                                  showMyModalBottomSheet<void>(
                                    context: context,
                                    heightPersent: 0.8,
                                    child: BudgetParametersWidget(line: line),
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
                                  child: const BudgetParametersWidget(),
                                );
                              },
                              child: const Text('Добавить')),
                        ],
                      if (state.tabIndex == 3) ...[
                        ...travel.insurances.map((insurance) =>
                            SlidableDataLineWidget(
                              onDelete: (context) {},
                              onEdit: (context) {
                                showMyModalBottomSheet<void>(
                                  context: context,
                                  heightPersent: 0.8,
                                  child: InsuranceParametersWidget(
                                      line: insurance),
                                );
                              },
                              child: Column(
                                children: [
                                  Text(insurance.insurer),
                                  Text(insurance.description),
                                  SelectableText(insurance.number),
                                  Text(insurance.insurant),
                                  OutlinedButton(
                                      onPressed: () {
                                        showMyModalBottomSheet<void>(
                                          context: context,
                                          heightPersent: 0.6,
                                          child:
                                              const ContactParametersWidget(),
                                        );
                                      },
                                      child: const Text('Добавить контакт')),
                                  ...insurance.contacts.map((contact) =>
                                      SlidableDataLineWidget(
                                          onDelete: (context) {},
                                          onEdit: (context) {
                                            showMyModalBottomSheet<void>(
                                              context: context,
                                              heightPersent: 0.8,
                                              child: ContactParametersWidget(
                                                  line: contact),
                                            );
                                          },
                                          child: ContactLineWidget(
                                              contact: contact)))
                                ],
                              ),
                            )),
                        OutlinedButton(
                            onPressed: () {
                              showMyModalBottomSheet<void>(
                                context: context,
                                heightPersent: 0.8,
                                child: const InsuranceParametersWidget(),
                              );
                            },
                            child: const Text('Добавить')),
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

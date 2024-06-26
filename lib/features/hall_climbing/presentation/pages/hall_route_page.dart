import 'package:my_climbing_trek/core/data/climbing_route_type.dart';
import 'package:my_climbing_trek/core/data/difficulty_category.dart';
import 'package:my_climbing_trek/core/data/drytooling_category.dart';
import 'package:my_climbing_trek/core/extentions/date_time_extention.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:my_climbing_trek/features/hall_climbing/domain/entities/route_color.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/hall_route_attempts_widget.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/widgets/select_category_widget.dart';
import 'package:my_climbing_trek/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HallRoutePage extends HookWidget {
  final ClimbingHall climbingHall;
  final ClimbingHallRoute? route;
  final DifficultyCategory? initialCategory;
  final ClimbingRouteType? initialType;
  final bool autoBelay;
  const HallRoutePage({
    super.key,
    required this.climbingHall,
    this.route,
    this.initialCategory,
    this.initialType,
    this.autoBelay = false,
  });

  @override
  Widget build(BuildContext context) {
    final ClimbingRouteType routeType =
        (!climbingHall.hasBigWall && climbingHall.hasBouldering)
            ? ClimbingRouteType.bouldering
            : ClimbingRouteType.rope;

    final category =
        useState<DifficultyCategory?>(initialCategory ?? route?.category);

    final color = useState<RouteColor?>(route?.color);

    final type =
        useState<ClimbingRouteType>(route?.type ?? initialType ?? routeType);

    final autoBelayState = useState<bool>(route?.autoBelay ?? autoBelay);

    final numberEditingController =
        useTextEditingController(text: route?.sectorNumber.toString() ?? '');

    final authorEditingController =
        useTextEditingController(text: route?.author.toString() ?? '');

    final nameEditingController =
        useTextEditingController(text: route?.name.toString() ?? '');

    final descriptionEditingController =
        useTextEditingController(text: route?.description.toString() ?? '');

    final createDateState = useState<DateTime?>(route?.createDate);

    final colorsMap = RouteColor.colorsMap;

    bool showSwitch = climbingHall.hasBigWall && climbingHall.hasBouldering;

    return BlocProvider(
      create: (context) => getIt<HallRouteCubit>(),
      child: BlocConsumer<HallRouteCubit, HallRouteState>(
        listenWhen: (_, current) => current.maybeMap(
            error: (_) => true, saved: (_) => true, orElse: () => false),
        listener: (context, state) {
          state.maybeMap(
            saved: (_) => Navigator.of(context).pop(),
            error: (errorState) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Ошибка'),
                  content: Column(
                    children: [Text(errorState.description)],
                  ),
                  actions: [
                    ElevatedButton(
                      child: const Text('OK'),
                      onPressed: () => Navigator.of(context).pop(),
                    )
                  ],
                ),
              );
            },
            orElse: () => null,
          );
        },
        buildWhen: (_, current) =>
            current.maybeMap(error: (_) => false, orElse: () => true),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            floatingActionButton: route == null
                ? FloatingActionButton(
                    child: const Icon(Icons.save),
                    onPressed: () {
                      BlocProvider.of<HallRouteCubit>(context).saveRoute(
                        climbingHall: climbingHall,
                        route: ClimbingHallRoute(
                          category: category.value!,
                          color: color.value!,
                          type: type.value,
                          autoBelay: autoBelayState.value,
                          author: authorEditingController.text,
                          description: descriptionEditingController.text,
                          name: nameEditingController.text,
                          createDate: createDateState.value,
                          sectorNumber: int.tryParse(
                                numberEditingController.text,
                              ) ??
                              0,
                        ),
                      );
                    })
                : null,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (showSwitch)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Rope',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    fontWeight: type.value ==
                                            ClimbingRouteType.bouldering
                                        ? FontWeight.normal
                                        : FontWeight.bold),
                          ),
                          Switch(
                              value: type.value == ClimbingRouteType.bouldering,
                              activeColor:
                                  Theme.of(context).colorScheme.surface,
                              inactiveThumbColor:
                                  Theme.of(context).colorScheme.surface,
                              inactiveTrackColor: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              onChanged: (value) {
                                type.value = value
                                    ? ClimbingRouteType.bouldering
                                    : ClimbingRouteType.rope;
                              }),
                          Text(
                            'Bouldering',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                    fontWeight: type.value ==
                                            ClimbingRouteType.bouldering
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                          ),
                        ],
                      ),
                    if (climbingHall.hasAutoBelay &&
                        type.value == ClimbingRouteType.rope)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Auto belay',
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                          Switch(
                            value: autoBelayState.value,
                            activeColor: Theme.of(context).primaryColor,
                            onChanged: (value) {
                              autoBelayState.value = value;
                            },
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Категория:',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Center(
                      child: SelectCategoryWidget(
                        currentCategory: category.value,
                        color: route?.color ?? color.value,
                        onTap: (selectCategory) {
                          category.value = selectCategory;
                        },
                      ),
                    ),
                    if (climbingHall.hasDrytooling)
                      Center(
                        child: SelectCategoryWidget(
                          currentCategory: category.value,
                          categories: DrytoolingCategory.hallValues,
                          color: route?.color ?? color.value,
                          onTap: (selectCategory) {
                            category.value = selectCategory;
                          },
                        ),
                      ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Цвет:',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlockPicker(
                      pickerColor:
                          color.value?.materialColor ?? Colors.transparent,
                      onColorChanged: (selectedColor) {
                        color.value = colorsMap[selectedColor];
                      },
                      availableColors: RouteColor.materialColors,
                      useInShowDialog: false,
                      layoutBuilder: (context, colors, child) => Wrap(
                        children: colors.map((color) => child(color)).toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: numberEditingController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: 'Номер дорожки',
                          border: OutlineInputBorder()),
                    ),
                    TextField(
                      controller: nameEditingController,
                      decoration: const InputDecoration(
                          labelText: 'Имя', border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: authorEditingController,
                      decoration: const InputDecoration(
                          labelText: 'Автор', border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () async {
                        final newDate = await showDatePicker(
                            context: context,
                            initialDate:
                                createDateState.value ?? DateTime.now(),
                            lastDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 4 * 365)));

                        if (newDate != null) {
                          createDateState.value = newDate;
                        }
                      },
                      child: Text(
                        'Дата накрутки: ${createDateState.value?.dayString() ?? ''}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: descriptionEditingController,
                      minLines: 3,
                      maxLines: 6,
                      decoration: const InputDecoration(
                          labelText: 'Описание', border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (route != null)
                      SizedBox(
                        height: 320,
                        child: HallRouteAttemptsWidget(route: route!),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

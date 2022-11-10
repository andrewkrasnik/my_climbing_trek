import 'package:climbing_diary/core/data/climbing_category.dart';
import 'package:climbing_diary/core/data/climbing_route_type.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/climbing_hall_route.dart';
import 'package:climbing_diary/features/hall_climbing/domain/entities/route_color.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/hall_route/hall_route_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/widgets/select_category_widget.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HallRoutePage extends HookWidget {
  final ClimbingHall climbingHall;
  final ClimbingHallRoute? route;
  final ClimbingCategory? initialCategory;
  final ClimbingRouteType? initialType;
  const HallRoutePage({
    Key? key,
    required this.climbingHall,
    this.route,
    this.initialCategory,
    this.initialType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = useState<ClimbingCategory?>(initialCategory);
    final color = useState<RouteColor?>(null);
    final type = useState<ClimbingRouteType>(
        route?.type ?? initialType ?? ClimbingRouteType.rope);
    final numberEditingController =
        useTextEditingController(text: route?.sectorNumber.toString() ?? '');

    final colorsMap = RouteColor.colorsMap;

    return BlocProvider(
      create: (context) => getIt<HallRouteCubit>(),
      child: BlocBuilder<HallRouteCubit, HallRouteState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rope',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                  fontWeight:
                                      type.value == ClimbingRouteType.bouldering
                                          ? FontWeight.normal
                                          : FontWeight.bold),
                        ),
                        Switch(
                            value: type.value == ClimbingRouteType.bouldering,
                            activeColor: Theme.of(context).primaryColor,
                            inactiveThumbColor: Theme.of(context).primaryColor,
                            inactiveTrackColor:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            onChanged: (value) {
                              type.value = value
                                  ? ClimbingRouteType.bouldering
                                  : ClimbingRouteType.rope;
                            }),
                        Text(
                          'Bouldering',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                  fontWeight:
                                      type.value == ClimbingRouteType.bouldering
                                          ? FontWeight.bold
                                          : FontWeight.normal),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Категория:',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Center(
                      child: SelectCategoryWidget(
                        currentCategory: route?.category ?? category.value,
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
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BlockPicker(
                      pickerColor: route?.color.materialColor ??
                          color.value?.materialColor ??
                          Colors.white,
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
                          labelText: 'Номер сектора',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    if (route == null)
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<HallRouteCubit>(context).saveRoute(
                              route: ClimbingHallRoute(
                                  climbingHall: climbingHall,
                                  category: category.value!,
                                  color: color.value!,
                                  type: type.value,
                                  sectorNumber: int.tryParse(
                                        numberEditingController.text,
                                      ) ??
                                      0));
                          Navigator.of(context).pop();
                        },
                        child: const Text('Сохранить'),
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

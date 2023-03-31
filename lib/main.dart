import 'dart:ui';

import 'package:climbing_diary/bottom_navigation_page.dart';
import 'package:climbing_diary/features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:climbing_diary/features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart';
import 'package:climbing_diary/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';

import 'package:climbing_diary/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:climbing_diary/features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart';
import 'package:climbing_diary/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageCubit>(
          create: (context) => getIt<HomePageCubit>()..loadData(),
        ),
        BlocProvider<CurrentHallTreaningCubit>(
          create: (context) => getIt<CurrentHallTreaningCubit>()..loadData(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => getIt<SettingsCubit>()..loadData(),
        ),
        BlocProvider(
          create: (context) => getIt<CurrentIceTreaningCubit>()..loadData(),
        ),
        BlocProvider(
          create: (context) => getIt<CardioTreaningCubit>()..loadData(),
        ),
        BlocProvider(
          create: (context) => getIt<StrengthTrainingCubit>()..loadData(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          scrollBehavior: MyCustomScrollBehavior(),
          home: const SafeArea(child: BottomNavigationPage())),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

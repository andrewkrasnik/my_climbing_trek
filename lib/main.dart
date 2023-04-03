import 'dart:async';
import 'dart:ui';

import 'package:my_climbing_trek/bottom_navigation_page.dart';
import 'package:my_climbing_trek/core/services/analitics/analitics_service.dart';
import 'package:my_climbing_trek/core/services/crash_log_service/crash_log_service.dart';
import 'package:my_climbing_trek/features/cardio_workout/presentation/cubit/cardio_treaning/cardio_treaning_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/current_hall_treaning/current_hall_treaning_cubit.dart';
import 'package:my_climbing_trek/features/hall_climbing/presentation/bloc/home_page/home_page_cubit.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/bloc/current_ice_treaning/current_ice_treaning_cubit.dart';

import 'package:my_climbing_trek/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:my_climbing_trek/features/strength_training/presentation/cubit/strength_training/strength_training_cubit.dart';
import 'package:my_climbing_trek/service_locator.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      di.configureDependencies();
      await di.getIt.getAsync<CrashLogService>();

      await di.getIt.getAsync<AnaliticsService>();

      await Hive.initFlutter();

      runApp(const MyApp());
    },
    (error, stack) {
      di.getIt<CrashLogService>().recordError(error, stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageCubit>(
          create: (context) => di.getIt<HomePageCubit>()..loadData(),
        ),
        BlocProvider<CurrentHallTreaningCubit>(
          create: (context) => di.getIt<CurrentHallTreaningCubit>()..loadData(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => di.getIt<SettingsCubit>()..loadData(),
        ),
        BlocProvider(
          create: (context) => di.getIt<CurrentIceTreaningCubit>()..loadData(),
        ),
        BlocProvider(
          create: (context) => di.getIt<CardioTreaningCubit>()..loadData(),
        ),
        BlocProvider(
          create: (context) => di.getIt<StrengthTrainingCubit>()..loadData(),
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

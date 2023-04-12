import 'package:my_climbing_trek/core/data/category_type.dart';
import 'package:my_climbing_trek/features/authentication/presentation/widgets/auth_button.dart';
import 'package:my_climbing_trek/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:my_climbing_trek/features/settings/presentation/pages/all_categories_page.dart';
import 'package:my_climbing_trek/features/settings/presentation/pages/ice_categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Настройки приложения',
                        style: titleTextStyle,
                      ),
                    ),
                    // const Text('Настройка темного режима'),
                    // const Text('Выбор языка'),
                    // const Text('Выбор категорий трасс'),
                    // const Text('Выбор видов лазанья'),
                    // const Text('Соглашение на уведомления'),
                    const SizedBox(
                      height: 16,
                    ),

                    SwitchListTile(
                      value: state.treaningsSettings.useGymTreanings,
                      onChanged: (value) =>
                          BlocProvider.of<SettingsCubit>(context)
                              .changeTreaningSettings(
                                  settingsId: 1, value: value),
                      title: const Text('Тренировки на скалодромах'),
                    ),
                    SwitchListTile(
                      value: state.treaningsSettings.useCardioTreanings,
                      onChanged: (value) =>
                          BlocProvider.of<SettingsCubit>(context)
                              .changeTreaningSettings(
                                  settingsId: 2, value: value),
                      title: const Text('Кардио тренировки'),
                    ),
                    SwitchListTile(
                      value: state.treaningsSettings.useStrengthTraining,
                      onChanged: (value) =>
                          BlocProvider.of<SettingsCubit>(context)
                              .changeTreaningSettings(
                                  settingsId: 3, value: value),
                      title: const Text('Силовые тренировки'),
                    ),
                    SwitchListTile(
                      value: state.treaningsSettings.useRockTraining,
                      onChanged: (value) =>
                          BlocProvider.of<SettingsCubit>(context)
                              .changeTreaningSettings(
                                  settingsId: 5, value: value),
                      title: const Text('Тренировки на скалах'),
                    ),
                    SwitchListTile(
                      value: state.treaningsSettings.useIceTreanings,
                      onChanged: (value) =>
                          BlocProvider.of<SettingsCubit>(context)
                              .changeTreaningSettings(
                                  settingsId: 4, value: value),
                      title: const Text('Ледолазные тренировки'),
                    ),
                    SwitchListTile(
                      value: state.treaningsSettings.useMountaineering,
                      onChanged: (value) =>
                          BlocProvider.of<SettingsCubit>(context)
                              .changeTreaningSettings(
                                  settingsId: 6, value: value),
                      title: const Text('Восхождения и мультипитчи'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Классификация категорий трудности:'),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (context) {
                                return Scaffold(
                                  body: ListView(
                                      children: CategoryType.values
                                          .map((type) => Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    BlocProvider.of<
                                                                SettingsCubit>(
                                                            context)
                                                        .selectHallCategoryType(
                                                            type: type);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Center(
                                                      child: Text(type.name)),
                                                ),
                                              ))
                                          .toList()),
                                );
                              },
                            );
                          },
                          child: Text(state.hallCategoryType.name),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const AllCategoriesPage()));
                      },
                      child: const Text('Категории скалолазанья'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const IceCategoriesPage()));
                      },
                      child: const Text('Категории ледолазанья'),
                    ),
                    const AuthButton(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

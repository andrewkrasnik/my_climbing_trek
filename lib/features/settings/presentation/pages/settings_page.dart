import 'package:my_climbing_trek/core/data/category_type.dart';
import 'package:my_climbing_trek/core/widgets/my_modal_bottom_sheet.dart';
import 'package:my_climbing_trek/features/authentication/presentation/widgets/auth_button.dart';
import 'package:my_climbing_trek/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:my_climbing_trek/features/settings/presentation/pages/aid_categories_page.dart';
import 'package:my_climbing_trek/features/settings/presentation/pages/all_categories_page.dart';
import 'package:my_climbing_trek/features/settings/presentation/pages/ice_categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_climbing_trek/features/settings/presentation/pages/mixed_categories_page.dart';
import 'package:my_climbing_trek/features/settings/presentation/pages/mountaineering_categories_page.dart';
import 'package:my_climbing_trek/features/settings/presentation/pages/ussr_categories_page.dart';
import 'package:my_climbing_trek/features/treanings/presentation/widgets/treanings_export_import_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
                    const AuthButton(),
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
                      value: state.treaningsSettings.useTechniques,
                      onChanged: (value) =>
                          BlocProvider.of<SettingsCubit>(context)
                              .changeTreaningSettings(
                                  settingsId: 9, value: value),
                      title: const Text('Технические тренировки'),
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
                    SwitchListTile(
                      value: state.treaningsSettings.useTrekking,
                      onChanged: (value) =>
                          BlocProvider.of<SettingsCubit>(context)
                              .changeTreaningSettings(
                                  settingsId: 8, value: value),
                      title: const Text('Треккинг и походы'),
                    ),
                    SwitchListTile(
                      value: state.treaningsSettings.useTraveling,
                      onChanged: (value) =>
                          BlocProvider.of<SettingsCubit>(context)
                              .changeTreaningSettings(
                                  settingsId: 7, value: value),
                      title: const Text('Путешествия'),
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
                            showMyModalBottomSheet<void>(
                              context: context,
                              heightPersent: 0.7,
                              child: ListView(
                                  padding: const EdgeInsets.only(top: 24),
                                  children: CategoryType.values
                                      .map((type) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                              onTap: () {
                                                BlocProvider.of<SettingsCubit>(
                                                        context)
                                                    .selectHallCategoryType(
                                                        type: type);
                                                Navigator.of(context).pop();
                                              },
                                              child: Center(
                                                  child: Text(
                                                type.name,
                                                style: titleTextStyle,
                                              )),
                                            ),
                                          ))
                                      .toList()),
                            );
                          },
                          child: Text(state.hallCategoryType.name),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Описание категорий трудности:',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const AllCategoriesPage()));
                            },
                            child: const Text('Скалолазанье'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const IceCategoriesPage()));
                            },
                            child: const Text('Ледолазанье'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const MixedCategoriesPage()));
                            },
                            child: const Text('Микст'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const UssrCategoriesPage()));
                            },
                            child: const Text('Скал СССР'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const AidCategoriesPage()));
                            },
                            child: const Text('ИТО'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const MountaineeringCategoriesPage()));
                            },
                            child: const Text('Восхождений'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Экспорт и импорт тренировок:',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    const TreaningsExportImportWidget(),
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

import 'package:my_climbing_trek/features/mountaineering/domain/entities/mountaineering_category.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_mountaineering_category_widget.dart';

class MountaineeringCategoriesPage extends StatelessWidget {
  const MountaineeringCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Категории восхождений'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: MountaineeringCategory.values
                .map((category) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SettingsMountaineeringCategoryWidget(
                              category: category),
                          const SizedBox(width: 12),
                          Flexible(child: Text(category.description))
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

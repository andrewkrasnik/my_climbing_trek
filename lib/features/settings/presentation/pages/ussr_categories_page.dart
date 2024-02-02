import 'package:my_climbing_trek/core/data/ussr_climbing_category.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_ussr_category_widget.dart';

class UssrCategoriesPage extends StatelessWidget {
  const UssrCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Категории скал СССР'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: UssrClimbingCategory.values
                .map((category) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SettingsUssrCategoryWidget(category: category),
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

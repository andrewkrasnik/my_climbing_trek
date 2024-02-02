import 'package:my_climbing_trek/core/data/mixed_category.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_mixed_category_widget.dart';

class MixedCategoriesPage extends StatelessWidget {
  const MixedCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Категории микста'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: MixedCategory.values
                .map((category) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SettingsMixedCategoryWidget(category: category),
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

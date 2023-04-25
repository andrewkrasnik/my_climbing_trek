import 'package:my_climbing_trek/core/data/aid_category.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_aid_category_widget.dart';
import 'package:flutter/material.dart';

class AidCategoriesPage extends StatelessWidget {
  const AidCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Категории ИТО'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: AidCategory.values
                .map((category) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SettingsAidCategoryWidget(category: category),
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

import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_ice_category_widget.dart';
import 'package:flutter/material.dart';

class IceCategoriesPage extends StatelessWidget {
  const IceCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Категории ледолазанья'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: IceCategory.values
                .map((category) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          SettingsIceCategoryWidget(category: category),
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

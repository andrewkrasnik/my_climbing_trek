import 'package:my_climbing_trek/core/data/category_type.dart';
import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:my_climbing_trek/features/settings/presentation/widgets/settings_category_widget.dart';
import 'package:flutter/material.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Все категории скалолазанья'),
      ),
      body: SingleChildScrollView(
        child: Table(
            border: const TableBorder(
              horizontalInside: BorderSide(
                width: 2.0,
              ),
            ),
            // columnWidths: const {0: FlexColumnWidth(2)},
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                  children: CategoryType.values
                      .map((type) => Text(type.name))
                      .toList()),
              ...ClimbingCategory.values.values.map((category) => TableRow(
                  children: CategoryType.values
                      .map((type) => SettingsCategoryWidget(
                            category: category,
                            type: type,
                          ))
                      .toList()))
            ]),
      ),
    );
  }
}

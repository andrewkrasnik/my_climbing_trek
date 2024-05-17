import 'package:flutter/material.dart';
import 'package:my_climbing_trek/core/data/difficulty_category.dart';
import 'package:my_climbing_trek/core/widgets/category_widget.dart';

class SelectCategoryWidget<T extends DifficultyCategory>
    extends StatelessWidget {
  final List<T> values;

  final ValueNotifier<T?> categoryState;

  const SelectCategoryWidget({
    required this.categoryState,
    required this.values,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: values
            .map((category) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    onTap: () {
                      categoryState.value = category;
                    },
                    child: CategoryWidget(
                      category: category,
                      selected: categoryState.value == category,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

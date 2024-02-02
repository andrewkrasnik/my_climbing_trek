import 'package:my_climbing_trek/core/data/climbing_category.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/rock_climbing/presentation/widgets/rock_category_widget.dart';

class SelectRockCategoryWidget extends StatelessWidget {
  final ClimbingCategory? currentCategory;
  final void Function(ClimbingCategory)? onTap;

  const SelectRockCategoryWidget({super.key, this.currentCategory, this.onTap});

  @override
  Widget build(BuildContext context) {
    const categories = ClimbingCategory.rockValues;
    return SizedBox(
        height: 64,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: categories
                .map((category) => GestureDetector(
                      onTap: onTap == null ? null : () => onTap!(category),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: RockCategoryWidget(
                          category: category,
                          planed: category != currentCategory,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ));
  }
}

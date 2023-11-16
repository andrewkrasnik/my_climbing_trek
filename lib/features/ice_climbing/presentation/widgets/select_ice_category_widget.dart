import 'package:my_climbing_trek/core/data/ice_category.dart';
import 'package:flutter/material.dart';
import 'package:my_climbing_trek/features/ice_climbing/presentation/widgets/ice_category_widget.dart';

class SelectIceCategoryWidget extends StatelessWidget {
  final IceCategory maxCategory;
  final IceCategory? currentCategory;
  final void Function(IceCategory)? onTap;

  const SelectIceCategoryWidget({
    super.key,
    this.currentCategory,
    required this.maxCategory,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final categories = IceCategory.byMaxCategory(maxCategory);
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
                        child: IceCategoryWidget(
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

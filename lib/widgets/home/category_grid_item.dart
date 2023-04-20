import 'package:flutter/material.dart';
import 'package:menu_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final double height;
  const CategoryItem({super.key, required this.category, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: category.color.withOpacity(0.6),
      ),
      child: Text(
        category.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}

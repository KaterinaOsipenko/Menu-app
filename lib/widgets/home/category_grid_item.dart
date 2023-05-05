import 'package:flutter/material.dart';
import 'package:menu_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final double height;
  final VoidCallback onSelected;
  const CategoryItem(
      {super.key,
      required this.category,
      required this.height,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
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
      ),
    );
  }
}

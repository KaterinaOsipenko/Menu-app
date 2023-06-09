import 'package:flutter/material.dart';
import 'package:menu_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final VoidCallback onSelected;
  const CategoryItem({
    super.key,
    required this.category,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: category.color.withOpacity(0.2),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
    );
  }
}
